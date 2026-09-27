//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PBR/Show_ShapeScale" {
Properties {

_MainTex ("R:缩放图形 G:扫光图形", 2D) = "white" { }

_Mask ("R:缩放遮罩 G:扫光遮罩", 2D) = "white" { }

_Scale_Color ("缩放颜色", Color) = (1,1,1,1)

_Scale_Intensity ("缩放颜色强度", Float) = 1.0

_Sweep_Color ("扫光颜色", Color) = (1,1,1,1)

_Sweep_Intensity ("扫光颜色强度", Float) = 1.0

_Speed ("扫光速度", Float) = 0.0

_Scale ("缩放比例", Range(0, 1)) = 0.0

_Cycle ("流动周期", Range(1, 20)) = 1.0

_Fresnel_Mask ("菲涅尔遮罩范围", Range(0.001, 10)) = 0.0010000000474974513

}
SubShader {
 Tags { "QUEUE" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" }
  GpuProgramID 104257
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
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
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
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
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
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
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
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
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
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
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
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
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
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
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
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
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
 Name "ForwardBase"
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" }
 ZWrite Off
  GpuProgramID 41260
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Scale_Color;
uniform 	vec4 _Sweep_Color;
uniform 	float _Scale_Intensity;
uniform 	float _Sweep_Intensity;
uniform 	float _Speed;
uniform 	float _Scale;
uniform 	float _Cycle;
uniform 	float _Fresnel_Mask;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump float u_xlat16_2;
vec2 u_xlat4;
mediump float u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0.y = vs_COLOR0.x;
    u_xlat0.x = float(0.5);
    u_xlat4.x = float(0.0);
    u_xlat0.xy = _Time.yy * vec2(vec2(_Speed, _Speed)) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_Cycle);
    u_xlatb1.xy = greaterThanEqual(u_xlat0.xyxx, (-u_xlat0.xyxx)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec3 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(_Cycle);
    u_xlat0.xy = max(u_xlat0.xy, vec2(-1.0, -1.0));
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _Scale;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat1.xy / u_xlat0.xx;
    u_xlat0.xy = max(u_xlat0.xy, vec2(-1.0, -1.0));
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _Scale_Intensity;
    u_xlat0.x = u_xlat0.x * _Scale_Color.w;
    u_xlat4.y = _Time.y * _Speed;
    u_xlat2.xy = u_xlat4.xy + vs_TEXCOORD1.xy;
    u_xlat2.xy = u_xlat2.xy / vec2(_Cycle);
    u_xlatb1.xy = greaterThanEqual(u_xlat2.xyxx, (-u_xlat2.xyxx)).xy;
    u_xlat2.xy = fract(abs(u_xlat2.xy));
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.y);
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat2.xy = u_xlat2.xy * vec2(_Cycle);
    u_xlat2.xy = max(u_xlat2.xy, vec2(-1.0, -1.0));
    u_xlat2.xy = min(u_xlat2.xy, vec2(1.0, 1.0));
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_2 = texture(_Mask, u_xlat2.xy).y;
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy).y;
    u_xlat2.x = u_xlat16_4 * u_xlat16_2;
    u_xlat2.x = u_xlat2.x * _Sweep_Intensity;
    u_xlat2.x = u_xlat2.x * _Sweep_Color.w;
    u_xlat2.xyz = u_xlat2.xxx * _Sweep_Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _Scale_Color.xyz + u_xlat2.xyz;
    u_xlat6 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat6 = log2(u_xlat6);
    u_xlat6 = u_xlat6 * _Fresnel_Mask;
    u_xlat6 = exp2(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD3;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Scale_Color;
uniform 	vec4 _Sweep_Color;
uniform 	float _Scale_Intensity;
uniform 	float _Sweep_Intensity;
uniform 	float _Speed;
uniform 	float _Scale;
uniform 	float _Cycle;
uniform 	float _Fresnel_Mask;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
mediump float u_xlat16_2;
vec2 u_xlat4;
mediump float u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0.y = vs_COLOR0.x;
    u_xlat0.x = float(0.5);
    u_xlat4.x = float(0.0);
    u_xlat0.xy = _Time.yy * vec2(vec2(_Speed, _Speed)) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_Cycle);
    u_xlatb1.xy = greaterThanEqual(u_xlat0.xyxx, (-u_xlat0.xyxx)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec3 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(_Cycle);
    u_xlat0.xy = max(u_xlat0.xy, vec2(-1.0, -1.0));
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0 = texture(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _Scale;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat1.xy / u_xlat0.xx;
    u_xlat0.xy = max(u_xlat0.xy, vec2(-1.0, -1.0));
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0 * _Scale_Intensity;
    u_xlat0.x = u_xlat0.x * _Scale_Color.w;
    u_xlat4.y = _Time.y * _Speed;
    u_xlat2.xy = u_xlat4.xy + vs_TEXCOORD1.xy;
    u_xlat2.xy = u_xlat2.xy / vec2(_Cycle);
    u_xlatb1.xy = greaterThanEqual(u_xlat2.xyxx, (-u_xlat2.xyxx)).xy;
    u_xlat2.xy = fract(abs(u_xlat2.xy));
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.y);
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat2.xy = u_xlat2.xy * vec2(_Cycle);
    u_xlat2.xy = max(u_xlat2.xy, vec2(-1.0, -1.0));
    u_xlat2.xy = min(u_xlat2.xy, vec2(1.0, 1.0));
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat16_2 = texture(_Mask, u_xlat2.xy).y;
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy).y;
    u_xlat2.x = u_xlat16_4 * u_xlat16_2;
    u_xlat2.x = u_xlat2.x * _Sweep_Intensity;
    u_xlat2.x = u_xlat2.x * _Sweep_Color.w;
    u_xlat2.xyz = u_xlat2.xxx * _Sweep_Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _Scale_Color.xyz + u_xlat2.xyz;
    u_xlat6 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat6 = log2(u_xlat6);
    u_xlat6 = u_xlat6 * _Fresnel_Mask;
    u_xlat6 = exp2(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Scale_Color;
uniform 	vec4 _Sweep_Color;
uniform 	float _Scale_Intensity;
uniform 	float _Sweep_Intensity;
uniform 	float _Speed;
uniform 	float _Scale;
uniform 	float _Cycle;
uniform 	float _Fresnel_Mask;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
lowp float u_xlat10_2;
vec2 u_xlat4;
lowp float u_xlat10_4;
float u_xlat6;
void main()
{
    u_xlat0.y = vs_COLOR0.x;
    u_xlat0.x = float(0.5);
    u_xlat4.x = float(0.0);
    u_xlat0.xy = _Time.yy * vec2(vec2(_Speed, _Speed)) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_Cycle);
    u_xlatb1.xy = greaterThanEqual(u_xlat0.xyxx, (-u_xlat0.xyxx)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec3 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(_Cycle);
    u_xlat0.xy = max(u_xlat0.xy, vec2(-1.0, -1.0));
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * _Scale;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat1.xy / u_xlat0.xx;
    u_xlat0.xy = max(u_xlat0.xy, vec2(-1.0, -1.0));
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * _Scale_Intensity;
    u_xlat0.x = u_xlat0.x * _Scale_Color.w;
    u_xlat4.y = _Time.y * _Speed;
    u_xlat2.xy = u_xlat4.xy + vs_TEXCOORD1.xy;
    u_xlat2.xy = u_xlat2.xy / vec2(_Cycle);
    u_xlatb1.xy = greaterThanEqual(u_xlat2.xyxx, (-u_xlat2.xyxx)).xy;
    u_xlat2.xy = fract(abs(u_xlat2.xy));
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.y);
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat2.xy = u_xlat2.xy * vec2(_Cycle);
    u_xlat2.xy = max(u_xlat2.xy, vec2(-1.0, -1.0));
    u_xlat2.xy = min(u_xlat2.xy, vec2(1.0, 1.0));
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat10_2 = texture2D(_Mask, u_xlat2.xy).y;
    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD0.xy).y;
    u_xlat2.x = u_xlat10_4 * u_xlat10_2;
    u_xlat2.x = u_xlat2.x * _Sweep_Intensity;
    u_xlat2.x = u_xlat2.x * _Sweep_Color.w;
    u_xlat2.xyz = u_xlat2.xxx * _Sweep_Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _Scale_Color.xyz + u_xlat2.xyz;
    u_xlat6 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD7.xyz);
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat6 = log2(u_xlat6);
    u_xlat6 = u_xlat6 * _Fresnel_Mask;
    u_xlat6 = exp2(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Scale_Color;
uniform 	vec4 _Sweep_Color;
uniform 	float _Scale_Intensity;
uniform 	float _Sweep_Intensity;
uniform 	float _Speed;
uniform 	float _Scale;
uniform 	float _Cycle;
uniform 	float _Fresnel_Mask;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec2 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
lowp float u_xlat10_2;
vec2 u_xlat4;
lowp float u_xlat10_4;
float u_xlat6;
void main()
{
    u_xlat0.y = vs_COLOR0.x;
    u_xlat0.x = float(0.5);
    u_xlat4.x = float(0.0);
    u_xlat0.xy = _Time.yy * vec2(vec2(_Speed, _Speed)) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_Cycle);
    u_xlatb1.xy = greaterThanEqual(u_xlat0.xyxx, (-u_xlat0.xyxx)).xy;
    u_xlat0.xy = fract(abs(u_xlat0.xy));
    {
        vec3 hlslcc_movcTemp = u_xlat0;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat0.x : (-u_xlat0.x);
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat0.y : (-u_xlat0.y);
        u_xlat0 = hlslcc_movcTemp;
    }
    u_xlat0.xy = u_xlat0.xy * vec2(_Cycle);
    u_xlat0.xy = max(u_xlat0.xy, vec2(-1.0, -1.0));
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * _Scale;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat1.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat1.xy / u_xlat0.xx;
    u_xlat0.xy = max(u_xlat0.xy, vec2(-1.0, -1.0));
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0 * _Scale_Intensity;
    u_xlat0.x = u_xlat0.x * _Scale_Color.w;
    u_xlat4.y = _Time.y * _Speed;
    u_xlat2.xy = u_xlat4.xy + vs_TEXCOORD1.xy;
    u_xlat2.xy = u_xlat2.xy / vec2(_Cycle);
    u_xlatb1.xy = greaterThanEqual(u_xlat2.xyxx, (-u_xlat2.xyxx)).xy;
    u_xlat2.xy = fract(abs(u_xlat2.xy));
    {
        vec3 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb1.x) ? u_xlat2.x : (-u_xlat2.x);
        hlslcc_movcTemp.y = (u_xlatb1.y) ? u_xlat2.y : (-u_xlat2.y);
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat2.xy = u_xlat2.xy * vec2(_Cycle);
    u_xlat2.xy = max(u_xlat2.xy, vec2(-1.0, -1.0));
    u_xlat2.xy = min(u_xlat2.xy, vec2(1.0, 1.0));
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat10_2 = texture2D(_Mask, u_xlat2.xy).y;
    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD0.xy).y;
    u_xlat2.x = u_xlat10_4 * u_xlat10_2;
    u_xlat2.x = u_xlat2.x * _Sweep_Intensity;
    u_xlat2.x = u_xlat2.x * _Sweep_Color.w;
    u_xlat2.xyz = u_xlat2.xxx * _Sweep_Color.xyz;
    u_xlat0.xyz = u_xlat0.xxx * _Scale_Color.xyz + u_xlat2.xyz;
    u_xlat6 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD7.xyz);
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat6 = log2(u_xlat6);
    u_xlat6 = u_xlat6 * _Fresnel_Mask;
    u_xlat6 = exp2(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
}
}