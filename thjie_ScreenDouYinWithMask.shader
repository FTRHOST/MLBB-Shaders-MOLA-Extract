//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "thjie/ScreenDouYinWithMask" {
Properties {

_MainTex ("Texture", 2D) = "white" { }

_OffsetX ("OffsetX", Float) = 0.0

_OffsetY ("OffsetY", Float) = 0.0

_Hue ("HUE", Float) = 0.0

_Saturation ("Saturation", Float) = 1.0

_Contrast ("Contrast", Float) = 1.0

_MaskValue ("MaskValue", Float) = 0.5

_MaskSoftness ("MaskSoftness", Float) = 0.10000000149011612

_MaskAlpha ("MaskAlpha", Float) = 1.0

}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 49282
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _ScreenParams;
uniform 	float _OffsetX;
uniform 	float _OffsetY;
uniform 	float _Hue;
uniform 	float _Saturation;
uniform 	float _Contrast;
uniform 	float _MaskValue;
uniform 	float _MaskSoftness;
uniform 	float _MaskAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat6.x = (-_MaskSoftness) + _MaskValue;
    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
    u_xlat12.x = _MaskSoftness + _MaskValue;
    u_xlat6.x = (-u_xlat6.x) + u_xlat12.x;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = u_xlat0.x * _MaskAlpha;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat2.z = float(1.0);
    u_xlat2.w = float(-1.0);
    u_xlat6.xy = vs_TEXCOORD0.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_6 = texture(_MainTex, u_xlat6.xy).z;
    u_xlat12.xy = vs_TEXCOORD0.xy + (-vec2(_OffsetX, _OffsetY));
    u_xlat3.w = texture(_MainTex, u_xlat12.xy).x;
    u_xlat12.x = u_xlat16_6 * u_xlat3.w;
    u_xlat1.x = u_xlat12.x * 0.100000001 + u_xlat16_6;
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_4.y>=u_xlat1.x);
#else
    u_xlatb6 = u_xlat16_4.y>=u_xlat1.x;
#endif
    u_xlat16_5 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat1.y = u_xlat16_4.y;
    u_xlat2.xy = (-u_xlat1.xy) + u_xlat1.yx;
    u_xlat1 = vec4(u_xlat16_5) * u_xlat2 + u_xlat1;
    u_xlat3.xyz = u_xlat1.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat3.w>=u_xlat3.x);
#else
    u_xlatb6 = u_xlat3.w>=u_xlat3.x;
#endif
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat1.xyw = u_xlat3.wyx;
    u_xlat1 = u_xlat1 + (-u_xlat3);
    u_xlat1 = u_xlat6.xxxx * u_xlat1 + u_xlat3;
    u_xlat6.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat6.x = (-u_xlat6.x) + u_xlat1.x;
    u_xlat12.x = u_xlat6.x * 6.0 + 1.00000001e-10;
    u_xlat18 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat12.x = u_xlat18 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x + u_xlat1.z;
    u_xlat12.x = abs(u_xlat12.x) + _Hue;
    u_xlat18 = u_xlat12.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=(-u_xlat18));
#else
    u_xlatb18 = u_xlat18>=(-u_xlat18);
#endif
    u_xlat7.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat12.x = u_xlat12.x * u_xlat7.y;
    u_xlat12.x = fract(u_xlat12.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat12.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12.x = u_xlat1.x + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat12.x;
    u_xlat6.x = u_xlat6.x * _Saturation;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat6.xyz = vec3(_Contrast) * u_xlat6.xyz + (-u_xlat16_4.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_4.xyz;
    SV_Target0.w = u_xlat16_4.w;
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _ScreenParams;
uniform 	float _OffsetX;
uniform 	float _OffsetY;
uniform 	float _Hue;
uniform 	float _Saturation;
uniform 	float _Contrast;
uniform 	float _MaskValue;
uniform 	float _MaskSoftness;
uniform 	float _MaskAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat6.x = (-_MaskSoftness) + _MaskValue;
    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
    u_xlat12.x = _MaskSoftness + _MaskValue;
    u_xlat6.x = (-u_xlat6.x) + u_xlat12.x;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = u_xlat0.x * _MaskAlpha;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat2.z = float(1.0);
    u_xlat2.w = float(-1.0);
    u_xlat6.xy = vs_TEXCOORD0.xy + vec2(_OffsetX, _OffsetY);
    u_xlat16_6 = texture(_MainTex, u_xlat6.xy).z;
    u_xlat12.xy = vs_TEXCOORD0.xy + (-vec2(_OffsetX, _OffsetY));
    u_xlat3.w = texture(_MainTex, u_xlat12.xy).x;
    u_xlat12.x = u_xlat16_6 * u_xlat3.w;
    u_xlat1.x = u_xlat12.x * 0.100000001 + u_xlat16_6;
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16_4.y>=u_xlat1.x);
#else
    u_xlatb6 = u_xlat16_4.y>=u_xlat1.x;
#endif
    u_xlat16_5 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat1.y = u_xlat16_4.y;
    u_xlat2.xy = (-u_xlat1.xy) + u_xlat1.yx;
    u_xlat1 = vec4(u_xlat16_5) * u_xlat2 + u_xlat1;
    u_xlat3.xyz = u_xlat1.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat3.w>=u_xlat3.x);
#else
    u_xlatb6 = u_xlat3.w>=u_xlat3.x;
#endif
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat1.xyw = u_xlat3.wyx;
    u_xlat1 = u_xlat1 + (-u_xlat3);
    u_xlat1 = u_xlat6.xxxx * u_xlat1 + u_xlat3;
    u_xlat6.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat6.x = (-u_xlat6.x) + u_xlat1.x;
    u_xlat12.x = u_xlat6.x * 6.0 + 1.00000001e-10;
    u_xlat18 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat12.x = u_xlat18 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x + u_xlat1.z;
    u_xlat12.x = abs(u_xlat12.x) + _Hue;
    u_xlat18 = u_xlat12.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=(-u_xlat18));
#else
    u_xlatb18 = u_xlat18>=(-u_xlat18);
#endif
    u_xlat7.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat12.x = u_xlat12.x * u_xlat7.y;
    u_xlat12.x = fract(u_xlat12.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat12.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12.x = u_xlat1.x + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat12.x;
    u_xlat6.x = u_xlat6.x * _Saturation;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat6.xyz = vec3(_Contrast) * u_xlat6.xyz + (-u_xlat16_4.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat16_4.xyz;
    SV_Target0.w = u_xlat16_4.w;
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
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _ScreenParams;
uniform 	float _OffsetX;
uniform 	float _OffsetY;
uniform 	float _Hue;
uniform 	float _Saturation;
uniform 	float _Contrast;
uniform 	float _MaskValue;
uniform 	float _MaskSoftness;
uniform 	float _MaskAlpha;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
bool u_xlatb6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat6.x = (-_MaskSoftness) + _MaskValue;
    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
    u_xlat12.x = _MaskSoftness + _MaskValue;
    u_xlat6.x = (-u_xlat6.x) + u_xlat12.x;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = u_xlat0.x * _MaskAlpha;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat2.z = float(1.0);
    u_xlat2.w = float(-1.0);
    u_xlat6.xy = vs_TEXCOORD0.xy + vec2(_OffsetX, _OffsetY);
    u_xlat10_6 = texture2D(_MainTex, u_xlat6.xy).z;
    u_xlat12.xy = vs_TEXCOORD0.xy + (-vec2(_OffsetX, _OffsetY));
    u_xlat3.w = texture2D(_MainTex, u_xlat12.xy).x;
    u_xlat12.x = u_xlat10_6 * u_xlat3.w;
    u_xlat1.x = u_xlat12.x * 0.100000001 + u_xlat10_6;
    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_4.y>=u_xlat1.x;
    u_xlat16_5 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat1.y = u_xlat10_4.y;
    u_xlat2.xy = (-u_xlat1.xy) + u_xlat1.yx;
    u_xlat1 = vec4(u_xlat16_5) * u_xlat2 + u_xlat1;
    u_xlat3.xyz = u_xlat1.xyw;
    u_xlatb6 = u_xlat3.w>=u_xlat3.x;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat1.xyw = u_xlat3.wyx;
    u_xlat1 = u_xlat1 + (-u_xlat3);
    u_xlat1 = u_xlat6.xxxx * u_xlat1 + u_xlat3;
    u_xlat6.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat6.x = (-u_xlat6.x) + u_xlat1.x;
    u_xlat12.x = u_xlat6.x * 6.0 + 1.00000001e-10;
    u_xlat18 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat12.x = u_xlat18 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x + u_xlat1.z;
    u_xlat12.x = abs(u_xlat12.x) + _Hue;
    u_xlat18 = u_xlat12.x * 360.0;
    u_xlatb18 = u_xlat18>=(-u_xlat18);
    u_xlat7.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat12.x = u_xlat12.x * u_xlat7.y;
    u_xlat12.x = fract(u_xlat12.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat12.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12.x = u_xlat1.x + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat12.x;
    u_xlat6.x = u_xlat6.x * _Saturation;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat6.xyz = vec3(_Contrast) * u_xlat6.xyz + (-u_xlat10_4.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat10_4.xyz;
    SV_Target0.w = u_xlat10_4.w;
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
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	vec4 _ScreenParams;
uniform 	float _OffsetX;
uniform 	float _OffsetY;
uniform 	float _Hue;
uniform 	float _Saturation;
uniform 	float _Contrast;
uniform 	float _MaskValue;
uniform 	float _MaskSoftness;
uniform 	float _MaskAlpha;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_4;
mediump float u_xlat16_5;
vec3 u_xlat6;
lowp float u_xlat10_6;
bool u_xlatb6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.y = 1.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat12.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat6.x = (-_MaskSoftness) + _MaskValue;
    u_xlat0.x = (-u_xlat6.x) + u_xlat0.x;
    u_xlat12.x = _MaskSoftness + _MaskValue;
    u_xlat6.x = (-u_xlat6.x) + u_xlat12.x;
    u_xlat6.x = float(1.0) / u_xlat6.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = u_xlat0.x * _MaskAlpha;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat2.z = float(1.0);
    u_xlat2.w = float(-1.0);
    u_xlat6.xy = vs_TEXCOORD0.xy + vec2(_OffsetX, _OffsetY);
    u_xlat10_6 = texture2D(_MainTex, u_xlat6.xy).z;
    u_xlat12.xy = vs_TEXCOORD0.xy + (-vec2(_OffsetX, _OffsetY));
    u_xlat3.w = texture2D(_MainTex, u_xlat12.xy).x;
    u_xlat12.x = u_xlat10_6 * u_xlat3.w;
    u_xlat1.x = u_xlat12.x * 0.100000001 + u_xlat10_6;
    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb6 = u_xlat10_4.y>=u_xlat1.x;
    u_xlat16_5 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat1.y = u_xlat10_4.y;
    u_xlat2.xy = (-u_xlat1.xy) + u_xlat1.yx;
    u_xlat1 = vec4(u_xlat16_5) * u_xlat2 + u_xlat1;
    u_xlat3.xyz = u_xlat1.xyw;
    u_xlatb6 = u_xlat3.w>=u_xlat3.x;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat1.xyw = u_xlat3.wyx;
    u_xlat1 = u_xlat1 + (-u_xlat3);
    u_xlat1 = u_xlat6.xxxx * u_xlat1 + u_xlat3;
    u_xlat6.x = min(u_xlat1.y, u_xlat1.w);
    u_xlat6.x = (-u_xlat6.x) + u_xlat1.x;
    u_xlat12.x = u_xlat6.x * 6.0 + 1.00000001e-10;
    u_xlat18 = (-u_xlat1.y) + u_xlat1.w;
    u_xlat12.x = u_xlat18 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x + u_xlat1.z;
    u_xlat12.x = abs(u_xlat12.x) + _Hue;
    u_xlat18 = u_xlat12.x * 360.0;
    u_xlatb18 = u_xlat18>=(-u_xlat18);
    u_xlat7.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat12.x = u_xlat12.x * u_xlat7.y;
    u_xlat12.x = fract(u_xlat12.x);
    u_xlat7.xyz = u_xlat7.xxx * u_xlat12.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12.x = u_xlat1.x + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat12.x;
    u_xlat6.x = u_xlat6.x * _Saturation;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xxx;
    u_xlat6.xyz = vec3(_Contrast) * u_xlat6.xyz + (-u_xlat10_4.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat10_4.xyz;
    SV_Target0.w = u_xlat10_4.w;
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
}
}