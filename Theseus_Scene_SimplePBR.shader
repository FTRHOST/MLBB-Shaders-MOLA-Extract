//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Scene/SimplePBR" {
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

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_CustomLightDir ("自定义灯光方向", Vector) = (0,0,-1,1)

_CustomLightColor ("自定义灯光颜色", Color) = (1,1,1,1)

_albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

_materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

_normalMap ("法线贴图", 2D) = "bump" { }

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

_metallicDirectSpecularColor ("金属直接光高光颜色", Color) = (1,1,1,1)

_emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_occlusionScale ("AO强度", Range(0, 1)) = 0.0

_shadowStrength ("阴影强度", Range(0, 1)) = 0.5

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

_atmosBrightness ("空气透视亮度", Range(0, 10)) = 1.0

_atmosContrast ("空气透视对比度", Range(0, 2)) = 1.0

_atmosSaturation ("空气透视饱和度", Range(0, 2)) = 1.0

_atmosSaturationColor ("空气透视颜色", Color) = (1,1,1,1)

_atmosPeriod ("空气透视程度，最终的透视颜色为上面的参数控制的结果", Range(0, 1)) = 0.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 21972
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
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec2 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat16_7.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.zxy) + _metallicDirectSpecularColor.zxy;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.zxy;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.zxy;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.zxy + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.yzx, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_12.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_12.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_12.xyz;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec2 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat16_7.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.zxy) + _metallicDirectSpecularColor.zxy;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.zxy;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.zxy;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.zxy + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.yzx, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_12.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_12.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_12.xyz;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec2 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat16_7.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.zxy) + _metallicDirectSpecularColor.zxy;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.zxy;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.zxy;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.zxy + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.yzx, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_12.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_12.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_12.xyz;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec2 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat16_7.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.zxy) + _metallicDirectSpecularColor.zxy;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.zxy;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.zxy;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.zxy + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.yzx, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_12.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_12.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_12.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUSTOM_LIGHT" }
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
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _CustomLightDir;
uniform 	mediump vec4 _CustomLightColor;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_CustomLightDir.xyz, _CustomLightDir.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _CustomLightDir.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat16_7.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.zxy) + _metallicDirectSpecularColor.zxy;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.zxy;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_10.xyz = _CustomLightDir.www * _CustomLightColor.zxy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.zxy + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.yzx, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_12.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_12.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_12.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUSTOM_LIGHT" }
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
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _CustomLightDir;
uniform 	mediump vec4 _CustomLightColor;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_CustomLightDir.xyz, _CustomLightDir.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _CustomLightDir.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat16_7.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.zxy) + _metallicDirectSpecularColor.zxy;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.zxy;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_10.xyz = _CustomLightDir.www * _CustomLightColor.zxy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.zxy + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.yzx, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_12.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_12.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_12.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUSTOM_LIGHT" }
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
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _CustomLightDir;
uniform 	mediump vec4 _CustomLightColor;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_CustomLightDir.xyz, _CustomLightDir.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _CustomLightDir.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat16_7.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.zxy) + _metallicDirectSpecularColor.zxy;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.zxy;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_10.xyz = _CustomLightDir.www * _CustomLightColor.zxy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.zxy + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.yzx, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_12.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_12.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_12.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUSTOM_LIGHT" }
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
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
uniform 	mediump vec4 _CustomLightDir;
uniform 	mediump vec4 _CustomLightColor;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(4) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_CustomLightDir.xyz, _CustomLightDir.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _CustomLightDir.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat16_7.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.zxy * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.zxy) + _metallicDirectSpecularColor.zxy;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.zxy;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_10.xyz = _CustomLightDir.www * _CustomLightColor.zxy;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.zxy * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.zxy + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.yzx, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.zxy + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat36 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat36);
    u_xlat1.x = u_xlat36 * 0.0625 + u_xlat1.y;
    u_xlat16_12.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_12.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_12.xyz;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec2 u_xlat16_10;
mediump vec3 u_xlat16_11;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.xyz) + _metallicDirectSpecularColor.xyz;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.xyz;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
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
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec2 u_xlat16_10;
mediump vec3 u_xlat16_11;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.xyz) + _metallicDirectSpecularColor.xyz;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.xyz;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
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
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec2 u_xlat16_10;
mediump vec3 u_xlat16_11;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.xyz) + _metallicDirectSpecularColor.xyz;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.xyz;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
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
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _LightColor0;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec2 u_xlat16_10;
mediump vec3 u_xlat16_11;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.xyz) + _metallicDirectSpecularColor.xyz;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.xyz;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.xyz;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * _LightColor0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUSTOM_LIGHT" }
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
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump vec4 _CustomLightDir;
uniform 	mediump vec4 _CustomLightColor;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_CustomLightDir.xyz, _CustomLightDir.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _CustomLightDir.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.xyz) + _metallicDirectSpecularColor.xyz;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.xyz;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_10.xyz = _CustomLightDir.www * _CustomLightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUSTOM_LIGHT" }
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
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump vec4 _CustomLightDir;
uniform 	mediump vec4 _CustomLightColor;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_CustomLightDir.xyz, _CustomLightDir.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _CustomLightDir.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.xyz) + _metallicDirectSpecularColor.xyz;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.xyz;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_10.xyz = _CustomLightDir.www * _CustomLightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUSTOM_LIGHT" }
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
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump vec4 _CustomLightDir;
uniform 	mediump vec4 _CustomLightColor;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_CustomLightDir.xyz, _CustomLightDir.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _CustomLightDir.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.xyz) + _metallicDirectSpecularColor.xyz;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.xyz;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_10.xyz = _CustomLightDir.www * _CustomLightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUSTOM_LIGHT" }
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
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
vec3 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD1.w = 0.0;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD2.w = u_xlat0.x * in_TANGENT0.w;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

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
uniform 	mediump vec4 _CustomLightDir;
uniform 	mediump vec4 _CustomLightColor;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _metallicDirectSpecularColor;
uniform 	mediump float _renderingMode;
uniform 	mediump float _cutoff;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump vec4 _atmosSaturationColor;
uniform 	mediump float _atmosBrightness;
uniform 	mediump float _atmosContrast;
uniform 	mediump float _atmosSaturation;
uniform 	mediump float _atmosPeriod;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(2) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _normalMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
bool u_xlatb12;
mediump vec3 u_xlat16_22;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_38;
mediump float u_xlat16_42;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_renderingMode==1.0);
#else
    u_xlatb0 = _renderingMode==1.0;
#endif
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.x = _albedoColor.w * u_xlat16_1.w + (-_cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x<0.0);
#else
    u_xlatb12 = u_xlat16_2.x<0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    if(u_xlatb0){discard;}
    u_xlat0.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat0.y = u_xlat4.x;
    u_xlat0.x = u_xlat3.z;
    u_xlat16_5.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_TEXCOORD1.y;
    u_xlat0.y = dot(u_xlat16_2.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat0.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat16_2.x = dot(_CustomLightDir.xyz, _CustomLightDir.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * _CustomLightDir.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat36 + -1.0;
    u_xlat16_6.x = _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_38 = u_xlat16_6.x * u_xlat16_38 + 1.0;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.x = u_xlat16_3.z + -1.0;
    u_xlat16_6.x = _occlusionScale * u_xlat16_6.x + 1.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_6.x;
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_38) * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_1.xyz * u_xlat16_7.xyz;
    u_xlat16_38 = u_xlat16_1.w * _albedoColor.w;
    SV_Target0.w = u_xlat16_38;
    u_xlat16_8.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = u_xlat16_3.www * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_10.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_38 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_9.xyz = u_xlat16_10.yyy * u_xlat16_9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_11.xyz = (-_directSpecularColor.xyz) + _metallicDirectSpecularColor.xyz;
    u_xlat16_22.xyz = u_xlat16_10.yyy * u_xlat16_11.xyz + _directSpecularColor.xyz;
    u_xlat16_42 = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat36 = max(u_xlat16_42, 0.0450000018);
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_22.xyz;
    u_xlat16_10.xyz = _CustomLightDir.www * _CustomLightColor.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_10.xyz;
    u_xlat16_9.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_42 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_42 = inversesqrt(u_xlat16_42);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_42) + u_xlat16_2.xyz;
    u_xlat37 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat1.xyz = vec3(u_xlat37) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat36 * u_xlat36 + -1.0;
    u_xlat0.x = u_xlat16_2.x * u_xlat0.x + 1.00100005;
    u_xlat16_2.x = u_xlat36 / u_xlat0.x;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.0795774683, 0.0795774683, 0.0795774683);
    u_xlat16_9.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16_10.xyz * u_xlat16_9.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_9.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_6.xyz * _emissiveColor.xyz + u_xlat16_2.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, vec3(0.212500006, 0.715399981, 0.0720999986));
    u_xlat16_6.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + (-vec3(u_xlat16_38));
    u_xlat16_6.xyz = vec3(vec3(_atmosSaturation, _atmosSaturation, _atmosSaturation)) * u_xlat16_6.xyz + vec3(u_xlat16_38);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(_atmosBrightness) + vec3(-0.5, -0.5, -0.5);
    u_xlat16_6.xyz = vec3(vec3(_atmosContrast, _atmosContrast, _atmosContrast)) * u_xlat16_6.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_6.xyz = u_xlat16_6.xyz * _atmosSaturationColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(vec3(_atmosPeriod, _atmosPeriod, _atmosPeriod)) * u_xlat16_6.xyz + u_xlat16_2.xyz;
    u_xlat16_6.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_2.xyz;
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
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUSTOM_LIGHT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUSTOM_LIGHT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUSTOM_LIGHT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUSTOM_LIGHT" }
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
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUSTOM_LIGHT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUSTOM_LIGHT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUSTOM_LIGHT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUSTOM_LIGHT" }
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
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUSTOM_LIGHT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_CUSTOM_LIGHT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUSTOM_LIGHT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_CUSTOM_LIGHT" }
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
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUSTOM_LIGHT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
Local Keywords { "_CUSTOM_LIGHT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUSTOM_LIGHT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
Local Keywords { "_CUSTOM_LIGHT" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 71448
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
CustomEditor "CodeGenShaderGUI.Theseus_Scene_SimplePbrGUI"
}