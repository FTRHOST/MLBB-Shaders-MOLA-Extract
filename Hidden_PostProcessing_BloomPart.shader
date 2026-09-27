//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/PostProcessing/BloomPart" {
Properties {

_MainTex ("", 2D) = "" { }

}
SubShader {
 Pass {
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 33826
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
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _MainTex_ST;
uniform 	float _PrefilterOffs;
uniform 	float _Threshold;
uniform 	vec3 _Curve;
uniform 	float _One_Intensity;
uniform 	mediump float _One_IsInterleave;
uniform 	mediump vec4 _One_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _AutoExposure;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec3 u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_8 = texture(_AutoExposure, u_xlat0.xy).x;
    u_xlat16_0.xyw = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = vec3(u_xlat16_8) * u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_12 = texture(_AutoExposure, u_xlat1.xy).x;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = vec3(u_xlat16_12) * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = max(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_3.xyz = min(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.100000001, 0.0), u_xlat16_2.xyzx).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_One_IsInterleave==1.0);
#else
    u_xlatb4 = _One_IsInterleave==1.0;
#endif
    u_xlat0.x = (u_xlatb4) ? u_xlat0.x : 1.0;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat1.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_2.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_2.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat12 = u_xlat16_2.x + (-_Curve.xxyz.y);
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = min(u_xlat12, _Curve.xxyz.z);
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * _Curve.xxyz.w;
    u_xlat1.x = u_xlat16_2.x + (-_Threshold);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat12 = max(u_xlat12, u_xlat1.x);
    u_xlat12 = u_xlat12 / u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = vec3(_One_Intensity) * _One_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
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
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _MainTex_ST;
uniform 	float _PrefilterOffs;
uniform 	float _Threshold;
uniform 	vec3 _Curve;
uniform 	float _One_Intensity;
uniform 	mediump float _One_IsInterleave;
uniform 	mediump vec4 _One_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _AutoExposure;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec3 u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_8 = texture(_AutoExposure, u_xlat0.xy).x;
    u_xlat16_0.xyw = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = vec3(u_xlat16_8) * u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_12 = texture(_AutoExposure, u_xlat1.xy).x;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = vec3(u_xlat16_12) * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = max(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_3.xyz = min(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.100000001, 0.0), u_xlat16_2.xyzx).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_One_IsInterleave==1.0);
#else
    u_xlatb4 = _One_IsInterleave==1.0;
#endif
    u_xlat0.x = (u_xlatb4) ? u_xlat0.x : 1.0;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat1.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_2.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_2.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat12 = u_xlat16_2.x + (-_Curve.xxyz.y);
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = min(u_xlat12, _Curve.xxyz.z);
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * _Curve.xxyz.w;
    u_xlat1.x = u_xlat16_2.x + (-_Threshold);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat12 = max(u_xlat12, u_xlat1.x);
    u_xlat12 = u_xlat12 / u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = vec3(_One_Intensity) * _One_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
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
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _MainTex_ST;
uniform 	float _PrefilterOffs;
uniform 	float _Threshold;
uniform 	vec3 _Curve;
uniform 	float _One_Intensity;
uniform 	mediump float _One_IsInterleave;
uniform 	mediump vec4 _One_Color;
uniform lowp sampler2D _AutoExposure;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SourceTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bvec3 u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
lowp float u_xlat10_8;
float u_xlat12;
lowp float u_xlat10_12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_8 = texture2D(_AutoExposure, u_xlat0.xy).x;
    u_xlat10_0.xyw = texture2D(_SourceTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = vec3(u_xlat10_8) * u_xlat10_0.xyw;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_12 = texture2D(_AutoExposure, u_xlat1.xy).x;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = vec3(u_xlat10_12) * u_xlat10_1.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = max(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_3.xyz = min(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.100000001, 0.0), u_xlat16_2.xyzx).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlatb4 = _One_IsInterleave==1.0;
    u_xlat0.x = (u_xlatb4) ? u_xlat0.x : 1.0;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat1.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_2.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_2.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat12 = u_xlat16_2.x + (-_Curve.xxyz.y);
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = min(u_xlat12, _Curve.xxyz.z);
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * _Curve.xxyz.w;
    u_xlat1.x = u_xlat16_2.x + (-_Threshold);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat12 = max(u_xlat12, u_xlat1.x);
    u_xlat12 = u_xlat12 / u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = vec3(_One_Intensity) * _One_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
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
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _MainTex_ST;
uniform 	float _PrefilterOffs;
uniform 	float _Threshold;
uniform 	vec3 _Curve;
uniform 	float _One_Intensity;
uniform 	mediump float _One_IsInterleave;
uniform 	mediump vec4 _One_Color;
uniform lowp sampler2D _AutoExposure;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SourceTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bvec3 u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
lowp float u_xlat10_8;
float u_xlat12;
lowp float u_xlat10_12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_8 = texture2D(_AutoExposure, u_xlat0.xy).x;
    u_xlat10_0.xyw = texture2D(_SourceTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = vec3(u_xlat10_8) * u_xlat10_0.xyw;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_12 = texture2D(_AutoExposure, u_xlat1.xy).x;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = vec3(u_xlat10_12) * u_xlat10_1.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = max(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_3.xyz = min(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.100000001, 0.0), u_xlat16_2.xyzx).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlatb4 = _One_IsInterleave==1.0;
    u_xlat0.x = (u_xlatb4) ? u_xlat0.x : 1.0;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat1.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_2.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_2.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat12 = u_xlat16_2.x + (-_Curve.xxyz.y);
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = min(u_xlat12, _Curve.xxyz.z);
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * _Curve.xxyz.w;
    u_xlat1.x = u_xlat16_2.x + (-_Threshold);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat12 = max(u_xlat12, u_xlat1.x);
    u_xlat12 = u_xlat12 / u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = vec3(_One_Intensity) * _One_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
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
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 129804
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
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    SV_Target0.w = 0.0;
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
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + u_xlat16_1.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    SV_Target0.w = 0.0;
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
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
lowp vec3 u_xlat10_2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    SV_Target0.w = 0.0;
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
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
lowp vec3 u_xlat10_2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD1.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + u_xlat10_1.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD1.xyxy;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat10_1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    SV_Target0.w = 0.0;
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
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 139198
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
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_1;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    phase0_Output0_1 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _SampleScale;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_1.xyz = texture(_BaseTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    SV_Target0.w = 0.0;
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
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_1;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    phase0_Output0_1 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _SampleScale;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + u_xlat1.xyz;
    u_xlat16_1.xyz = texture(_BaseTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + u_xlat16_1.xyz;
    SV_Target0.w = 0.0;
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
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_1;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    phase0_Output0_1 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + u_xlat10_2.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + u_xlat1.xyz;
    u_xlat10_1.xyz = texture2D(_BaseTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + u_xlat10_1.xyz;
    SV_Target0.w = 0.0;
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
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_1;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    phase0_Output0_1 = in_TEXCOORD0.xyxy * _MainTex_ST.xyxy + _MainTex_ST.zwzw;
vs_TEXCOORD0 = phase0_Output0_1.xy;
vs_TEXCOORD1 = phase0_Output0_1.zw;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.zw).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz + u_xlat10_2.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + u_xlat1.xyz;
    u_xlat10_1.xyz = texture2D(_BaseTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + u_xlat10_1.xyz;
    SV_Target0.w = 0.0;
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
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 261370
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
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _MainTex_ST;
uniform 	float _PrefilterOffs;
uniform 	float _Two_Threshold;
uniform 	vec3 _TwoCurve;
uniform 	float _Two_Intensity;
uniform 	mediump float _Two_IsInterleave;
uniform 	mediump vec4 _Two_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _AutoExposure;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec3 u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_8 = texture(_AutoExposure, u_xlat0.xy).x;
    u_xlat16_0.xyw = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = vec3(u_xlat16_8) * u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_12 = texture(_AutoExposure, u_xlat1.xy).x;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = vec3(u_xlat16_12) * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = max(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_3.xyz = min(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.100000001, 0.0), u_xlat16_2.xyzx).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_Two_IsInterleave==1.0);
#else
    u_xlatb4 = _Two_IsInterleave==1.0;
#endif
    u_xlat0.x = (u_xlatb4) ? u_xlat0.x : 1.0;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat1.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_2.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_2.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat12 = u_xlat16_2.x + (-_TwoCurve.x);
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = min(u_xlat12, _TwoCurve.y);
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * _TwoCurve.z;
    u_xlat1.x = u_xlat16_2.x + (-_Two_Threshold);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat12 = max(u_xlat12, u_xlat1.x);
    u_xlat12 = u_xlat12 / u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = vec3(vec3(_Two_Intensity, _Two_Intensity, _Two_Intensity)) * _Two_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
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
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _MainTex_ST;
uniform 	float _PrefilterOffs;
uniform 	float _Two_Threshold;
uniform 	vec3 _TwoCurve;
uniform 	float _Two_Intensity;
uniform 	mediump float _Two_IsInterleave;
uniform 	mediump vec4 _Two_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _AutoExposure;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _SourceTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bvec3 u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_8 = texture(_AutoExposure, u_xlat0.xy).x;
    u_xlat16_0.xyw = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = vec3(u_xlat16_8) * u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_12 = texture(_AutoExposure, u_xlat1.xy).x;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = vec3(u_xlat16_12) * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = max(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_3.xyz = min(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.100000001, 0.0), u_xlat16_2.xyzx).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_Two_IsInterleave==1.0);
#else
    u_xlatb4 = _Two_IsInterleave==1.0;
#endif
    u_xlat0.x = (u_xlatb4) ? u_xlat0.x : 1.0;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat1.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_2.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_2.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat12 = u_xlat16_2.x + (-_TwoCurve.x);
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = min(u_xlat12, _TwoCurve.y);
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * _TwoCurve.z;
    u_xlat1.x = u_xlat16_2.x + (-_Two_Threshold);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat12 = max(u_xlat12, u_xlat1.x);
    u_xlat12 = u_xlat12 / u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = vec3(vec3(_Two_Intensity, _Two_Intensity, _Two_Intensity)) * _Two_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
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
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _MainTex_ST;
uniform 	float _PrefilterOffs;
uniform 	float _Two_Threshold;
uniform 	vec3 _TwoCurve;
uniform 	float _Two_Intensity;
uniform 	mediump float _Two_IsInterleave;
uniform 	mediump vec4 _Two_Color;
uniform lowp sampler2D _AutoExposure;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SourceTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bvec3 u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
lowp float u_xlat10_8;
float u_xlat12;
lowp float u_xlat10_12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_8 = texture2D(_AutoExposure, u_xlat0.xy).x;
    u_xlat10_0.xyw = texture2D(_SourceTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = vec3(u_xlat10_8) * u_xlat10_0.xyw;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_12 = texture2D(_AutoExposure, u_xlat1.xy).x;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = vec3(u_xlat10_12) * u_xlat10_1.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = max(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_3.xyz = min(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.100000001, 0.0), u_xlat16_2.xyzx).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlatb4 = _Two_IsInterleave==1.0;
    u_xlat0.x = (u_xlatb4) ? u_xlat0.x : 1.0;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat1.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_2.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_2.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat12 = u_xlat16_2.x + (-_TwoCurve.x);
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = min(u_xlat12, _TwoCurve.y);
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * _TwoCurve.z;
    u_xlat1.x = u_xlat16_2.x + (-_Two_Threshold);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat12 = max(u_xlat12, u_xlat1.x);
    u_xlat12 = u_xlat12 / u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = vec3(vec3(_Two_Intensity, _Two_Intensity, _Two_Intensity)) * _Two_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
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
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _MainTex_ST;
uniform 	float _PrefilterOffs;
uniform 	float _Two_Threshold;
uniform 	vec3 _TwoCurve;
uniform 	float _Two_Intensity;
uniform 	mediump float _Two_IsInterleave;
uniform 	mediump vec4 _Two_Color;
uniform lowp sampler2D _AutoExposure;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SourceTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bvec3 u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
lowp float u_xlat10_8;
float u_xlat12;
lowp float u_xlat10_12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_8 = texture2D(_AutoExposure, u_xlat0.xy).x;
    u_xlat10_0.xyw = texture2D(_SourceTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = vec3(u_xlat10_8) * u_xlat10_0.xyw;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat1.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_12 = texture2D(_AutoExposure, u_xlat1.xy).x;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = vec3(u_xlat10_12) * u_xlat10_1.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat16_2.xyz = max(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_3.xyz = min(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.100000001, 0.0), u_xlat16_2.xyzx).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlatb4 = _Two_IsInterleave==1.0;
    u_xlat0.x = (u_xlatb4) ? u_xlat0.x : 1.0;
    u_xlat4.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat1.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_2.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_2.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat12 = u_xlat16_2.x + (-_TwoCurve.x);
    u_xlat12 = max(u_xlat12, 0.0);
    u_xlat12 = min(u_xlat12, _TwoCurve.y);
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * _TwoCurve.z;
    u_xlat1.x = u_xlat16_2.x + (-_Two_Threshold);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat12 = max(u_xlat12, u_xlat1.x);
    u_xlat12 = u_xlat12 / u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = vec3(vec3(_Two_Intensity, _Two_Intensity, _Two_Intensity)) * _Two_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 0.0;
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
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 279131
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
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _MainTex_ST;
uniform 	float _PrefilterOffs;
UNITY_LOCATION(0) uniform mediump sampler2D _AutoExposure;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _ResultTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_ResultTex, u_xlat0.xy);
    u_xlat16_0 = texture(_AutoExposure, u_xlat6.xy).x;
    u_xlat16_2 = texture(_MainTex, u_xlat6.xy);
    u_xlat0 = vec4(u_xlat16_0) * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    SV_Target0 = u_xlat16_1 + u_xlat0;
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
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _MainTex_ST;
uniform 	float _PrefilterOffs;
UNITY_LOCATION(0) uniform mediump sampler2D _AutoExposure;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _ResultTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_ResultTex, u_xlat0.xy);
    u_xlat16_0 = texture(_AutoExposure, u_xlat6.xy).x;
    u_xlat16_2 = texture(_MainTex, u_xlat6.xy);
    u_xlat0 = vec4(u_xlat16_0) * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    SV_Target0 = u_xlat16_1 + u_xlat0;
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
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _MainTex_ST;
uniform 	float _PrefilterOffs;
uniform lowp sampler2D _AutoExposure;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ResultTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1 = texture2D(_ResultTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_AutoExposure, u_xlat6.xy).x;
    u_xlat10_2 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat0 = vec4(u_xlat10_0) * u_xlat10_2;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat10_1 + u_xlat0;
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
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _MainTex_ST;
uniform 	float _PrefilterOffs;
uniform lowp sampler2D _AutoExposure;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _ResultTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
vec2 u_xlat6;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat6.xy = u_xlat0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1 = texture2D(_ResultTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_AutoExposure, u_xlat6.xy).x;
    u_xlat10_2 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat0 = vec4(u_xlat10_0) * u_xlat10_2;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    SV_Target0 = u_xlat10_1 + u_xlat0;
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
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 351780
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
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	float _Threshold;
uniform 	float _Two_Threshold;
uniform 	vec3 _Curve;
uniform 	vec3 _TwoCurve;
uniform 	float _One_Intensity;
uniform 	float _Two_Intensity;
uniform 	mediump float _One_IsInterleave;
uniform 	mediump float _Two_IsInterleave;
uniform 	mediump vec4 _One_Color;
uniform 	mediump vec4 _Two_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _BloomTex0;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _BloomTex1;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec2 u_xlatb8;
float u_xlat9;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = min(u_xlat16_1.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_1.xyz = texture(_BloomTex0, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_BloomTex1, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = min(u_xlat16_0.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_4.xyz = min(u_xlat16_1.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_5.xyz = max(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_6.xyz = min(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.100000001, 0.0), u_xlat16_5.xyzx).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlatb8.xy = equal(vec4(_One_IsInterleave, _Two_IsInterleave, _One_IsInterleave, _One_IsInterleave), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat0.x = (u_xlatb8.x) ? u_xlat0.x : 1.0;
    u_xlat1.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_4.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_26 = max(u_xlat0.w, u_xlat0.y);
    u_xlat16_26 = max(u_xlat0.x, u_xlat16_26);
    u_xlat1.x = u_xlat16_26 + (-_Curve.xxyz.y);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = min(u_xlat1.x, _Curve.xxyz.z);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _Curve.xxyz.w;
    u_xlat9 = u_xlat16_26 + (-_Threshold);
    u_xlat16_26 = max(u_xlat16_26, 9.99999975e-05);
    u_xlat1.x = max(u_xlat9, u_xlat1.x);
    u_xlat1.x = u_xlat1.x / u_xlat16_26;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat1.xyz = vec3(_One_Intensity) * _One_Color.xyz;
    u_xlat16_1.xyz = u_xlat0.xyw * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = max(u_xlat16_2.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xyz = (-u_xlat16_2.xyz) + u_xlat16_4.xyz;
    u_xlatb0.xyw = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.0, 0.100000001), u_xlat16_2.xyxz).xyw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.w * u_xlat0.x;
    u_xlat0.x = (u_xlatb8.y) ? u_xlat0.x : 1.0;
    u_xlat8.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat16_3.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16_2.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_2.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat24 = u_xlat16_2.x + (-_TwoCurve.x);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat24 = min(u_xlat24, _TwoCurve.y);
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * _TwoCurve.z;
    u_xlat7.x = u_xlat16_2.x + (-_Two_Threshold);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat24 = max(u_xlat24, u_xlat7.x);
    u_xlat24 = u_xlat24 / u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat7.xyz = vec3(vec3(_Two_Intensity, _Two_Intensity, _Two_Intensity)) * _Two_Color.xyz;
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.w = 0.0;
    u_xlat16_0.w = 0.0;
    SV_Target0 = u_xlat16_0 + u_xlat16_1;
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
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	float _Threshold;
uniform 	float _Two_Threshold;
uniform 	vec3 _Curve;
uniform 	vec3 _TwoCurve;
uniform 	float _One_Intensity;
uniform 	float _Two_Intensity;
uniform 	mediump float _One_IsInterleave;
uniform 	mediump float _Two_IsInterleave;
uniform 	mediump vec4 _One_Color;
uniform 	mediump vec4 _Two_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _BloomTex0;
UNITY_LOCATION(1) uniform mediump sampler2D _SourceTex;
UNITY_LOCATION(2) uniform mediump sampler2D _BloomTex1;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec2 u_xlatb8;
float u_xlat9;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = texture(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = min(u_xlat16_1.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_1.xyz = texture(_BloomTex0, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_BloomTex1, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = min(u_xlat16_0.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_4.xyz = min(u_xlat16_1.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_5.xyz = max(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_6.xyz = min(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.100000001, 0.0), u_xlat16_5.xyzx).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlatb8.xy = equal(vec4(_One_IsInterleave, _Two_IsInterleave, _One_IsInterleave, _One_IsInterleave), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat0.x = (u_xlatb8.x) ? u_xlat0.x : 1.0;
    u_xlat1.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_4.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_26 = max(u_xlat0.w, u_xlat0.y);
    u_xlat16_26 = max(u_xlat0.x, u_xlat16_26);
    u_xlat1.x = u_xlat16_26 + (-_Curve.xxyz.y);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = min(u_xlat1.x, _Curve.xxyz.z);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _Curve.xxyz.w;
    u_xlat9 = u_xlat16_26 + (-_Threshold);
    u_xlat16_26 = max(u_xlat16_26, 9.99999975e-05);
    u_xlat1.x = max(u_xlat9, u_xlat1.x);
    u_xlat1.x = u_xlat1.x / u_xlat16_26;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat1.xyz = vec3(_One_Intensity) * _One_Color.xyz;
    u_xlat16_1.xyz = u_xlat0.xyw * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xyz = min(max(u_xlat16_1.xyz, 0.0), 1.0);
#else
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = max(u_xlat16_2.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xyz = (-u_xlat16_2.xyz) + u_xlat16_4.xyz;
    u_xlatb0.xyw = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.0, 0.100000001), u_xlat16_2.xyxz).xyw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.w * u_xlat0.x;
    u_xlat0.x = (u_xlatb8.y) ? u_xlat0.x : 1.0;
    u_xlat8.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat16_3.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16_2.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_2.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat24 = u_xlat16_2.x + (-_TwoCurve.x);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat24 = min(u_xlat24, _TwoCurve.y);
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * _TwoCurve.z;
    u_xlat7.x = u_xlat16_2.x + (-_Two_Threshold);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat24 = max(u_xlat24, u_xlat7.x);
    u_xlat24 = u_xlat24 / u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat7.xyz = vec3(vec3(_Two_Intensity, _Two_Intensity, _Two_Intensity)) * _Two_Color.xyz;
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.w = 0.0;
    u_xlat16_0.w = 0.0;
    SV_Target0 = u_xlat16_0 + u_xlat16_1;
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
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	float _Threshold;
uniform 	float _Two_Threshold;
uniform 	vec3 _Curve;
uniform 	vec3 _TwoCurve;
uniform 	float _One_Intensity;
uniform 	float _Two_Intensity;
uniform 	mediump float _One_IsInterleave;
uniform 	mediump float _Two_IsInterleave;
uniform 	mediump vec4 _One_Color;
uniform 	mediump vec4 _Two_Color;
uniform lowp sampler2D _BloomTex0;
uniform lowp sampler2D _SourceTex;
uniform lowp sampler2D _BloomTex1;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec4 u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec2 u_xlatb8;
float u_xlat9;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = min(u_xlat10_1.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat10_1.xyz = texture2D(_BloomTex0, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_BloomTex1, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = min(u_xlat10_0.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_4.xyz = min(u_xlat10_1.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_5.xyz = max(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_6.xyz = min(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.100000001, 0.0), u_xlat16_5.xyzx).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlatb8.xy = equal(vec4(_One_IsInterleave, _Two_IsInterleave, _One_IsInterleave, _One_IsInterleave), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat0.x = (u_xlatb8.x) ? u_xlat0.x : 1.0;
    u_xlat1.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_4.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_26 = max(u_xlat0.w, u_xlat0.y);
    u_xlat16_26 = max(u_xlat0.x, u_xlat16_26);
    u_xlat1.x = u_xlat16_26 + (-_Curve.xxyz.y);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = min(u_xlat1.x, _Curve.xxyz.z);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _Curve.xxyz.w;
    u_xlat9 = u_xlat16_26 + (-_Threshold);
    u_xlat16_26 = max(u_xlat16_26, 9.99999975e-05);
    u_xlat1.x = max(u_xlat9, u_xlat1.x);
    u_xlat1.x = u_xlat1.x / u_xlat16_26;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat1.xyz = vec3(_One_Intensity) * _One_Color.xyz;
    u_xlat16_1.xyz = u_xlat0.xyw * u_xlat1.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_2.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xyz = (-u_xlat16_2.xyz) + u_xlat16_4.xyz;
    u_xlatb0.xyw = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.0, 0.100000001), u_xlat16_2.xyxz).xyw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.w * u_xlat0.x;
    u_xlat0.x = (u_xlatb8.y) ? u_xlat0.x : 1.0;
    u_xlat8.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat16_3.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16_2.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_2.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat24 = u_xlat16_2.x + (-_TwoCurve.x);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat24 = min(u_xlat24, _TwoCurve.y);
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * _TwoCurve.z;
    u_xlat7.x = u_xlat16_2.x + (-_Two_Threshold);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat24 = max(u_xlat24, u_xlat7.x);
    u_xlat24 = u_xlat24 / u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat7.xyz = vec3(vec3(_Two_Intensity, _Two_Intensity, _Two_Intensity)) * _Two_Color.xyz;
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat16_1.w = 0.0;
    u_xlat16_0.w = 0.0;
    SV_Target0 = u_xlat16_0 + u_xlat16_1;
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
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	float _Threshold;
uniform 	float _Two_Threshold;
uniform 	vec3 _Curve;
uniform 	vec3 _TwoCurve;
uniform 	float _One_Intensity;
uniform 	float _Two_Intensity;
uniform 	mediump float _One_IsInterleave;
uniform 	mediump float _Two_IsInterleave;
uniform 	mediump vec4 _One_Color;
uniform 	mediump vec4 _Two_Color;
uniform lowp sampler2D _BloomTex0;
uniform lowp sampler2D _SourceTex;
uniform lowp sampler2D _BloomTex1;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
bvec4 u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bvec2 u_xlatb8;
float u_xlat9;
float u_xlat24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(vec2(_PrefilterOffs, _PrefilterOffs)) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2D(_SourceTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = min(u_xlat10_1.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat10_1.xyz = texture2D(_BloomTex0, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_BloomTex1, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = min(u_xlat10_0.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_4.xyz = min(u_xlat10_1.xyz, vec3(65504.0, 65504.0, 65504.0));
    u_xlat16_5.xyz = max(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_6.xyz = min(u_xlat16_2.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz + (-u_xlat16_6.xyz);
    u_xlatb0.xyz = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.100000001, 0.0), u_xlat16_5.xyzx).xyz;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.z * u_xlat0.x;
    u_xlatb8.xy = equal(vec4(_One_IsInterleave, _Two_IsInterleave, _One_IsInterleave, _One_IsInterleave), vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlat0.x = (u_xlatb8.x) ? u_xlat0.x : 1.0;
    u_xlat1.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_4.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_4.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_26 = max(u_xlat0.w, u_xlat0.y);
    u_xlat16_26 = max(u_xlat0.x, u_xlat16_26);
    u_xlat1.x = u_xlat16_26 + (-_Curve.xxyz.y);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = min(u_xlat1.x, _Curve.xxyz.z);
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _Curve.xxyz.w;
    u_xlat9 = u_xlat16_26 + (-_Threshold);
    u_xlat16_26 = max(u_xlat16_26, 9.99999975e-05);
    u_xlat1.x = max(u_xlat9, u_xlat1.x);
    u_xlat1.x = u_xlat1.x / u_xlat16_26;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat1.xyz = vec3(_One_Intensity) * _One_Color.xyz;
    u_xlat16_1.xyz = u_xlat0.xyw * u_xlat1.xyz;
    u_xlat16_1.xyz = clamp(u_xlat16_1.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_2.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, u_xlat16_3.xyz);
    u_xlat16_2.xyz = (-u_xlat16_2.xyz) + u_xlat16_4.xyz;
    u_xlatb0.xyw = greaterThanEqual(vec4(0.100000001, 0.100000001, 0.0, 0.100000001), u_xlat16_2.xyxz).xyw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat0.x = u_xlat0.w * u_xlat0.x;
    u_xlat0.x = (u_xlatb8.y) ? u_xlat0.x : 1.0;
    u_xlat8.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat8.xyz = u_xlat16_3.xyz * u_xlat8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat8.xyz;
    u_xlat16_2.x = max(u_xlat0.z, u_xlat0.y);
    u_xlat16_2.x = max(u_xlat0.x, u_xlat16_2.x);
    u_xlat24 = u_xlat16_2.x + (-_TwoCurve.x);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat24 = min(u_xlat24, _TwoCurve.y);
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * _TwoCurve.z;
    u_xlat7.x = u_xlat16_2.x + (-_Two_Threshold);
    u_xlat16_2.x = max(u_xlat16_2.x, 9.99999975e-05);
    u_xlat24 = max(u_xlat24, u_xlat7.x);
    u_xlat24 = u_xlat24 / u_xlat16_2.x;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat7.xyz = vec3(vec3(_Two_Intensity, _Two_Intensity, _Two_Intensity)) * _Two_Color.xyz;
    u_xlat16_0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat16_1.w = 0.0;
    u_xlat16_0.w = 0.0;
    SV_Target0 = u_xlat16_0 + u_xlat16_1;
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