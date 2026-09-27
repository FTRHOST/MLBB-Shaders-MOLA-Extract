//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Fur/Fur11LayerShader" {
Properties {

_MainColor ("基础色", Color) = (1,1,1,1)

_MainColorPower ("主颜色次幂", Float) = 0.1550000011920929

_MainColorIntensity ("主颜色强度", Float) = 1.0190000534057617

_Ambient ("环境色", Color) = (1,1,1,1)

_MainTex ("主贴图", 2D) = "white" { }

_NoiseTex ("噪点图", 2D) = "white" { }

_NoiseTexUV ("噪点图UV&Tling", Vector) = (1,1,1,1)

_SHIntensity ("球谐光照强度", Float) = 1.0

_FurSHIntensity ("绒毛球谐参数", Float) = 1.0

_SpecularOffset ("高光偏移", Float) = 1.0

_ShadowParams ("阴影参数", Vector) = (1,1,1,1)

_DirLightPower ("平行灯光次幂", Float) = 1.0

_DirLightIntensity ("平行光强度", Float) = 1.0

_DirLightColor ("平行光颜色", Color) = (1,1,1,1)

_FurLightIntensity ("绒毛灯光强度", Float) = 1.0

_SpecularColorA ("高光1颜色", Color) = (1,1,1,1)

_SpecIntensityA ("高光1强度", Float) = 1.0

_SpecularColorB ("高光2颜色", Color) = (1,1,1,1)

_SpecIntensityB ("高光2强度", Float) = 1.0

_WindDir ("风力方向", Vector) = (1,1,1,1)

_FurDir ("绒毛方向", Vector) = (1,1,1,1)

_Alpha ("绒毛透明度", Float) = 1.0

_FurLength ("绒毛长度", Float) = 1.0

_FresnelPower ("边缘光", Float) = 1.0

_SHAr ("_SHAr", Vector) = (0.5,0.5,0.5,0.5)

_SHAg ("_SHAg", Vector) = (0.5,0.5,0.5,0.5)

_SHAb ("_SHAb", Vector) = (0.5,0.5,0.5,0.5)

_SHBr ("_SHBr", Vector) = (0.5,0.5,0.5,0.5)

_SHBg ("_SHBg", Vector) = (0.5,0.5,0.5,0.5)

_SHBb ("_SHBb", Vector) = (0.5,0.5,0.5,0.5)

_SHC ("_SHC", Vector) = (0.5,0.5,0.5,0.5)

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 7831
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	vec3 _DirLightColor;
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
vec3 u_xlat3;
float u_xlat4;
mediump float u_xlat16_6;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = u_xlat0.xy * _NoiseTexUV.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat12 = dot(u_xlat0, u_xlat0);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_6 = dot(_SHBr, u_xlat16_1);
    u_xlat16_2 = _SHC.x * u_xlat16_2 + u_xlat16_6;
    u_xlat0.w = 1.0;
    u_xlat16_6 = dot(_SHAr, u_xlat0);
    u_xlat16_2 = u_xlat16_2 + u_xlat16_6;
    u_xlat16_2 = max(u_xlat16_2, 0.0);
    u_xlat12 = log2(u_xlat16_2);
    u_xlat12 = u_xlat12 * 0.416666657;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * 1.05499995 + -0.0549999997;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * 1.33000004;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _SHIntensity;
    u_xlat12 = u_xlat12 * _FurSHIntensity;
    u_xlat3.x = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * (-_ShadowParams.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat4 = _DirLightPower + 1.0;
    u_xlat8 = _DirLightPower * 0.5;
    u_xlat0.x = u_xlat0.x * u_xlat4 + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * _FurLightIntensity;
    u_xlat0.x = u_xlat0.x * _DirLightIntensity;
    u_xlat0.xyz = u_xlat0.xxx * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z);
    vs_TEXCOORD1.xyz = _Ambient.xyz * vec3(u_xlat12) + u_xlat0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	vec4 _MainColor;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat0.xyz = u_xlat1.xyz / u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	vec3 _DirLightColor;
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
vec3 u_xlat3;
float u_xlat4;
mediump float u_xlat16_6;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = u_xlat0.xy * _NoiseTexUV.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat12 = dot(u_xlat0, u_xlat0);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_6 = dot(_SHBr, u_xlat16_1);
    u_xlat16_2 = _SHC.x * u_xlat16_2 + u_xlat16_6;
    u_xlat0.w = 1.0;
    u_xlat16_6 = dot(_SHAr, u_xlat0);
    u_xlat16_2 = u_xlat16_2 + u_xlat16_6;
    u_xlat16_2 = max(u_xlat16_2, 0.0);
    u_xlat12 = log2(u_xlat16_2);
    u_xlat12 = u_xlat12 * 0.416666657;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * 1.05499995 + -0.0549999997;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * 1.33000004;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _SHIntensity;
    u_xlat12 = u_xlat12 * _FurSHIntensity;
    u_xlat3.x = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * (-_ShadowParams.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat4 = _DirLightPower + 1.0;
    u_xlat8 = _DirLightPower * 0.5;
    u_xlat0.x = u_xlat0.x * u_xlat4 + u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * _FurLightIntensity;
    u_xlat0.x = u_xlat0.x * _DirLightIntensity;
    u_xlat0.xyz = u_xlat0.xxx * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z);
    vs_TEXCOORD1.xyz = _Ambient.xyz * vec3(u_xlat12) + u_xlat0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	vec4 _MainColor;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat0.xyz = u_xlat1.xyz / u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	vec3 _DirLightColor;
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
vec3 u_xlat3;
float u_xlat4;
mediump float u_xlat16_6;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = u_xlat0.xy * _NoiseTexUV.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat12 = dot(u_xlat0, u_xlat0);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_6 = dot(_SHBr, u_xlat16_1);
    u_xlat16_2 = _SHC.x * u_xlat16_2 + u_xlat16_6;
    u_xlat0.w = 1.0;
    u_xlat16_6 = dot(_SHAr, u_xlat0);
    u_xlat16_2 = u_xlat16_2 + u_xlat16_6;
    u_xlat16_2 = max(u_xlat16_2, 0.0);
    u_xlat12 = log2(u_xlat16_2);
    u_xlat12 = u_xlat12 * 0.416666657;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * 1.05499995 + -0.0549999997;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * 1.33000004;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _SHIntensity;
    u_xlat12 = u_xlat12 * _FurSHIntensity;
    u_xlat3.x = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * (-_ShadowParams.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat4 = _DirLightPower + 1.0;
    u_xlat8 = _DirLightPower * 0.5;
    u_xlat0.x = u_xlat0.x * u_xlat4 + u_xlat8;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * _FurLightIntensity;
    u_xlat0.x = u_xlat0.x * _DirLightIntensity;
    u_xlat0.xyz = u_xlat0.xxx * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z);
    vs_TEXCOORD1.xyz = _Ambient.xyz * vec3(u_xlat12) + u_xlat0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainColor;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat0.xyz = u_xlat1.xyz / u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	vec3 _DirLightColor;
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
vec3 u_xlat3;
float u_xlat4;
mediump float u_xlat16_6;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.zw = u_xlat0.xy * _NoiseTexUV.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat0;
    u_xlat12 = dot(u_xlat0, u_xlat0);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat16_2 = u_xlat0.y * u_xlat0.y;
    u_xlat16_2 = u_xlat0.x * u_xlat0.x + (-u_xlat16_2);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_6 = dot(_SHBr, u_xlat16_1);
    u_xlat16_2 = _SHC.x * u_xlat16_2 + u_xlat16_6;
    u_xlat0.w = 1.0;
    u_xlat16_6 = dot(_SHAr, u_xlat0);
    u_xlat16_2 = u_xlat16_2 + u_xlat16_6;
    u_xlat16_2 = max(u_xlat16_2, 0.0);
    u_xlat12 = log2(u_xlat16_2);
    u_xlat12 = u_xlat12 * 0.416666657;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * 1.05499995 + -0.0549999997;
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * 1.33000004;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _SHIntensity;
    u_xlat12 = u_xlat12 * _FurSHIntensity;
    u_xlat3.x = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * (-_ShadowParams.xyz);
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat4 = _DirLightPower + 1.0;
    u_xlat8 = _DirLightPower * 0.5;
    u_xlat0.x = u_xlat0.x * u_xlat4 + u_xlat8;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * _FurLightIntensity;
    u_xlat0.x = u_xlat0.x * _DirLightIntensity;
    u_xlat0.xyz = u_xlat0.xxx * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z);
    vs_TEXCOORD1.xyz = _Ambient.xyz * vec3(u_xlat12) + u_xlat0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainColor;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat0.xyz = u_xlat1.xyz / u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 78609
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.00999999978, 0.00999999978);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.00999999978, 0.00999999978) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.00999999978 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.0100999996;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.00499999989 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.100000001;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 0.5 + 0.00100000005;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.00999999978, 0.00999999978);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.00999999978, 0.00999999978) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.00999999978 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.0100999996;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.00499999989 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.100000001;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 0.5 + 0.00100000005;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.00999999978, 0.00999999978);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.00999999978, 0.00999999978) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.00999999978 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.0100999996;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.00499999989 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.100000001;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 0.5 + 0.00100000005;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.100000001, 0.100000001, 0.100000001);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.00999999978, 0.00999999978);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.00999999978, 0.00999999978) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.00999999978 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.0100999996;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.00499999989 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.100000001;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 0.5 + 0.00100000005;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 145151
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.200000003, 0.200000003);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.200000003, 0.200000003) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0199999996, 0.0199999996);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0199999996, 0.0199999996) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.0399999991 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.0416000001;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.0199999996 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.200000003;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_1 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat1.x = dot(vec2(u_xlat16_1), vec2(1.0, 1.0));
    u_xlat1.x = u_xlat1.x + (-u_xlat1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.w = u_xlat1.x * _Alpha;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.200000003, 0.200000003);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.200000003, 0.200000003) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0199999996, 0.0199999996);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0199999996, 0.0199999996) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.0399999991 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.0416000001;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.0199999996 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.200000003;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_1 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat1.x = dot(vec2(u_xlat16_1), vec2(1.0, 1.0));
    u_xlat1.x = u_xlat1.x + (-u_xlat1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat0.w = u_xlat1.x * _Alpha;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.200000003, 0.200000003);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.200000003, 0.200000003) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0199999996, 0.0199999996);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0199999996, 0.0199999996) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.0399999991 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.0416000001;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.0199999996 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.200000003;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_1 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat1.x = dot(vec2(u_xlat10_1), vec2(1.0, 1.0));
    u_xlat1.x = u_xlat1.x + (-u_xlat1.y);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.w = u_xlat1.x * _Alpha;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0399999991, 0.0399999991, 0.0399999991) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.200000003, 0.200000003, 0.200000003);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.200000003, 0.200000003);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.200000003, 0.200000003) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0199999996, 0.0199999996);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0199999996, 0.0199999996) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.0399999991 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.0416000001;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.0199999996 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.200000003;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec2 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_1 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat1.x = dot(vec2(u_xlat10_1), vec2(1.0, 1.0));
    u_xlat1.x = u_xlat1.x + (-u_xlat1.y);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0.w = u_xlat1.x * _Alpha;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 206187
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0900000036, 0.0900000036, 0.0900000036) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.300000012, 0.300000012);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.300000012, 0.300000012) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0299999993, 0.0299999993);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0299999993, 0.0299999993) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.0900000036 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.0979999974;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.0450000018 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.300000012;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 1.5 + 0.0900000036;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0900000036, 0.0900000036, 0.0900000036) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.300000012, 0.300000012);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.300000012, 0.300000012) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0299999993, 0.0299999993);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0299999993, 0.0299999993) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.0900000036 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.0979999974;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.0450000018 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.300000012;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 1.5 + 0.0900000036;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0900000036, 0.0900000036, 0.0900000036) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.300000012, 0.300000012);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.300000012, 0.300000012) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0299999993, 0.0299999993);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0299999993, 0.0299999993) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.0900000036 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.0979999974;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.0450000018 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.300000012;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 1.5 + 0.0900000036;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0900000036, 0.0900000036, 0.0900000036) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.300000012, 0.300000012, 0.300000012);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.300000012, 0.300000012);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.300000012, 0.300000012) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0299999993, 0.0299999993);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0299999993, 0.0299999993) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.0900000036 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.0979999974;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.0450000018 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.300000012;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 1.5 + 0.0900000036;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 322692
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.159999996, 0.159999996, 0.159999996) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.400000006, 0.400000006);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.400000006, 0.400000006) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0399999991, 0.0399999991);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0399999991, 0.0399999991) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.159999996 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.185599998;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.0790000036 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.400000006;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 2.0 + 0.159999996;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.159999996, 0.159999996, 0.159999996) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.400000006, 0.400000006);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.400000006, 0.400000006) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0399999991, 0.0399999991);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0399999991, 0.0399999991) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.159999996 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.185599998;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.0790000036 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.400000006;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 2.0 + 0.159999996;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.159999996, 0.159999996, 0.159999996) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.400000006, 0.400000006);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.400000006, 0.400000006) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0399999991, 0.0399999991);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0399999991, 0.0399999991) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.159999996 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.185599998;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.0790000036 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.400000006;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 2.0 + 0.159999996;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.159999996, 0.159999996, 0.159999996) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.400000006, 0.400000006, 0.400000006);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.400000006, 0.400000006);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.400000006, 0.400000006) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0399999991, 0.0399999991);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0399999991, 0.0399999991) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.159999996 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.185599998;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.0790000036 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.400000006;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 2.0 + 0.159999996;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 350321
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.25, 0.25, 0.25) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0500000007, 0.0500000007) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.25 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.3125;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.125 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.5;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 2.5 + 0.25;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.25, 0.25, 0.25) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0500000007, 0.0500000007) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.25 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.3125;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.125 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.5;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 2.5 + 0.25;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.25, 0.25, 0.25) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0500000007, 0.0500000007) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.25 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.3125;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.125 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.5;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 2.5 + 0.25;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.25, 0.25, 0.25) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0500000007, 0.0500000007) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.25 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.3125;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.125 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.5;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 2.5 + 0.25;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 439734
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.360000014, 0.360000014, 0.360000014) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.600000024, 0.600000024, 0.600000024);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.600000024, 0.600000024);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.600000024, 0.600000024) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0599999987, 0.0599999987);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0599999987, 0.0599999987) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.360000014 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.489600003;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.180000007 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.600000024;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 3.0 + 0.360000014;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.360000014, 0.360000014, 0.360000014) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.600000024, 0.600000024, 0.600000024);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.600000024, 0.600000024);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.600000024, 0.600000024) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0599999987, 0.0599999987);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0599999987, 0.0599999987) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.360000014 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.489600003;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.180000007 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.600000024;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 3.0 + 0.360000014;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.360000014, 0.360000014, 0.360000014) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.600000024, 0.600000024, 0.600000024);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.600000024, 0.600000024);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.600000024, 0.600000024) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0599999987, 0.0599999987);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0599999987, 0.0599999987) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.360000014 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.489600003;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.180000007 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.600000024;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 3.0 + 0.360000014;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.360000014, 0.360000014, 0.360000014) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.600000024, 0.600000024, 0.600000024);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.600000024, 0.600000024);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.600000024, 0.600000024) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0599999987, 0.0599999987);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0599999987, 0.0599999987) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.360000014 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.489600003;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.180000007 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.600000024;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 3.0 + 0.360000014;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 469180
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.49000001, 0.49000001, 0.49000001) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.699999988, 0.699999988, 0.699999988);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.699999988, 0.699999988);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.699999988, 0.699999988) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0700000003, 0.0700000003);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0700000003, 0.0700000003) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.49000001 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.730000019;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.245000005 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.699999988;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 3.5 + 0.49000001;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.49000001, 0.49000001, 0.49000001) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.699999988, 0.699999988, 0.699999988);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.699999988, 0.699999988);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.699999988, 0.699999988) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0700000003, 0.0700000003);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0700000003, 0.0700000003) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.49000001 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.730000019;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.245000005 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.699999988;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 3.5 + 0.49000001;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.49000001, 0.49000001, 0.49000001) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.699999988, 0.699999988, 0.699999988);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.699999988, 0.699999988);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.699999988, 0.699999988) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0700000003, 0.0700000003);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0700000003, 0.0700000003) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.49000001 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.730000019;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.245000005 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.699999988;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 3.5 + 0.49000001;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.49000001, 0.49000001, 0.49000001) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.699999988, 0.699999988, 0.699999988);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.699999988, 0.699999988);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.699999988, 0.699999988) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0700000003, 0.0700000003);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0700000003, 0.0700000003) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.49000001 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 0.730000019;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.245000005 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.699999988;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 3.5 + 0.49000001;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 557382
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.639999986, 0.639999986, 0.639999986) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.800000012, 0.800000012, 0.800000012);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.800000012, 0.800000012);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.800000012, 0.800000012) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0799999982, 0.0799999982);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0799999982, 0.0799999982) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.639999986 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 1.04960001;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.319000006 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.800000012;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 4.0 + 0.639999986;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.639999986, 0.639999986, 0.639999986) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.800000012, 0.800000012, 0.800000012);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.800000012, 0.800000012);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.800000012, 0.800000012) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0799999982, 0.0799999982);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0799999982, 0.0799999982) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.639999986 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 1.04960001;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.319000006 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.800000012;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 4.0 + 0.639999986;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.639999986, 0.639999986, 0.639999986) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.800000012, 0.800000012, 0.800000012);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.800000012, 0.800000012);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.800000012, 0.800000012) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0799999982, 0.0799999982);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0799999982, 0.0799999982) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.639999986 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 1.04960001;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.319000006 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.800000012;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 4.0 + 0.639999986;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.639999986, 0.639999986, 0.639999986) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.800000012, 0.800000012, 0.800000012);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.800000012, 0.800000012);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.800000012, 0.800000012) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0799999982, 0.0799999982);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0799999982, 0.0799999982) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.639999986 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 1.04960001;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.319000006 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.800000012;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 4.0 + 0.639999986;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 601769
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.810000002, 0.810000002, 0.810000002) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.899999976, 0.899999976, 0.899999976);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.899999976, 0.899999976);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.899999976, 0.899999976) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0900000036, 0.0900000036);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0900000036, 0.0900000036) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.810000002 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 1.46609998;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.405000001 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.899999976;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 4.5 + 0.810000002;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.810000002, 0.810000002, 0.810000002) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.899999976, 0.899999976, 0.899999976);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.899999976, 0.899999976);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.899999976, 0.899999976) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0900000036, 0.0900000036);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0900000036, 0.0900000036) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.810000002 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 1.46609998;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat22 = _FurLength * 0.405000001 + u_xlat22;
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.899999976;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 4.5 + 0.810000002;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.810000002, 0.810000002, 0.810000002) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.899999976, 0.899999976, 0.899999976);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.899999976, 0.899999976);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.899999976, 0.899999976) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0900000036, 0.0900000036);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0900000036, 0.0900000036) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.810000002 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 1.46609998;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.405000001 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.899999976;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 4.5 + 0.810000002;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat14;
vec2 u_xlat16;
float u_xlat21;
float u_xlat22;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat21 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat21) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.810000002, 0.810000002, 0.810000002) + in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.899999976, 0.899999976, 0.899999976);
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * vec2(0.899999976, 0.899999976);
    u_xlat0.xy = _NoiseTex_ST.xy * vec2(0.899999976, 0.899999976) + u_xlat0.xy;
    u_xlat14.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat14.xy = u_xlat14.xy * _NoiseTexUV.ww;
    u_xlat2.xy = u_xlat14.xy * vec2(0.0900000036, 0.0900000036);
    u_xlat2.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat2.xy * u_xlat16.xy + u_xlat3.xy;
    u_xlat0.xy = u_xlat3.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat14.xy * vec2(0.0900000036, 0.0900000036) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat7 = in_COLOR0.w + _FurDir.w;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat21 = dot(u_xlat1, u_xlat1);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_11 = dot(_SHBr, u_xlat16_2);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_11;
    u_xlat1.w = 1.0;
    u_xlat16_11 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_11;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat21 = log2(u_xlat16_4);
    u_xlat21 = u_xlat21 * 0.416666657;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.05499995 + -0.0549999997;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * 1.33000004;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _SHIntensity;
    u_xlat21 = u_xlat21 * _FurSHIntensity;
    u_xlat3.xyz = _Ambient.xyz * vec3(u_xlat21) + (-vec3(u_xlat21));
    u_xlat22 = _Ambient.w * -0.810000002 + 1.0;
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat3.xyz + vec3(u_xlat21);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * _FresnelPower;
    u_xlat21 = u_xlat21 * 1.46609998;
    u_xlat2.yzw = u_xlat3.xyz * vec3(u_xlat21) + u_xlat3.xyz;
    u_xlat21 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz);
    u_xlat5.xyz = vec3(u_xlat21) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat22 = _DirLightPower + 1.0;
    u_xlat3.x = _DirLightPower * 0.5;
    u_xlat22 = u_xlat21 * u_xlat22 + u_xlat3.x;
    u_xlat21 = u_xlat21;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat22 = _FurLength * 0.405000001 + u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat22 = u_xlat22 * _FurLightIntensity;
    u_xlat22 = u_xlat22 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat22) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat6.xyz = u_xlat0.xyz * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.zxy * u_xlat0.yzx + (-u_xlat6.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat22);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat5.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat7 = u_xlat0.x + 1.0;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat14.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat7 = u_xlat14.x * u_xlat7;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat7) * u_xlat0.xz;
    u_xlat7 = u_xlat0.y * 0.899999976;
    u_xlat1.xyz = vec3(u_xlat7) * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat21);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 4.5 + 0.810000002;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 685083
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat10;
mediump float u_xlat16_12;
vec2 u_xlat16;
vec2 u_xlat19;
float u_xlat24;
float u_xlat25;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat24 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat24) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz + in_NORMAL0.xyz;
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw + _NoiseTex_ST.xy;
    u_xlat16.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat10.xy = u_xlat16.xy * _NoiseTexUV.ww;
    u_xlat16.xy = u_xlat10.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat16.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat3.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat19.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat16.xy * u_xlat3.xy + u_xlat19.xy;
    u_xlat0.xy = u_xlat19.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat10.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat8 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat8;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat24 = dot(u_xlat1, u_xlat1);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_3 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_12 = dot(_SHBr, u_xlat16_3);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_12;
    u_xlat1.w = 1.0;
    u_xlat16_12 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_12;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat24 = log2(u_xlat16_4);
    u_xlat24 = u_xlat24 * 0.416666657;
    u_xlat24 = exp2(u_xlat24);
    u_xlat24 = u_xlat24 * 1.05499995 + -0.0549999997;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat10.z = log2(u_xlat24);
    u_xlat2.xyz = u_xlat10.xyz * vec3(1.33000004, 1.33000004, 1.33000004);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_SHIntensity);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_FurSHIntensity, _FurSHIntensity, _FurSHIntensity));
    u_xlat5.xyz = _Ambient.xyz * u_xlat2.xyz + (-u_xlat2.xyz);
    u_xlat24 = (-_Ambient.w) + 1.0;
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat25 = u_xlat24 + u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat24 = u_xlat24 * _FresnelPower;
    u_xlat2.yzw = u_xlat2.xyz * vec3(u_xlat24) + u_xlat2.xyz;
    u_xlat24 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * (-_ShadowParams.xyz);
    u_xlat6.xyz = vec3(u_xlat24) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat25 = _DirLightPower + 1.0;
    u_xlat5.x = _DirLightPower * 0.5;
    u_xlat25 = u_xlat24 * u_xlat25 + u_xlat5.x;
    u_xlat24 = u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat25 = _FurLength * 0.5 + u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat25 * _FurLightIntensity;
    u_xlat25 = u_xlat25 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat25) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat5.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat5.zxy * u_xlat0.yzx + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat25 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat25);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat6.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat8 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16.x = u_xlat8 * -2.0 + 3.0;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat8 = u_xlat16.x * u_xlat8;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xz;
    u_xlat1.xyz = u_xlat0.yyy * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat24);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 5.0 + 1.0;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat10;
mediump float u_xlat16_12;
vec2 u_xlat16;
vec2 u_xlat19;
float u_xlat24;
float u_xlat25;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat24 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat24) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz + in_NORMAL0.xyz;
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw + _NoiseTex_ST.xy;
    u_xlat16.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat10.xy = u_xlat16.xy * _NoiseTexUV.ww;
    u_xlat16.xy = u_xlat10.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat16.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat3.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat19.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat16.xy * u_xlat3.xy + u_xlat19.xy;
    u_xlat0.xy = u_xlat19.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat10.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat8 = in_COLOR0.w + _FurDir.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat8;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat24 = dot(u_xlat1, u_xlat1);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_3 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_12 = dot(_SHBr, u_xlat16_3);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_12;
    u_xlat1.w = 1.0;
    u_xlat16_12 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_12;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat24 = log2(u_xlat16_4);
    u_xlat24 = u_xlat24 * 0.416666657;
    u_xlat24 = exp2(u_xlat24);
    u_xlat24 = u_xlat24 * 1.05499995 + -0.0549999997;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat10.z = log2(u_xlat24);
    u_xlat2.xyz = u_xlat10.xyz * vec3(1.33000004, 1.33000004, 1.33000004);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_SHIntensity);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_FurSHIntensity, _FurSHIntensity, _FurSHIntensity));
    u_xlat5.xyz = _Ambient.xyz * u_xlat2.xyz + (-u_xlat2.xyz);
    u_xlat24 = (-_Ambient.w) + 1.0;
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(u_xlat1.yzx, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat25 = u_xlat24 + u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat24 = u_xlat24 * _FresnelPower;
    u_xlat2.yzw = u_xlat2.xyz * vec3(u_xlat24) + u_xlat2.xyz;
    u_xlat24 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * (-_ShadowParams.xyz);
    u_xlat6.xyz = vec3(u_xlat24) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat25 = _DirLightPower + 1.0;
    u_xlat5.x = _DirLightPower * 0.5;
    u_xlat25 = u_xlat24 * u_xlat25 + u_xlat5.x;
    u_xlat24 = u_xlat24;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat25 = _FurLength * 0.5 + u_xlat25;
#ifdef UNITY_ADRENO_ES3
    u_xlat25 = min(max(u_xlat25, 0.0), 1.0);
#else
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
#endif
    u_xlat25 = u_xlat25 * _FurLightIntensity;
    u_xlat25 = u_xlat25 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat25) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat5.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat5.zxy * u_xlat0.yzx + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat25 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat25);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat6.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat8 = u_xlat0.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat8 = min(max(u_xlat8, 0.0), 1.0);
#else
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16.x = u_xlat8 * -2.0 + 3.0;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat8 = u_xlat16.x * u_xlat8;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xz;
    u_xlat1.xyz = u_xlat0.yyy * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat24);
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
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 5.0 + 1.0;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat16_0.x = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat16_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat10;
mediump float u_xlat16_12;
vec2 u_xlat16;
vec2 u_xlat19;
float u_xlat24;
float u_xlat25;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat24 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat24) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz + in_NORMAL0.xyz;
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw + _NoiseTex_ST.xy;
    u_xlat16.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat10.xy = u_xlat16.xy * _NoiseTexUV.ww;
    u_xlat16.xy = u_xlat10.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat16.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat3.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat19.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat16.xy * u_xlat3.xy + u_xlat19.xy;
    u_xlat0.xy = u_xlat19.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat10.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat8 = in_COLOR0.w + _FurDir.w;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat8;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat24 = dot(u_xlat1, u_xlat1);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_3 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_12 = dot(_SHBr, u_xlat16_3);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_12;
    u_xlat1.w = 1.0;
    u_xlat16_12 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_12;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat24 = log2(u_xlat16_4);
    u_xlat24 = u_xlat24 * 0.416666657;
    u_xlat24 = exp2(u_xlat24);
    u_xlat24 = u_xlat24 * 1.05499995 + -0.0549999997;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat10.z = log2(u_xlat24);
    u_xlat2.xyz = u_xlat10.xyz * vec3(1.33000004, 1.33000004, 1.33000004);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_SHIntensity);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_FurSHIntensity, _FurSHIntensity, _FurSHIntensity));
    u_xlat5.xyz = _Ambient.xyz * u_xlat2.xyz + (-u_xlat2.xyz);
    u_xlat24 = (-_Ambient.w) + 1.0;
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat25 = u_xlat24 + u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat24 = u_xlat24 * _FresnelPower;
    u_xlat2.yzw = u_xlat2.xyz * vec3(u_xlat24) + u_xlat2.xyz;
    u_xlat24 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * (-_ShadowParams.xyz);
    u_xlat6.xyz = vec3(u_xlat24) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat25 = _DirLightPower + 1.0;
    u_xlat5.x = _DirLightPower * 0.5;
    u_xlat25 = u_xlat24 * u_xlat25 + u_xlat5.x;
    u_xlat24 = u_xlat24;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat25 = _FurLength * 0.5 + u_xlat25;
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlat25 = u_xlat25 * _FurLightIntensity;
    u_xlat25 = u_xlat25 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat25) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat5.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat5.zxy * u_xlat0.yzx + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat25 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat25);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat6.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat8 = u_xlat0.x + 1.0;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16.x = u_xlat8 * -2.0 + 3.0;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat8 = u_xlat16.x * u_xlat8;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xz;
    u_xlat1.xyz = u_xlat0.yyy * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat24);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 5.0 + 1.0;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _ShadowParams;
uniform 	vec4 _Ambient;
uniform 	vec4 _WindDir;
uniform 	vec4 _FurDir;
uniform 	float _SHIntensity;
uniform 	float _FurSHIntensity;
uniform 	float _DirLightPower;
uniform 	float _FurLightIntensity;
uniform 	float _DirLightIntensity;
uniform 	float _SpecularOffset;
uniform 	float _SpecIntensityA;
uniform 	float _FurLength;
uniform 	float _FresnelPower;
uniform 	float _SpecIntensityB;
uniform 	vec3 _DirLightColor;
uniform 	vec3 _SpecularColorA;
uniform 	vec3 _SpecularColorB;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _NoiseTex_ST;
uniform 	mediump vec4 _SHAr;
uniform 	mediump vec4 _SHBr;
uniform 	mediump vec4 _SHC;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump float u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat10;
mediump float u_xlat16_12;
vec2 u_xlat16;
vec2 u_xlat19;
float u_xlat24;
float u_xlat25;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyy * _WindDir.zyy;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.400000006, 0.300000012);
    u_xlat24 = _Time.y * _WindDir.x;
    u_xlat0.xyz = vec3(u_xlat24) * vec3(1.5, 0.5, 0.699999988) + u_xlat0.xyz;
    u_xlat1.y = cos(u_xlat0.y);
    u_xlat1.xz = sin(u_xlat0.xz);
    u_xlat0.xy = u_xlat1.xy * _WindDir.ww;
    u_xlat1.xyz = u_xlat1.xyz * _WindDir.www + _FurDir.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_NORMAL0.zzz + in_NORMAL0.xyz;
    u_xlat0.xy = u_xlat0.xy * _NoiseTex_ST.zw + _NoiseTex_ST.xy;
    u_xlat16.xy = in_COLOR0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat10.xy = u_xlat16.xy * _NoiseTexUV.ww;
    u_xlat16.xy = u_xlat10.xy * vec2(0.100000001, 0.100000001);
    u_xlat16.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001) + u_xlat16.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.100000001, 0.100000001);
    u_xlat3.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat19.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat16.xy * u_xlat3.xy + u_xlat19.xy;
    u_xlat0.xy = u_xlat19.xy * _NoiseTexUV.xy + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat10.xy * vec2(0.100000001, 0.100000001) + u_xlat0.xy;
    u_xlat0.x = _FurLength * 0.100000001;
    u_xlat8 = in_COLOR0.w + _FurDir.w;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat8;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yzx * in_POSITION0.www + u_xlat0.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.yzx;
    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
    u_xlat1 = in_NORMAL0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_NORMAL0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_NORMAL0.zzzz + u_xlat1;
    u_xlat24 = dot(u_xlat1, u_xlat1);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_4 = u_xlat1.y * u_xlat1.y;
    u_xlat16_4 = u_xlat1.x * u_xlat1.x + (-u_xlat16_4);
    u_xlat16_3 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat16_12 = dot(_SHBr, u_xlat16_3);
    u_xlat16_4 = _SHC.x * u_xlat16_4 + u_xlat16_12;
    u_xlat1.w = 1.0;
    u_xlat16_12 = dot(_SHAr, u_xlat1);
    u_xlat16_4 = u_xlat16_4 + u_xlat16_12;
    u_xlat16_4 = max(u_xlat16_4, 0.0);
    u_xlat24 = log2(u_xlat16_4);
    u_xlat24 = u_xlat24 * 0.416666657;
    u_xlat24 = exp2(u_xlat24);
    u_xlat24 = u_xlat24 * 1.05499995 + -0.0549999997;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat10.z = log2(u_xlat24);
    u_xlat2.xyz = u_xlat10.xyz * vec3(1.33000004, 1.33000004, 1.33000004);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(_SHIntensity);
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_FurSHIntensity, _FurSHIntensity, _FurSHIntensity));
    u_xlat5.xyz = _Ambient.xyz * u_xlat2.xyz + (-u_xlat2.xyz);
    u_xlat24 = (-_Ambient.w) + 1.0;
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(u_xlat1.yzx, u_xlat0.xyz);
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat25 = u_xlat24 + u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat24 = u_xlat24 * _FresnelPower;
    u_xlat2.yzw = u_xlat2.xyz * vec3(u_xlat24) + u_xlat2.xyz;
    u_xlat24 = dot((-_ShadowParams.xyz), (-_ShadowParams.xyz));
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * (-_ShadowParams.xyz);
    u_xlat6.xyz = vec3(u_xlat24) * (-_ShadowParams.xyz) + u_xlat0.zxy;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat25 = _DirLightPower + 1.0;
    u_xlat5.x = _DirLightPower * 0.5;
    u_xlat25 = u_xlat24 * u_xlat25 + u_xlat5.x;
    u_xlat24 = u_xlat24;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat25 = _FurLength * 0.5 + u_xlat25;
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlat25 = u_xlat25 * _FurLightIntensity;
    u_xlat25 = u_xlat25 * _DirLightIntensity;
    vs_TEXCOORD1.xyz = vec3(u_xlat25) * vec3(_DirLightColor.x, _DirLightColor.y, _DirLightColor.z) + u_xlat2.yzw;
    vs_TEXCOORD1.w = in_COLOR0.w;
    u_xlat5.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].zxy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].zxy * in_TANGENT0.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].zxy * in_TANGENT0.zzz + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat0.xyz * u_xlat5.xyz;
    u_xlat0.xyz = u_xlat5.zxy * u_xlat0.yzx + (-u_xlat7.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat25 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat25);
    u_xlat0.xyz = vec3(vec3(_SpecularOffset, _SpecularOffset, _SpecularOffset)) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat1.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat2.x = u_xlat1.x * u_xlat6.x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat2.xzw);
    u_xlat8 = u_xlat0.x + 1.0;
    u_xlat8 = clamp(u_xlat8, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) * u_xlat0.x + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16.x = u_xlat8 * -2.0 + 3.0;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat8 = u_xlat16.x * u_xlat8;
    u_xlat1.x = u_xlat0.x * _SpecIntensityA;
    u_xlat1.y = u_xlat0.x * _SpecIntensityB;
    u_xlat0.xz = exp2(u_xlat1.xy);
    u_xlat0.xy = vec2(u_xlat8) * u_xlat0.xz;
    u_xlat1.xyz = u_xlat0.yyy * _SpecularColorB.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _SpecularColorA.xyz + u_xlat1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    vs_TEXCOORD2.xyz = u_xlat0.xyz * vec3(u_xlat24);
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _NoiseTexUV;
uniform 	vec4 _MainColor;
uniform 	float _Alpha;
uniform 	float _MainColorPower;
uniform 	float _MainColorIntensity;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _MainColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_TEXCOORD1.xyz + vs_TEXCOORD2.xyz;
    u_xlat9 = vs_TEXCOORD1.w + _NoiseTexUV.z;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat1.xy = (-vec2(u_xlat9)) + vec2(2.0, 1.0);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat0.xyz = u_xlat1.xxx * u_xlat0.xyz + vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower));
    u_xlat9 = u_xlat1.y * 5.0 + 1.0;
    u_xlat0.xyz = u_xlat2.xyz / u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(_MainColorIntensity);
    u_xlat10_0.x = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    u_xlat0.x = dot(u_xlat10_0.xx, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x + (-u_xlat9);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = u_xlat0.x * _Alpha;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  GpuProgramID 745676
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
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
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
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
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996) + u_xlat1.xyz;
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
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996) + u_xlat1.xyz;
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
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996) + u_xlat1.xyz;
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
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996) + u_xlat1.xyz;
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
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996) + u_xlat1.xyz;
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
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996) + u_xlat1.xyz;
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
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996) + u_xlat1.xyz;
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
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0199999996, 0.0199999996, 0.0199999996) + u_xlat1.xyz;
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
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
}
}
}
}