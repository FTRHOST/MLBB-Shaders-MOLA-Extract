//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR_Common_EnvLaser" {
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

_LGTex ("流光贴图", 2D) = "black" { }

_LGMask ("流光遮罩", 2D) = "white" { }

_LGColor ("流光颜色", Color) = (1,1,1,1)

_LGIntensity ("流光强度", Float) = 1.0

_USpeed_LG ("U向流动速度", Float) = 0.0

_VSpeed_LG ("V向流动速度", Float) = 0.0

_UseDissolve2U ("溶解使用2U", Float) = 0.0

_UseVertical ("启用竖向溶解", Float) = 0.0

_UseDissolveReversal ("溶解方向是否反转", Float) = 0.0

_DissolveTex ("溶解纹理", 2D) = "white" { }

_DissolveEdgeShrink ("溶解边缘压缩", Float) = 6.0

_Cutoff ("溶解进度", Range(0, 1)) = 0.0

_LaserCubemap ("镭射贴图", Cube) = "white" { }

_LaserCubemapMip ("镭射贴图Mip", Range(1, 7)) = 1.0

_LaserIntensity ("镭射强度", Range(0, 5)) = 1.0

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_OcclusionScale ("AO强度", Range(0, 1)) = 1.0

_ShadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_ShadowStrength ("阴影强度", Range(0, 3)) = 1.6799999475479126

_ShadowColor ("阴影颜色", Color) = (0.367925,0,0,0)

_DirectSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR_Freya_Wing"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 56918
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _USpeed_LG;
uniform 	mediump float _VSpeed_LG;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseDissolveReversal;
uniform 	mediump float _UseVertical;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _LaserCubemapMip;
uniform 	mediump float _LaserIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(7) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(8) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump samplerCube _LaserCubemap;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
ivec3 u_xlati20;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
float u_xlat24;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec2 u_xlat16_26;
float u_xlat40;
int u_xlati40;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
float u_xlat53;
float u_xlat60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
mediump float u_xlat16_65;
float u_xlat67;
float u_xlat69;
float u_xlat70;
float u_xlat72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xyz = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolveReversal, _UseDissolve2U), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_41.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_41.xy + u_xlat16_1.xy;
    u_xlat16_41.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_61 = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_2.xy = (u_xlatb0.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_1.xy).x;
    u_xlat16_1.x = u_xlat16_61 + u_xlat16_41.x;
    u_xlat16_21 = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.y + u_xlat16_21;
    u_xlat16_1.x = _Cutoff * 1.20000005 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.10000002;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + -0.0599999987;
    u_xlat16_21 = max(_DissolveEdgeShrink, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_21 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5>=u_xlat16_1.x);
#else
    u_xlatb0.x = 0.5>=u_xlat16_1.x;
#endif
    if(!u_xlatb0.x){discard;}
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_21 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_21 = (-u_xlat16_21) * u_xlat16_21 + 1.0;
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_41.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_62 = u_xlat16_21 * u_xlat16_41.x;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb0.x = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_3.xy = (u_xlatb0.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_3.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.yyy + u_xlat16_3.xzw;
    u_xlat16_3.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_3.x = u_xlat16_3.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_23 = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_23, u_xlat16_3.x);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_62) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_62 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat4.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + u_xlat16_2.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_63 = dot(u_xlat16_2.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat60 * u_xlat60;
    u_xlat16_63 = u_xlat60 * u_xlat16_63;
    u_xlat16_63 = u_xlat60 * u_xlat16_63;
    u_xlat16_5.x = u_xlat60 * u_xlat16_63;
    u_xlat60 = (-u_xlat16_63) * u_xlat60 + 1.0;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_25.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_25.xyz = u_xlat16_1.zxy * u_xlat16_25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_25.xyz = u_xlat16_1.zxy * u_xlat16_25.xyz;
    u_xlat16_6.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_25.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat16_8.xyz;
    u_xlat60 = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat16_5.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_63 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat16_11.xyz;
    u_xlat13.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat13.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat13.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat16_14.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat7 = dot(u_xlat12.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat67 = (-u_xlat7) * u_xlat16_2.x + u_xlat7;
    u_xlat67 = u_xlat7 * u_xlat67 + u_xlat16_2.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat7;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(u_xlat16_62);
    u_xlat13.x = dot(u_xlat12.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat13.x) * u_xlat16_2.x + u_xlat13.x;
    u_xlat69 = u_xlat13.x * u_xlat69 + u_xlat16_2.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat13.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat67 = u_xlat67 * u_xlat69;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24 = u_xlat16_2.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_2.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat67 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat7) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_3.xyz * u_xlat9.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat14.xyz = vec3(u_xlat67) * u_xlat14.xyz;
    u_xlat16_22 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat12.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat67 * u_xlat24 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat70 = u_xlat16_2.x / u_xlat67;
    u_xlat70 = u_xlat70 * 0.318309873;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat72 = (-u_xlat16_22) + 1.0;
    u_xlat16_22 = u_xlat72 * u_xlat72;
    u_xlat16_22 = u_xlat72 * u_xlat16_22;
    u_xlat16_22 = u_xlat72 * u_xlat16_22;
    u_xlat16_63 = u_xlat72 * u_xlat16_22;
    u_xlat72 = (-u_xlat16_22) * u_xlat72 + 1.0;
    u_xlat14.xyz = u_xlat16_8.xyz * vec3(u_xlat72);
    u_xlat14.xyz = vec3(u_xlat60) * vec3(u_xlat16_63) + u_xlat14.xyz;
    u_xlat72 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat53 = (-u_xlat72) * u_xlat16_2.x + u_xlat72;
    u_xlat53 = u_xlat72 * u_xlat53 + u_xlat16_2.x;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat53 = u_xlat72 + u_xlat53;
    u_xlat53 = u_xlat53 + 6.10351563e-05;
    u_xlat53 = u_xlat69 * u_xlat53;
    u_xlat53 = float(1.0) / u_xlat53;
    u_xlat53 = min(u_xlat53, 16.0);
    u_xlat70 = u_xlat70 * u_xlat53;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _DirectSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat72) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_63 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_5.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_5.x = (-u_xlat16_5.x) * u_xlat16_5.x + 1.0;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_26.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat9.xyz;
    u_xlat16_63 = u_xlat16_5.x * u_xlat16_26.x;
    u_xlat16_5.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_5.x));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_5.x);
#endif
    u_xlat16_17.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_5.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_5.x = u_xlat16_5.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb9 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_26.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_5.x;
    u_xlat16_17.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + u_xlat16_16.xyz;
    u_xlat9.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat9.xxx;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat12.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat24 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_2.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat20.x = dot(u_xlat12.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat40 * u_xlat40;
    u_xlat16_63 = u_xlat40 * u_xlat16_63;
    u_xlat16_63 = u_xlat40 * u_xlat16_63;
    u_xlat16_5.x = u_xlat40 * u_xlat16_63;
    u_xlat40 = (-u_xlat16_63) * u_xlat40 + 1.0;
    u_xlat9.xyz = u_xlat16_8.xyz * vec3(u_xlat40);
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat16_5.xxx + u_xlat9.xyz;
    u_xlat40 = (-u_xlat20.x) * u_xlat16_2.x + u_xlat20.x;
    u_xlat40 = u_xlat20.x * u_xlat40 + u_xlat16_2.x;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat20.x;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat40 * u_xlat69;
    u_xlat0.z = float(1.0) / u_xlat40;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat9.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.zxy;
    u_xlat0.xzw = u_xlat20.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_17.xyz * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_15.xyz;
    u_xlat16_63 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_63) * u_xlat16_25.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat16_5.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat4.zzz * u_xlat16_16.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xyz = u_xlat4.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat7) * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xyz = u_xlat16_17.xyz * vec3(u_xlat72) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_16.xyz * u_xlat20.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_15.xyz + u_xlat16_3.xyz;
    u_xlat16_16.xyz = (-u_xlat10.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_OcclusionScale) * u_xlat16_16.xyz + u_xlat12.xyz;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_63) + u_xlat16_65;
    u_xlat16_26.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_26.x + 1.0;
    u_xlat16_63 = u_xlat16_6.w * u_xlat16_65 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_6.w * u_xlat16_63;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_65;
    u_xlat0.x = min(u_xlat16_63, 1.0);
    u_xlat20.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_17.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat20.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat20.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_18.y = u_xlat16_16.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati20.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_65) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati20.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati20.x = int(uint(uint(u_xlati20.x) & 1u));
    u_xlati40 = (u_xlati20.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati20.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_19.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_17.xyz + u_xlat16_3.xyz;
    u_xlat16_5.x = dot((-u_xlat16_11.xyz), u_xlat12.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat20.xyz = (-u_xlat12.xyz) * u_xlat16_5.xxx + (-u_xlat16_11.xyz);
    u_xlat16_6.z = dot(u_xlat16_16.xyz, u_xlat20.xyz);
    u_xlat4.x = dot(u_xlat16_16.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_5.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_5.x = floor(u_xlat16_9.w);
    u_xlat16_25.x = u_xlat16_5.x + 1.0;
    u_xlat16_25.x = min(u_xlat16_25.x, 15.0);
    u_xlat16_9.x = u_xlat16_25.x * 16.0 + u_xlat16_9.z;
    u_xlat16_26.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_26.xy = u_xlat16_26.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24 = texture(_SpecularOcclusionLut3D, u_xlat16_26.xy).x;
    u_xlat16_9.x = u_xlat16_5.x * 16.0 + u_xlat16_9.z;
    u_xlat16_26.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_26.xy = u_xlat16_26.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_26.xy).x;
    u_xlat16_5.x = u_xlat16_5.z * 15.0 + (-u_xlat16_5.x);
    u_xlat16_25.x = (-u_xlat16_44) + u_xlat16_24;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_25.x + u_xlat16_44;
    u_xlat16_5.x = u_xlat16_65 * u_xlat16_5.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat0.x * 0.5;
    u_xlat16_25.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_5.x = u_xlat4.x * u_xlat16_25.x + u_xlat16_5.x;
    u_xlat16_25.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_45 = (-u_xlat16_5.x) * 2.0 + 1.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_45 + u_xlat16_25.x;
    u_xlat16_5.x = u_xlat0.x * u_xlat16_5.x;
    u_xlat16_5.x = min(u_xlat16_5.x, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat10.xyz * vec3(u_xlat64) + (-u_xlat20.xyz);
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat4.xyz + u_xlat20.xyz;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat16.y = u_xlat0.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_25.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat13.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_25.x);
    u_xlat16_25.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_25.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_25.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_63) * u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_25.xyz = (u_xlatb0.x) ? u_xlat16_8.xyz : u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_25.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat16_5.yzx * u_xlat16_6.yzx + u_xlat16_15.yzx;
    u_xlat16_63 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_25.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_25.xyz = u_xlat16_0.zxy * u_xlat16_25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_25.xyz = u_xlat16_0.zxy * u_xlat16_25.xyz;
    u_xlat16_3.xyz = u_xlat16_25.xyz * _EmissiveColor.zxy + u_xlat16_3.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat20.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat20.xy = u_xlat20.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_1 = texture(_LGTex, u_xlat20.xy);
    u_xlat16_25.xyz = u_xlat16_0.xxx * u_xlat16_1.zxy;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(_LGIntensity);
    u_xlat16_25.xyz = u_xlat16_1.www * u_xlat16_25.xyz;
    u_xlat16_3.xyz = u_xlat16_25.xyz * _LGColor.zxy + u_xlat16_3.xyz;
    u_xlat0.x = dot(u_xlat12.xyz, (-u_xlat16_11.xyz));
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat16_11.xyz * u_xlat0.xxx + u_xlat12.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat16_0 = textureLod(_LaserCubemap, u_xlat0.xyz, _LaserCubemapMip);
    u_xlat16_25.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_25.xyz;
    u_xlat16_3.xyz = u_xlat16_25.xyz * vec3(vec3(_LaserIntensity, _LaserIntensity, _LaserIntensity)) + u_xlat16_3.xyz;
    u_xlat16_25.xyz = (-u_xlat16_3.xyz) + _FogCol.zxy;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_25.xyz + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_20.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_63 : u_xlat16_5.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _USpeed_LG;
uniform 	mediump float _VSpeed_LG;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseDissolveReversal;
uniform 	mediump float _UseVertical;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _LaserCubemapMip;
uniform 	mediump float _LaserIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(7) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(8) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump samplerCube _LaserCubemap;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec4 u_xlat16_9;
bool u_xlatb9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat20;
mediump vec3 u_xlat16_20;
ivec3 u_xlati20;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
float u_xlat24;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec2 u_xlat16_26;
float u_xlat40;
int u_xlati40;
mediump vec2 u_xlat16_41;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
float u_xlat53;
float u_xlat60;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
float u_xlat64;
mediump float u_xlat16_65;
float u_xlat67;
float u_xlat69;
float u_xlat70;
float u_xlat72;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xyz = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolveReversal, _UseDissolve2U), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_41.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_41.xy + u_xlat16_1.xy;
    u_xlat16_41.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_61 = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_2.xy = (u_xlatb0.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_1.xy).x;
    u_xlat16_1.x = u_xlat16_61 + u_xlat16_41.x;
    u_xlat16_21 = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.y + u_xlat16_21;
    u_xlat16_1.x = _Cutoff * 1.20000005 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.10000002;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + -0.0599999987;
    u_xlat16_21 = max(_DissolveEdgeShrink, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_21 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5>=u_xlat16_1.x);
#else
    u_xlatb0.x = 0.5>=u_xlat16_1.x;
#endif
    if(!u_xlatb0.x){discard;}
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_21 = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_21 = (-u_xlat16_21) * u_xlat16_21 + 1.0;
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_21 = u_xlat16_21 * u_xlat16_21;
    u_xlat16_41.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_62 = u_xlat16_21 * u_xlat16_41.x;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb0.x = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_3.xy = (u_xlatb0.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_62 = max(u_xlat16_62, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_3.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.yyy + u_xlat16_3.xzw;
    u_xlat16_3.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_2.xyz);
    u_xlat16_3.x = u_xlat16_3.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_23 = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_3.x = max(u_xlat16_23, u_xlat16_3.x);
    u_xlat16_62 = u_xlat16_62 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_62) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_62 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_62 = inversesqrt(u_xlat16_62);
    u_xlat4.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + u_xlat16_2.xyz;
    u_xlat60 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat4.xyz = vec3(u_xlat60) * u_xlat4.xyz;
    u_xlat16_63 = dot(u_xlat16_2.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat60 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat60 * u_xlat60;
    u_xlat16_63 = u_xlat60 * u_xlat16_63;
    u_xlat16_63 = u_xlat60 * u_xlat16_63;
    u_xlat16_5.x = u_xlat60 * u_xlat16_63;
    u_xlat60 = (-u_xlat16_63) * u_xlat60 + 1.0;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_25.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_25.xyz = u_xlat16_1.zxy * u_xlat16_25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_25.xyz = u_xlat16_1.zxy * u_xlat16_25.xyz;
    u_xlat16_6.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_25.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat16_8.xyz;
    u_xlat60 = u_xlat16_8.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat16_5.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_63 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_11.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_63) + vs_TEXCOORD2.yzx;
    u_xlat64 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat64 = max(u_xlat64, 1.17549435e-38);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat12.xyz = vec3(u_xlat64) * u_xlat16_11.xyz;
    u_xlat13.xyz = u_xlat12.xyz * vs_TEXCOORD1.zxy;
    u_xlat13.xyz = vs_TEXCOORD1.yzx * u_xlat12.yzx + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat13.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat13.x;
    u_xlat10.x = u_xlat12.z;
    u_xlat16_14.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
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
    u_xlat7 = dot(u_xlat12.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0078125);
    u_xlat67 = (-u_xlat7) * u_xlat16_2.x + u_xlat7;
    u_xlat67 = u_xlat7 * u_xlat67 + u_xlat16_2.x;
    u_xlat67 = sqrt(u_xlat67);
    u_xlat67 = u_xlat67 + u_xlat7;
    u_xlat67 = u_xlat67 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat0.xyz * vec3(u_xlat16_62);
    u_xlat13.x = dot(u_xlat12.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat13.x) * u_xlat16_2.x + u_xlat13.x;
    u_xlat69 = u_xlat13.x * u_xlat69 + u_xlat16_2.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat13.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat67 = u_xlat67 * u_xlat69;
    u_xlat67 = float(1.0) / u_xlat67;
    u_xlat67 = min(u_xlat67, 16.0);
    u_xlat4.x = dot(u_xlat12.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24 = u_xlat16_2.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat24 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_2.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat67 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _DirectSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat7) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_3.xyz * u_xlat9.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat67 = dot(u_xlat14.xyz, u_xlat14.xyz);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat14.xyz = vec3(u_xlat67) * u_xlat14.xyz;
    u_xlat16_22 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_22 = min(max(u_xlat16_22, 0.0), 1.0);
#else
    u_xlat16_22 = clamp(u_xlat16_22, 0.0, 1.0);
#endif
    u_xlat67 = dot(u_xlat12.xyz, u_xlat14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat67 = u_xlat67 * u_xlat24 + 1.0;
    u_xlat67 = u_xlat67 * u_xlat67;
    u_xlat70 = u_xlat16_2.x / u_xlat67;
    u_xlat70 = u_xlat70 * 0.318309873;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat72 = (-u_xlat16_22) + 1.0;
    u_xlat16_22 = u_xlat72 * u_xlat72;
    u_xlat16_22 = u_xlat72 * u_xlat16_22;
    u_xlat16_22 = u_xlat72 * u_xlat16_22;
    u_xlat16_63 = u_xlat72 * u_xlat16_22;
    u_xlat72 = (-u_xlat16_22) * u_xlat72 + 1.0;
    u_xlat14.xyz = u_xlat16_8.xyz * vec3(u_xlat72);
    u_xlat14.xyz = vec3(u_xlat60) * vec3(u_xlat16_63) + u_xlat14.xyz;
    u_xlat72 = dot(u_xlat12.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat53 = (-u_xlat72) * u_xlat16_2.x + u_xlat72;
    u_xlat53 = u_xlat72 * u_xlat53 + u_xlat16_2.x;
    u_xlat53 = sqrt(u_xlat53);
    u_xlat53 = u_xlat72 + u_xlat53;
    u_xlat53 = u_xlat53 + 6.10351563e-05;
    u_xlat53 = u_xlat69 * u_xlat53;
    u_xlat53 = float(1.0) / u_xlat53;
    u_xlat53 = min(u_xlat53, 16.0);
    u_xlat70 = u_xlat70 * u_xlat53;
    u_xlat14.xyz = u_xlat14.xyz * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.xyz = min(max(u_xlat14.xyz, 0.0), 1.0);
#else
    u_xlat14.xyz = clamp(u_xlat14.xyz, 0.0, 1.0);
#endif
    u_xlat14.xyz = u_xlat14.xyz * _DirectSpecularColor.zxy;
    u_xlat14.xyz = vec3(u_xlat72) * u_xlat14.xyz;
    u_xlat16_15.xyz = u_xlat14.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_63 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_5.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_5.x = (-u_xlat16_5.x) * u_xlat16_5.x + 1.0;
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_26.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat9.xyz;
    u_xlat16_63 = u_xlat16_5.x * u_xlat16_26.x;
    u_xlat16_5.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.00100000005>=abs(u_xlat16_5.x));
#else
    u_xlatb9 = 0.00100000005>=abs(u_xlat16_5.x);
#endif
    u_xlat16_17.xy = (bool(u_xlatb9)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_17.x);
    u_xlat16_17.xzw = u_xlat16_17.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_17.yyy + u_xlat16_17.xzw;
    u_xlat16_5.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_5.x = u_xlat16_5.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb9 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_26.x = (u_xlatb9) ? 1.0 : 0.0;
    u_xlat16_5.x = max(u_xlat16_5.x, u_xlat16_26.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_5.x;
    u_xlat16_17.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_62) + u_xlat16_16.xyz;
    u_xlat9.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9.x = inversesqrt(u_xlat9.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat9.xxx;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat12.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat24 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_2.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat20.x = dot(u_xlat12.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat40 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat40 * u_xlat40;
    u_xlat16_63 = u_xlat40 * u_xlat16_63;
    u_xlat16_63 = u_xlat40 * u_xlat16_63;
    u_xlat16_5.x = u_xlat40 * u_xlat16_63;
    u_xlat40 = (-u_xlat16_63) * u_xlat40 + 1.0;
    u_xlat9.xyz = u_xlat16_8.xyz * vec3(u_xlat40);
    u_xlat9.xyz = vec3(u_xlat60) * u_xlat16_5.xxx + u_xlat9.xyz;
    u_xlat40 = (-u_xlat20.x) * u_xlat16_2.x + u_xlat20.x;
    u_xlat40 = u_xlat20.x * u_xlat40 + u_xlat16_2.x;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat20.x;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat40 * u_xlat69;
    u_xlat0.z = float(1.0) / u_xlat40;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat9.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.zxy;
    u_xlat0.xzw = u_xlat20.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_17.xyz * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_15.xyz;
    u_xlat16_63 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_5.xyz = vec3(u_xlat16_63) * u_xlat16_25.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * u_xlat16_5.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat4.zzz * u_xlat16_16.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xyz = u_xlat4.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = vec3(u_xlat7) * u_xlat16_3.xyz;
    u_xlat16_17.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_3.xyz = u_xlat16_17.xyz * vec3(u_xlat72) + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_16.xyz * u_xlat20.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_15.xyz + u_xlat16_3.xyz;
    u_xlat16_16.xyz = (-u_xlat10.xyz) * vec3(u_xlat64) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_OcclusionScale) * u_xlat16_16.xyz + u_xlat12.xyz;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_16.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlat16_63 = dot(u_xlat16_16.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_63) + u_xlat16_65;
    u_xlat16_26.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_26.x + 1.0;
    u_xlat16_63 = u_xlat16_6.w * u_xlat16_65 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_6.w * u_xlat16_63;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _OcclusionScale * u_xlat16_65 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_65;
    u_xlat0.x = min(u_xlat16_63, 1.0);
    u_xlat20.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_17.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat20.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat20.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat20.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat20.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_18.y = u_xlat16_16.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati20.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_65) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati20.y,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati20.x = int(uint(uint(u_xlati20.x) & 1u));
    u_xlati40 = (u_xlati20.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati20.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_19.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_17.xyz + u_xlat16_3.xyz;
    u_xlat16_5.x = dot((-u_xlat16_11.xyz), u_xlat12.xyz);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat20.xyz = (-u_xlat12.xyz) * u_xlat16_5.xxx + (-u_xlat16_11.xyz);
    u_xlat16_6.z = dot(u_xlat16_16.xyz, u_xlat20.xyz);
    u_xlat4.x = dot(u_xlat16_16.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_9.yzw = u_xlat16_5.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_5.x = floor(u_xlat16_9.w);
    u_xlat16_25.x = u_xlat16_5.x + 1.0;
    u_xlat16_25.x = min(u_xlat16_25.x, 15.0);
    u_xlat16_9.x = u_xlat16_25.x * 16.0 + u_xlat16_9.z;
    u_xlat16_26.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_26.xy = u_xlat16_26.xy * vec2(0.00390625, 0.0625);
    u_xlat16_24 = texture(_SpecularOcclusionLut3D, u_xlat16_26.xy).x;
    u_xlat16_9.x = u_xlat16_5.x * 16.0 + u_xlat16_9.z;
    u_xlat16_26.xy = u_xlat16_9.xy + vec2(0.5, 0.5);
    u_xlat16_26.xy = u_xlat16_26.xy * vec2(0.00390625, 0.0625);
    u_xlat16_44 = texture(_SpecularOcclusionLut3D, u_xlat16_26.xy).x;
    u_xlat16_5.x = u_xlat16_5.z * 15.0 + (-u_xlat16_5.x);
    u_xlat16_25.x = (-u_xlat16_44) + u_xlat16_24;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_25.x + u_xlat16_44;
    u_xlat16_5.x = u_xlat16_65 * u_xlat16_5.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat0.x * 0.5;
    u_xlat16_25.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_5.x = u_xlat4.x * u_xlat16_25.x + u_xlat16_5.x;
    u_xlat16_25.x = u_xlat16_5.x + u_xlat16_5.x;
    u_xlat16_45 = (-u_xlat16_5.x) * 2.0 + 1.0;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_45 + u_xlat16_25.x;
    u_xlat16_5.x = u_xlat0.x * u_xlat16_5.x;
    u_xlat16_5.x = min(u_xlat16_5.x, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat10.xyz * vec3(u_xlat64) + (-u_xlat20.xyz);
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat4.xyz + u_xlat20.xyz;
    u_xlat16_16.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_16.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat16.y = u_xlat0.y;
    u_xlat16.xz = u_xlat16_16.xz;
    u_xlat16_25.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat13.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat13.xy).xy;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat16.xyz, u_xlat16_25.x);
    u_xlat16_25.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_25.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_25.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_63) * u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_25.xyz = (u_xlatb0.x) ? u_xlat16_8.xyz : u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xxx * u_xlat16_25.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_3.xyz;
    u_xlat16_5.xyz = u_xlat16_5.yzx * u_xlat16_6.yzx + u_xlat16_15.yzx;
    u_xlat16_63 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_25.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_25.xyz = u_xlat16_0.zxy * u_xlat16_25.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_25.xyz = u_xlat16_0.zxy * u_xlat16_25.xyz;
    u_xlat16_3.xyz = u_xlat16_25.xyz * _EmissiveColor.zxy + u_xlat16_3.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat20.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat20.xy = u_xlat20.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_1 = texture(_LGTex, u_xlat20.xy);
    u_xlat16_25.xyz = u_xlat16_0.xxx * u_xlat16_1.zxy;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(_LGIntensity);
    u_xlat16_25.xyz = u_xlat16_1.www * u_xlat16_25.xyz;
    u_xlat16_3.xyz = u_xlat16_25.xyz * _LGColor.zxy + u_xlat16_3.xyz;
    u_xlat0.x = dot(u_xlat12.xyz, (-u_xlat16_11.xyz));
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat16_11.xyz * u_xlat0.xxx + u_xlat12.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat16_0 = textureLod(_LaserCubemap, u_xlat0.xyz, _LaserCubemapMip);
    u_xlat16_25.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_25.xyz;
    u_xlat16_3.xyz = u_xlat16_25.xyz * vec3(vec3(_LaserIntensity, _LaserIntensity, _LaserIntensity)) + u_xlat16_3.xyz;
    u_xlat16_25.xyz = (-u_xlat16_3.xyz) + _FogCol.zxy;
    u_xlat16_3.xyz = vs_TEXCOORD0.www * u_xlat16_25.xyz + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
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
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_20.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_63 : u_xlat16_5.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _USpeed_LG;
uniform 	mediump float _VSpeed_LG;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseDissolveReversal;
uniform 	mediump float _UseVertical;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _LaserCubemapMip;
uniform 	mediump float _LaserIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(9) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(12) uniform mediump samplerCube _LaserCubemap;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
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
vec2 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
float u_xlat23;
mediump float u_xlat16_23;
vec3 u_xlat24;
float u_xlat29;
mediump vec3 u_xlat16_30;
int u_xlati40;
mediump vec2 u_xlat16_41;
float u_xlat43;
mediump float u_xlat16_43;
float u_xlat49;
mediump float u_xlat16_50;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat63;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_66;
float u_xlat67;
float u_xlat69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xyz = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolveReversal, _UseDissolve2U), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_41.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_41.xy + u_xlat16_1.xy;
    u_xlat16_41.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_61 = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_2.xy = (u_xlatb0.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_1.xy).x;
    u_xlat16_1.x = u_xlat16_61 + u_xlat16_41.x;
    u_xlat16_21 = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.y + u_xlat16_21;
    u_xlat16_1.x = _Cutoff * 1.20000005 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.10000002;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + -0.0599999987;
    u_xlat16_21 = max(_DissolveEdgeShrink, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_21 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5>=u_xlat16_1.x);
#else
    u_xlatb0.x = 0.5>=u_xlat16_1.x;
#endif
    if(!u_xlatb0.x){discard;}
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
    u_xlat65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat5.xyz;
    u_xlat24.x = dot(u_xlat7.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat7.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat24.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat3.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.z + (-u_xlat3.x);
    u_xlat23 = max((-u_xlat0.w), u_xlat3.x);
    u_xlat23 = (-u_xlat3.x) + u_xlat23;
    u_xlat0.z = _ShadowBias.y * u_xlat23 + u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat20.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat20.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _ShadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_30.x = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_10.x * u_xlat16_30.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_11.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + u_xlat16_10.xyz;
    u_xlat63 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat4.xyz = vec3(u_xlat63) * u_xlat4.xyz;
    u_xlat16_70 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat63 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24.x = (-u_xlat16_70) + 1.0;
    u_xlat16_10.x = u_xlat24.x * u_xlat24.x;
    u_xlat16_10.x = u_xlat24.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat24.x * u_xlat16_10.x;
    u_xlat16_30.x = u_xlat24.x * u_xlat16_10.x;
    u_xlat24.x = (-u_xlat16_10.x) * u_xlat24.x + 1.0;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_10.xzw = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_1.zxy * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_1.zxy * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_8.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat67 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat24.xyz = vec3(u_xlat67) * u_xlat16_30.xxx + u_xlat24.xyz;
    u_xlat16_30.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0078125);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0078125);
    u_xlat9.x = (-u_xlat63) * u_xlat16_30.x + u_xlat63;
    u_xlat9.x = u_xlat63 * u_xlat9.x + u_xlat16_30.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat63 + u_xlat9.x;
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat29 = (-u_xlat14.x) * u_xlat16_30.x + u_xlat14.x;
    u_xlat29 = u_xlat14.x * u_xlat29 + u_xlat16_30.x;
    u_xlat29 = sqrt(u_xlat29);
    u_xlat9.y = u_xlat29 + u_xlat14.x;
    u_xlat9.xy = u_xlat9.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat9.x = u_xlat9.x * u_xlat9.y;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat49 = u_xlat16_30.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat49 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_30.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat9.x * u_xlat4.x;
    u_xlat4.xyz = u_xlat24.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.zxy;
    u_xlat4.xyz = vec3(u_xlat63) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat20.xxx * u_xlat4.xyz;
    u_xlat15.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat64 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat15.xyz = vec3(u_xlat64) * u_xlat15.xyz;
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat7.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat64 * u_xlat49 + 1.0;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat16_30.x / u_xlat64;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat9.x = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat9.x * u_xlat9.x;
    u_xlat16_71 = u_xlat9.x * u_xlat16_71;
    u_xlat16_71 = u_xlat9.x * u_xlat16_71;
    u_xlat16_72 = u_xlat9.x * u_xlat16_71;
    u_xlat9.x = (-u_xlat16_71) * u_xlat9.x + 1.0;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat9.xxx;
    u_xlat15.xyz = vec3(u_xlat67) * vec3(u_xlat16_72) + u_xlat15.xyz;
    u_xlat9.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat9.x) * u_xlat16_30.x + u_xlat9.x;
    u_xlat69 = u_xlat9.x * u_xlat69 + u_xlat16_30.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat9.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat69 * u_xlat9.y;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat64 = u_xlat64 * u_xlat69;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.zxy;
    u_xlat15.xyz = u_xlat9.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat15.xyz * u_xlat16_6.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_72 = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = (-u_xlat16_72) * u_xlat16_72 + 1.0;
    u_xlat16_72 = max(u_xlat16_72, 0.0);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_73 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_17.xyz = u_xlat4.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_72 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_72));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_72);
#endif
    u_xlat16_18.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_72 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_72 = u_xlat16_72 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_73);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_72;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + u_xlat16_17.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xxx;
    u_xlat16_66 = dot(u_xlat16_17.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat49 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_30.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat23 = dot(u_xlat7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat43 = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat43 * u_xlat43;
    u_xlat16_66 = u_xlat43 * u_xlat16_66;
    u_xlat16_66 = u_xlat43 * u_xlat16_66;
    u_xlat16_71 = u_xlat43 * u_xlat16_66;
    u_xlat43 = (-u_xlat16_66) * u_xlat43 + 1.0;
    u_xlat4.xyz = u_xlat16_12.xyz * vec3(u_xlat43);
    u_xlat4.xyz = vec3(u_xlat67) * vec3(u_xlat16_71) + u_xlat4.xyz;
    u_xlat43 = (-u_xlat23) * u_xlat16_30.x + u_xlat23;
    u_xlat43 = u_xlat23 * u_xlat43 + u_xlat16_30.x;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat43 = u_xlat43 + u_xlat23;
    u_xlat43 = u_xlat43 + 6.10351563e-05;
    u_xlat43 = u_xlat43 * u_xlat9.y;
    u_xlat3.z = float(1.0) / u_xlat43;
    u_xlat3.xz = min(u_xlat3.xz, vec2(16.0, 16.0));
    u_xlat3.x = u_xlat3.z * u_xlat3.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.zxy;
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_18.xyz * u_xlat4.xyz;
    u_xlat16_16.xyz = u_xlat4.xyz * u_xlat20.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_66) * u_xlat16_10.xzw;
    u_xlat16_17.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat20.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat63) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat9.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_18.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat20.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat23) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_66) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _OcclusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_71 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_66;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_18.y = u_xlat16_11.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_71) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati40 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat3.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_4.w);
    u_xlat16_50 = u_xlat16_10.x + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_4.x = u_xlat16_50 * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_4.x = u_xlat16_10.x * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_50 = (-u_xlat16_43) + u_xlat16_23;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_50 + u_xlat16_43;
    u_xlat16_10.x = u_xlat16_71 * u_xlat16_10.x;
    u_xlat3.x = u_xlat3.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat0.y * 0.5;
    u_xlat16_50 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat3.x * u_xlat16_50 + u_xlat16_10.x;
    u_xlat16_50 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_70 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_70 + u_xlat16_50;
    u_xlat16_10.x = u_xlat0.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat16_2.z, u_xlat16_10.x);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_30.xxx * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat11.y = u_xlat0.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_30.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_30.x);
    u_xlat16_30.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_30.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_30.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_30.xyz = (u_xlatb0.x) ? u_xlat16_17.xyz : u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_30.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.yzx * u_xlat16_12.yzx + u_xlat16_16.yzx;
    u_xlat16_66 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_30.xyz = u_xlat16_0.zxy * u_xlat16_30.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_30.xyz = u_xlat16_0.zxy * u_xlat16_30.xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * _EmissiveColor.zxy + u_xlat16_6.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat20.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat20.xy = u_xlat20.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_1 = texture(_LGTex, u_xlat20.xy);
    u_xlat16_30.xyz = u_xlat16_0.xxx * u_xlat16_1.zxy;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(_LGIntensity);
    u_xlat16_30.xyz = u_xlat16_1.www * u_xlat16_30.xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * _LGColor.zxy + u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, (-u_xlat16_13.xyz));
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat16_13.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat16_0 = textureLod(_LaserCubemap, u_xlat0.xyz, _LaserCubemapMip);
    u_xlat16_30.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_30.xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * vec3(vec3(_LaserIntensity, _LaserIntensity, _LaserIntensity)) + u_xlat16_6.xyz;
    u_xlat16_30.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_30.xyz + u_xlat16_6.xyz;
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
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_20.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_66 : u_xlat16_10.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _USpeed_LG;
uniform 	mediump float _VSpeed_LG;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseDissolveReversal;
uniform 	mediump float _UseVertical;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _LaserCubemapMip;
uniform 	mediump float _LaserIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(9) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(12) uniform mediump samplerCube _LaserCubemap;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bool u_xlatb3;
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
vec2 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
float u_xlat23;
mediump float u_xlat16_23;
vec3 u_xlat24;
float u_xlat29;
mediump vec3 u_xlat16_30;
int u_xlati40;
mediump vec2 u_xlat16_41;
float u_xlat43;
mediump float u_xlat16_43;
float u_xlat49;
mediump float u_xlat16_50;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat63;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_66;
float u_xlat67;
float u_xlat69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xyz = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolveReversal, _UseDissolve2U), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_41.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_41.xy + u_xlat16_1.xy;
    u_xlat16_41.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_61 = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_2.xy = (u_xlatb0.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_1.xy).x;
    u_xlat16_1.x = u_xlat16_61 + u_xlat16_41.x;
    u_xlat16_21 = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.y + u_xlat16_21;
    u_xlat16_1.x = _Cutoff * 1.20000005 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.10000002;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + -0.0599999987;
    u_xlat16_21 = max(_DissolveEdgeShrink, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_21 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5>=u_xlat16_1.x);
#else
    u_xlatb0.x = 0.5>=u_xlat16_1.x;
#endif
    if(!u_xlatb0.x){discard;}
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
    u_xlat65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat5.xyz;
    u_xlat24.x = dot(u_xlat7.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat7.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat24.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat3.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.z + (-u_xlat3.x);
    u_xlat23 = max((-u_xlat0.w), u_xlat3.x);
    u_xlat23 = (-u_xlat3.x) + u_xlat23;
    u_xlat0.z = _ShadowBias.y * u_xlat23 + u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat20.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat20.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _ShadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_30.x = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_10.x * u_xlat16_30.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_11.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + u_xlat16_10.xyz;
    u_xlat63 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat4.xyz = vec3(u_xlat63) * u_xlat4.xyz;
    u_xlat16_70 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat63 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24.x = (-u_xlat16_70) + 1.0;
    u_xlat16_10.x = u_xlat24.x * u_xlat24.x;
    u_xlat16_10.x = u_xlat24.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat24.x * u_xlat16_10.x;
    u_xlat16_30.x = u_xlat24.x * u_xlat16_10.x;
    u_xlat24.x = (-u_xlat16_10.x) * u_xlat24.x + 1.0;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_10.xzw = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_1.zxy * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_1.zxy * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _AlbedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_8.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat67 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat24.xyz = vec3(u_xlat67) * u_xlat16_30.xxx + u_xlat24.xyz;
    u_xlat16_30.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0078125);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0078125);
    u_xlat9.x = (-u_xlat63) * u_xlat16_30.x + u_xlat63;
    u_xlat9.x = u_xlat63 * u_xlat9.x + u_xlat16_30.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat63 + u_xlat9.x;
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat29 = (-u_xlat14.x) * u_xlat16_30.x + u_xlat14.x;
    u_xlat29 = u_xlat14.x * u_xlat29 + u_xlat16_30.x;
    u_xlat29 = sqrt(u_xlat29);
    u_xlat9.y = u_xlat29 + u_xlat14.x;
    u_xlat9.xy = u_xlat9.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat9.x = u_xlat9.x * u_xlat9.y;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat49 = u_xlat16_30.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat49 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_30.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat9.x * u_xlat4.x;
    u_xlat4.xyz = u_xlat24.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.zxy;
    u_xlat4.xyz = vec3(u_xlat63) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat20.xxx * u_xlat4.xyz;
    u_xlat15.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat64 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat15.xyz = vec3(u_xlat64) * u_xlat15.xyz;
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat7.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat64 * u_xlat49 + 1.0;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat16_30.x / u_xlat64;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat9.x = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat9.x * u_xlat9.x;
    u_xlat16_71 = u_xlat9.x * u_xlat16_71;
    u_xlat16_71 = u_xlat9.x * u_xlat16_71;
    u_xlat16_72 = u_xlat9.x * u_xlat16_71;
    u_xlat9.x = (-u_xlat16_71) * u_xlat9.x + 1.0;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat9.xxx;
    u_xlat15.xyz = vec3(u_xlat67) * vec3(u_xlat16_72) + u_xlat15.xyz;
    u_xlat9.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat9.x) * u_xlat16_30.x + u_xlat9.x;
    u_xlat69 = u_xlat9.x * u_xlat69 + u_xlat16_30.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat9.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat69 * u_xlat9.y;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat64 = u_xlat64 * u_xlat69;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.zxy;
    u_xlat15.xyz = u_xlat9.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_16.xyz = u_xlat15.xyz * u_xlat16_6.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_72 = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = (-u_xlat16_72) * u_xlat16_72 + 1.0;
    u_xlat16_72 = max(u_xlat16_72, 0.0);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_73 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_17.xyz = u_xlat4.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_72 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_72));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_72);
#endif
    u_xlat16_18.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_72 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_72 = u_xlat16_72 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_73);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_72;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + u_xlat16_17.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xxx;
    u_xlat16_66 = dot(u_xlat16_17.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat49 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_30.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat23 = dot(u_xlat7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat43 = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat43 * u_xlat43;
    u_xlat16_66 = u_xlat43 * u_xlat16_66;
    u_xlat16_66 = u_xlat43 * u_xlat16_66;
    u_xlat16_71 = u_xlat43 * u_xlat16_66;
    u_xlat43 = (-u_xlat16_66) * u_xlat43 + 1.0;
    u_xlat4.xyz = u_xlat16_12.xyz * vec3(u_xlat43);
    u_xlat4.xyz = vec3(u_xlat67) * vec3(u_xlat16_71) + u_xlat4.xyz;
    u_xlat43 = (-u_xlat23) * u_xlat16_30.x + u_xlat23;
    u_xlat43 = u_xlat23 * u_xlat43 + u_xlat16_30.x;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat43 = u_xlat43 + u_xlat23;
    u_xlat43 = u_xlat43 + 6.10351563e-05;
    u_xlat43 = u_xlat43 * u_xlat9.y;
    u_xlat3.z = float(1.0) / u_xlat43;
    u_xlat3.xz = min(u_xlat3.xz, vec2(16.0, 16.0));
    u_xlat3.x = u_xlat3.z * u_xlat3.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.zxy;
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_18.xyz * u_xlat4.xyz;
    u_xlat16_16.xyz = u_xlat4.xyz * u_xlat20.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_66) * u_xlat16_10.xzw;
    u_xlat16_17.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat20.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat63) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat9.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_18.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat20.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat23) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_66) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _OcclusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_71 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_66;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.zxy;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_18.y = u_xlat16_11.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_71) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati40 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat3.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_4.w);
    u_xlat16_50 = u_xlat16_10.x + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_4.x = u_xlat16_50 * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_4.x = u_xlat16_10.x * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_50 = (-u_xlat16_43) + u_xlat16_23;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_50 + u_xlat16_43;
    u_xlat16_10.x = u_xlat16_71 * u_xlat16_10.x;
    u_xlat3.x = u_xlat3.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat0.y * 0.5;
    u_xlat16_50 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat3.x * u_xlat16_50 + u_xlat16_10.x;
    u_xlat16_50 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_70 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_70 + u_xlat16_50;
    u_xlat16_10.x = u_xlat0.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat16_2.z, u_xlat16_10.x);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_30.xxx * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat11.y = u_xlat0.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_30.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_30.x);
    u_xlat16_30.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_30.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_30.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_30.xyz = (u_xlatb0.x) ? u_xlat16_17.xyz : u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_30.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.yzx * u_xlat16_12.yzx + u_xlat16_16.yzx;
    u_xlat16_66 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_30.xyz = u_xlat16_0.zxy * u_xlat16_30.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_30.xyz = u_xlat16_0.zxy * u_xlat16_30.xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * _EmissiveColor.zxy + u_xlat16_6.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat20.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat20.xy = u_xlat20.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_1 = texture(_LGTex, u_xlat20.xy);
    u_xlat16_30.xyz = u_xlat16_0.xxx * u_xlat16_1.zxy;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(_LGIntensity);
    u_xlat16_30.xyz = u_xlat16_1.www * u_xlat16_30.xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * _LGColor.zxy + u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, (-u_xlat16_13.xyz));
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat16_13.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat16_0 = textureLod(_LaserCubemap, u_xlat0.xyz, _LaserCubemapMip);
    u_xlat16_30.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_30.xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * vec3(vec3(_LaserIntensity, _LaserIntensity, _LaserIntensity)) + u_xlat16_6.xyz;
    u_xlat16_30.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_30.xyz + u_xlat16_6.xyz;
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
    u_xlat3.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_20.xyz) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_66 : u_xlat16_10.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _USpeed_LG;
uniform 	mediump float _VSpeed_LG;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseDissolveReversal;
uniform 	mediump float _UseVertical;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _LaserCubemapMip;
uniform 	mediump float _LaserIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(7) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(8) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump samplerCube _LaserCubemap;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec3 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
ivec3 u_xlati18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump vec2 u_xlat16_24;
float u_xlat36;
int u_xlati36;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
float u_xlat48;
float u_xlat54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat61;
float u_xlat63;
float u_xlat65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xyz = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolveReversal, _UseDissolve2U), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_37.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_37.xy + u_xlat16_1.xy;
    u_xlat16_37.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_55 = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_2.xy = (u_xlatb0.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_1.xy).x;
    u_xlat16_1.x = u_xlat16_55 + u_xlat16_37.x;
    u_xlat16_19.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.y + u_xlat16_19.x;
    u_xlat16_1.x = _Cutoff * 1.20000005 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.10000002;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + -0.0599999987;
    u_xlat16_19.x = max(_DissolveEdgeShrink, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_19.x + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5>=u_xlat16_1.x);
#else
    u_xlatb0.x = 0.5>=u_xlat16_1.x;
#endif
    if(!u_xlatb0.x){discard;}
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37.x;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0.x = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (u_xlatb0.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb0.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20 = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
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
    u_xlat16_3.x = u_xlat54 * u_xlat16_56;
    u_xlat54 = (-u_xlat16_56) * u_xlat54 + 1.0;
    u_xlat16_5 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_21.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_5.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_8.xyz;
    u_xlat54 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat61 = (-u_xlat7) * u_xlat16_19.x + u_xlat7;
    u_xlat61 = u_xlat7 * u_xlat61 + u_xlat16_19.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 + u_xlat7;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat12.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat63;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
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
    u_xlat4.x = u_xlat61 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _DirectSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat13.xyz;
    u_xlat16_37.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.x = min(max(u_xlat16_37.x, 0.0), 1.0);
#else
    u_xlat16_37.x = clamp(u_xlat16_37.x, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * u_xlat22 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_19.x / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat65 = (-u_xlat16_37.x) + 1.0;
    u_xlat16_37.x = u_xlat65 * u_xlat65;
    u_xlat16_37.x = u_xlat65 * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat65 * u_xlat16_37.x;
    u_xlat16_55 = u_xlat65 * u_xlat16_37.x;
    u_xlat65 = (-u_xlat16_37.x) * u_xlat65 + 1.0;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat65);
    u_xlat13.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat13.xyz;
    u_xlat65 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat65) * u_xlat16_19.x + u_xlat65;
    u_xlat48 = u_xlat65 * u_xlat48 + u_xlat16_19.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat65 + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat63 * u_xlat48;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat61 = u_xlat61 * u_xlat48;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat65) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_37.x = max(u_xlat16_37.x, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37.x);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_15.xyz = u_xlat16_37.xxx * u_xlat5.xyz;
    u_xlat16_37.x = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37.x = max(u_xlat16_37.x, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_56);
    u_xlat16_37.x = u_xlat16_55 * u_xlat16_37.x;
    u_xlat16_16.xyz = u_xlat16_37.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
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
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat36 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat36 * u_xlat36;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_37.x = u_xlat36 * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat36 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat36);
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_37.xxx + u_xlat5.xyz;
    u_xlat36 = (-u_xlat18.x) * u_xlat16_19.x + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_19.x;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat63;
    u_xlat0.z = float(1.0) / u_xlat36;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.xyz;
    u_xlat0.xzw = u_xlat18.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat7) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat65) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
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
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_24.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_24.x + 1.0;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_56;
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
    u_xlat18.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat18.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_3.xxx + (-u_xlat16_10.xyz);
    u_xlat16_6.z = dot(u_xlat16_14.xyz, u_xlat18.xyz);
    u_xlat4.x = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_13.w);
    u_xlat16_21.x = u_xlat16_3.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_13.x = u_xlat16_21.x * 16.0 + u_xlat16_13.z;
    u_xlat16_24.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_24.xy = u_xlat16_24.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_24.xy).x;
    u_xlat16_13.x = u_xlat16_3.x * 16.0 + u_xlat16_13.z;
    u_xlat16_24.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_24.xy = u_xlat16_24.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_24.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_21.x = (-u_xlat16_40) + u_xlat16_22;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_21.x + u_xlat16_40;
    u_xlat16_3.x = u_xlat16_57 * u_xlat16_3.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_3.x;
    u_xlat16_21.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_39 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_39 + u_xlat16_21.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat4.xyz + u_xlat18.xyz;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat14.y = u_xlat0.y;
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_21.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_19.x);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (u_xlatb0.x) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_1.xzw;
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
    u_xlat16_19.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * _EmissiveColor.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat18.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat18.xy = u_xlat18.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_3 = texture(_LGTex, u_xlat18.xy);
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_LGIntensity);
    u_xlat16_6.xyz = u_xlat16_3.www * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _LGColor.xyz + u_xlat16_2.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, (-u_xlat16_10.xyz));
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat16_10.xyz * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat54 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat0.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat16_0 = textureLod(_LaserCubemap, u_xlat0.xyz, _LaserCubemapMip);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(vec3(_LaserIntensity, _LaserIntensity, _LaserIntensity)) + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_1.x : u_xlat16_19.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _USpeed_LG;
uniform 	mediump float _VSpeed_LG;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseDissolveReversal;
uniform 	mediump float _UseVertical;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _LaserCubemapMip;
uniform 	mediump float _LaserIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(7) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(8) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(9) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(10) uniform mediump samplerCube _LaserCubemap;
UNITY_LOCATION(11) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec3 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec4 u_xlat16_5;
bool u_xlatb5;
mediump vec4 u_xlat16_6;
float u_xlat7;
mediump vec4 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
ivec3 u_xlati18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
mediump vec2 u_xlat16_24;
float u_xlat36;
int u_xlati36;
mediump vec2 u_xlat16_37;
mediump float u_xlat16_39;
mediump float u_xlat16_40;
float u_xlat48;
float u_xlat54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat61;
float u_xlat63;
float u_xlat65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xyz = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolveReversal, _UseDissolve2U), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_37.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_37.xy + u_xlat16_1.xy;
    u_xlat16_37.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_55 = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_2.xy = (u_xlatb0.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_1.xy).x;
    u_xlat16_1.x = u_xlat16_55 + u_xlat16_37.x;
    u_xlat16_19.x = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.y + u_xlat16_19.x;
    u_xlat16_1.x = _Cutoff * 1.20000005 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.10000002;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + -0.0599999987;
    u_xlat16_19.x = max(_DissolveEdgeShrink, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_19.x + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5>=u_xlat16_1.x);
#else
    u_xlatb0.x = 0.5>=u_xlat16_1.x;
#endif
    if(!u_xlatb0.x){discard;}
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37.x;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0.x = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (u_xlatb0.x) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
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
    u_xlatb0.x = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0.x = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20 = (u_xlatb0.x) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
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
    u_xlat16_3.x = u_xlat54 * u_xlat16_56;
    u_xlat54 = (-u_xlat16_56) * u_xlat54 + 1.0;
    u_xlat16_5 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_21.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_5.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_7.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xy = u_xlat16_7.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_8.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_8.xyz;
    u_xlat54 = u_xlat16_8.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat5.xyz;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat16_56 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_10.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_56) + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_10.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat9.y = u_xlat12.x;
    u_xlat9.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = dot(u_xlat16_10.xyz, u_xlat9.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_10.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_10.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat9.xyz;
    u_xlat7 = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat61 = (-u_xlat7) * u_xlat16_19.x + u_xlat7;
    u_xlat61 = u_xlat7 * u_xlat61 + u_xlat16_19.x;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat61 + u_xlat7;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat12.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat63;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
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
    u_xlat4.x = u_xlat61 * u_xlat4.x;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _DirectSpecularColor.xyz;
    u_xlat5.xyz = vec3(u_xlat7) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat16_4.xz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat4.xz = u_xlat16_4.xz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xz = min(max(u_xlat4.xz, 0.0), 1.0);
#else
    u_xlat4.xz = clamp(u_xlat4.xz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat61 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat13.xyz = vec3(u_xlat61) * u_xlat13.xyz;
    u_xlat16_37.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37.x = min(max(u_xlat16_37.x, 0.0), 1.0);
#else
    u_xlat16_37.x = clamp(u_xlat16_37.x, 0.0, 1.0);
#endif
    u_xlat61 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat61 * u_xlat22 + 1.0;
    u_xlat61 = u_xlat61 * u_xlat61;
    u_xlat61 = u_xlat16_19.x / u_xlat61;
    u_xlat61 = u_xlat61 * 0.318309873;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat65 = (-u_xlat16_37.x) + 1.0;
    u_xlat16_37.x = u_xlat65 * u_xlat65;
    u_xlat16_37.x = u_xlat65 * u_xlat16_37.x;
    u_xlat16_37.x = u_xlat65 * u_xlat16_37.x;
    u_xlat16_55 = u_xlat65 * u_xlat16_37.x;
    u_xlat65 = (-u_xlat16_37.x) * u_xlat65 + 1.0;
    u_xlat13.xyz = u_xlat16_8.xyz * vec3(u_xlat65);
    u_xlat13.xyz = vec3(u_xlat54) * vec3(u_xlat16_55) + u_xlat13.xyz;
    u_xlat65 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat65 = min(max(u_xlat65, 0.0), 1.0);
#else
    u_xlat65 = clamp(u_xlat65, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat65) * u_xlat16_19.x + u_xlat65;
    u_xlat48 = u_xlat65 * u_xlat48 + u_xlat16_19.x;
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat65 + u_xlat48;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat48 = u_xlat63 * u_xlat48;
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat61 = u_xlat61 * u_xlat48;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat61);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _DirectSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat65) * u_xlat13.xyz;
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat5.xyz;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_37.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_37.x = max(u_xlat16_37.x, 6.10351563e-05);
    u_xlat16_55 = u_xlat16_37.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_56 = float(1.0) / float(u_xlat16_37.x);
    u_xlat16_37.x = inversesqrt(u_xlat16_37.x);
    u_xlat16_15.xyz = u_xlat16_37.xxx * u_xlat5.xyz;
    u_xlat16_37.x = u_xlat16_55 * u_xlat16_56;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb5 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_16.xy = (bool(u_xlatb5)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_37.x = max(u_xlat16_37.x, u_xlat16_16.x);
    u_xlat16_16.xzw = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_16.xzw;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb5 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_56 = (u_xlatb5) ? 1.0 : 0.0;
    u_xlat16_55 = max(u_xlat16_55, u_xlat16_56);
    u_xlat16_37.x = u_xlat16_55 * u_xlat16_37.x;
    u_xlat16_16.xyz = u_xlat16_37.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat5.xxx;
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
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat18.x = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat36 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat36 * u_xlat36;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat36 * u_xlat16_1.x;
    u_xlat16_37.x = u_xlat36 * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat36 + 1.0;
    u_xlat5.xyz = u_xlat16_8.xyz * vec3(u_xlat36);
    u_xlat5.xyz = vec3(u_xlat54) * u_xlat16_37.xxx + u_xlat5.xyz;
    u_xlat36 = (-u_xlat18.x) * u_xlat16_19.x + u_xlat18.x;
    u_xlat36 = u_xlat18.x * u_xlat36 + u_xlat16_19.x;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 + u_xlat18.x;
    u_xlat36 = u_xlat36 + 6.10351563e-05;
    u_xlat36 = u_xlat36 * u_xlat63;
    u_xlat0.z = float(1.0) / u_xlat36;
    u_xlat0.xz = min(u_xlat0.xz, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlat0.xzw = u_xlat5.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xzw = min(max(u_xlat0.xzw, 0.0), 1.0);
#else
    u_xlat0.xzw = clamp(u_xlat0.xzw, 0.0, 1.0);
#endif
    u_xlat0.xzw = u_xlat0.xzw * _DirectSpecularColor.xyz;
    u_xlat0.xzw = u_xlat18.xxx * u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_16.xyz * u_xlat0.xzw;
    u_xlat16_1.xzw = u_xlat0.xzw * u_xlat4.zzz + u_xlat16_14.xyz;
    u_xlat16_56 = (-u_xlat16_7.y) * _MetallicMultiplier + 1.0;
    u_xlat16_3.xyz = vec3(u_xlat16_56) * u_xlat16_21.xyz;
    u_xlat16_14.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat4.zzz * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = vec3(u_xlat7) * u_xlat16_2.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_15.xyz * vec3(u_xlat65) + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat18.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xzw + u_xlat16_2.xyz;
    u_xlat16_14.xyz = (-u_xlat9.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
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
    u_xlat16_57 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_57 = (-u_xlat16_56) + u_xlat16_57;
    u_xlat16_24.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _OcclusionScale * u_xlat16_24.x + 1.0;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_57 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_6.w * u_xlat16_56;
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
    u_xlat18.x = min(u_xlat0.x, u_xlat16_7.z);
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat18.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat18.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat18.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_56 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_15.xyz + u_xlat16_2.xyz;
    u_xlat16_3.x = dot((-u_xlat16_10.xyz), u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_3.xxx + (-u_xlat16_10.xyz);
    u_xlat16_6.z = dot(u_xlat16_14.xyz, u_xlat18.xyz);
    u_xlat4.x = dot(u_xlat16_14.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_13.yzw = u_xlat16_3.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_3.x = floor(u_xlat16_13.w);
    u_xlat16_21.x = u_xlat16_3.x + 1.0;
    u_xlat16_21.x = min(u_xlat16_21.x, 15.0);
    u_xlat16_13.x = u_xlat16_21.x * 16.0 + u_xlat16_13.z;
    u_xlat16_24.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_24.xy = u_xlat16_24.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_24.xy).x;
    u_xlat16_13.x = u_xlat16_3.x * 16.0 + u_xlat16_13.z;
    u_xlat16_24.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_24.xy = u_xlat16_24.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_24.xy).x;
    u_xlat16_3.x = u_xlat16_3.z * 15.0 + (-u_xlat16_3.x);
    u_xlat16_21.x = (-u_xlat16_40) + u_xlat16_22;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_21.x + u_xlat16_40;
    u_xlat16_3.x = u_xlat16_57 * u_xlat16_3.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat0.x * 0.5;
    u_xlat16_21.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat4.x * u_xlat16_21.x + u_xlat16_3.x;
    u_xlat16_21.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_39 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_39 + u_xlat16_21.x;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_3.x, u_xlat16_7.z);
    u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat4.xyz + u_xlat18.xyz;
    u_xlat16_14.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_14.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat14.y = u_xlat0.y;
    u_xlat14.xz = u_xlat16_14.xz;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_21.xyz = u_xlat16_8.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat14.xyz, u_xlat16_19.x);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_6.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_56) * u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_6.xyz = (u_xlatb0.x) ? u_xlat16_8.xyz : u_xlat16_6.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_6.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_21.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + u_xlat16_1.xzw;
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
    u_xlat16_19.x = u_xlat16_5.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * _EmissiveColor.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat18.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat18.xy = u_xlat18.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_3 = texture(_LGTex, u_xlat18.xy);
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_LGIntensity);
    u_xlat16_6.xyz = u_xlat16_3.www * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _LGColor.xyz + u_xlat16_2.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, (-u_xlat16_10.xyz));
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat16_10.xyz * u_xlat0.xxx + u_xlat11.xyz;
    u_xlat54 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat0.xyz = vec3(u_xlat54) * u_xlat0.xyz;
    u_xlat16_0 = textureLod(_LaserCubemap, u_xlat0.xyz, _LaserCubemapMip);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(vec3(_LaserIntensity, _LaserIntensity, _LaserIntensity)) + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_1.x : u_xlat16_19.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _USpeed_LG;
uniform 	mediump float _VSpeed_LG;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseDissolveReversal;
uniform 	mediump float _UseVertical;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _LaserCubemapMip;
uniform 	mediump float _LaserIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(9) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(12) uniform mediump samplerCube _LaserCubemap;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
bool u_xlatb3;
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
vec2 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
float u_xlat23;
mediump float u_xlat16_23;
vec3 u_xlat24;
float u_xlat29;
mediump vec3 u_xlat16_30;
int u_xlati40;
mediump vec2 u_xlat16_41;
float u_xlat43;
mediump float u_xlat16_43;
float u_xlat49;
mediump float u_xlat16_50;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat63;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_66;
float u_xlat67;
float u_xlat69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xyz = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolveReversal, _UseDissolve2U), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_41.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_41.xy + u_xlat16_1.xy;
    u_xlat16_41.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_61 = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_2.xy = (u_xlatb0.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_1.xy).x;
    u_xlat16_1.x = u_xlat16_61 + u_xlat16_41.x;
    u_xlat16_21 = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.y + u_xlat16_21;
    u_xlat16_1.x = _Cutoff * 1.20000005 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.10000002;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + -0.0599999987;
    u_xlat16_21 = max(_DissolveEdgeShrink, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_21 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5>=u_xlat16_1.x);
#else
    u_xlatb0.x = 0.5>=u_xlat16_1.x;
#endif
    if(!u_xlatb0.x){discard;}
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
    u_xlat65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat5.xyz;
    u_xlat24.x = dot(u_xlat7.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat7.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat24.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat3.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.z + (-u_xlat3.x);
    u_xlat23 = max((-u_xlat0.w), u_xlat3.x);
    u_xlat23 = (-u_xlat3.x) + u_xlat23;
    u_xlat0.z = _ShadowBias.y * u_xlat23 + u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat20.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat20.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _ShadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_30.x = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_10.x * u_xlat16_30.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_11.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + u_xlat16_10.xyz;
    u_xlat63 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat4.xyz = vec3(u_xlat63) * u_xlat4.xyz;
    u_xlat16_70 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat63 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24.x = (-u_xlat16_70) + 1.0;
    u_xlat16_10.x = u_xlat24.x * u_xlat24.x;
    u_xlat16_10.x = u_xlat24.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat24.x * u_xlat16_10.x;
    u_xlat16_30.x = u_xlat24.x * u_xlat16_10.x;
    u_xlat24.x = (-u_xlat16_10.x) * u_xlat24.x + 1.0;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_10.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_1.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_1.xyz * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_8.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat67 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat24.xyz = vec3(u_xlat67) * u_xlat16_30.xxx + u_xlat24.xyz;
    u_xlat16_30.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0078125);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0078125);
    u_xlat9.x = (-u_xlat63) * u_xlat16_30.x + u_xlat63;
    u_xlat9.x = u_xlat63 * u_xlat9.x + u_xlat16_30.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat63 + u_xlat9.x;
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat29 = (-u_xlat14.x) * u_xlat16_30.x + u_xlat14.x;
    u_xlat29 = u_xlat14.x * u_xlat29 + u_xlat16_30.x;
    u_xlat29 = sqrt(u_xlat29);
    u_xlat9.y = u_xlat29 + u_xlat14.x;
    u_xlat9.xy = u_xlat9.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat9.x = u_xlat9.x * u_xlat9.y;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat49 = u_xlat16_30.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat49 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_30.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat9.x * u_xlat4.x;
    u_xlat4.xyz = u_xlat24.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat63) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat20.xxx * u_xlat4.xyz;
    u_xlat15.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat64 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat15.xyz = vec3(u_xlat64) * u_xlat15.xyz;
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat7.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat64 * u_xlat49 + 1.0;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat16_30.x / u_xlat64;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat9.x = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat9.x * u_xlat9.x;
    u_xlat16_71 = u_xlat9.x * u_xlat16_71;
    u_xlat16_71 = u_xlat9.x * u_xlat16_71;
    u_xlat16_72 = u_xlat9.x * u_xlat16_71;
    u_xlat9.x = (-u_xlat16_71) * u_xlat9.x + 1.0;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat9.xxx;
    u_xlat15.xyz = vec3(u_xlat67) * vec3(u_xlat16_72) + u_xlat15.xyz;
    u_xlat9.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat9.x) * u_xlat16_30.x + u_xlat9.x;
    u_xlat69 = u_xlat9.x * u_xlat69 + u_xlat16_30.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat9.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat69 * u_xlat9.y;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat64 = u_xlat64 * u_xlat69;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.xyz;
    u_xlat15.xyz = u_xlat9.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat15.xyz * u_xlat16_6.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_72 = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = (-u_xlat16_72) * u_xlat16_72 + 1.0;
    u_xlat16_72 = max(u_xlat16_72, 0.0);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_73 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_17.xyz = u_xlat4.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_72 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_72));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_72);
#endif
    u_xlat16_18.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_72 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_72 = u_xlat16_72 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_73);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_72;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + u_xlat16_17.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xxx;
    u_xlat16_66 = dot(u_xlat16_17.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat49 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_30.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat23 = dot(u_xlat7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat43 = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat43 * u_xlat43;
    u_xlat16_66 = u_xlat43 * u_xlat16_66;
    u_xlat16_66 = u_xlat43 * u_xlat16_66;
    u_xlat16_71 = u_xlat43 * u_xlat16_66;
    u_xlat43 = (-u_xlat16_66) * u_xlat43 + 1.0;
    u_xlat4.xyz = u_xlat16_12.xyz * vec3(u_xlat43);
    u_xlat4.xyz = vec3(u_xlat67) * vec3(u_xlat16_71) + u_xlat4.xyz;
    u_xlat43 = (-u_xlat23) * u_xlat16_30.x + u_xlat23;
    u_xlat43 = u_xlat23 * u_xlat43 + u_xlat16_30.x;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat43 = u_xlat43 + u_xlat23;
    u_xlat43 = u_xlat43 + 6.10351563e-05;
    u_xlat43 = u_xlat43 * u_xlat9.y;
    u_xlat3.z = float(1.0) / u_xlat43;
    u_xlat3.xz = min(u_xlat3.xz, vec2(16.0, 16.0));
    u_xlat3.x = u_xlat3.z * u_xlat3.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_18.xyz * u_xlat4.xyz;
    u_xlat16_16.xyz = u_xlat4.xyz * u_xlat20.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_66) * u_xlat16_10.xzw;
    u_xlat16_17.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat20.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat63) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat9.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_18.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat20.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat23) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_66) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _OcclusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_71 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_66;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_18.y = u_xlat16_11.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_71) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati40 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat3.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_4.w);
    u_xlat16_50 = u_xlat16_10.x + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_4.x = u_xlat16_50 * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_4.x = u_xlat16_10.x * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_50 = (-u_xlat16_43) + u_xlat16_23;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_50 + u_xlat16_43;
    u_xlat16_10.x = u_xlat16_71 * u_xlat16_10.x;
    u_xlat3.x = u_xlat3.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat0.y * 0.5;
    u_xlat16_50 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat3.x * u_xlat16_50 + u_xlat16_10.x;
    u_xlat16_50 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_70 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_70 + u_xlat16_50;
    u_xlat16_10.x = u_xlat0.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat16_2.z, u_xlat16_10.x);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_30.xxx * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat11.y = u_xlat0.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_30.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_30.x);
    u_xlat16_30.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_30.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_30.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_30.xyz = (u_xlatb0.x) ? u_xlat16_17.xyz : u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_30.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_16.xyz;
    u_xlat16_66 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_30.xyz = u_xlat16_0.xyz * u_xlat16_30.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_30.xyz = u_xlat16_0.xyz * u_xlat16_30.xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * _EmissiveColor.xyz + u_xlat16_6.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat20.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat20.xy = u_xlat20.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_1 = texture(_LGTex, u_xlat20.xy);
    u_xlat16_30.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(_LGIntensity);
    u_xlat16_30.xyz = u_xlat16_1.www * u_xlat16_30.xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * _LGColor.xyz + u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, (-u_xlat16_13.xyz));
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat16_13.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat16_0 = textureLod(_LaserCubemap, u_xlat0.xyz, _LaserCubemapMip);
    u_xlat16_30.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_30.xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * vec3(vec3(_LaserIntensity, _LaserIntensity, _LaserIntensity)) + u_xlat16_6.xyz;
    u_xlat16_30.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_30.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_66 : u_xlat16_10.x;
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
    vs_TEXCOORD3.zw = in_TEXCOORD2.xy;
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
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _ShadowStrength;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	vec4 _LGTex_ST;
uniform 	mediump vec4 _LGColor;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _USpeed_LG;
uniform 	mediump float _VSpeed_LG;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _UseDissolve2U;
uniform 	mediump float _UseDissolveReversal;
uniform 	mediump float _UseVertical;
uniform 	mediump float _DissolveEdgeShrink;
uniform 	mediump float _Cutoff;
uniform 	mediump float _LaserCubemapMip;
uniform 	mediump float _LaserIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
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
UNITY_LOCATION(9) uniform mediump sampler2D _LGMask;
UNITY_LOCATION(10) uniform mediump sampler2D _LGTex;
UNITY_LOCATION(11) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(12) uniform mediump samplerCube _LaserCubemap;
UNITY_LOCATION(13) uniform mediump sampler2D _ShadowStrengthMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
bool u_xlatb3;
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
vec2 u_xlat14;
vec3 u_xlat15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec2 u_xlat20;
mediump vec3 u_xlat16_20;
mediump float u_xlat16_21;
float u_xlat23;
mediump float u_xlat16_23;
vec3 u_xlat24;
float u_xlat29;
mediump vec3 u_xlat16_30;
int u_xlati40;
mediump vec2 u_xlat16_41;
float u_xlat43;
mediump float u_xlat16_43;
float u_xlat49;
mediump float u_xlat16_50;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat63;
float u_xlat64;
float u_xlat65;
mediump float u_xlat16_66;
float u_xlat67;
float u_xlat69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
mediump float u_xlat16_72;
mediump float u_xlat16_73;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatb0.xyz = greaterThanEqual(vec4(_UseDissolve2U, _UseVertical, _UseDissolveReversal, _UseDissolve2U), vec4(0.5, 0.5, 0.5, 0.0)).xyz;
    u_xlat16_1.xy = (u_xlatb0.x) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_41.xy = (u_xlatb0.x) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_1.xy = u_xlat16_41.xy + u_xlat16_1.xy;
    u_xlat16_41.x = (u_xlatb0.y) ? 0.0 : u_xlat16_1.x;
    u_xlat16_61 = (u_xlatb0.y) ? u_xlat16_1.y : 0.0;
    u_xlat16_2.xy = (u_xlatb0.z) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.xy = u_xlat16_1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat16_1.xy).x;
    u_xlat16_1.x = u_xlat16_61 + u_xlat16_41.x;
    u_xlat16_21 = u_xlat16_2.x * u_xlat16_1.x;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.y + u_xlat16_21;
    u_xlat16_1.x = _Cutoff * 1.20000005 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -1.10000002;
    u_xlat16_1.x = u_xlat16_1.x * 2.0 + -0.0599999987;
    u_xlat16_21 = max(_DissolveEdgeShrink, 0.0);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_21 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.5>=u_xlat16_1.x);
#else
    u_xlatb0.x = 0.5>=u_xlat16_1.x;
#endif
    if(!u_xlatb0.x){discard;}
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
    u_xlat65 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat65 = max(u_xlat65, 1.17549435e-38);
    u_xlat65 = inversesqrt(u_xlat65);
    u_xlat7.xyz = vec3(u_xlat65) * u_xlat5.xyz;
    u_xlat24.x = dot(u_xlat7.xyz, u_xlat24.xyz);
    u_xlat24.x = (-u_xlat24.x) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * _ShadowBias.z;
    u_xlat24.xyz = (-u_xlat7.xyz) * u_xlat24.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat24.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat3.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat0.z + (-u_xlat3.x);
    u_xlat23 = max((-u_xlat0.w), u_xlat3.x);
    u_xlat23 = (-u_xlat3.x) + u_xlat23;
    u_xlat0.z = _ShadowBias.y * u_xlat23 + u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec0 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec1 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat3.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec2 = vec3(u_xlat3.xy,u_xlat3.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat3.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat3.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat3.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat20.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat20.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_20.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_6.x = u_xlat16_20.z * _ShadowStrength;
    u_xlat20.xy = u_xlat16_20.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.xy = min(max(u_xlat20.xy, 0.0), 1.0);
#else
    u_xlat20.xy = clamp(u_xlat20.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _ShadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xw = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_30.x = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_10.x * u_xlat16_30.x;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb3 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb3)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb3 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb3) ? 1.0 : 0.0;
    u_xlat16_70 = max(u_xlat16_70, u_xlat16_11.x);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_70;
    u_xlat16_11.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_66 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + u_xlat16_10.xyz;
    u_xlat63 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat63 = inversesqrt(u_xlat63);
    u_xlat4.xyz = vec3(u_xlat63) * u_xlat4.xyz;
    u_xlat16_70 = dot(u_xlat16_10.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat63 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat63 = min(max(u_xlat63, 0.0), 1.0);
#else
    u_xlat63 = clamp(u_xlat63, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat24.x = (-u_xlat16_70) + 1.0;
    u_xlat16_10.x = u_xlat24.x * u_xlat24.x;
    u_xlat16_10.x = u_xlat24.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat24.x * u_xlat16_10.x;
    u_xlat16_30.x = u_xlat24.x * u_xlat16_10.x;
    u_xlat24.x = (-u_xlat16_10.x) * u_xlat24.x + 1.0;
    u_xlat16_1 = texture(_AlbedoTex, vs_TEXCOORD3.xy);
    u_xlat16_10.xzw = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_1.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xzw = u_xlat16_1.xyz * u_xlat16_10.xzw;
    u_xlat16_12.xyz = _AlbedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_MaterialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_8.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_8.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = u_xlat24.xxx * u_xlat16_12.xyz;
    u_xlat67 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat67 = min(max(u_xlat67, 0.0), 1.0);
#else
    u_xlat67 = clamp(u_xlat67, 0.0, 1.0);
#endif
    u_xlat24.xyz = vec3(u_xlat67) * u_xlat16_30.xxx + u_xlat24.xyz;
    u_xlat16_30.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0078125);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0078125);
    u_xlat9.x = (-u_xlat63) * u_xlat16_30.x + u_xlat63;
    u_xlat9.x = u_xlat63 * u_xlat9.x + u_xlat16_30.x;
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat63 + u_xlat9.x;
    u_xlat16_13.xyz = u_xlat3.xyz * vec3(u_xlat16_66);
    u_xlat14.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat14.x = min(max(u_xlat14.x, 0.0), 1.0);
#else
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
#endif
    u_xlat29 = (-u_xlat14.x) * u_xlat16_30.x + u_xlat14.x;
    u_xlat29 = u_xlat14.x * u_xlat29 + u_xlat16_30.x;
    u_xlat29 = sqrt(u_xlat29);
    u_xlat9.y = u_xlat29 + u_xlat14.x;
    u_xlat9.xy = u_xlat9.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat9.x = u_xlat9.x * u_xlat9.y;
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = min(u_xlat9.x, 16.0);
    u_xlat49 = u_xlat16_30.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat49 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_30.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat9.x * u_xlat4.x;
    u_xlat4.xyz = u_xlat24.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat63) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat20.xxx * u_xlat4.xyz;
    u_xlat15.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat64 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat64 = inversesqrt(u_xlat64);
    u_xlat15.xyz = vec3(u_xlat64) * u_xlat15.xyz;
    u_xlat16_71 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat64 = dot(u_xlat7.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat64 = min(max(u_xlat64, 0.0), 1.0);
#else
    u_xlat64 = clamp(u_xlat64, 0.0, 1.0);
#endif
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat64 * u_xlat49 + 1.0;
    u_xlat64 = u_xlat64 * u_xlat64;
    u_xlat64 = u_xlat16_30.x / u_xlat64;
    u_xlat64 = u_xlat64 * 0.318309873;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat9.x = (-u_xlat16_71) + 1.0;
    u_xlat16_71 = u_xlat9.x * u_xlat9.x;
    u_xlat16_71 = u_xlat9.x * u_xlat16_71;
    u_xlat16_71 = u_xlat9.x * u_xlat16_71;
    u_xlat16_72 = u_xlat9.x * u_xlat16_71;
    u_xlat9.x = (-u_xlat16_71) * u_xlat9.x + 1.0;
    u_xlat15.xyz = u_xlat16_12.xyz * u_xlat9.xxx;
    u_xlat15.xyz = vec3(u_xlat67) * vec3(u_xlat16_72) + u_xlat15.xyz;
    u_xlat9.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat69 = (-u_xlat9.x) * u_xlat16_30.x + u_xlat9.x;
    u_xlat69 = u_xlat9.x * u_xlat69 + u_xlat16_30.x;
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat9.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat69 * u_xlat9.y;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = min(u_xlat69, 16.0);
    u_xlat64 = u_xlat64 * u_xlat69;
    u_xlat15.xyz = u_xlat15.xyz * vec3(u_xlat64);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xyz = min(max(u_xlat15.xyz, 0.0), 1.0);
#else
    u_xlat15.xyz = clamp(u_xlat15.xyz, 0.0, 1.0);
#endif
    u_xlat15.xyz = u_xlat15.xyz * _DirectSpecularColor.xyz;
    u_xlat15.xyz = u_xlat9.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_16.xyz = u_xlat15.xyz * u_xlat16_6.xyz + u_xlat4.xyz;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_71 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_71 = max(u_xlat16_71, 6.10351563e-05);
    u_xlat16_72 = u_xlat16_71 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_72 = (-u_xlat16_72) * u_xlat16_72 + 1.0;
    u_xlat16_72 = max(u_xlat16_72, 0.0);
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
    u_xlat16_73 = float(1.0) / float(u_xlat16_71);
    u_xlat16_71 = inversesqrt(u_xlat16_71);
    u_xlat16_17.xyz = u_xlat4.xyz * vec3(u_xlat16_71);
    u_xlat16_71 = u_xlat16_72 * u_xlat16_73;
    u_xlat16_72 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_72));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_72);
#endif
    u_xlat16_18.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_71 = max(u_xlat16_71, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_72 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_72 = u_xlat16_72 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_72 = min(max(u_xlat16_72, 0.0), 1.0);
#else
    u_xlat16_72 = clamp(u_xlat16_72, 0.0, 1.0);
#endif
    u_xlat16_72 = u_xlat16_72 * u_xlat16_72;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_73 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat16_72 = max(u_xlat16_72, u_xlat16_73);
    u_xlat16_71 = u_xlat16_71 * u_xlat16_72;
    u_xlat16_18.xyz = vec3(u_xlat16_71) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_66) + u_xlat16_17.xyz;
    u_xlat4.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xxx;
    u_xlat16_66 = dot(u_xlat16_17.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat3.x * u_xlat49 + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = u_xlat16_30.x / u_xlat3.x;
    u_xlat3.x = u_xlat3.x * 0.318309873;
    u_xlat23 = dot(u_xlat7.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23 = min(max(u_xlat23, 0.0), 1.0);
#else
    u_xlat23 = clamp(u_xlat23, 0.0, 1.0);
#endif
    u_xlat43 = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat43 * u_xlat43;
    u_xlat16_66 = u_xlat43 * u_xlat16_66;
    u_xlat16_66 = u_xlat43 * u_xlat16_66;
    u_xlat16_71 = u_xlat43 * u_xlat16_66;
    u_xlat43 = (-u_xlat16_66) * u_xlat43 + 1.0;
    u_xlat4.xyz = u_xlat16_12.xyz * vec3(u_xlat43);
    u_xlat4.xyz = vec3(u_xlat67) * vec3(u_xlat16_71) + u_xlat4.xyz;
    u_xlat43 = (-u_xlat23) * u_xlat16_30.x + u_xlat23;
    u_xlat43 = u_xlat23 * u_xlat43 + u_xlat16_30.x;
    u_xlat43 = sqrt(u_xlat43);
    u_xlat43 = u_xlat43 + u_xlat23;
    u_xlat43 = u_xlat43 + 6.10351563e-05;
    u_xlat43 = u_xlat43 * u_xlat9.y;
    u_xlat3.z = float(1.0) / u_xlat43;
    u_xlat3.xz = min(u_xlat3.xz, vec2(16.0, 16.0));
    u_xlat3.x = u_xlat3.z * u_xlat3.x;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat3.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz * _DirectSpecularColor.xyz;
    u_xlat4.xyz = vec3(u_xlat23) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat16_18.xyz * u_xlat4.xyz;
    u_xlat16_16.xyz = u_xlat4.xyz * u_xlat20.yyy + u_xlat16_16.xyz;
    u_xlat16_66 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_66) * u_xlat16_10.xzw;
    u_xlat16_17.xyz = u_xlat16_10.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_17.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat20.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat63) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat9.xxx + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_18.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat20.yyy * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * vec3(u_xlat23) + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat65) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(_OcclusionScale) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_11.xyz = vec3(u_xlat16_66) * u_xlat16_11.xyz;
    u_xlat16_66 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_71 = (-u_xlat16_66) + u_xlat16_71;
    u_xlat16_72 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _OcclusionScale * u_xlat16_72 + 1.0;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_71 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_8.w * u_xlat16_66;
    u_xlat16_71 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71 = min(max(u_xlat16_71, 0.0), 1.0);
#else
    u_xlat16_71 = clamp(u_xlat16_71, 0.0, 1.0);
#endif
    u_xlat16_71 = u_xlat16_71 + -1.0;
    u_xlat16_71 = _OcclusionScale * u_xlat16_71 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_71;
    u_xlat0.xy = min(u_xlat0.xw, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_17.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat0.xxx * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat0.xxx * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat0.xxx + (-u_xlat16_18.xyz);
    u_xlat16_18.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_17.xyz = u_xlat16_18.xyz * u_xlat0.xxx + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_18.y = u_xlat16_11.y;
    u_xlat16_19.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_18.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = vec3(u_xlat16_71) * u_xlat16_19.xyz;
    u_xlati40 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati40].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati40 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati40].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xzw * u_xlat16_17.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_13.xyz);
    u_xlat16_8.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat3.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_10.xzw = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xzw = min(max(u_xlat16_10.xzw, 0.0), 1.0);
#else
    u_xlat16_10.xzw = clamp(u_xlat16_10.xzw, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_10.zxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_10.x = floor(u_xlat16_4.w);
    u_xlat16_50 = u_xlat16_10.x + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_4.x = u_xlat16_50 * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_23 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_4.x = u_xlat16_10.x * 16.0 + u_xlat16_4.z;
    u_xlat16_11.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_43 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_10.x = u_xlat16_10.w * 15.0 + (-u_xlat16_10.x);
    u_xlat16_50 = (-u_xlat16_43) + u_xlat16_23;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_50 + u_xlat16_43;
    u_xlat16_10.x = u_xlat16_71 * u_xlat16_10.x;
    u_xlat3.x = u_xlat3.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat0.y * 0.5;
    u_xlat16_50 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_10.x = u_xlat3.x * u_xlat16_50 + u_xlat16_10.x;
    u_xlat16_50 = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat16_70 = (-u_xlat16_10.x) * 2.0 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_70 + u_xlat16_50;
    u_xlat16_10.x = u_xlat0.y * u_xlat16_10.x;
    u_xlat16_10.x = min(u_xlat16_2.z, u_xlat16_10.x);
    u_xlat3.xyz = u_xlat5.xyz * vec3(u_xlat65) + (-u_xlat0.xzw);
    u_xlat0.xyz = u_xlat16_30.xxx * u_xlat3.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat11.y = u_xlat0.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_30.x = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat14.y = u_xlat16_8.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat14.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_30.x);
    u_xlat16_30.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_30.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_30.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_17.xyz = vec3(u_xlat16_66) * u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0.x = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_30.xyz = (u_xlatb0.x) ? u_xlat16_17.xyz : u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xxx * u_xlat16_30.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_16.xyz;
    u_xlat16_66 = dot(u_xlat16_10.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_1.w * _AlbedoColor.w + u_xlat16_66;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_1.w * _AlbedoColor.w;
    u_xlat16_0.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_30.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_30.xyz = u_xlat16_0.xyz * u_xlat16_30.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_30.xyz = u_xlat16_0.xyz * u_xlat16_30.xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * _EmissiveColor.xyz + u_xlat16_6.xyz;
    u_xlat16_0.x = texture(_LGMask, vs_TEXCOORD3.xy).x;
    u_xlat20.xy = _Time.yy * vec2(_USpeed_LG, _VSpeed_LG) + vs_TEXCOORD3.xy;
    u_xlat20.xy = u_xlat20.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_1 = texture(_LGTex, u_xlat20.xy);
    u_xlat16_30.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(_LGIntensity);
    u_xlat16_30.xyz = u_xlat16_1.www * u_xlat16_30.xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * _LGColor.xyz + u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, (-u_xlat16_13.xyz));
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat16_13.xyz * u_xlat0.xxx + u_xlat7.xyz;
    u_xlat60 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat60 = inversesqrt(u_xlat60);
    u_xlat0.xyz = vec3(u_xlat60) * u_xlat0.xyz;
    u_xlat16_0 = textureLod(_LaserCubemap, u_xlat0.xyz, _LaserCubemapMip);
    u_xlat16_30.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_30.xyz;
    u_xlat16_6.xyz = u_xlat16_30.xyz * vec3(vec3(_LaserIntensity, _LaserIntensity, _LaserIntensity)) + u_xlat16_6.xyz;
    u_xlat16_30.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_30.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0.x = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0.x) ? u_xlat16_66 : u_xlat16_10.x;
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
  GpuProgramID 91152
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Common_EnvLaserGUI"
}