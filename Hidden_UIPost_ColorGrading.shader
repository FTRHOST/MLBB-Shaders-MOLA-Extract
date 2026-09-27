//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/UIPost_ColorGrading" {
Properties {

[Space(20)] _MainTex ("Screen", 2D) = "black" { }

_VoronoTex ("VoronoTex1", 2D) = "black" { }

_Hue ("Hue", Float) = 0.0

_Saturation ("Saturation", Float) = 1.0

_Contrast ("Contrast", Float) = 1.0

[Space(20)] _Color1 ("Color1", Color) = (1,1,1,0)

_Color2 ("Color2", Color) = (0,0,0,0)

_RevertColor ("RevertColor", Float) = 0.0

[Space(10)] _BlackWhiteMaskVector ("BlackWhiteMaskVector", Vector) = (0.5,0.5,0,0)

[Space(20)] _centerU ("centerU", Range(0, 1)) = 0.5

_centerV ("centerV", Range(0, 1)) = 0.5

_LineTilingU ("LineTilingU", Range(0.01, 1)) = 0.5

_LineTilingV ("LineTilingV", Range(0.01, 1)) = 0.5

_LineUVScale ("LineUVScale", Range(0.01, 5)) = 3.0

[Space(20)] _AddTex ("Tex", 2D) = "white" { }

_TexRotator ("TexRotator", Range(0, 1)) = 0.0

_TexAlpha ("TexAlpha", Range(0, 1)) = 0.07000000029802322

_Tex_ST ("Tex_ST", Vector) = (300,300,0,0)

[Space(20)] _VignettePower ("VignettePower", Range(1, 3)) = 1.5

_VignetteColor ("VignetteColor", Color) = (0,0,0,1)

_VignetteScale ("VignetteScale", Range(0, 3)) = 1.5

}
SubShader {
 Pass {
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 44333
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec2 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_14;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_InvertColor);
#else
    u_xlatb0 = 0.5<_InvertColor;
#endif
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
#endif
    u_xlat16_14 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_14) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_14) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_2.x>=u_xlat0.x);
#else
    u_xlatb8 = u_xlat16_2.x>=u_xlat0.x;
#endif
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat8 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat8) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat12 = min(u_xlat0.y, u_xlat1.x);
    u_xlat4.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat12 = (-u_xlat12) + u_xlat0.x;
    u_xlat1.x = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat4.x = u_xlat4.x / u_xlat1.x;
    u_xlat4.x = u_xlat4.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat4.x) + _Hue;
    u_xlat16_6.x = u_xlat16_2.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_6.x>=(-u_xlat16_6.x));
#else
    u_xlatb4 = u_xlat16_6.x>=(-u_xlat16_6.x);
#endif
    u_xlat16_6.xy = (bool(u_xlatb4)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_6.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_6.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = u_xlat0.x + 1.00000001e-10;
    u_xlat4.x = u_xlat12 / u_xlat4.x;
    u_xlat16_2.x = u_xlat4.x * _Saturation;
    u_xlat4.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + (-_VignetteColor.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat3.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat12 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _VignettePower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_UseVignette);
#else
    u_xlatb12 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : u_xlat0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec2 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_14;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_InvertColor);
#else
    u_xlatb0 = 0.5<_InvertColor;
#endif
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
#endif
    u_xlat16_14 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_14) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_14) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_2.x>=u_xlat0.x);
#else
    u_xlatb8 = u_xlat16_2.x>=u_xlat0.x;
#endif
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat8 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat8) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat12 = min(u_xlat0.y, u_xlat1.x);
    u_xlat4.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat12 = (-u_xlat12) + u_xlat0.x;
    u_xlat1.x = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat4.x = u_xlat4.x / u_xlat1.x;
    u_xlat4.x = u_xlat4.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat4.x) + _Hue;
    u_xlat16_6.x = u_xlat16_2.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat16_6.x>=(-u_xlat16_6.x));
#else
    u_xlatb4 = u_xlat16_6.x>=(-u_xlat16_6.x);
#endif
    u_xlat16_6.xy = (bool(u_xlatb4)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_6.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_6.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = u_xlat0.x + 1.00000001e-10;
    u_xlat4.x = u_xlat12 / u_xlat4.x;
    u_xlat16_2.x = u_xlat4.x * _Saturation;
    u_xlat4.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + (-_VignetteColor.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat3.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat12 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _VignettePower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.5<_UseVignette);
#else
    u_xlatb12 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec2 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_14;
void main()
{
    u_xlatb0 = 0.5<_InvertColor;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat10_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
    u_xlat16_14 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_14) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_14) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
    u_xlatb8 = u_xlat16_2.x>=u_xlat0.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat8 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat8) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat12 = min(u_xlat0.y, u_xlat1.x);
    u_xlat4.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat12 = (-u_xlat12) + u_xlat0.x;
    u_xlat1.x = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat4.x = u_xlat4.x / u_xlat1.x;
    u_xlat4.x = u_xlat4.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat4.x) + _Hue;
    u_xlat16_6.x = u_xlat16_2.x * 360.0;
    u_xlatb4 = u_xlat16_6.x>=(-u_xlat16_6.x);
    u_xlat16_6.xy = (bool(u_xlatb4)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_6.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_6.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = u_xlat0.x + 1.00000001e-10;
    u_xlat4.x = u_xlat12 / u_xlat4.x;
    u_xlat16_2.x = u_xlat4.x * _Saturation;
    u_xlat4.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + (-_VignetteColor.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat3.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat12 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _VignettePower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _VignetteScale;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz + _VignetteColor.xyz;
    u_xlatb12 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec2 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
float u_xlat12;
bool u_xlatb12;
mediump float u_xlat16_14;
void main()
{
    u_xlatb0 = 0.5<_InvertColor;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat10_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
    u_xlat16_14 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_14) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_14) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
    u_xlatb8 = u_xlat16_2.x>=u_xlat0.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat8 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat8) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat12 = min(u_xlat0.y, u_xlat1.x);
    u_xlat4.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat12 = (-u_xlat12) + u_xlat0.x;
    u_xlat1.x = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat4.x = u_xlat4.x / u_xlat1.x;
    u_xlat4.x = u_xlat4.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat4.x) + _Hue;
    u_xlat16_6.x = u_xlat16_2.x * 360.0;
    u_xlatb4 = u_xlat16_6.x>=(-u_xlat16_6.x);
    u_xlat16_6.xy = (bool(u_xlatb4)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_6.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_6.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = u_xlat0.x + 1.00000001e-10;
    u_xlat4.x = u_xlat12 / u_xlat4.x;
    u_xlat16_2.x = u_xlat4.x * _Saturation;
    u_xlat4.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat4.xyz * u_xlat0.xxx;
    u_xlat1.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + (-_VignetteColor.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat3.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat12 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _VignettePower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = u_xlat12 * _VignetteScale;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz + _VignetteColor.xyz;
    u_xlatb12 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb12)) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_ADDTEX" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AddTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_8;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_InvertColor);
#else
    u_xlatb0 = 0.5<_InvertColor;
#endif
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
#endif
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_20) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_20) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x>=u_xlat0.x);
#else
    u_xlatb12 = u_xlat16_2.x>=u_xlat0.x;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat12 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat18 = min(u_xlat0.y, u_xlat1.x);
    u_xlat6.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat18 = (-u_xlat18) + u_xlat0.x;
    u_xlat1.x = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat1.x;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat6.x) + _Hue;
    u_xlat16_8.x = u_xlat16_2.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_8.x>=(-u_xlat16_8.x));
#else
    u_xlatb6 = u_xlat16_8.x>=(-u_xlat16_8.x);
#endif
    u_xlat16_8.xy = (bool(u_xlatb6)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_8.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_8.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = u_xlat0.x + 1.00000001e-10;
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat16_2.x = u_xlat6.x * _Saturation;
    u_xlat6.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xxx;
    u_xlat18 = _TexRotator * 0.0174532924;
    u_xlat16_2.x = sin((-u_xlat18));
    u_xlat16_4 = sin(u_xlat18);
    u_xlat16_5 = cos(u_xlat18);
    u_xlat16_2.y = u_xlat16_5;
    u_xlat16_2.z = u_xlat16_4;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat3.x = dot(u_xlat16_2.yx, u_xlat1.xy);
    u_xlat3.y = dot(u_xlat16_2.zy, u_xlat1.xy);
    u_xlat18 = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignettePower;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat16_1 = texture(_AddTex, u_xlat1.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha));
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_VignetteColor.xyz);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_UseVignette);
#else
    u_xlatb18 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_ADDTEX" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AddTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_8;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_InvertColor);
#else
    u_xlatb0 = 0.5<_InvertColor;
#endif
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
#endif
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_20) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_20) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x>=u_xlat0.x);
#else
    u_xlatb12 = u_xlat16_2.x>=u_xlat0.x;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat12 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat18 = min(u_xlat0.y, u_xlat1.x);
    u_xlat6.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat18 = (-u_xlat18) + u_xlat0.x;
    u_xlat1.x = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat1.x;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat6.x) + _Hue;
    u_xlat16_8.x = u_xlat16_2.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_8.x>=(-u_xlat16_8.x));
#else
    u_xlatb6 = u_xlat16_8.x>=(-u_xlat16_8.x);
#endif
    u_xlat16_8.xy = (bool(u_xlatb6)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_8.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_8.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = u_xlat0.x + 1.00000001e-10;
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat16_2.x = u_xlat6.x * _Saturation;
    u_xlat6.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xxx;
    u_xlat18 = _TexRotator * 0.0174532924;
    u_xlat16_2.x = sin((-u_xlat18));
    u_xlat16_4 = sin(u_xlat18);
    u_xlat16_5 = cos(u_xlat18);
    u_xlat16_2.y = u_xlat16_5;
    u_xlat16_2.z = u_xlat16_4;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat3.x = dot(u_xlat16_2.yx, u_xlat1.xy);
    u_xlat3.y = dot(u_xlat16_2.zy, u_xlat1.xy);
    u_xlat18 = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignettePower;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat16_1 = texture(_AddTex, u_xlat1.xy);
    u_xlat16_2.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha));
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_VignetteColor.xyz);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_UseVignette);
#else
    u_xlatb18 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_ADDTEX" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _AddTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_8;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlatb0 = 0.5<_InvertColor;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat10_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_20) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_20) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
    u_xlatb12 = u_xlat16_2.x>=u_xlat0.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat12 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat18 = min(u_xlat0.y, u_xlat1.x);
    u_xlat6.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat18 = (-u_xlat18) + u_xlat0.x;
    u_xlat1.x = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat1.x;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat6.x) + _Hue;
    u_xlat16_8.x = u_xlat16_2.x * 360.0;
    u_xlatb6 = u_xlat16_8.x>=(-u_xlat16_8.x);
    u_xlat16_8.xy = (bool(u_xlatb6)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_8.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_8.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = u_xlat0.x + 1.00000001e-10;
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat16_2.x = u_xlat6.x * _Saturation;
    u_xlat6.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xxx;
    u_xlat18 = _TexRotator * 0.0174532924;
    u_xlat16_2.x = sin((-u_xlat18));
    u_xlat16_4 = sin(u_xlat18);
    u_xlat16_5 = cos(u_xlat18);
    u_xlat16_2.y = u_xlat16_5;
    u_xlat16_2.z = u_xlat16_4;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat3.x = dot(u_xlat16_2.yx, u_xlat1.xy);
    u_xlat3.y = dot(u_xlat16_2.zy, u_xlat1.xy);
    u_xlat18 = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignettePower;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignetteScale;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat10_1 = texture2D(_AddTex, u_xlat1.xy);
    u_xlat16_2.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha));
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_VignetteColor.xyz);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _VignetteColor.xyz;
    u_xlatb18 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_ADDTEX" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _AddTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump float u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_8;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlatb0 = 0.5<_InvertColor;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat10_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_20) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_20) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
    u_xlatb12 = u_xlat16_2.x>=u_xlat0.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat12 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat18 = min(u_xlat0.y, u_xlat1.x);
    u_xlat6.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat18 = (-u_xlat18) + u_xlat0.x;
    u_xlat1.x = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat1.x;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat6.x) + _Hue;
    u_xlat16_8.x = u_xlat16_2.x * 360.0;
    u_xlatb6 = u_xlat16_8.x>=(-u_xlat16_8.x);
    u_xlat16_8.xy = (bool(u_xlatb6)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_8.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_8.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = u_xlat0.x + 1.00000001e-10;
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat16_2.x = u_xlat6.x * _Saturation;
    u_xlat6.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xxx;
    u_xlat18 = _TexRotator * 0.0174532924;
    u_xlat16_2.x = sin((-u_xlat18));
    u_xlat16_4 = sin(u_xlat18);
    u_xlat16_5 = cos(u_xlat18);
    u_xlat16_2.y = u_xlat16_5;
    u_xlat16_2.z = u_xlat16_4;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat3.x = dot(u_xlat16_2.yx, u_xlat1.xy);
    u_xlat3.y = dot(u_xlat16_2.zy, u_xlat1.xy);
    u_xlat18 = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignettePower;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignetteScale;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat10_1 = texture2D(_AddTex, u_xlat1.xy);
    u_xlat16_2.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha));
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_VignetteColor.xyz);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _VignetteColor.xyz;
    u_xlatb18 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_RAY_LINE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
UNITY_LOCATION(0) uniform mediump sampler2D _VoronoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_8;
float u_xlat10;
bool u_xlatb10;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat10 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat15 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat10 = u_xlat10 * u_xlat15;
    u_xlat15 = u_xlat10 * u_xlat10;
    u_xlat1.x = u_xlat15 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat15 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat15 * u_xlat1.x + -0.330299497;
    u_xlat15 = u_xlat15 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat15 * u_xlat10;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb6 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb6 ? u_xlat1.x : float(0.0);
    u_xlat10 = u_xlat10 * u_xlat15 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb15 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat15 = u_xlatb15 ? -3.14159274 : float(0.0);
    u_xlat10 = u_xlat15 + u_xlat10;
    u_xlat15 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15<(-u_xlat15));
#else
    u_xlatb15 = u_xlat15<(-u_xlat15);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb5 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb5 = u_xlatb5 && u_xlatb15;
    u_xlat5.x = (u_xlatb5) ? (-u_xlat10) : u_xlat10;
    u_xlat0.y = u_xlat5.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat16_0 = texture(_VoronoTex, u_xlat2.xz).x;
    u_xlat16_5 = texture(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat16_5 * u_xlat16_0;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat5.y = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat5.xy = sqrt(u_xlat5.xy);
    u_xlat10 = log2(u_xlat5.y);
    u_xlat10 = u_xlat10 * _VignettePower;
    u_xlat10 = exp2(u_xlat10);
    u_xlat10 = u_xlat10 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat5.x = (-u_xlat5.x) + 1.0;
    u_xlat15 = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat15 * u_xlat5.x;
    u_xlat0.xy = u_xlat5.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_InvertColor);
#else
    u_xlatb0 = 0.5<_InvertColor;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat0.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb15 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_18 = (u_xlatb15) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_18) * u_xlat0.xy + u_xlat16_3.zy;
    u_xlat2.w = (-u_xlat16_3.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_18) * u_xlat0.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat4.x = u_xlat2.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x>=u_xlat1.x);
#else
    u_xlatb0 = u_xlat16_3.x>=u_xlat1.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat1.xyw;
    u_xlat0.x = min(u_xlat5.x, u_xlat1.y);
    u_xlat5.x = u_xlat5.x + (-u_xlat1.y);
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat15 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat5.x = u_xlat5.x / u_xlat15;
    u_xlat5.x = u_xlat5.x + u_xlat1.z;
    u_xlat16_3.x = abs(u_xlat5.x) + _Hue;
    u_xlat16_8.x = u_xlat16_3.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_8.x>=(-u_xlat16_8.x));
#else
    u_xlatb5 = u_xlat16_8.x>=(-u_xlat16_8.x);
#endif
    u_xlat16_8.xy = (bool(u_xlatb5)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_8.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat6.xyz = u_xlat16_8.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = u_xlat1.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat16_3.x = u_xlat0.x * _Saturation;
    u_xlat0.xyw = u_xlat16_3.xxx * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat1.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyw + (-_VignetteColor.xyz);
    u_xlat0.xyw = u_xlat0.xyw * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.5<_UseVignette);
#else
    u_xlatb10 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb10)) ? u_xlat1.xyz : u_xlat0.xyw;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_RAY_LINE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
UNITY_LOCATION(0) uniform mediump sampler2D _VoronoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
mediump float u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_8;
float u_xlat10;
bool u_xlatb10;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat10 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat15 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat10 = u_xlat10 * u_xlat15;
    u_xlat15 = u_xlat10 * u_xlat10;
    u_xlat1.x = u_xlat15 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat15 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat15 * u_xlat1.x + -0.330299497;
    u_xlat15 = u_xlat15 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat15 * u_xlat10;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb6 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb6 ? u_xlat1.x : float(0.0);
    u_xlat10 = u_xlat10 * u_xlat15 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb15 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat15 = u_xlatb15 ? -3.14159274 : float(0.0);
    u_xlat10 = u_xlat15 + u_xlat10;
    u_xlat15 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15<(-u_xlat15));
#else
    u_xlatb15 = u_xlat15<(-u_xlat15);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb5 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb5 = u_xlatb5 && u_xlatb15;
    u_xlat5.x = (u_xlatb5) ? (-u_xlat10) : u_xlat10;
    u_xlat0.y = u_xlat5.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat16_0 = texture(_VoronoTex, u_xlat2.xz).x;
    u_xlat16_5 = texture(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat16_5 * u_xlat16_0;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat5.y = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat5.xy = sqrt(u_xlat5.xy);
    u_xlat10 = log2(u_xlat5.y);
    u_xlat10 = u_xlat10 * _VignettePower;
    u_xlat10 = exp2(u_xlat10);
    u_xlat10 = u_xlat10 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat10 = min(max(u_xlat10, 0.0), 1.0);
#else
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
#endif
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat5.x = (-u_xlat5.x) + 1.0;
    u_xlat15 = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat15 * u_xlat5.x;
    u_xlat0.xy = u_xlat5.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_InvertColor);
#else
    u_xlatb0 = 0.5<_InvertColor;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat0.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb15 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_18 = (u_xlatb15) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_18) * u_xlat0.xy + u_xlat16_3.zy;
    u_xlat2.w = (-u_xlat16_3.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_18) * u_xlat0.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat4.x = u_xlat2.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x>=u_xlat1.x);
#else
    u_xlatb0 = u_xlat16_3.x>=u_xlat1.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat1.xyw;
    u_xlat0.x = min(u_xlat5.x, u_xlat1.y);
    u_xlat5.x = u_xlat5.x + (-u_xlat1.y);
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat15 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat5.x = u_xlat5.x / u_xlat15;
    u_xlat5.x = u_xlat5.x + u_xlat1.z;
    u_xlat16_3.x = abs(u_xlat5.x) + _Hue;
    u_xlat16_8.x = u_xlat16_3.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat16_8.x>=(-u_xlat16_8.x));
#else
    u_xlatb5 = u_xlat16_8.x>=(-u_xlat16_8.x);
#endif
    u_xlat16_8.xy = (bool(u_xlatb5)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_8.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat6.xyz = u_xlat16_8.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xyz = min(max(u_xlat6.xyz, 0.0), 1.0);
#else
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = u_xlat1.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat16_3.x = u_xlat0.x * _Saturation;
    u_xlat0.xyw = u_xlat16_3.xxx * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat1.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyw + (-_VignetteColor.xyz);
    u_xlat0.xyw = u_xlat0.xyw * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.5<_UseVignette);
#else
    u_xlatb10 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb10)) ? u_xlat1.xyz : u_xlat0.xyw;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_RAY_LINE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform lowp sampler2D _VoronoTex;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_8;
float u_xlat10;
bool u_xlatb10;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat10 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat15 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat10 = u_xlat10 * u_xlat15;
    u_xlat15 = u_xlat10 * u_xlat10;
    u_xlat1.x = u_xlat15 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat15 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat15 * u_xlat1.x + -0.330299497;
    u_xlat15 = u_xlat15 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat15 * u_xlat10;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb6 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb6 ? u_xlat1.x : float(0.0);
    u_xlat10 = u_xlat10 * u_xlat15 + u_xlat1.x;
    u_xlatb15 = u_xlat0.y<(-u_xlat0.y);
    u_xlat15 = u_xlatb15 ? -3.14159274 : float(0.0);
    u_xlat10 = u_xlat15 + u_xlat10;
    u_xlat15 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb15 = u_xlat15<(-u_xlat15);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlatb5 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb5 = u_xlatb5 && u_xlatb15;
    u_xlat5.x = (u_xlatb5) ? (-u_xlat10) : u_xlat10;
    u_xlat0.y = u_xlat5.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat10_0 = texture2D(_VoronoTex, u_xlat2.xz).x;
    u_xlat10_5 = texture2D(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat10_5 * u_xlat10_0;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat5.y = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat5.xy = sqrt(u_xlat5.xy);
    u_xlat10 = log2(u_xlat5.y);
    u_xlat10 = u_xlat10 * _VignettePower;
    u_xlat10 = exp2(u_xlat10);
    u_xlat10 = u_xlat10 * _VignetteScale;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat5.x = (-u_xlat5.x) + 1.0;
    u_xlat15 = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat15 * u_xlat5.x;
    u_xlat0.xy = u_xlat5.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat10_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlatb0 = 0.5<_InvertColor;
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat0.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
    u_xlatb15 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_18 = (u_xlatb15) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_18) * u_xlat0.xy + u_xlat16_3.zy;
    u_xlat2.w = (-u_xlat16_3.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_18) * u_xlat0.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat4.x = u_xlat2.x + u_xlat16_3.x;
    u_xlatb0 = u_xlat16_3.x>=u_xlat1.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat1.xyw;
    u_xlat0.x = min(u_xlat5.x, u_xlat1.y);
    u_xlat5.x = u_xlat5.x + (-u_xlat1.y);
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat15 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat5.x = u_xlat5.x / u_xlat15;
    u_xlat5.x = u_xlat5.x + u_xlat1.z;
    u_xlat16_3.x = abs(u_xlat5.x) + _Hue;
    u_xlat16_8.x = u_xlat16_3.x * 360.0;
    u_xlatb5 = u_xlat16_8.x>=(-u_xlat16_8.x);
    u_xlat16_8.xy = (bool(u_xlatb5)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_8.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat6.xyz = u_xlat16_8.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = u_xlat1.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat16_3.x = u_xlat0.x * _Saturation;
    u_xlat0.xyw = u_xlat16_3.xxx * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat1.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyw + (-_VignetteColor.xyz);
    u_xlat0.xyw = u_xlat0.xyw * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz + _VignetteColor.xyz;
    u_xlatb10 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb10)) ? u_xlat1.xyz : u_xlat0.xyw;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_RAY_LINE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform lowp sampler2D _VoronoTex;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
vec2 u_xlat5;
lowp float u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_8;
float u_xlat10;
bool u_xlatb10;
float u_xlat15;
bool u_xlatb15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat10 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat10 = float(1.0) / u_xlat10;
    u_xlat15 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat10 = u_xlat10 * u_xlat15;
    u_xlat15 = u_xlat10 * u_xlat10;
    u_xlat1.x = u_xlat15 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat15 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat15 * u_xlat1.x + -0.330299497;
    u_xlat15 = u_xlat15 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat15 * u_xlat10;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb6 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb6 ? u_xlat1.x : float(0.0);
    u_xlat10 = u_xlat10 * u_xlat15 + u_xlat1.x;
    u_xlatb15 = u_xlat0.y<(-u_xlat0.y);
    u_xlat15 = u_xlatb15 ? -3.14159274 : float(0.0);
    u_xlat10 = u_xlat15 + u_xlat10;
    u_xlat15 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb15 = u_xlat15<(-u_xlat15);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlatb5 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb5 = u_xlatb5 && u_xlatb15;
    u_xlat5.x = (u_xlatb5) ? (-u_xlat10) : u_xlat10;
    u_xlat0.y = u_xlat5.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat10_0 = texture2D(_VoronoTex, u_xlat2.xz).x;
    u_xlat10_5 = texture2D(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat10_5 * u_xlat10_0;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat5.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat5.y = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat5.xy = sqrt(u_xlat5.xy);
    u_xlat10 = log2(u_xlat5.y);
    u_xlat10 = u_xlat10 * _VignettePower;
    u_xlat10 = exp2(u_xlat10);
    u_xlat10 = u_xlat10 * _VignetteScale;
    u_xlat10 = clamp(u_xlat10, 0.0, 1.0);
    u_xlat10 = (-u_xlat10) + 1.0;
    u_xlat5.x = (-u_xlat5.x) + 1.0;
    u_xlat15 = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat15 * u_xlat5.x;
    u_xlat0.xy = u_xlat5.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat10_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlatb0 = 0.5<_InvertColor;
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat0.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
    u_xlatb15 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_18 = (u_xlatb15) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_18) * u_xlat0.xy + u_xlat16_3.zy;
    u_xlat2.w = (-u_xlat16_3.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_18) * u_xlat0.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat4.x = u_xlat2.x + u_xlat16_3.x;
    u_xlatb0 = u_xlat16_3.x>=u_xlat1.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat5.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat1.xyw;
    u_xlat0.x = min(u_xlat5.x, u_xlat1.y);
    u_xlat5.x = u_xlat5.x + (-u_xlat1.y);
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat15 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat5.x = u_xlat5.x / u_xlat15;
    u_xlat5.x = u_xlat5.x + u_xlat1.z;
    u_xlat16_3.x = abs(u_xlat5.x) + _Hue;
    u_xlat16_8.x = u_xlat16_3.x * 360.0;
    u_xlatb5 = u_xlat16_8.x>=(-u_xlat16_8.x);
    u_xlat16_8.xy = (bool(u_xlatb5)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_8.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat6.xyz = u_xlat16_8.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat6.xyz = fract(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat6.xyz = abs(u_xlat6.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat6.xyz = clamp(u_xlat6.xyz, 0.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = u_xlat1.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat16_3.x = u_xlat0.x * _Saturation;
    u_xlat0.xyw = u_xlat16_3.xxx * u_xlat6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat1.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyw + (-_VignetteColor.xyz);
    u_xlat0.xyw = u_xlat0.xyw * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz + _VignetteColor.xyz;
    u_xlatb10 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb10)) ? u_xlat1.xyz : u_xlat0.xyw;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_ADDTEX" "_USE_RAY_LINE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _VoronoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AddTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat14;
bool u_xlatb16;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat21 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat21 * u_xlat1.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat21 * u_xlat14;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb8 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21<(-u_xlat21));
#else
    u_xlatb21 = u_xlat21<(-u_xlat21);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb21;
    u_xlat7.x = (u_xlatb7) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat7.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat16_0.x = texture(_VoronoTex, u_xlat2.xz).x;
    u_xlat16_7 = texture(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat16_7 * u_xlat16_0.x;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat14 = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat0.xy = u_xlat7.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_InvertColor);
#else
    u_xlatb2 = 0.5<_InvertColor;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat0.w = (-u_xlat16_3.x);
    u_xlat2.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb16 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_24 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat2.xy = vec2(u_xlat16_24) * u_xlat2.xy + u_xlat16_3.zy;
    u_xlat4.x = float(1.0);
    u_xlat4.y = float(-1.0);
    u_xlat2.zw = vec2(u_xlat16_24) * u_xlat4.xy + vec2(-1.0, 0.666666687);
    u_xlat0.xyz = (-u_xlat2.xyw);
    u_xlat4.yzw = u_xlat0.yzw + u_xlat2.yzx;
    u_xlat4.x = u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat16_3.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz + u_xlat2.xyw;
    u_xlat2.x = min(u_xlat0.z, u_xlat7.x);
    u_xlat7.x = (-u_xlat0.z) + u_xlat7.x;
    u_xlat14 = u_xlat0.x + (-u_xlat2.x);
    u_xlat2.x = u_xlat14 * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat2.x;
    u_xlat7.x = u_xlat7.x + u_xlat0.w;
    u_xlat16_3.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_3.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_10.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat2.xyz = u_xlat16_10.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = u_xlat0.x + 1.00000001e-10;
    u_xlat7.x = u_xlat14 / u_xlat7.x;
    u_xlat16_3.x = u_xlat7.x * _Saturation;
    u_xlat7.xyz = u_xlat16_3.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat21 = _TexRotator * 0.0174532924;
    u_xlat16_3.x = sin((-u_xlat21));
    u_xlat16_5 = sin(u_xlat21);
    u_xlat16_6 = cos(u_xlat21);
    u_xlat16_3.y = u_xlat16_6;
    u_xlat16_3.z = u_xlat16_5;
    u_xlat2.y = dot(u_xlat16_3.zy, u_xlat1.xy);
    u_xlat2.x = dot(u_xlat16_3.yx, u_xlat1.xy);
    u_xlat21 = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _VignettePower;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat16_1 = texture(_AddTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha));
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_VignetteColor.xyz);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.5<_UseVignette);
#else
    u_xlatb21 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_ADDTEX" "_USE_RAY_LINE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _VoronoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AddTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat14;
bool u_xlatb16;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat21 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat21 * u_xlat1.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat21 * u_xlat14;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb8 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21<(-u_xlat21));
#else
    u_xlatb21 = u_xlat21<(-u_xlat21);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb21;
    u_xlat7.x = (u_xlatb7) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat7.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat16_0.x = texture(_VoronoTex, u_xlat2.xz).x;
    u_xlat16_7 = texture(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat16_7 * u_xlat16_0.x;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat14 = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat0.xy = u_xlat7.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_InvertColor);
#else
    u_xlatb2 = 0.5<_InvertColor;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat0.w = (-u_xlat16_3.x);
    u_xlat2.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb16 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_24 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat2.xy = vec2(u_xlat16_24) * u_xlat2.xy + u_xlat16_3.zy;
    u_xlat4.x = float(1.0);
    u_xlat4.y = float(-1.0);
    u_xlat2.zw = vec2(u_xlat16_24) * u_xlat4.xy + vec2(-1.0, 0.666666687);
    u_xlat0.xyz = (-u_xlat2.xyw);
    u_xlat4.yzw = u_xlat0.yzw + u_xlat2.yzx;
    u_xlat4.x = u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat16_3.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz + u_xlat2.xyw;
    u_xlat2.x = min(u_xlat0.z, u_xlat7.x);
    u_xlat7.x = (-u_xlat0.z) + u_xlat7.x;
    u_xlat14 = u_xlat0.x + (-u_xlat2.x);
    u_xlat2.x = u_xlat14 * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat2.x;
    u_xlat7.x = u_xlat7.x + u_xlat0.w;
    u_xlat16_3.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_3.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_10.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat2.xyz = u_xlat16_10.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = u_xlat0.x + 1.00000001e-10;
    u_xlat7.x = u_xlat14 / u_xlat7.x;
    u_xlat16_3.x = u_xlat7.x * _Saturation;
    u_xlat7.xyz = u_xlat16_3.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat21 = _TexRotator * 0.0174532924;
    u_xlat16_3.x = sin((-u_xlat21));
    u_xlat16_5 = sin(u_xlat21);
    u_xlat16_6 = cos(u_xlat21);
    u_xlat16_3.y = u_xlat16_6;
    u_xlat16_3.z = u_xlat16_5;
    u_xlat2.y = dot(u_xlat16_3.zy, u_xlat1.xy);
    u_xlat2.x = dot(u_xlat16_3.yx, u_xlat1.xy);
    u_xlat21 = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _VignettePower;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat16_1 = texture(_AddTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha));
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_VignetteColor.xyz);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.5<_UseVignette);
#else
    u_xlatb21 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_ADDTEX" "_USE_RAY_LINE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
uniform lowp sampler2D _VoronoTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _AddTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat14;
bool u_xlatb16;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat21 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat21 * u_xlat1.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat21 * u_xlat14;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb8 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat1.x;
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb21 = u_xlat21<(-u_xlat21);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb7 = u_xlatb7 && u_xlatb21;
    u_xlat7.x = (u_xlatb7) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat7.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat10_0.x = texture2D(_VoronoTex, u_xlat2.xz).x;
    u_xlat10_7 = texture2D(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat10_7 * u_xlat10_0.x;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat14 = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat0.xy = u_xlat7.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlatb2 = 0.5<_InvertColor;
    u_xlat16_3.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat10_0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    u_xlat0.w = (-u_xlat16_3.x);
    u_xlat2.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
    u_xlatb16 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_24 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat2.xy = vec2(u_xlat16_24) * u_xlat2.xy + u_xlat16_3.zy;
    u_xlat4.x = float(1.0);
    u_xlat4.y = float(-1.0);
    u_xlat2.zw = vec2(u_xlat16_24) * u_xlat4.xy + vec2(-1.0, 0.666666687);
    u_xlat0.xyz = (-u_xlat2.xyw);
    u_xlat4.yzw = u_xlat0.yzw + u_xlat2.yzx;
    u_xlat4.x = u_xlat0.x + u_xlat16_3.x;
    u_xlatb0 = u_xlat16_3.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz + u_xlat2.xyw;
    u_xlat2.x = min(u_xlat0.z, u_xlat7.x);
    u_xlat7.x = (-u_xlat0.z) + u_xlat7.x;
    u_xlat14 = u_xlat0.x + (-u_xlat2.x);
    u_xlat2.x = u_xlat14 * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat2.x;
    u_xlat7.x = u_xlat7.x + u_xlat0.w;
    u_xlat16_3.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_3.x * 360.0;
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_10.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat2.xyz = u_xlat16_10.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = u_xlat0.x + 1.00000001e-10;
    u_xlat7.x = u_xlat14 / u_xlat7.x;
    u_xlat16_3.x = u_xlat7.x * _Saturation;
    u_xlat7.xyz = u_xlat16_3.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat21 = _TexRotator * 0.0174532924;
    u_xlat16_3.x = sin((-u_xlat21));
    u_xlat16_5 = sin(u_xlat21);
    u_xlat16_6 = cos(u_xlat21);
    u_xlat16_3.y = u_xlat16_6;
    u_xlat16_3.z = u_xlat16_5;
    u_xlat2.y = dot(u_xlat16_3.zy, u_xlat1.xy);
    u_xlat2.x = dot(u_xlat16_3.yx, u_xlat1.xy);
    u_xlat21 = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _VignettePower;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _VignetteScale;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat10_1 = texture2D(_AddTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha));
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_VignetteColor.xyz);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz + _VignetteColor.xyz;
    u_xlatb21 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_ADDTEX" "_USE_RAY_LINE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
uniform lowp sampler2D _VoronoTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _AddTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump float u_xlat16_6;
vec3 u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat14;
bool u_xlatb16;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat21 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat21 * u_xlat1.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat21 * u_xlat14;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb8 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat1.x;
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb21 = u_xlat21<(-u_xlat21);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb7 = u_xlatb7 && u_xlatb21;
    u_xlat7.x = (u_xlatb7) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat7.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat10_0.x = texture2D(_VoronoTex, u_xlat2.xz).x;
    u_xlat10_7 = texture2D(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat10_7 * u_xlat10_0.x;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat14 = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat14 * u_xlat7.x;
    u_xlat0.xy = u_xlat7.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlatb2 = 0.5<_InvertColor;
    u_xlat16_3.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat10_0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    u_xlat0.w = (-u_xlat16_3.x);
    u_xlat2.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
    u_xlatb16 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_24 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat2.xy = vec2(u_xlat16_24) * u_xlat2.xy + u_xlat16_3.zy;
    u_xlat4.x = float(1.0);
    u_xlat4.y = float(-1.0);
    u_xlat2.zw = vec2(u_xlat16_24) * u_xlat4.xy + vec2(-1.0, 0.666666687);
    u_xlat0.xyz = (-u_xlat2.xyw);
    u_xlat4.yzw = u_xlat0.yzw + u_xlat2.yzx;
    u_xlat4.x = u_xlat0.x + u_xlat16_3.x;
    u_xlatb0 = u_xlat16_3.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz + u_xlat2.xyw;
    u_xlat2.x = min(u_xlat0.z, u_xlat7.x);
    u_xlat7.x = (-u_xlat0.z) + u_xlat7.x;
    u_xlat14 = u_xlat0.x + (-u_xlat2.x);
    u_xlat2.x = u_xlat14 * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat2.x;
    u_xlat7.x = u_xlat7.x + u_xlat0.w;
    u_xlat16_3.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_3.x * 360.0;
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_10.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat2.xyz = u_xlat16_10.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = u_xlat0.x + 1.00000001e-10;
    u_xlat7.x = u_xlat14 / u_xlat7.x;
    u_xlat16_3.x = u_xlat7.x * _Saturation;
    u_xlat7.xyz = u_xlat16_3.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat21 = _TexRotator * 0.0174532924;
    u_xlat16_3.x = sin((-u_xlat21));
    u_xlat16_5 = sin(u_xlat21);
    u_xlat16_6 = cos(u_xlat21);
    u_xlat16_3.y = u_xlat16_6;
    u_xlat16_3.z = u_xlat16_5;
    u_xlat2.y = dot(u_xlat16_3.zy, u_xlat1.xy);
    u_xlat2.x = dot(u_xlat16_3.yx, u_xlat1.xy);
    u_xlat21 = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _VignettePower;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = u_xlat21 * _VignetteScale;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat21 = (-u_xlat21) + 1.0;
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat10_1 = texture2D(_AddTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha));
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xyz + (-_VignetteColor.xyz);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz + _VignetteColor.xyz;
    u_xlatb21 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_8;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_InvertColor);
#else
    u_xlatb0 = 0.5<_InvertColor;
#endif
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
#endif
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_20) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_20) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x>=u_xlat0.x);
#else
    u_xlatb12 = u_xlat16_2.x>=u_xlat0.x;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat12 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat18 = min(u_xlat0.y, u_xlat1.x);
    u_xlat6.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat18 = (-u_xlat18) + u_xlat0.x;
    u_xlat1.x = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat1.x;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat6.x) + _Hue;
    u_xlat16_8.x = u_xlat16_2.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_8.x>=(-u_xlat16_8.x));
#else
    u_xlatb6 = u_xlat16_8.x>=(-u_xlat16_8.x);
#endif
    u_xlat16_8.xy = (bool(u_xlatb6)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_8.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_8.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = u_xlat0.x + 1.00000001e-10;
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat16_2.x = u_xlat6.x * _Saturation;
    u_xlat6.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BlackWhiteThredhold<u_xlat16_2.x);
#else
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_2.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_ExchangeBlackWhite);
#else
    u_xlatb6 = 0.5<_ExchangeBlackWhite;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb6)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_4.xyz = (bool(u_xlatb6)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz;
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz + (-_VignetteColor.xyz);
    u_xlat1.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignettePower;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_UseVignette);
#else
    u_xlatb18 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_8;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_InvertColor);
#else
    u_xlatb0 = 0.5<_InvertColor;
#endif
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
#endif
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_20) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_20) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat16_2.x>=u_xlat0.x);
#else
    u_xlatb12 = u_xlat16_2.x>=u_xlat0.x;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat12 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat18 = min(u_xlat0.y, u_xlat1.x);
    u_xlat6.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat18 = (-u_xlat18) + u_xlat0.x;
    u_xlat1.x = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat1.x;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat6.x) + _Hue;
    u_xlat16_8.x = u_xlat16_2.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_8.x>=(-u_xlat16_8.x));
#else
    u_xlatb6 = u_xlat16_8.x>=(-u_xlat16_8.x);
#endif
    u_xlat16_8.xy = (bool(u_xlatb6)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_8.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_8.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = u_xlat0.x + 1.00000001e-10;
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat16_2.x = u_xlat6.x * _Saturation;
    u_xlat6.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BlackWhiteThredhold<u_xlat16_2.x);
#else
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_2.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_ExchangeBlackWhite);
#else
    u_xlatb6 = 0.5<_ExchangeBlackWhite;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb6)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_4.xyz = (bool(u_xlatb6)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz;
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz + (-_VignetteColor.xyz);
    u_xlat1.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignettePower;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_UseVignette);
#else
    u_xlatb18 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_8;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlatb0 = 0.5<_InvertColor;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat10_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_20) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_20) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
    u_xlatb12 = u_xlat16_2.x>=u_xlat0.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat12 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat18 = min(u_xlat0.y, u_xlat1.x);
    u_xlat6.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat18 = (-u_xlat18) + u_xlat0.x;
    u_xlat1.x = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat1.x;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat6.x) + _Hue;
    u_xlat16_8.x = u_xlat16_2.x * 360.0;
    u_xlatb6 = u_xlat16_8.x>=(-u_xlat16_8.x);
    u_xlat16_8.xy = (bool(u_xlatb6)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_8.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_8.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = u_xlat0.x + 1.00000001e-10;
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat16_2.x = u_xlat6.x * _Saturation;
    u_xlat6.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_2.x;
    u_xlatb6 = 0.5<_ExchangeBlackWhite;
    u_xlat16_5.xyz = (bool(u_xlatb6)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_4.xyz = (bool(u_xlatb6)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz;
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz + (-_VignetteColor.xyz);
    u_xlat1.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignettePower;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignetteScale;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + _VignetteColor.xyz;
    u_xlatb18 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
mediump vec2 u_xlat16_8;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlatb0 = 0.5<_InvertColor;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat10_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_20) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_20) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
    u_xlatb12 = u_xlat16_2.x>=u_xlat0.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat12 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat18 = min(u_xlat0.y, u_xlat1.x);
    u_xlat6.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat18 = (-u_xlat18) + u_xlat0.x;
    u_xlat1.x = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat1.x;
    u_xlat6.x = u_xlat6.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat6.x) + _Hue;
    u_xlat16_8.x = u_xlat16_2.x * 360.0;
    u_xlatb6 = u_xlat16_8.x>=(-u_xlat16_8.x);
    u_xlat16_8.xy = (bool(u_xlatb6)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_8.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_8.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat6.x = u_xlat0.x + 1.00000001e-10;
    u_xlat6.x = u_xlat18 / u_xlat6.x;
    u_xlat16_2.x = u_xlat6.x * _Saturation;
    u_xlat6.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_2.x;
    u_xlatb6 = 0.5<_ExchangeBlackWhite;
    u_xlat16_5.xyz = (bool(u_xlatb6)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_4.xyz = (bool(u_xlatb6)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz;
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz + (-_VignetteColor.xyz);
    u_xlat1.xy = vs_TEXCOORD0.zw + vec2(-0.5, -0.5);
    u_xlat18 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignettePower;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignetteScale;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + _VignetteColor.xyz;
    u_xlatb18 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AddTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
mediump float u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat16;
bool u_xlatb16;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_InvertColor);
#else
    u_xlatb0 = 0.5<_InvertColor;
#endif
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
#endif
    u_xlat16_26 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_26) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_26) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_2.x>=u_xlat0.x);
#else
    u_xlatb16 = u_xlat16_2.x>=u_xlat0.x;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat16 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat24 = min(u_xlat0.y, u_xlat1.x);
    u_xlat8.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat24 = (-u_xlat24) + u_xlat0.x;
    u_xlat1.x = u_xlat24 * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat1.x;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat8.x) + _Hue;
    u_xlat16_10.x = u_xlat16_2.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb8 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_10.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_10.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = u_xlat0.x + 1.00000001e-10;
    u_xlat8.x = u_xlat24 / u_xlat8.x;
    u_xlat16_2.x = u_xlat8.x * _Saturation;
    u_xlat8.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BlackWhiteThredhold<u_xlat16_2.x);
#else
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_2.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_ExchangeBlackWhite);
#else
    u_xlatb8 = 0.5<_ExchangeBlackWhite;
#endif
    u_xlat16_7.xyz = (bool(u_xlatb8)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_4.xyz = (bool(u_xlatb8)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    u_xlat0.x = _TexRotator * 0.0174532924;
    u_xlat16_4.x = sin((-u_xlat0.x));
    u_xlat16_5 = sin(u_xlat0.x);
    u_xlat16_6 = cos(u_xlat0.x);
    u_xlat16_4.y = u_xlat16_6;
    u_xlat16_4.z = u_xlat16_5;
    u_xlat0 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = dot(u_xlat16_4.yx, u_xlat0.xy);
    u_xlat1.y = dot(u_xlat16_4.zy, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VignettePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = u_xlat8.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat16_1 = texture(_AddTex, u_xlat8.xy);
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat8.xyz = u_xlat16_4.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha)) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat8.xyz + (-_VignetteColor.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_UseVignette);
#else
    u_xlatb0 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat8.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AddTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
mediump float u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat16;
bool u_xlatb16;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_InvertColor);
#else
    u_xlatb0 = 0.5<_InvertColor;
#endif
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
#endif
    u_xlat16_26 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_26) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_26) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat16_2.x>=u_xlat0.x);
#else
    u_xlatb16 = u_xlat16_2.x>=u_xlat0.x;
#endif
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat16 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat24 = min(u_xlat0.y, u_xlat1.x);
    u_xlat8.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat24 = (-u_xlat24) + u_xlat0.x;
    u_xlat1.x = u_xlat24 * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat1.x;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat8.x) + _Hue;
    u_xlat16_10.x = u_xlat16_2.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb8 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_10.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_10.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = u_xlat0.x + 1.00000001e-10;
    u_xlat8.x = u_xlat24 / u_xlat8.x;
    u_xlat16_2.x = u_xlat8.x * _Saturation;
    u_xlat8.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BlackWhiteThredhold<u_xlat16_2.x);
#else
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_2.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_ExchangeBlackWhite);
#else
    u_xlatb8 = 0.5<_ExchangeBlackWhite;
#endif
    u_xlat16_7.xyz = (bool(u_xlatb8)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_4.xyz = (bool(u_xlatb8)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    u_xlat0.x = _TexRotator * 0.0174532924;
    u_xlat16_4.x = sin((-u_xlat0.x));
    u_xlat16_5 = sin(u_xlat0.x);
    u_xlat16_6 = cos(u_xlat0.x);
    u_xlat16_4.y = u_xlat16_6;
    u_xlat16_4.z = u_xlat16_5;
    u_xlat0 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = dot(u_xlat16_4.yx, u_xlat0.xy);
    u_xlat1.y = dot(u_xlat16_4.zy, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VignettePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = u_xlat8.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat16_1 = texture(_AddTex, u_xlat8.xy);
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat8.xyz = u_xlat16_4.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha)) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat8.xyz + (-_VignetteColor.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_UseVignette);
#else
    u_xlatb0 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat8.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _AddTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
mediump float u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat16;
bool u_xlatb16;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = 0.5<_InvertColor;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat10_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
    u_xlat16_26 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_26) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_26) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
    u_xlatb16 = u_xlat16_2.x>=u_xlat0.x;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat16 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat24 = min(u_xlat0.y, u_xlat1.x);
    u_xlat8.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat24 = (-u_xlat24) + u_xlat0.x;
    u_xlat1.x = u_xlat24 * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat1.x;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat8.x) + _Hue;
    u_xlat16_10.x = u_xlat16_2.x * 360.0;
    u_xlatb8 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_10.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_10.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = u_xlat0.x + 1.00000001e-10;
    u_xlat8.x = u_xlat24 / u_xlat8.x;
    u_xlat16_2.x = u_xlat8.x * _Saturation;
    u_xlat8.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_2.x;
    u_xlatb8 = 0.5<_ExchangeBlackWhite;
    u_xlat16_7.xyz = (bool(u_xlatb8)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_4.xyz = (bool(u_xlatb8)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    u_xlat0.x = _TexRotator * 0.0174532924;
    u_xlat16_4.x = sin((-u_xlat0.x));
    u_xlat16_5 = sin(u_xlat0.x);
    u_xlat16_6 = cos(u_xlat0.x);
    u_xlat16_4.y = u_xlat16_6;
    u_xlat16_4.z = u_xlat16_5;
    u_xlat0 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = dot(u_xlat16_4.yx, u_xlat0.xy);
    u_xlat1.y = dot(u_xlat16_4.zy, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VignettePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VignetteScale;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = u_xlat8.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat10_1 = texture2D(_AddTex, u_xlat8.xy);
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat8.xyz = u_xlat16_4.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha)) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat8.xyz + (-_VignetteColor.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz + _VignetteColor.xyz;
    u_xlatb0 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat8.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _AddTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
mediump float u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat16;
bool u_xlatb16;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
    u_xlatb0 = 0.5<_InvertColor;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = (-u_xlat10_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlatb0 = u_xlat16_2.y>=u_xlat16_2.z;
    u_xlat16_26 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = (-u_xlat16_2.zy) + u_xlat16_2.yz;
    u_xlat0.xy = vec2(u_xlat16_26) * u_xlat0.xy + u_xlat16_2.zy;
    u_xlat1.x = float(1.0);
    u_xlat1.y = float(-1.0);
    u_xlat0.zw = vec2(u_xlat16_26) * u_xlat1.xy + vec2(-1.0, 0.666666687);
    u_xlat1.xyz = (-u_xlat0.xyw);
    u_xlat1.w = (-u_xlat16_2.x);
    u_xlat3.yzw = u_xlat0.yzx + u_xlat1.yzw;
    u_xlat3.x = u_xlat1.x + u_xlat16_2.x;
    u_xlatb16 = u_xlat16_2.x>=u_xlat0.x;
    u_xlat16 = u_xlatb16 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat16 * u_xlat3.w + u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat16) * u_xlat3.xyz + u_xlat0.xyw;
    u_xlat24 = min(u_xlat0.y, u_xlat1.x);
    u_xlat8.x = (-u_xlat0.y) + u_xlat1.x;
    u_xlat24 = (-u_xlat24) + u_xlat0.x;
    u_xlat1.x = u_xlat24 * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat1.x;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16_2.x = abs(u_xlat8.x) + _Hue;
    u_xlat16_10.x = u_xlat16_2.x * 360.0;
    u_xlatb8 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_2.x = u_xlat16_10.y * u_xlat16_2.x;
    u_xlat16_2.x = fract(u_xlat16_2.x);
    u_xlat1.xyz = u_xlat16_10.xxx * u_xlat16_2.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat1.xyz = fract(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = u_xlat0.x + 1.00000001e-10;
    u_xlat8.x = u_xlat24 / u_xlat8.x;
    u_xlat16_2.x = u_xlat8.x * _Saturation;
    u_xlat8.xyz = u_xlat16_2.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_2.x;
    u_xlatb8 = 0.5<_ExchangeBlackWhite;
    u_xlat16_7.xyz = (bool(u_xlatb8)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_4.xyz = (bool(u_xlatb8)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_4.xyz : u_xlat16_2.xyz;
    u_xlat0.x = _TexRotator * 0.0174532924;
    u_xlat16_4.x = sin((-u_xlat0.x));
    u_xlat16_5 = sin(u_xlat0.x);
    u_xlat16_6 = cos(u_xlat0.x);
    u_xlat16_4.y = u_xlat16_6;
    u_xlat16_4.z = u_xlat16_5;
    u_xlat0 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.x = dot(u_xlat16_4.yx, u_xlat0.xy);
    u_xlat1.y = dot(u_xlat16_4.zy, u_xlat0.xy);
    u_xlat0.x = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VignettePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VignetteScale;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat8.xy = u_xlat8.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat10_1 = texture2D(_AddTex, u_xlat8.xy);
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat8.xyz = u_xlat16_4.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha)) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat8.xyz + (-_VignetteColor.xyz);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz + _VignetteColor.xyz;
    u_xlatb0 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat1.xyz : u_xlat8.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
UNITY_LOCATION(0) uniform mediump sampler2D _VoronoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat14;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat21 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat21 * u_xlat1.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat21 * u_xlat14;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb8 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21<(-u_xlat21));
#else
    u_xlatb21 = u_xlat21<(-u_xlat21);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb21;
    u_xlat7.x = (u_xlatb7) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat7.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat16_0 = texture(_VoronoTex, u_xlat2.xz).x;
    u_xlat16_7 = texture(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat16_7 * u_xlat16_0;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat7.y = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat7.xy = sqrt(u_xlat7.xy);
    u_xlat14 = log2(u_xlat7.y);
    u_xlat14 = u_xlat14 * _VignettePower;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat14 = (-u_xlat14) + 1.0;
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat21 = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
    u_xlat0.xy = u_xlat7.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_InvertColor);
#else
    u_xlatb0 = 0.5<_InvertColor;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat0.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb21 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_24 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_24) * u_xlat0.xy + u_xlat16_3.zy;
    u_xlat2.w = (-u_xlat16_3.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_24) * u_xlat0.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat4.x = u_xlat2.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x>=u_xlat1.x);
#else
    u_xlatb0 = u_xlat16_3.x>=u_xlat1.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat1.xyw;
    u_xlat0.x = min(u_xlat7.x, u_xlat1.y);
    u_xlat7.x = u_xlat7.x + (-u_xlat1.y);
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat21;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat16_3.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_3.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_10.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat8.xyz = u_xlat16_10.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = u_xlat1.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat7.x;
    u_xlat16_3.x = u_xlat0.x * _Saturation;
    u_xlat0.xyw = u_xlat16_3.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat0.xyw = u_xlat0.xyw * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = dot(u_xlat0.xyw, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BlackWhiteThredhold<u_xlat16_3.x);
#else
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_3.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.5<_ExchangeBlackWhite);
#else
    u_xlatb7 = 0.5<_ExchangeBlackWhite;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb7)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb7)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz;
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat0.xyw = u_xlat16_3.xyz + (-_VignetteColor.xyz);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat0.xyw + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.5<_UseVignette);
#else
    u_xlatb21 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat16_3.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
UNITY_LOCATION(0) uniform mediump sampler2D _VoronoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat14;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat21 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat21 * u_xlat1.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat21 * u_xlat14;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb8 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21<(-u_xlat21));
#else
    u_xlatb21 = u_xlat21<(-u_xlat21);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb21;
    u_xlat7.x = (u_xlatb7) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat7.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat16_0 = texture(_VoronoTex, u_xlat2.xz).x;
    u_xlat16_7 = texture(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat16_7 * u_xlat16_0;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat7.y = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat7.xy = sqrt(u_xlat7.xy);
    u_xlat14 = log2(u_xlat7.y);
    u_xlat14 = u_xlat14 * _VignettePower;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat14 = (-u_xlat14) + 1.0;
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat21 = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
    u_xlat0.xy = u_xlat7.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_InvertColor);
#else
    u_xlatb0 = 0.5<_InvertColor;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
    u_xlat0.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb21 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_24 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_24) * u_xlat0.xy + u_xlat16_3.zy;
    u_xlat2.w = (-u_xlat16_3.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_24) * u_xlat0.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat4.x = u_xlat2.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x>=u_xlat1.x);
#else
    u_xlatb0 = u_xlat16_3.x>=u_xlat1.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat1.xyw;
    u_xlat0.x = min(u_xlat7.x, u_xlat1.y);
    u_xlat7.x = u_xlat7.x + (-u_xlat1.y);
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat21;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat16_3.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_3.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_10.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat8.xyz = u_xlat16_10.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = u_xlat1.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat7.x;
    u_xlat16_3.x = u_xlat0.x * _Saturation;
    u_xlat0.xyw = u_xlat16_3.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat0.xyw = u_xlat0.xyw * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = dot(u_xlat0.xyw, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BlackWhiteThredhold<u_xlat16_3.x);
#else
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_3.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.5<_ExchangeBlackWhite);
#else
    u_xlatb7 = 0.5<_ExchangeBlackWhite;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb7)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb7)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz;
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat0.xyw = u_xlat16_3.xyz + (-_VignetteColor.xyz);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat0.xyw + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.5<_UseVignette);
#else
    u_xlatb21 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat16_3.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform lowp sampler2D _VoronoTex;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat14;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat21 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat21 * u_xlat1.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat21 * u_xlat14;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb8 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat1.x;
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb21 = u_xlat21<(-u_xlat21);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb7 = u_xlatb7 && u_xlatb21;
    u_xlat7.x = (u_xlatb7) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat7.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat10_0 = texture2D(_VoronoTex, u_xlat2.xz).x;
    u_xlat10_7 = texture2D(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat10_7 * u_xlat10_0;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat7.y = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat7.xy = sqrt(u_xlat7.xy);
    u_xlat14 = log2(u_xlat7.y);
    u_xlat14 = u_xlat14 * _VignettePower;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _VignetteScale;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat14 = (-u_xlat14) + 1.0;
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat21 = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
    u_xlat0.xy = u_xlat7.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat10_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlatb0 = 0.5<_InvertColor;
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat0.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
    u_xlatb21 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_24 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_24) * u_xlat0.xy + u_xlat16_3.zy;
    u_xlat2.w = (-u_xlat16_3.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_24) * u_xlat0.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat4.x = u_xlat2.x + u_xlat16_3.x;
    u_xlatb0 = u_xlat16_3.x>=u_xlat1.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat1.xyw;
    u_xlat0.x = min(u_xlat7.x, u_xlat1.y);
    u_xlat7.x = u_xlat7.x + (-u_xlat1.y);
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat21;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat16_3.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_3.x * 360.0;
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_10.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat8.xyz = u_xlat16_10.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = u_xlat1.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat7.x;
    u_xlat16_3.x = u_xlat0.x * _Saturation;
    u_xlat0.xyw = u_xlat16_3.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat0.xyw = u_xlat0.xyw * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = dot(u_xlat0.xyw, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_3.x;
    u_xlatb7 = 0.5<_ExchangeBlackWhite;
    u_xlat16_6.xyz = (bool(u_xlatb7)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb7)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz;
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat0.xyw = u_xlat16_3.xyz + (-_VignetteColor.xyz);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat0.xyw + _VignetteColor.xyz;
    u_xlatb21 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat16_3.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform lowp sampler2D _VoronoTex;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_10;
float u_xlat14;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat14 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = float(1.0) / u_xlat14;
    u_xlat21 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat21 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat21 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat21 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat21 * u_xlat1.x + -0.330299497;
    u_xlat21 = u_xlat21 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat21 * u_xlat14;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb8 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb8 ? u_xlat1.x : float(0.0);
    u_xlat14 = u_xlat14 * u_xlat21 + u_xlat1.x;
    u_xlatb21 = u_xlat0.y<(-u_xlat0.y);
    u_xlat21 = u_xlatb21 ? -3.14159274 : float(0.0);
    u_xlat14 = u_xlat21 + u_xlat14;
    u_xlat21 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb21 = u_xlat21<(-u_xlat21);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb7 = u_xlatb7 && u_xlatb21;
    u_xlat7.x = (u_xlatb7) ? (-u_xlat14) : u_xlat14;
    u_xlat0.y = u_xlat7.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat10_0 = texture2D(_VoronoTex, u_xlat2.xz).x;
    u_xlat10_7 = texture2D(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat10_7 * u_xlat10_0;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat7.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat7.y = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat7.xy = sqrt(u_xlat7.xy);
    u_xlat14 = log2(u_xlat7.y);
    u_xlat14 = u_xlat14 * _VignettePower;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = u_xlat14 * _VignetteScale;
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat14 = (-u_xlat14) + 1.0;
    u_xlat7.x = (-u_xlat7.x) + 1.0;
    u_xlat21 = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat21 * u_xlat7.x;
    u_xlat0.xy = u_xlat7.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat10_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlatb0 = 0.5<_InvertColor;
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_3.xyz : u_xlat10_1.xyz;
    SV_Target0.w = u_xlat10_1.w;
    u_xlat0.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
    u_xlatb21 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_24 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat1.xy = vec2(u_xlat16_24) * u_xlat0.xy + u_xlat16_3.zy;
    u_xlat2.w = (-u_xlat16_3.x);
    u_xlat0.x = float(1.0);
    u_xlat0.y = float(-1.0);
    u_xlat1.zw = vec2(u_xlat16_24) * u_xlat0.xy + vec2(-1.0, 0.666666687);
    u_xlat2.xyz = (-u_xlat1.xyw);
    u_xlat4.yzw = u_xlat1.yzx + u_xlat2.yzw;
    u_xlat4.x = u_xlat2.x + u_xlat16_3.x;
    u_xlatb0 = u_xlat16_3.x>=u_xlat1.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat1.xyw;
    u_xlat0.x = min(u_xlat7.x, u_xlat1.y);
    u_xlat7.x = u_xlat7.x + (-u_xlat1.y);
    u_xlat0.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = u_xlat7.x / u_xlat21;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat16_3.x = abs(u_xlat7.x) + _Hue;
    u_xlat16_10.x = u_xlat16_3.x * 360.0;
    u_xlatb7 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_10.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat8.xyz = u_xlat16_10.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = u_xlat1.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat7.x;
    u_xlat16_3.x = u_xlat0.x * _Saturation;
    u_xlat0.xyw = u_xlat16_3.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat0.xyw = u_xlat0.xyw * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = dot(u_xlat0.xyw, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_3.x;
    u_xlatb7 = 0.5<_ExchangeBlackWhite;
    u_xlat16_6.xyz = (bool(u_xlatb7)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb7)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz;
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat0.xyw = u_xlat16_3.xyz + (-_VignetteColor.xyz);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat0.xyw + _VignetteColor.xyz;
    u_xlatb21 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat16_3.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _VoronoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AddTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
float u_xlat18;
bool u_xlatb18;
bool u_xlatb20;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat18 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat27 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat18 = u_xlat18 * u_xlat27;
    u_xlat27 = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat27 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat27 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat27 * u_xlat1.x + -0.330299497;
    u_xlat27 = u_xlat27 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat27 * u_xlat18;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb10 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb10 ? u_xlat1.x : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat27 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb27 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat27 = u_xlatb27 ? -3.14159274 : float(0.0);
    u_xlat18 = u_xlat27 + u_xlat18;
    u_xlat27 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat27<(-u_xlat27));
#else
    u_xlatb27 = u_xlat27<(-u_xlat27);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb9 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb27;
    u_xlat9.x = (u_xlatb9) ? (-u_xlat18) : u_xlat18;
    u_xlat0.y = u_xlat9.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat16_0.x = texture(_VoronoTex, u_xlat2.xz).x;
    u_xlat16_9 = texture(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat16_9 * u_xlat16_0.x;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat9.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = (-u_xlat9.x) + 1.0;
    u_xlat18 = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat18 * u_xlat9.x;
    u_xlat0.xy = u_xlat9.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_InvertColor);
#else
    u_xlatb2 = 0.5<_InvertColor;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat0.w = (-u_xlat16_3.x);
    u_xlat2.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb20 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_30 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat2.xy = vec2(u_xlat16_30) * u_xlat2.xy + u_xlat16_3.zy;
    u_xlat4.x = float(1.0);
    u_xlat4.y = float(-1.0);
    u_xlat2.zw = vec2(u_xlat16_30) * u_xlat4.xy + vec2(-1.0, 0.666666687);
    u_xlat0.xyz = (-u_xlat2.xyw);
    u_xlat4.yzw = u_xlat0.yzw + u_xlat2.yzx;
    u_xlat4.x = u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat16_3.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat9.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz + u_xlat2.xyw;
    u_xlat2.x = min(u_xlat0.z, u_xlat9.x);
    u_xlat9.x = (-u_xlat0.z) + u_xlat9.x;
    u_xlat18 = u_xlat0.x + (-u_xlat2.x);
    u_xlat2.x = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat2.x;
    u_xlat9.x = u_xlat9.x + u_xlat0.w;
    u_xlat16_3.x = abs(u_xlat9.x) + _Hue;
    u_xlat16_12.x = u_xlat16_3.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_12.x>=(-u_xlat16_12.x));
#else
    u_xlatb9 = u_xlat16_12.x>=(-u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_12.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat2.xyz = u_xlat16_12.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat0.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18 / u_xlat9.x;
    u_xlat16_3.x = u_xlat9.x * _Saturation;
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat9.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BlackWhiteThredhold<u_xlat16_3.x);
#else
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_3.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.5<_ExchangeBlackWhite);
#else
    u_xlatb9 = 0.5<_ExchangeBlackWhite;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb9)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb9)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz;
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat0.x = _TexRotator * 0.0174532924;
    u_xlat16_5.x = sin((-u_xlat0.x));
    u_xlat16_6 = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_5.y = u_xlat16_7;
    u_xlat16_5.z = u_xlat16_6;
    u_xlat0.y = dot(u_xlat16_5.zy, u_xlat1.xy);
    u_xlat0.x = dot(u_xlat16_5.yx, u_xlat1.xy);
    u_xlat18 = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignettePower;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat16_1 = texture(_AddTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyw = u_xlat16_5.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha)) + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat0.xyw + (-_VignetteColor.xyz);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_UseVignette);
#else
    u_xlatb18 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyw;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _VoronoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AddTex;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump float u_xlat16_9;
bool u_xlatb9;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
float u_xlat18;
bool u_xlatb18;
bool u_xlatb20;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat18 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat27 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat18 = u_xlat18 * u_xlat27;
    u_xlat27 = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat27 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat27 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat27 * u_xlat1.x + -0.330299497;
    u_xlat27 = u_xlat27 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat27 * u_xlat18;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb10 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1.x = u_xlatb10 ? u_xlat1.x : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat27 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb27 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat27 = u_xlatb27 ? -3.14159274 : float(0.0);
    u_xlat18 = u_xlat27 + u_xlat18;
    u_xlat27 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(u_xlat27<(-u_xlat27));
#else
    u_xlatb27 = u_xlat27<(-u_xlat27);
#endif
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb9 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb27;
    u_xlat9.x = (u_xlatb9) ? (-u_xlat18) : u_xlat18;
    u_xlat0.y = u_xlat9.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat16_0.x = texture(_VoronoTex, u_xlat2.xz).x;
    u_xlat16_9 = texture(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat16_9 * u_xlat16_0.x;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat9.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = (-u_xlat9.x) + 1.0;
    u_xlat18 = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat18 * u_xlat9.x;
    u_xlat0.xy = u_xlat9.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_InvertColor);
#else
    u_xlatb2 = 0.5<_InvertColor;
#endif
    u_xlat16_3.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat0.w = (-u_xlat16_3.x);
    u_xlat2.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb20 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_30 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat2.xy = vec2(u_xlat16_30) * u_xlat2.xy + u_xlat16_3.zy;
    u_xlat4.x = float(1.0);
    u_xlat4.y = float(-1.0);
    u_xlat2.zw = vec2(u_xlat16_30) * u_xlat4.xy + vec2(-1.0, 0.666666687);
    u_xlat0.xyz = (-u_xlat2.xyw);
    u_xlat4.yzw = u_xlat0.yzw + u_xlat2.yzx;
    u_xlat4.x = u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat16_3.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat9.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz + u_xlat2.xyw;
    u_xlat2.x = min(u_xlat0.z, u_xlat9.x);
    u_xlat9.x = (-u_xlat0.z) + u_xlat9.x;
    u_xlat18 = u_xlat0.x + (-u_xlat2.x);
    u_xlat2.x = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat2.x;
    u_xlat9.x = u_xlat9.x + u_xlat0.w;
    u_xlat16_3.x = abs(u_xlat9.x) + _Hue;
    u_xlat16_12.x = u_xlat16_3.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_12.x>=(-u_xlat16_12.x));
#else
    u_xlatb9 = u_xlat16_12.x>=(-u_xlat16_12.x);
#endif
    u_xlat16_12.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_12.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat2.xyz = u_xlat16_12.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat0.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18 / u_xlat9.x;
    u_xlat16_3.x = u_xlat9.x * _Saturation;
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat9.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_BlackWhiteThredhold<u_xlat16_3.x);
#else
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_3.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.5<_ExchangeBlackWhite);
#else
    u_xlatb9 = 0.5<_ExchangeBlackWhite;
#endif
    u_xlat16_8.xyz = (bool(u_xlatb9)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb9)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz;
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat0.x = _TexRotator * 0.0174532924;
    u_xlat16_5.x = sin((-u_xlat0.x));
    u_xlat16_6 = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_5.y = u_xlat16_7;
    u_xlat16_5.z = u_xlat16_6;
    u_xlat0.y = dot(u_xlat16_5.zy, u_xlat1.xy);
    u_xlat0.x = dot(u_xlat16_5.yx, u_xlat1.xy);
    u_xlat18 = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignettePower;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignetteScale;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat16_1 = texture(_AddTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyw = u_xlat16_5.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha)) + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat0.xyw + (-_VignetteColor.xyz);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _VignetteColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.5<_UseVignette);
#else
    u_xlatb18 = 0.5<_UseVignette;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyw;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
uniform lowp sampler2D _VoronoTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _AddTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
lowp float u_xlat10_9;
bool u_xlatb9;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
float u_xlat18;
bool u_xlatb18;
bool u_xlatb20;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat18 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat27 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat18 = u_xlat18 * u_xlat27;
    u_xlat27 = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat27 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat27 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat27 * u_xlat1.x + -0.330299497;
    u_xlat27 = u_xlat27 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat27 * u_xlat18;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb10 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb10 ? u_xlat1.x : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat27 + u_xlat1.x;
    u_xlatb27 = u_xlat0.y<(-u_xlat0.y);
    u_xlat27 = u_xlatb27 ? -3.14159274 : float(0.0);
    u_xlat18 = u_xlat27 + u_xlat18;
    u_xlat27 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb27 = u_xlat27<(-u_xlat27);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlatb9 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb9 = u_xlatb9 && u_xlatb27;
    u_xlat9.x = (u_xlatb9) ? (-u_xlat18) : u_xlat18;
    u_xlat0.y = u_xlat9.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat10_0.x = texture2D(_VoronoTex, u_xlat2.xz).x;
    u_xlat10_9 = texture2D(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat10_9 * u_xlat10_0.x;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat9.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = (-u_xlat9.x) + 1.0;
    u_xlat18 = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat18 * u_xlat9.x;
    u_xlat0.xy = u_xlat9.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlatb2 = 0.5<_InvertColor;
    u_xlat16_3.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat10_0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    u_xlat0.w = (-u_xlat16_3.x);
    u_xlat2.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
    u_xlatb20 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_30 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat2.xy = vec2(u_xlat16_30) * u_xlat2.xy + u_xlat16_3.zy;
    u_xlat4.x = float(1.0);
    u_xlat4.y = float(-1.0);
    u_xlat2.zw = vec2(u_xlat16_30) * u_xlat4.xy + vec2(-1.0, 0.666666687);
    u_xlat0.xyz = (-u_xlat2.xyw);
    u_xlat4.yzw = u_xlat0.yzw + u_xlat2.yzx;
    u_xlat4.x = u_xlat0.x + u_xlat16_3.x;
    u_xlatb0 = u_xlat16_3.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat9.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz + u_xlat2.xyw;
    u_xlat2.x = min(u_xlat0.z, u_xlat9.x);
    u_xlat9.x = (-u_xlat0.z) + u_xlat9.x;
    u_xlat18 = u_xlat0.x + (-u_xlat2.x);
    u_xlat2.x = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat2.x;
    u_xlat9.x = u_xlat9.x + u_xlat0.w;
    u_xlat16_3.x = abs(u_xlat9.x) + _Hue;
    u_xlat16_12.x = u_xlat16_3.x * 360.0;
    u_xlatb9 = u_xlat16_12.x>=(-u_xlat16_12.x);
    u_xlat16_12.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_12.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat2.xyz = u_xlat16_12.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat0.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18 / u_xlat9.x;
    u_xlat16_3.x = u_xlat9.x * _Saturation;
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat9.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_3.x;
    u_xlatb9 = 0.5<_ExchangeBlackWhite;
    u_xlat16_8.xyz = (bool(u_xlatb9)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb9)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz;
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat0.x = _TexRotator * 0.0174532924;
    u_xlat16_5.x = sin((-u_xlat0.x));
    u_xlat16_6 = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_5.y = u_xlat16_7;
    u_xlat16_5.z = u_xlat16_6;
    u_xlat0.y = dot(u_xlat16_5.zy, u_xlat1.xy);
    u_xlat0.x = dot(u_xlat16_5.yx, u_xlat1.xy);
    u_xlat18 = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignettePower;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignetteScale;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat10_1 = texture2D(_AddTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyw = u_xlat16_5.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha)) + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat0.xyw + (-_VignetteColor.xyz);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _VignetteColor.xyz;
    u_xlatb18 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyw;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ShakeUV;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _ShakeUV.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _InvertColor;
uniform 	float _BlackWhiteThredhold;
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	float _ExchangeBlackWhite;
uniform 	float _centerU;
uniform 	float _centerV;
uniform 	float _LineTilingU;
uniform 	float _LineTilingV;
uniform 	float _LineUVScale;
uniform 	mediump float _UseVignette;
uniform 	float _VignettePower;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteScale;
uniform 	vec4 _AddTex_ST;
uniform 	float _TexRotator;
uniform 	float _TexAlpha;
uniform lowp sampler2D _VoronoTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _AddTex;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
lowp float u_xlat10_9;
bool u_xlatb9;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
float u_xlat18;
bool u_xlatb18;
bool u_xlatb20;
float u_xlat27;
bool u_xlatb27;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy + (-vec2(_centerU, _centerV));
    u_xlat18 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat27 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat18 = u_xlat18 * u_xlat27;
    u_xlat27 = u_xlat18 * u_xlat18;
    u_xlat1.x = u_xlat27 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat27 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat27 * u_xlat1.x + -0.330299497;
    u_xlat27 = u_xlat27 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat27 * u_xlat18;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb10 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1.x = u_xlatb10 ? u_xlat1.x : float(0.0);
    u_xlat18 = u_xlat18 * u_xlat27 + u_xlat1.x;
    u_xlatb27 = u_xlat0.y<(-u_xlat0.y);
    u_xlat27 = u_xlatb27 ? -3.14159274 : float(0.0);
    u_xlat18 = u_xlat27 + u_xlat18;
    u_xlat27 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb27 = u_xlat27<(-u_xlat27);
    u_xlat1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlatb9 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb9 = u_xlatb9 && u_xlatb27;
    u_xlat9.x = (u_xlatb9) ? (-u_xlat18) : u_xlat18;
    u_xlat0.y = u_xlat9.x * 0.159235656;
    u_xlat1 = vec4(_LineTilingU, _LineTilingV, _LineTilingU, _LineTilingV) * vec4(2.0, 50.0, 1.0, 100.0);
    u_xlat2 = u_xlat0.xxyy * u_xlat1.xzyw;
    u_xlat10_0.x = texture2D(_VoronoTex, u_xlat2.xz).x;
    u_xlat10_9 = texture2D(_VoronoTex, u_xlat2.yw).x;
    u_xlat0.x = u_xlat10_9 * u_xlat10_0.x;
    u_xlat0.x = u_xlat0.x * _LineUVScale;
    u_xlat1 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat9.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = (-u_xlat9.x) + 1.0;
    u_xlat18 = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = u_xlat18 * u_xlat9.x;
    u_xlat0.xy = u_xlat9.xx * u_xlat0.xx + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_3.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlatb2 = 0.5<_InvertColor;
    u_xlat16_3.xyz = (bool(u_xlatb2)) ? u_xlat16_3.xyz : u_xlat10_0.xyz;
    SV_Target0.w = u_xlat10_0.w;
    u_xlat0.w = (-u_xlat16_3.x);
    u_xlat2.xy = (-u_xlat16_3.zy) + u_xlat16_3.yz;
    u_xlatb20 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_30 = (u_xlatb20) ? 1.0 : 0.0;
    u_xlat2.xy = vec2(u_xlat16_30) * u_xlat2.xy + u_xlat16_3.zy;
    u_xlat4.x = float(1.0);
    u_xlat4.y = float(-1.0);
    u_xlat2.zw = vec2(u_xlat16_30) * u_xlat4.xy + vec2(-1.0, 0.666666687);
    u_xlat0.xyz = (-u_xlat2.xyw);
    u_xlat4.yzw = u_xlat0.yzw + u_xlat2.yzx;
    u_xlat4.x = u_xlat0.x + u_xlat16_3.x;
    u_xlatb0 = u_xlat16_3.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat9.x = u_xlat0.x * u_xlat4.w + u_xlat16_3.x;
    u_xlat0.xzw = u_xlat0.xxx * u_xlat4.xyz + u_xlat2.xyw;
    u_xlat2.x = min(u_xlat0.z, u_xlat9.x);
    u_xlat9.x = (-u_xlat0.z) + u_xlat9.x;
    u_xlat18 = u_xlat0.x + (-u_xlat2.x);
    u_xlat2.x = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat9.x = u_xlat9.x / u_xlat2.x;
    u_xlat9.x = u_xlat9.x + u_xlat0.w;
    u_xlat16_3.x = abs(u_xlat9.x) + _Hue;
    u_xlat16_12.x = u_xlat16_3.x * 360.0;
    u_xlatb9 = u_xlat16_12.x>=(-u_xlat16_12.x);
    u_xlat16_12.xy = (bool(u_xlatb9)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_3.x = u_xlat16_12.y * u_xlat16_3.x;
    u_xlat16_3.x = fract(u_xlat16_3.x);
    u_xlat2.xyz = u_xlat16_12.xxx * u_xlat16_3.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat9.x = u_xlat0.x + 1.00000001e-10;
    u_xlat9.x = u_xlat18 / u_xlat9.x;
    u_xlat16_3.x = u_xlat9.x * _Saturation;
    u_xlat9.xyz = u_xlat16_3.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat9.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = _BlackWhiteThredhold<u_xlat16_3.x;
    u_xlatb9 = 0.5<_ExchangeBlackWhite;
    u_xlat16_8.xyz = (bool(u_xlatb9)) ? _Color1.xyz : _Color2.xyz;
    u_xlat16_5.xyz = (bool(u_xlatb9)) ? _Color2.xyz : _Color1.xyz;
    u_xlat16_3.xyz = u_xlat16_8.xyz;
    u_xlat16_3.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat0.x = _TexRotator * 0.0174532924;
    u_xlat16_5.x = sin((-u_xlat0.x));
    u_xlat16_6 = sin(u_xlat0.x);
    u_xlat16_7 = cos(u_xlat0.x);
    u_xlat16_5.y = u_xlat16_7;
    u_xlat16_5.z = u_xlat16_6;
    u_xlat0.y = dot(u_xlat16_5.zy, u_xlat1.xy);
    u_xlat0.x = dot(u_xlat16_5.yx, u_xlat1.xy);
    u_xlat18 = dot(u_xlat1.zw, u_xlat1.zw);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignettePower;
    u_xlat18 = exp2(u_xlat18);
    u_xlat18 = u_xlat18 * _VignetteScale;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat18 = (-u_xlat18) + 1.0;
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * _AddTex_ST.xy + _AddTex_ST.zw;
    u_xlat10_1 = texture2D(_AddTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyw = u_xlat16_5.xyz * vec3(vec3(_TexAlpha, _TexAlpha, _TexAlpha)) + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat0.xyw + (-_VignetteColor.xyz);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _VignetteColor.xyz;
    u_xlatb18 = 0.5<_UseVignette;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyw;
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
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_ADDTEX" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_ADDTEX" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_ADDTEX" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_ADDTEX" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_RAY_LINE" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_RAY_LINE" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_RAY_LINE" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_RAY_LINE" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_ADDTEX" "_USE_RAY_LINE" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_ADDTEX" "_USE_RAY_LINE" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_ADDTEX" "_USE_RAY_LINE" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_ADDTEX" "_USE_RAY_LINE" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_ADDTEX" "_USE_BLACK_WHITE_FLASH" "_USE_RAY_LINE" }
""
}
}
}
}
}