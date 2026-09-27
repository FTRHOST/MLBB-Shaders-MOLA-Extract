//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Unlit/TextFlowLight 2" {
Properties {

_MainTex ("Alpha (A)", 2D) = "white" { }

_LGTex ("流光纹理", 2D) = "black" { }

_LGColor ("流光颜色", Color) = (1,1,1,1)

_LG_U ("流光流速U", Float) = 0.0

_LG_V ("流光流速V", Float) = 0.0

}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
 Offset -1.0, -1.0
  GpuProgramID 55856
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
uniform 	vec4 _ClipRange0;
uniform 	vec4 _ClipRange1;
uniform 	vec4 _ClipArgs1;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    u_xlat0.x = in_POSITION0.y * _ClipArgs1.z;
    u_xlat4.x = in_POSITION0.x * _ClipArgs1.w + (-u_xlat0.x);
    u_xlat4.y = dot(in_POSITION0.xy, _ClipArgs1.zw);
    vs_TEXCOORD4.zw = u_xlat4.xy * _ClipRange1.zw + _ClipRange1.xy;
    vs_TEXCOORD4.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
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
uniform 	vec4 _ClipArgs0;
uniform 	vec4 _ClipArgs1;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
uniform 	mediump vec4 _LGTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = -abs(vs_TEXCOORD4) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.zw = u_xlat0.zw * _ClipArgs1.xy;
    u_xlat0.xz = min(u_xlat0.yw, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.z, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_4 * vs_COLOR0.w;
    u_xlat0.w = u_xlat0.x * u_xlat16_1;
    u_xlat2.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat3.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat3.x = u_xlat2.x * u_xlat3.y;
    u_xlat2.xy = u_xlat3.xz * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat2.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * _LGColor.xyz + vs_COLOR0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _ClipRange0;
uniform 	vec4 _ClipRange1;
uniform 	vec4 _ClipArgs1;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    u_xlat0.x = in_POSITION0.y * _ClipArgs1.z;
    u_xlat4.x = in_POSITION0.x * _ClipArgs1.w + (-u_xlat0.x);
    u_xlat4.y = dot(in_POSITION0.xy, _ClipArgs1.zw);
    vs_TEXCOORD4.zw = u_xlat4.xy * _ClipRange1.zw + _ClipRange1.xy;
    vs_TEXCOORD4.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
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
uniform 	vec4 _ClipArgs0;
uniform 	vec4 _ClipArgs1;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
uniform 	mediump vec4 _LGTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_4;
void main()
{
    u_xlat0 = -abs(vs_TEXCOORD4) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.zw = u_xlat0.zw * _ClipArgs1.xy;
    u_xlat0.xz = min(u_xlat0.yw, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.z, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_4 * vs_COLOR0.w;
    u_xlat0.w = u_xlat0.x * u_xlat16_1;
    u_xlat2.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat3.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat3.x = u_xlat2.x * u_xlat3.y;
    u_xlat2.xy = u_xlat3.xz * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat2.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat2.xy;
    u_xlat16_2.xyz = texture(_LGTex, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * _LGColor.xyz + vs_COLOR0.xyz;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _ClipRange0;
uniform 	vec4 _ClipRange1;
uniform 	vec4 _ClipArgs1;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    u_xlat0.x = in_POSITION0.y * _ClipArgs1.z;
    u_xlat4.x = in_POSITION0.x * _ClipArgs1.w + (-u_xlat0.x);
    u_xlat4.y = dot(in_POSITION0.xy, _ClipArgs1.zw);
    vs_TEXCOORD4.zw = u_xlat4.xy * _ClipRange1.zw + _ClipRange1.xy;
    vs_TEXCOORD4.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
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
uniform 	vec4 _ClipArgs0;
uniform 	vec4 _ClipArgs1;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
uniform 	mediump vec4 _LGTex_ST;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LGTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp float u_xlat10_4;
void main()
{
    u_xlat0 = -abs(vs_TEXCOORD4) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.zw = u_xlat0.zw * _ClipArgs1.xy;
    u_xlat0.xz = min(u_xlat0.yw, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.z, u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat10_4 * vs_COLOR0.w;
    u_xlat0.w = u_xlat0.x * u_xlat16_1;
    u_xlat2.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat3.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat3.x = u_xlat2.x * u_xlat3.y;
    u_xlat2.xy = u_xlat3.xz * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat2.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat2.xy;
    u_xlat10_2.xyz = texture2D(_LGTex, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat10_2.xyz * _LGColor.xyz + vs_COLOR0.xyz;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _ClipRange0;
uniform 	vec4 _ClipRange1;
uniform 	vec4 _ClipArgs1;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    u_xlat0.x = in_POSITION0.y * _ClipArgs1.z;
    u_xlat4.x = in_POSITION0.x * _ClipArgs1.w + (-u_xlat0.x);
    u_xlat4.y = dot(in_POSITION0.xy, _ClipArgs1.zw);
    vs_TEXCOORD4.zw = u_xlat4.xy * _ClipRange1.zw + _ClipRange1.xy;
    vs_TEXCOORD4.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
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
uniform 	vec4 _ClipArgs0;
uniform 	vec4 _ClipArgs1;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
uniform 	mediump vec4 _LGTex_ST;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LGTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
lowp float u_xlat10_4;
void main()
{
    u_xlat0 = -abs(vs_TEXCOORD4) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.zw = u_xlat0.zw * _ClipArgs1.xy;
    u_xlat0.xz = min(u_xlat0.yw, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.z, u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat10_4 * vs_COLOR0.w;
    u_xlat0.w = u_xlat0.x * u_xlat16_1;
    u_xlat2.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat3.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat3.x = u_xlat2.x * u_xlat3.y;
    u_xlat2.xy = u_xlat3.xz * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat2.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat2.xy;
    u_xlat10_2.xyz = texture2D(_LGTex, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat10_2.xyz * _LGColor.xyz + vs_COLOR0.xyz;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _ClipRange0;
uniform 	vec4 _ClipRange1;
uniform 	vec4 _ClipArgs1;
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
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    u_xlat0.x = in_POSITION0.y * _ClipArgs1.z;
    u_xlat4.x = in_POSITION0.x * _ClipArgs1.w + (-u_xlat0.x);
    u_xlat4.y = dot(in_POSITION0.xy, _ClipArgs1.zw);
    vs_TEXCOORD4.zw = u_xlat4.xy * _ClipRange1.zw + _ClipRange1.xy;
    vs_TEXCOORD4.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
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
uniform 	vec4 _ClipArgs0;
uniform 	vec4 _ClipArgs1;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
uniform 	mediump vec4 _LGTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec2 u_xlati2;
bvec2 u_xlatb2;
mediump float u_xlat16_3;
vec4 u_xlat4;
ivec2 u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
bvec4 u_xlatb5;
bvec4 u_xlatb6;
vec2 u_xlat7;
mediump vec3 u_xlat16_7;
bvec2 u_xlatb7;
float u_xlat14;
ivec2 u_xlati14;
bool u_xlatb14;
bool u_xlatb21;
void main()
{
    u_xlat0 = -abs(vs_TEXCOORD4) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat7.xy = u_xlat0.zw * _ClipArgs1.xy;
    u_xlat7.x = min(u_xlat7.y, u_xlat7.x);
    u_xlat0.x = min(u_xlat7.x, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat2.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat7.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat2.x = u_xlat7.x * u_xlat2.y;
    u_xlat7.xy = u_xlat2.xz * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat7.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat7.xy;
    u_xlat16_7.xyz = texture(_LGTex, u_xlat7.xy).xyz;
    u_xlat1.xyz = u_xlat16_7.xyz * _LGColor.xyz + vs_COLOR0.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.xy;
    u_xlat7.xy = u_xlat7.xy * vs_TEXCOORD2.zw;
    u_xlatb2.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyxx).xy;
    u_xlatb21 = u_xlatb2.y || u_xlatb2.x;
    u_xlatb7.xy = greaterThanEqual(u_xlat7.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.x || u_xlatb21;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    u_xlat16_3 = (u_xlatb7.x) ? 0.0 : u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(0.0<vs_TEXCOORD3.w);
#else
    u_xlatb7.x = 0.0<vs_TEXCOORD3.w;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat16_3!=1.0);
#else
    u_xlatb14 = u_xlat16_3!=1.0;
#endif
    u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat2 = vs_TEXCOORD3.wwww * _MainTex_TexelSize.xyxy;
        u_xlat4 = u_xlat2.zwzw * vec4(-0.707099974, -0.707099974, -0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat7.x = texture(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati14.xy = ivec2(uvec2((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu), (uint(u_xlatb6.w) * 0xffffffffu) | (uint(u_xlatb6.z) * 0xffffffffu)));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati14.xy = ivec2(uvec2(uint(u_xlati14.x) | (uint(u_xlatb5.x) * 0xffffffffu), uint(u_xlati14.y) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlati14.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | uint(u_xlati14.x), (uint(u_xlatb5.w) * 0xffffffffu) | uint(u_xlati14.y)));
        u_xlat7.x = (u_xlati14.x != 0) ? 0.0 : u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat4.zw).w;
        u_xlat14 = (u_xlati14.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat4 = u_xlat2.zwzw * vec4(0.707099974, -0.707099974, 0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati4.xy = ivec2(uvec2((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu), (uint(u_xlatb6.w) * 0xffffffffu) | (uint(u_xlatb6.z) * 0xffffffffu)));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati4.xy = ivec2(uvec2(uint(u_xlati4.x) | (uint(u_xlatb5.x) * 0xffffffffu), uint(u_xlati4.y) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlati4.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | uint(u_xlati4.x), (uint(u_xlatb5.w) * 0xffffffffu) | uint(u_xlati4.y)));
        u_xlat14 = (u_xlati4.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat4.zw).w;
        u_xlat14 = (u_xlati4.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat2 = u_xlat2 * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat2 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture(_MainTex, u_xlat2.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati2.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb5.w) * 0xffffffffu) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati2.xy = ivec2(uvec2(uint(u_xlati2.x) | (uint(u_xlatb4.x) * 0xffffffffu), uint(u_xlati2.y) | (uint(u_xlatb4.z) * 0xffffffffu)));
        u_xlati2.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | uint(u_xlati2.x), (uint(u_xlatb4.w) * 0xffffffffu) | uint(u_xlati2.y)));
        u_xlat14 = (u_xlati2.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat4.yz = vs_TEXCOORD3.ww;
        u_xlat4.x = float(1.0);
        u_xlat4.w = float(0.0);
        u_xlat5 = u_xlat4.yxxy * _MainTex_TexelSize.xyxy;
        u_xlat4 = u_xlat5 * u_xlat4.wzzw + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati4.xy = ivec2(uvec2((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu), (uint(u_xlatb6.w) * 0xffffffffu) | (uint(u_xlatb6.z) * 0xffffffffu)));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati4.xy = ivec2(uvec2(uint(u_xlati4.x) | (uint(u_xlatb5.x) * 0xffffffffu), uint(u_xlati4.y) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlati4.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | uint(u_xlati4.x), (uint(u_xlatb5.w) * 0xffffffffu) | uint(u_xlati4.y)));
        u_xlat14 = (u_xlati4.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat2.zw).w;
        u_xlat14 = (u_xlati2.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat4.zw).w;
        u_xlat14 = (u_xlati4.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat7.x = min(u_xlat7.x, 1.0);
        u_xlat7.x = u_xlat7.x * 0.5;
        u_xlat16_7.x = u_xlat7.x;
    } else {
        u_xlat16_7.x = vs_TEXCOORD3.w;
    }
    u_xlat16_2.xyz = (-vs_TEXCOORD3.xyz);
    u_xlat16_2.w = (-u_xlat16_7.x);
    u_xlat16_1 = u_xlat1 + u_xlat16_2;
    SV_Target0.xyz = vec3(u_xlat16_3) * u_xlat16_1.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_1.w + u_xlat16_7.x;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0.w;
    u_xlat4.x = u_xlat0.x * u_xlat16_3;
    SV_Target0.w = u_xlat4.x;
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
uniform 	vec4 _ClipRange0;
uniform 	vec4 _ClipRange1;
uniform 	vec4 _ClipArgs1;
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
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    u_xlat0.x = in_POSITION0.y * _ClipArgs1.z;
    u_xlat4.x = in_POSITION0.x * _ClipArgs1.w + (-u_xlat0.x);
    u_xlat4.y = dot(in_POSITION0.xy, _ClipArgs1.zw);
    vs_TEXCOORD4.zw = u_xlat4.xy * _ClipRange1.zw + _ClipRange1.xy;
    vs_TEXCOORD4.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
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
uniform 	vec4 _ClipArgs0;
uniform 	vec4 _ClipArgs1;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
uniform 	mediump vec4 _LGTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LGTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec2 u_xlati2;
bvec2 u_xlatb2;
mediump float u_xlat16_3;
vec4 u_xlat4;
ivec2 u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
bvec4 u_xlatb5;
bvec4 u_xlatb6;
vec2 u_xlat7;
mediump vec3 u_xlat16_7;
bvec2 u_xlatb7;
float u_xlat14;
ivec2 u_xlati14;
bool u_xlatb14;
bool u_xlatb21;
void main()
{
    u_xlat0 = -abs(vs_TEXCOORD4) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat7.xy = u_xlat0.zw * _ClipArgs1.xy;
    u_xlat7.x = min(u_xlat7.y, u_xlat7.x);
    u_xlat0.x = min(u_xlat7.x, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1.w = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat2.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat7.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat2.x = u_xlat7.x * u_xlat2.y;
    u_xlat7.xy = u_xlat2.xz * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat7.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat7.xy;
    u_xlat16_7.xyz = texture(_LGTex, u_xlat7.xy).xyz;
    u_xlat1.xyz = u_xlat16_7.xyz * _LGColor.xyz + vs_COLOR0.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.xy;
    u_xlat7.xy = u_xlat7.xy * vs_TEXCOORD2.zw;
    u_xlatb2.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyxx).xy;
    u_xlatb21 = u_xlatb2.y || u_xlatb2.x;
    u_xlatb7.xy = greaterThanEqual(u_xlat7.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.x || u_xlatb21;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    u_xlat16_3 = (u_xlatb7.x) ? 0.0 : u_xlat1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7.x = !!(0.0<vs_TEXCOORD3.w);
#else
    u_xlatb7.x = 0.0<vs_TEXCOORD3.w;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat16_3!=1.0);
#else
    u_xlatb14 = u_xlat16_3!=1.0;
#endif
    u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat2 = vs_TEXCOORD3.wwww * _MainTex_TexelSize.xyxy;
        u_xlat4 = u_xlat2.zwzw * vec4(-0.707099974, -0.707099974, -0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat7.x = texture(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati14.xy = ivec2(uvec2((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu), (uint(u_xlatb6.w) * 0xffffffffu) | (uint(u_xlatb6.z) * 0xffffffffu)));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati14.xy = ivec2(uvec2(uint(u_xlati14.x) | (uint(u_xlatb5.x) * 0xffffffffu), uint(u_xlati14.y) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlati14.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | uint(u_xlati14.x), (uint(u_xlatb5.w) * 0xffffffffu) | uint(u_xlati14.y)));
        u_xlat7.x = (u_xlati14.x != 0) ? 0.0 : u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat4.zw).w;
        u_xlat14 = (u_xlati14.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat4 = u_xlat2.zwzw * vec4(0.707099974, -0.707099974, 0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati4.xy = ivec2(uvec2((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu), (uint(u_xlatb6.w) * 0xffffffffu) | (uint(u_xlatb6.z) * 0xffffffffu)));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati4.xy = ivec2(uvec2(uint(u_xlati4.x) | (uint(u_xlatb5.x) * 0xffffffffu), uint(u_xlati4.y) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlati4.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | uint(u_xlati4.x), (uint(u_xlatb5.w) * 0xffffffffu) | uint(u_xlati4.y)));
        u_xlat14 = (u_xlati4.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat4.zw).w;
        u_xlat14 = (u_xlati4.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat2 = u_xlat2 * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat2 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture(_MainTex, u_xlat2.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati2.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb5.w) * 0xffffffffu) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati2.xy = ivec2(uvec2(uint(u_xlati2.x) | (uint(u_xlatb4.x) * 0xffffffffu), uint(u_xlati2.y) | (uint(u_xlatb4.z) * 0xffffffffu)));
        u_xlati2.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | uint(u_xlati2.x), (uint(u_xlatb4.w) * 0xffffffffu) | uint(u_xlati2.y)));
        u_xlat14 = (u_xlati2.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat4.yz = vs_TEXCOORD3.ww;
        u_xlat4.x = float(1.0);
        u_xlat4.w = float(0.0);
        u_xlat5 = u_xlat4.yxxy * _MainTex_TexelSize.xyxy;
        u_xlat4 = u_xlat5 * u_xlat4.wzzw + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati4.xy = ivec2(uvec2((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu), (uint(u_xlatb6.w) * 0xffffffffu) | (uint(u_xlatb6.z) * 0xffffffffu)));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati4.xy = ivec2(uvec2(uint(u_xlati4.x) | (uint(u_xlatb5.x) * 0xffffffffu), uint(u_xlati4.y) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlati4.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | uint(u_xlati4.x), (uint(u_xlatb5.w) * 0xffffffffu) | uint(u_xlati4.y)));
        u_xlat14 = (u_xlati4.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat2.zw).w;
        u_xlat14 = (u_xlati2.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture(_MainTex, u_xlat4.zw).w;
        u_xlat14 = (u_xlati4.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat7.x = min(u_xlat7.x, 1.0);
        u_xlat7.x = u_xlat7.x * 0.5;
        u_xlat16_7.x = u_xlat7.x;
    } else {
        u_xlat16_7.x = vs_TEXCOORD3.w;
    }
    u_xlat16_2.xyz = (-vs_TEXCOORD3.xyz);
    u_xlat16_2.w = (-u_xlat16_7.x);
    u_xlat16_1 = u_xlat1 + u_xlat16_2;
    SV_Target0.xyz = vec3(u_xlat16_3) * u_xlat16_1.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_1.w + u_xlat16_7.x;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0.w;
    u_xlat4.x = u_xlat0.x * u_xlat16_3;
    SV_Target0.w = u_xlat4.x;
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
uniform 	vec4 _ClipRange0;
uniform 	vec4 _ClipRange1;
uniform 	vec4 _ClipArgs1;
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
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    u_xlat0.x = in_POSITION0.y * _ClipArgs1.z;
    u_xlat4.x = in_POSITION0.x * _ClipArgs1.w + (-u_xlat0.x);
    u_xlat4.y = dot(in_POSITION0.xy, _ClipArgs1.zw);
    vs_TEXCOORD4.zw = u_xlat4.xy * _ClipRange1.zw + _ClipRange1.xy;
    vs_TEXCOORD4.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
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
uniform 	vec4 _ClipArgs0;
uniform 	vec4 _ClipArgs1;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
uniform 	mediump vec4 _LGTex_ST;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LGTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec2 u_xlati2;
bvec2 u_xlatb2;
mediump float u_xlat16_3;
vec4 u_xlat4;
ivec2 u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
bvec4 u_xlatb5;
bvec4 u_xlatb6;
vec2 u_xlat7;
mediump float u_xlat16_7;
lowp vec3 u_xlat10_7;
bvec2 u_xlatb7;
float u_xlat14;
ivec2 u_xlati14;
bool u_xlatb14;
bool u_xlatb21;
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
    u_xlat0 = -abs(vs_TEXCOORD4) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat7.xy = u_xlat0.zw * _ClipArgs1.xy;
    u_xlat7.x = min(u_xlat7.y, u_xlat7.x);
    u_xlat0.x = min(u_xlat7.x, u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat2.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat7.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat2.x = u_xlat7.x * u_xlat2.y;
    u_xlat7.xy = u_xlat2.xz * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat7.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat7.xy;
    u_xlat10_7.xyz = texture2D(_LGTex, u_xlat7.xy).xyz;
    u_xlat1.xyz = u_xlat10_7.xyz * _LGColor.xyz + vs_COLOR0.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.xy;
    u_xlat7.xy = u_xlat7.xy * vs_TEXCOORD2.zw;
    u_xlatb2.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyxx).xy;
    u_xlatb21 = u_xlatb2.y || u_xlatb2.x;
    u_xlatb7.xy = greaterThanEqual(u_xlat7.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.x || u_xlatb21;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    u_xlat16_3 = (u_xlatb7.x) ? 0.0 : u_xlat1.w;
    u_xlatb7.x = 0.0<vs_TEXCOORD3.w;
    u_xlatb14 = u_xlat16_3!=1.0;
    u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat2 = vs_TEXCOORD3.wwww * _MainTex_TexelSize.xyxy;
        u_xlat4 = u_xlat2.zwzw * vec4(-0.707099974, -0.707099974, -0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat7.x = texture2D(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati14.xy = op_or((ivec2(u_xlatb6.yw) * -1), (ivec2(u_xlatb6.xz) * -1));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati14.xy = op_or(u_xlati14.xy, (ivec2(u_xlatb5.xz) * -1));
        u_xlati14.xy = op_or((ivec2(u_xlatb5.yw) * -1), u_xlati14.xy);
        u_xlat7.x = (u_xlati14.x != 0) ? 0.0 : u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat4.zw).w;
        u_xlat14 = (u_xlati14.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat4 = u_xlat2.zwzw * vec4(0.707099974, -0.707099974, 0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture2D(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati4.xy = op_or((ivec2(u_xlatb6.yw) * -1), (ivec2(u_xlatb6.xz) * -1));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati4.xy = op_or(u_xlati4.xy, (ivec2(u_xlatb5.xz) * -1));
        u_xlati4.xy = op_or((ivec2(u_xlatb5.yw) * -1), u_xlati4.xy);
        u_xlat14 = (u_xlati4.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat4.zw).w;
        u_xlat14 = (u_xlati4.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat2 = u_xlat2 * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat2 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture2D(_MainTex, u_xlat2.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati2.xy = op_or((ivec2(u_xlatb5.yw) * -1), (ivec2(u_xlatb5.xz) * -1));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati2.xy = op_or(u_xlati2.xy, (ivec2(u_xlatb4.xz) * -1));
        u_xlati2.xy = op_or((ivec2(u_xlatb4.yw) * -1), u_xlati2.xy);
        u_xlat14 = (u_xlati2.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat4.yz = vs_TEXCOORD3.ww;
        u_xlat4.x = float(1.0);
        u_xlat4.w = float(0.0);
        u_xlat5 = u_xlat4.yxxy * _MainTex_TexelSize.xyxy;
        u_xlat4 = u_xlat5 * u_xlat4.wzzw + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture2D(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati4.xy = op_or((ivec2(u_xlatb6.yw) * -1), (ivec2(u_xlatb6.xz) * -1));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati4.xy = op_or(u_xlati4.xy, (ivec2(u_xlatb5.xz) * -1));
        u_xlati4.xy = op_or((ivec2(u_xlatb5.yw) * -1), u_xlati4.xy);
        u_xlat14 = (u_xlati4.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat2.zw).w;
        u_xlat14 = (u_xlati2.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat4.zw).w;
        u_xlat14 = (u_xlati4.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat7.x = min(u_xlat7.x, 1.0);
        u_xlat7.x = u_xlat7.x * 0.5;
        u_xlat16_7 = u_xlat7.x;
    } else {
        u_xlat16_7 = vs_TEXCOORD3.w;
    }
    u_xlat16_2.xyz = (-vs_TEXCOORD3.xyz);
    u_xlat16_2.w = (-u_xlat16_7);
    u_xlat16_1 = u_xlat1 + u_xlat16_2;
    SV_Target0.xyz = vec3(u_xlat16_3) * u_xlat16_1.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_1.w + u_xlat16_7;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0.w;
    u_xlat4.x = u_xlat0.x * u_xlat16_3;
    SV_Target0.w = u_xlat4.x;
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
uniform 	vec4 _ClipRange0;
uniform 	vec4 _ClipRange1;
uniform 	vec4 _ClipArgs1;
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
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
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
    u_xlat0.x = in_POSITION0.y * _ClipArgs1.z;
    u_xlat4.x = in_POSITION0.x * _ClipArgs1.w + (-u_xlat0.x);
    u_xlat4.y = dot(in_POSITION0.xy, _ClipArgs1.zw);
    vs_TEXCOORD4.zw = u_xlat4.xy * _ClipRange1.zw + _ClipRange1.xy;
    vs_TEXCOORD4.xy = in_POSITION0.xy * _ClipRange0.zw + _ClipRange0.xy;
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
uniform 	vec4 _ClipArgs0;
uniform 	vec4 _ClipArgs1;
uniform 	mediump float _LG_U;
uniform 	mediump float _LG_V;
uniform 	mediump vec3 _LGColor;
uniform 	mediump vec4 _LGTex_ST;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LGTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
ivec2 u_xlati2;
bvec2 u_xlatb2;
mediump float u_xlat16_3;
vec4 u_xlat4;
ivec2 u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
bvec4 u_xlatb5;
bvec4 u_xlatb6;
vec2 u_xlat7;
mediump float u_xlat16_7;
lowp vec3 u_xlat10_7;
bvec2 u_xlatb7;
float u_xlat14;
ivec2 u_xlati14;
bool u_xlatb14;
bool u_xlatb21;
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
    u_xlat0 = -abs(vs_TEXCOORD4) + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * _ClipArgs0.xy;
    u_xlat0.x = min(u_xlat0.y, u_xlat0.x);
    u_xlat7.xy = u_xlat0.zw * _ClipArgs1.xy;
    u_xlat7.x = min(u_xlat7.y, u_xlat7.x);
    u_xlat0.x = min(u_xlat7.x, u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1.w = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat2.yz = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat7.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat2.x = u_xlat7.x * u_xlat2.y;
    u_xlat7.xy = u_xlat2.xz * _LGTex_ST.xy + _LGTex_ST.zw;
    u_xlat7.xy = _Time.yy * vec2(_LG_U, _LG_V) + u_xlat7.xy;
    u_xlat10_7.xyz = texture2D(_LGTex, u_xlat7.xy).xyz;
    u_xlat1.xyz = u_xlat10_7.xyz * _LGColor.xyz + vs_COLOR0.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.xy;
    u_xlat7.xy = u_xlat7.xy * vs_TEXCOORD2.zw;
    u_xlatb2.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyxx).xy;
    u_xlatb21 = u_xlatb2.y || u_xlatb2.x;
    u_xlatb7.xy = greaterThanEqual(u_xlat7.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.x || u_xlatb21;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    u_xlat16_3 = (u_xlatb7.x) ? 0.0 : u_xlat1.w;
    u_xlatb7.x = 0.0<vs_TEXCOORD3.w;
    u_xlatb14 = u_xlat16_3!=1.0;
    u_xlatb7.x = u_xlatb14 && u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat2 = vs_TEXCOORD3.wwww * _MainTex_TexelSize.xyxy;
        u_xlat4 = u_xlat2.zwzw * vec4(-0.707099974, -0.707099974, -0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat7.x = texture2D(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati14.xy = op_or((ivec2(u_xlatb6.yw) * -1), (ivec2(u_xlatb6.xz) * -1));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati14.xy = op_or(u_xlati14.xy, (ivec2(u_xlatb5.xz) * -1));
        u_xlati14.xy = op_or((ivec2(u_xlatb5.yw) * -1), u_xlati14.xy);
        u_xlat7.x = (u_xlati14.x != 0) ? 0.0 : u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat4.zw).w;
        u_xlat14 = (u_xlati14.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat4 = u_xlat2.zwzw * vec4(0.707099974, -0.707099974, 0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture2D(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati4.xy = op_or((ivec2(u_xlatb6.yw) * -1), (ivec2(u_xlatb6.xz) * -1));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati4.xy = op_or(u_xlati4.xy, (ivec2(u_xlatb5.xz) * -1));
        u_xlati4.xy = op_or((ivec2(u_xlatb5.yw) * -1), u_xlati4.xy);
        u_xlat14 = (u_xlati4.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat4.zw).w;
        u_xlat14 = (u_xlati4.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat2 = u_xlat2 * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat2 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture2D(_MainTex, u_xlat2.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati2.xy = op_or((ivec2(u_xlatb5.yw) * -1), (ivec2(u_xlatb5.xz) * -1));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati2.xy = op_or(u_xlati2.xy, (ivec2(u_xlatb4.xz) * -1));
        u_xlati2.xy = op_or((ivec2(u_xlatb4.yw) * -1), u_xlati2.xy);
        u_xlat14 = (u_xlati2.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat4.yz = vs_TEXCOORD3.ww;
        u_xlat4.x = float(1.0);
        u_xlat4.w = float(0.0);
        u_xlat5 = u_xlat4.yxxy * _MainTex_TexelSize.xyxy;
        u_xlat4 = u_xlat5 * u_xlat4.wzzw + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat14 = texture2D(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati4.xy = op_or((ivec2(u_xlatb6.yw) * -1), (ivec2(u_xlatb6.xz) * -1));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati4.xy = op_or(u_xlati4.xy, (ivec2(u_xlatb5.xz) * -1));
        u_xlati4.xy = op_or((ivec2(u_xlatb5.yw) * -1), u_xlati4.xy);
        u_xlat14 = (u_xlati4.x != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat2.zw).w;
        u_xlat14 = (u_xlati2.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat14 = texture2D(_MainTex, u_xlat4.zw).w;
        u_xlat14 = (u_xlati4.y != 0) ? 0.0 : u_xlat14;
        u_xlat7.x = u_xlat14 + u_xlat7.x;
        u_xlat7.x = min(u_xlat7.x, 1.0);
        u_xlat7.x = u_xlat7.x * 0.5;
        u_xlat16_7 = u_xlat7.x;
    } else {
        u_xlat16_7 = vs_TEXCOORD3.w;
    }
    u_xlat16_2.xyz = (-vs_TEXCOORD3.xyz);
    u_xlat16_2.w = (-u_xlat16_7);
    u_xlat16_1 = u_xlat1 + u_xlat16_2;
    SV_Target0.xyz = vec3(u_xlat16_3) * u_xlat16_1.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_1.w + u_xlat16_7;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0.w;
    u_xlat4.x = u_xlat0.x * u_xlat16_3;
    SV_Target0.w = u_xlat4.x;
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
Fall back "Unlit/TextFlowLight"
}