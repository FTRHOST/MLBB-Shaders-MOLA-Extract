//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/TextFlowLight" {
Properties {

_MainTex ("Alpha (A)", 2D) = "white" { }

_LGTex ("流光纹理", 2D) = "black" { }

_LGColor ("流光颜色", Color) = (1,1,1,1)

_LGIntensity ("流光强度", Float) = 1.0

_LG_U ("流光流速U", Float) = 0.0

_LG_V ("流光流速V", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
 Offset -1.0, -1.0
  GpuProgramID 31484
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat0.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat1.xz;
    u_xlat0.xy = u_xlat0.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_0.xyz = texture(_LGTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _LGColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LGIntensity) + vs_COLOR0.xyz;
    u_xlat16_2 = max(vs_COLOR0.y, vs_COLOR0.x);
    u_xlat16_2 = max(u_xlat16_2, vs_COLOR0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_2>=0.5);
#else
    u_xlatb9 = u_xlat16_2>=0.5;
#endif
    SV_Target0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : vs_COLOR0.xyz;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat0.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat1.xz;
    u_xlat0.xy = u_xlat0.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_0.xyz = texture(_LGTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _LGColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LGIntensity) + vs_COLOR0.xyz;
    u_xlat16_2 = max(vs_COLOR0.y, vs_COLOR0.x);
    u_xlat16_2 = max(u_xlat16_2, vs_COLOR0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat16_2>=0.5);
#else
    u_xlatb9 = u_xlat16_2>=0.5;
#endif
    SV_Target0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : vs_COLOR0.xyz;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
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
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LGTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
mediump float u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat0.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat1.xz;
    u_xlat0.xy = u_xlat0.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat10_0.xyz = texture2D(_LGTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _LGColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LGIntensity) + vs_COLOR0.xyz;
    u_xlat16_2 = max(vs_COLOR0.y, vs_COLOR0.x);
    u_xlat16_2 = max(u_xlat16_2, vs_COLOR0.z);
    u_xlatb9 = u_xlat16_2>=0.5;
    SV_Target0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : vs_COLOR0.xyz;
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    u_xlat10_0.x = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat10_0.x * vs_COLOR0.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LGTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
mediump float u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat0.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat1.xz;
    u_xlat0.xy = u_xlat0.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat10_0.xyz = texture2D(_LGTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _LGColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_LGIntensity) + vs_COLOR0.xyz;
    u_xlat16_2 = max(vs_COLOR0.y, vs_COLOR0.x);
    u_xlat16_2 = max(u_xlat16_2, vs_COLOR0.z);
    u_xlatb9 = u_xlat16_2>=0.5;
    SV_Target0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : vs_COLOR0.xyz;
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    u_xlat10_0.x = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat10_0.x * vs_COLOR0.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_OUTLINE_NEW" }
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3 = in_TEXCOORD3;
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
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
ivec2 u_xlati1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec4 u_xlat4;
bvec4 u_xlatb4;
bvec4 u_xlatb5;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
bvec2 u_xlatb7;
float u_xlat14;
ivec2 u_xlati14;
bool u_xlatb14;
bool u_xlatb21;
mediump float u_xlat16_23;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat1.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat7.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat7.x * u_xlat1.y;
    u_xlat7.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat1.xz;
    u_xlat7.xy = u_xlat7.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_7.xyz = texture(_LGTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = u_xlat16_7.xyz * _LGColor.xyz;
    u_xlat16_2.x = max(vs_COLOR0.y, vs_COLOR0.x);
    u_xlat16_2.x = max(u_xlat16_2.x, vs_COLOR0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_2.x>=0.5);
#else
    u_xlatb1.x = u_xlat16_2.x>=0.5;
#endif
    u_xlat7.xyz = u_xlat7.xyz * vec3(_LGIntensity) + vs_COLOR0.xyz;
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat7.xyz : vs_COLOR0.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.xy;
    u_xlat7.xy = u_xlat7.xy * vs_TEXCOORD2.zw;
    u_xlatb1.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyxx).xy;
    u_xlatb21 = u_xlatb1.y || u_xlatb1.x;
    u_xlatb7.xy = greaterThanEqual(u_xlat7.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.x || u_xlatb21;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    u_xlat16_23 = (u_xlatb7.x) ? 0.0 : u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(0.0<vs_TEXCOORD3.w);
#else
    u_xlatb7.x = 0.0<vs_TEXCOORD3.w;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat16_23!=1.0);
#else
    u_xlatb14 = u_xlat16_23!=1.0;
#endif
    u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat1 = vs_TEXCOORD3.wwww * _MainTex_TexelSize.xyxy;
        u_xlat3 = u_xlat1.zwzw * vec4(-0.707099974, -0.707099974, -0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat7.x = texture(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati14.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb5.w) * 0xffffffffu) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati14.xy = ivec2(uvec2(uint(u_xlati14.x) | (uint(u_xlatb4.x) * 0xffffffffu), uint(u_xlati14.y) | (uint(u_xlatb4.z) * 0xffffffffu)));
        u_xlati14.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | uint(u_xlati14.x), (uint(u_xlatb4.w) * 0xffffffffu) | uint(u_xlati14.y)));
        u_xlat7.x = (u_xlati14.x != 0) ? 0.0 : u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat3.zw).w;
        u_xlat14 = (u_xlati14.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat3 = u_xlat1.zwzw * vec4(0.707099974, -0.707099974, 0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati3.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb5.w) * 0xffffffffu) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati3.xy = ivec2(uvec2(uint(u_xlati3.x) | (uint(u_xlatb4.x) * 0xffffffffu), uint(u_xlati3.y) | (uint(u_xlatb4.z) * 0xffffffffu)));
        u_xlati3.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | uint(u_xlati3.x), (uint(u_xlatb4.w) * 0xffffffffu) | uint(u_xlati3.y)));
        u_xlat14 = (u_xlati3.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat3.zw).w;
        u_xlat14 = (u_xlati3.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat1 = u_xlat1 * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = u_xlat1 + vs_TEXCOORD2.xyxy;
        u_xlat3 = u_xlat3 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture(_MainTex, u_xlat1.xy).w;
        u_xlatb4 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3);
        u_xlati1.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | (uint(u_xlatb4.x) * 0xffffffffu), (uint(u_xlatb4.w) * 0xffffffffu) | (uint(u_xlatb4.z) * 0xffffffffu)));
        u_xlatb3 = greaterThanEqual(u_xlat3, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati1.xy = ivec2(uvec2(uint(u_xlati1.x) | (uint(u_xlatb3.x) * 0xffffffffu), uint(u_xlati1.y) | (uint(u_xlatb3.z) * 0xffffffffu)));
        u_xlati1.xy = ivec2(uvec2((uint(u_xlatb3.y) * 0xffffffffu) | uint(u_xlati1.x), (uint(u_xlatb3.w) * 0xffffffffu) | uint(u_xlati1.y)));
        u_xlat14 = (u_xlati1.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat3.yz = vs_TEXCOORD3.ww;
        u_xlat3.x = float(1.0);
        u_xlat3.w = float(0.0);
        u_xlat4 = u_xlat3.yxxy * _MainTex_TexelSize.xyxy;
        u_xlat3 = u_xlat4 * u_xlat3.wzzw + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati3.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb5.w) * 0xffffffffu) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati3.xy = ivec2(uvec2(uint(u_xlati3.x) | (uint(u_xlatb4.x) * 0xffffffffu), uint(u_xlati3.y) | (uint(u_xlatb4.z) * 0xffffffffu)));
        u_xlati3.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | uint(u_xlati3.x), (uint(u_xlatb4.w) * 0xffffffffu) | uint(u_xlati3.y)));
        u_xlat14 = (u_xlati3.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat1.zw).w;
        u_xlat14 = (u_xlati1.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat3.zw).w;
        u_xlat14 = (u_xlati3.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat7.x = min(u_xlat7.x, 1.0);
        u_xlat7.x = u_xlat7.x * 0.5;
        u_xlat16_7.x = u_xlat7.x;
    } else {
        u_xlat16_7.x = vs_TEXCOORD3.w;
    }
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-vs_TEXCOORD3.xyz);
    u_xlat16_6 = (-u_xlat16_7.x) + u_xlat0;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_23 * u_xlat16_6 + u_xlat16_7.x;
    SV_Target0.w = u_xlat16_2.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_OUTLINE_NEW" }
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3 = in_TEXCOORD3;
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
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec4 u_xlat1;
ivec2 u_xlati1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec4 u_xlat4;
bvec4 u_xlatb4;
bvec4 u_xlatb5;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_7;
bvec2 u_xlatb7;
float u_xlat14;
ivec2 u_xlati14;
bool u_xlatb14;
bool u_xlatb21;
mediump float u_xlat16_23;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat1.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat7.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat7.x * u_xlat1.y;
    u_xlat7.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat1.xz;
    u_xlat7.xy = u_xlat7.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat16_7.xyz = texture(_LGTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = u_xlat16_7.xyz * _LGColor.xyz;
    u_xlat16_2.x = max(vs_COLOR0.y, vs_COLOR0.x);
    u_xlat16_2.x = max(u_xlat16_2.x, vs_COLOR0.z);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_2.x>=0.5);
#else
    u_xlatb1.x = u_xlat16_2.x>=0.5;
#endif
    u_xlat7.xyz = u_xlat7.xyz * vec3(_LGIntensity) + vs_COLOR0.xyz;
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat7.xyz : vs_COLOR0.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.xy;
    u_xlat7.xy = u_xlat7.xy * vs_TEXCOORD2.zw;
    u_xlatb1.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyxx).xy;
    u_xlatb21 = u_xlatb1.y || u_xlatb1.x;
    u_xlatb7.xy = greaterThanEqual(u_xlat7.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.x || u_xlatb21;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    u_xlat16_23 = (u_xlatb7.x) ? 0.0 : u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(0.0<vs_TEXCOORD3.w);
#else
    u_xlatb7.x = 0.0<vs_TEXCOORD3.w;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat16_23!=1.0);
#else
    u_xlatb14 = u_xlat16_23!=1.0;
#endif
    u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat1 = vs_TEXCOORD3.wwww * _MainTex_TexelSize.xyxy;
        u_xlat3 = u_xlat1.zwzw * vec4(-0.707099974, -0.707099974, -0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat7.x = texture(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati14.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb5.w) * 0xffffffffu) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati14.xy = ivec2(uvec2(uint(u_xlati14.x) | (uint(u_xlatb4.x) * 0xffffffffu), uint(u_xlati14.y) | (uint(u_xlatb4.z) * 0xffffffffu)));
        u_xlati14.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | uint(u_xlati14.x), (uint(u_xlatb4.w) * 0xffffffffu) | uint(u_xlati14.y)));
        u_xlat7.x = (u_xlati14.x != 0) ? 0.0 : u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat3.zw).w;
        u_xlat14 = (u_xlati14.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat3 = u_xlat1.zwzw * vec4(0.707099974, -0.707099974, 0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati3.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb5.w) * 0xffffffffu) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati3.xy = ivec2(uvec2(uint(u_xlati3.x) | (uint(u_xlatb4.x) * 0xffffffffu), uint(u_xlati3.y) | (uint(u_xlatb4.z) * 0xffffffffu)));
        u_xlati3.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | uint(u_xlati3.x), (uint(u_xlatb4.w) * 0xffffffffu) | uint(u_xlati3.y)));
        u_xlat14 = (u_xlati3.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat3.zw).w;
        u_xlat14 = (u_xlati3.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat1 = u_xlat1 * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = u_xlat1 + vs_TEXCOORD2.xyxy;
        u_xlat3 = u_xlat3 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture(_MainTex, u_xlat1.xy).w;
        u_xlatb4 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3);
        u_xlati1.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | (uint(u_xlatb4.x) * 0xffffffffu), (uint(u_xlatb4.w) * 0xffffffffu) | (uint(u_xlatb4.z) * 0xffffffffu)));
        u_xlatb3 = greaterThanEqual(u_xlat3, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati1.xy = ivec2(uvec2(uint(u_xlati1.x) | (uint(u_xlatb3.x) * 0xffffffffu), uint(u_xlati1.y) | (uint(u_xlatb3.z) * 0xffffffffu)));
        u_xlati1.xy = ivec2(uvec2((uint(u_xlatb3.y) * 0xffffffffu) | uint(u_xlati1.x), (uint(u_xlatb3.w) * 0xffffffffu) | uint(u_xlati1.y)));
        u_xlat14 = (u_xlati1.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat3.yz = vs_TEXCOORD3.ww;
        u_xlat3.x = float(1.0);
        u_xlat3.w = float(0.0);
        u_xlat4 = u_xlat3.yxxy * _MainTex_TexelSize.xyxy;
        u_xlat3 = u_xlat4 * u_xlat3.wzzw + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati3.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb5.w) * 0xffffffffu) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati3.xy = ivec2(uvec2(uint(u_xlati3.x) | (uint(u_xlatb4.x) * 0xffffffffu), uint(u_xlati3.y) | (uint(u_xlatb4.z) * 0xffffffffu)));
        u_xlati3.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | uint(u_xlati3.x), (uint(u_xlatb4.w) * 0xffffffffu) | uint(u_xlati3.y)));
        u_xlat14 = (u_xlati3.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat1.zw).w;
        u_xlat14 = (u_xlati1.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat3.zw).w;
        u_xlat14 = (u_xlati3.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat7.x = min(u_xlat7.x, 1.0);
        u_xlat7.x = u_xlat7.x * 0.5;
        u_xlat16_7.x = u_xlat7.x;
    } else {
        u_xlat16_7.x = vs_TEXCOORD3.w;
    }
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-vs_TEXCOORD3.xyz);
    u_xlat16_6 = (-u_xlat16_7.x) + u_xlat0;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.xyz = min(max(SV_Target0.xyz, 0.0), 1.0);
#else
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_23 * u_xlat16_6 + u_xlat16_7.x;
    SV_Target0.w = u_xlat16_2.x * vs_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_OUTLINE_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3 = in_TEXCOORD3;
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
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LGTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
ivec2 u_xlati1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec4 u_xlat4;
bvec4 u_xlatb4;
bvec4 u_xlatb5;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
lowp vec3 u_xlat10_7;
bvec2 u_xlatb7;
float u_xlat14;
ivec2 u_xlati14;
bool u_xlatb14;
bool u_xlatb21;
mediump float u_xlat16_23;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat1.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat7.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat7.x * u_xlat1.y;
    u_xlat7.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat1.xz;
    u_xlat7.xy = u_xlat7.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat10_7.xyz = texture2D(_LGTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = u_xlat10_7.xyz * _LGColor.xyz;
    u_xlat16_2.x = max(vs_COLOR0.y, vs_COLOR0.x);
    u_xlat16_2.x = max(u_xlat16_2.x, vs_COLOR0.z);
    u_xlatb1.x = u_xlat16_2.x>=0.5;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_LGIntensity) + vs_COLOR0.xyz;
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat7.xyz : vs_COLOR0.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.xy;
    u_xlat7.xy = u_xlat7.xy * vs_TEXCOORD2.zw;
    u_xlatb1.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyxx).xy;
    u_xlatb21 = u_xlatb1.y || u_xlatb1.x;
    u_xlatb7.xy = greaterThanEqual(u_xlat7.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.x || u_xlatb21;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    u_xlat16_23 = (u_xlatb7.x) ? 0.0 : u_xlat0;
    u_xlatb7.x = 0.0<vs_TEXCOORD3.w;
    u_xlatb14 = u_xlat16_23!=1.0;
    u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat1 = vs_TEXCOORD3.wwww * _MainTex_TexelSize.xyxy;
        u_xlat3 = u_xlat1.zwzw * vec4(-0.707099974, -0.707099974, -0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat7.x = texture2D(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati14.xy = op_or((ivec2(u_xlatb5.yw) * -1), (ivec2(u_xlatb5.xz) * -1));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati14.xy = op_or(u_xlati14.xy, (ivec2(u_xlatb4.xz) * -1));
        u_xlati14.xy = op_or((ivec2(u_xlatb4.yw) * -1), u_xlati14.xy);
        u_xlat7.x = (u_xlati14.x != 0) ? 0.0 : u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat3.zw).w;
        u_xlat14 = (u_xlati14.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat3 = u_xlat1.zwzw * vec4(0.707099974, -0.707099974, 0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture2D(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati3.xy = op_or((ivec2(u_xlatb5.yw) * -1), (ivec2(u_xlatb5.xz) * -1));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati3.xy = op_or(u_xlati3.xy, (ivec2(u_xlatb4.xz) * -1));
        u_xlati3.xy = op_or((ivec2(u_xlatb4.yw) * -1), u_xlati3.xy);
        u_xlat14 = (u_xlati3.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat3.zw).w;
        u_xlat14 = (u_xlati3.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat1 = u_xlat1 * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = u_xlat1 + vs_TEXCOORD2.xyxy;
        u_xlat3 = u_xlat3 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture2D(_MainTex, u_xlat1.xy).w;
        u_xlatb4 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3);
        u_xlati1.xy = op_or((ivec2(u_xlatb4.yw) * -1), (ivec2(u_xlatb4.xz) * -1));
        u_xlatb3 = greaterThanEqual(u_xlat3, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati1.xy = op_or(u_xlati1.xy, (ivec2(u_xlatb3.xz) * -1));
        u_xlati1.xy = op_or((ivec2(u_xlatb3.yw) * -1), u_xlati1.xy);
        u_xlat14 = (u_xlati1.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat3.yz = vs_TEXCOORD3.ww;
        u_xlat3.x = float(1.0);
        u_xlat3.w = float(0.0);
        u_xlat4 = u_xlat3.yxxy * _MainTex_TexelSize.xyxy;
        u_xlat3 = u_xlat4 * u_xlat3.wzzw + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture2D(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati3.xy = op_or((ivec2(u_xlatb5.yw) * -1), (ivec2(u_xlatb5.xz) * -1));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati3.xy = op_or(u_xlati3.xy, (ivec2(u_xlatb4.xz) * -1));
        u_xlati3.xy = op_or((ivec2(u_xlatb4.yw) * -1), u_xlati3.xy);
        u_xlat14 = (u_xlati3.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat1.zw).w;
        u_xlat14 = (u_xlati1.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat3.zw).w;
        u_xlat14 = (u_xlati3.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat7.x = min(u_xlat7.x, 1.0);
        u_xlat7.x = u_xlat7.x * 0.5;
        u_xlat16_7 = u_xlat7.x;
    } else {
        u_xlat16_7 = vs_TEXCOORD3.w;
    }
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-vs_TEXCOORD3.xyz);
    u_xlat16_6 = (-u_xlat16_7) + u_xlat0;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    u_xlat16_2.x = u_xlat16_23 * u_xlat16_6 + u_xlat16_7;
    SV_Target0.w = u_xlat16_2.x * vs_COLOR0.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_OUTLINE_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3 = in_TEXCOORD3;
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
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _LGTex_ST;
uniform 	mediump float _LGIntensity;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LGTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec4 u_xlat1;
ivec2 u_xlati1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
ivec2 u_xlati3;
bvec4 u_xlatb3;
vec4 u_xlat4;
bvec4 u_xlatb4;
bvec4 u_xlatb5;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump float u_xlat16_7;
lowp vec3 u_xlat10_7;
bvec2 u_xlatb7;
float u_xlat14;
ivec2 u_xlati14;
bool u_xlatb14;
bool u_xlatb21;
mediump float u_xlat16_23;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat1.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat7.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat7.x * u_xlat1.y;
    u_xlat7.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat1.xz;
    u_xlat7.xy = u_xlat7.xy * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat10_7.xyz = texture2D(_LGTex, u_xlat7.xy).xyz;
    u_xlat7.xyz = u_xlat10_7.xyz * _LGColor.xyz;
    u_xlat16_2.x = max(vs_COLOR0.y, vs_COLOR0.x);
    u_xlat16_2.x = max(u_xlat16_2.x, vs_COLOR0.z);
    u_xlatb1.x = u_xlat16_2.x>=0.5;
    u_xlat7.xyz = u_xlat7.xyz * vec3(_LGIntensity) + vs_COLOR0.xyz;
    u_xlat16_2.xyz = (u_xlatb1.x) ? u_xlat7.xyz : vs_COLOR0.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.xy;
    u_xlat7.xy = u_xlat7.xy * vs_TEXCOORD2.zw;
    u_xlatb1.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyxx).xy;
    u_xlatb21 = u_xlatb1.y || u_xlatb1.x;
    u_xlatb7.xy = greaterThanEqual(u_xlat7.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.x || u_xlatb21;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    u_xlat16_23 = (u_xlatb7.x) ? 0.0 : u_xlat0;
    u_xlatb7.x = 0.0<vs_TEXCOORD3.w;
    u_xlatb14 = u_xlat16_23!=1.0;
    u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat1 = vs_TEXCOORD3.wwww * _MainTex_TexelSize.xyxy;
        u_xlat3 = u_xlat1.zwzw * vec4(-0.707099974, -0.707099974, -0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat7.x = texture2D(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati14.xy = op_or((ivec2(u_xlatb5.yw) * -1), (ivec2(u_xlatb5.xz) * -1));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati14.xy = op_or(u_xlati14.xy, (ivec2(u_xlatb4.xz) * -1));
        u_xlati14.xy = op_or((ivec2(u_xlatb4.yw) * -1), u_xlati14.xy);
        u_xlat7.x = (u_xlati14.x != 0) ? 0.0 : u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat3.zw).w;
        u_xlat14 = (u_xlati14.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat3 = u_xlat1.zwzw * vec4(0.707099974, -0.707099974, 0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture2D(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati3.xy = op_or((ivec2(u_xlatb5.yw) * -1), (ivec2(u_xlatb5.xz) * -1));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati3.xy = op_or(u_xlati3.xy, (ivec2(u_xlatb4.xz) * -1));
        u_xlati3.xy = op_or((ivec2(u_xlatb4.yw) * -1), u_xlati3.xy);
        u_xlat14 = (u_xlati3.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat3.zw).w;
        u_xlat14 = (u_xlati3.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat1 = u_xlat1 * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
        u_xlat3 = u_xlat1 + vs_TEXCOORD2.xyxy;
        u_xlat3 = u_xlat3 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture2D(_MainTex, u_xlat1.xy).w;
        u_xlatb4 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat3);
        u_xlati1.xy = op_or((ivec2(u_xlatb4.yw) * -1), (ivec2(u_xlatb4.xz) * -1));
        u_xlatb3 = greaterThanEqual(u_xlat3, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati1.xy = op_or(u_xlati1.xy, (ivec2(u_xlatb3.xz) * -1));
        u_xlati1.xy = op_or((ivec2(u_xlatb3.yw) * -1), u_xlati1.xy);
        u_xlat14 = (u_xlati1.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat3.yz = vs_TEXCOORD3.ww;
        u_xlat3.x = float(1.0);
        u_xlat3.w = float(0.0);
        u_xlat4 = u_xlat3.yxxy * _MainTex_TexelSize.xyxy;
        u_xlat3 = u_xlat4 * u_xlat3.wzzw + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture2D(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati3.xy = op_or((ivec2(u_xlatb5.yw) * -1), (ivec2(u_xlatb5.xz) * -1));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati3.xy = op_or(u_xlati3.xy, (ivec2(u_xlatb4.xz) * -1));
        u_xlati3.xy = op_or((ivec2(u_xlatb4.yw) * -1), u_xlati3.xy);
        u_xlat14 = (u_xlati3.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat1.zw).w;
        u_xlat14 = (u_xlati1.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat3.zw).w;
        u_xlat14 = (u_xlati3.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat7.x = min(u_xlat7.x, 1.0);
        u_xlat7.x = u_xlat7.x * 0.5;
        u_xlat16_7 = u_xlat7.x;
    } else {
        u_xlat16_7 = vs_TEXCOORD3.w;
    }
    u_xlat16_2.xyz = u_xlat16_2.xyz + (-vs_TEXCOORD3.xyz);
    u_xlat16_6 = (-u_xlat16_7) + u_xlat0;
    SV_Target0.xyz = vec3(u_xlat16_23) * u_xlat16_2.xyz + vs_TEXCOORD3.xyz;
    SV_Target0.xyz = clamp(SV_Target0.xyz, 0.0, 1.0);
    u_xlat16_2.x = u_xlat16_23 * u_xlat16_6 + u_xlat16_7;
    SV_Target0.w = u_xlat16_2.x * vs_COLOR0.w;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
Local Keywords { "_OUTLINE_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_OUTLINE_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_OUTLINE_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_OUTLINE_NEW" }
""
}
}
}
}
}