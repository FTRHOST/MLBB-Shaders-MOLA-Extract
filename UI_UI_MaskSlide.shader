//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/UI_MaskSlide" {
Properties {

_MainTex ("MainTex", 2D) = "white" { }

_SlideTex ("进度纹理", 2D) = "white" { }

_Mask ("Mask", 2D) = "white" { }

_Mask_TiOf ("Mask XY:Tiling ZW:Offset", Vector) = (1,1,0,0)

_Slide ("进度", Range(0, 1)) = 1.0

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "FORWARD"
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 46949
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _SlideTex_ST;
uniform 	float _Slide;
uniform 	vec4 _Mask_TiOf;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SlideTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Slide>=vs_TEXCOORD0.x);
#else
    u_xlatb0 = _Slide>=vs_TEXCOORD0.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.xy = vs_TEXCOORD0.xy * _SlideTex_ST.xy + _SlideTex_ST.zw;
    u_xlat16_1 = texture(_SlideTex, u_xlat3.xy);
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_TiOf.xy + _Mask_TiOf.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xy).x;
    SV_Target0.w = u_xlat16_0 * u_xlat16_2.w;
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _SlideTex_ST;
uniform 	float _Slide;
uniform 	vec4 _Mask_TiOf;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SlideTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Slide>=vs_TEXCOORD0.x);
#else
    u_xlatb0 = _Slide>=vs_TEXCOORD0.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.xy = vs_TEXCOORD0.xy * _SlideTex_ST.xy + _SlideTex_ST.zw;
    u_xlat16_1 = texture(_SlideTex, u_xlat3.xy);
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat16_1.xyz + (-u_xlat16_2.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat16_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_TiOf.xy + _Mask_TiOf.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xy).x;
    SV_Target0.w = u_xlat16_0 * u_xlat16_2.w;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _SlideTex_ST;
uniform 	float _Slide;
uniform 	vec4 _Mask_TiOf;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SlideTex;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
void main()
{
    u_xlatb0 = _Slide>=vs_TEXCOORD0.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.xy = vs_TEXCOORD0.xy * _SlideTex_ST.xy + _SlideTex_ST.zw;
    u_xlat10_1 = texture2D(_SlideTex, u_xlat3.xy);
    u_xlat0.x = u_xlat0.x * u_xlat10_1.w;
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_TiOf.xy + _Mask_TiOf.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy).x;
    SV_Target0.w = u_xlat10_0 * u_xlat10_2.w;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _SlideTex_ST;
uniform 	float _Slide;
uniform 	vec4 _Mask_TiOf;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _SlideTex;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
lowp vec4 u_xlat10_1;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
void main()
{
    u_xlatb0 = _Slide>=vs_TEXCOORD0.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.xy = vs_TEXCOORD0.xy * _SlideTex_ST.xy + _SlideTex_ST.zw;
    u_xlat10_1 = texture2D(_SlideTex, u_xlat3.xy);
    u_xlat0.x = u_xlat0.x * u_xlat10_1.w;
    u_xlat3.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat3.xyz = u_xlat10_1.xyz + (-u_xlat10_2.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat3.xyz + u_xlat10_2.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_TiOf.xy + _Mask_TiOf.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xy).x;
    SV_Target0.w = u_xlat10_0 * u_xlat10_2.w;
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