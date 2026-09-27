//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/GRenderShader_UIClip" {
Properties {

_MainTex ("White Texture", 2D) = "white" { }

_BlackTex ("Black Texture", 2D) = "black" { }

_Color ("Color", Color) = (1,1,1,1)

[Toggle] _Grey ("Grey", Float) = 0.0

_PanelRect ("PanelRect", Vector) = (0,0,0,0)

_PanelClipInfo ("ClipInfo", Vector) = (0,0,0,0)

_StencilComp ("Stencil Comparison", Float) = 8.0

_Stencil ("Stencil ID", Float) = 0.0

_StencilOp ("Stencil Operation", Float) = 0.0

_StencilWriteMask ("Stencil Write Mask", Float) = 255.0

_StencilReadMask ("Stencil Read Mask", Float) = 255.0

_ColorMask ("Color Mask", Float) = 15.0

_Alpha ("Alpha", Range(0, 1)) = 1.0

}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 37915
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
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
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _Grey;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlackTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat16_3.xyz = texture(_BlackTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.x = (-u_xlat16_3.x) + u_xlat16_0;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_4.x = u_xlat16_1.x * _Alpha + -0.00999999978;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_4.x<0.0);
#else
    u_xlatb0 = u_xlat16_4.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_4.xyz = u_xlat16_3.xyz / u_xlat16_1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x==0.0);
#else
    u_xlatb0 = u_xlat16_1.x==0.0;
#endif
    u_xlat16_2.w = u_xlat16_1.x * _Alpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat16_4.xyz;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Grey));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Grey);
#endif
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_10) : u_xlat16_1.xyz;
    u_xlat16_1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelRect.zw;
    u_xlat16_1.xy = u_xlat16_1.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_1.xxxx * u_xlat16_2;
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
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
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _Grey;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlackTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat16_3.xyz = texture(_BlackTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.x = (-u_xlat16_3.x) + u_xlat16_0;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_4.x = u_xlat16_1.x * _Alpha + -0.00999999978;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_4.x<0.0);
#else
    u_xlatb0 = u_xlat16_4.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_4.xyz = u_xlat16_3.xyz / u_xlat16_1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x==0.0);
#else
    u_xlatb0 = u_xlat16_1.x==0.0;
#endif
    u_xlat16_2.w = u_xlat16_1.x * _Alpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat16_4.xyz;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Grey));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Grey);
#endif
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_10) : u_xlat16_1.xyz;
    u_xlat16_1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelRect.zw;
    u_xlat16_1.xy = u_xlat16_1.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_1.xxxx * u_xlat16_2;
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
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
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _Grey;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BlackTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat10_3.xyz = texture2D(_BlackTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.x = (-u_xlat10_3.x) + u_xlat10_0;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_4.x = u_xlat16_1.x * _Alpha + -0.00999999978;
    u_xlatb0 = u_xlat16_4.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat16_4.xyz = u_xlat10_3.xyz / u_xlat16_1.xxx;
    u_xlatb0 = u_xlat16_1.x==0.0;
    u_xlat16_2.w = u_xlat16_1.x * _Alpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat16_4.xyz;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Grey);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_10) : u_xlat16_1.xyz;
    u_xlat16_1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelRect.zw;
    u_xlat16_1.xy = u_xlat16_1.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_1.xxxx * u_xlat16_2;
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
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
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _Grey;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BlackTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat10_3.xyz = texture2D(_BlackTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.x = (-u_xlat10_3.x) + u_xlat10_0;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_4.x = u_xlat16_1.x * _Alpha + -0.00999999978;
    u_xlatb0 = u_xlat16_4.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat16_4.xyz = u_xlat10_3.xyz / u_xlat16_1.xxx;
    u_xlatb0 = u_xlat16_1.x==0.0;
    u_xlat16_2.w = u_xlat16_1.x * _Alpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat16_4.xyz;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Grey);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_10) : u_xlat16_1.xyz;
    u_xlat16_1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelRect.zw;
    u_xlat16_1.xy = u_xlat16_1.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_1.xxxx * u_xlat16_2;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
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
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _Grey;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlackTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat16_3.xyz = texture(_BlackTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.x = (-u_xlat16_3.x) + u_xlat16_0;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_4.x = u_xlat16_1.x * _Alpha + -0.00999999978;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_4.x<0.0);
#else
    u_xlatb0 = u_xlat16_4.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_4.xyz = u_xlat16_3.xyz / u_xlat16_1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x==0.0);
#else
    u_xlatb0 = u_xlat16_1.x==0.0;
#endif
    u_xlat16_2.w = u_xlat16_1.x * _Alpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat16_4.xyz;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Grey));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Grey);
#endif
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_10) : u_xlat16_1.xyz;
    u_xlat16_1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_1.xxxx * u_xlat16_2;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
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
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _Grey;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _BlackTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat16_3.xyz = texture(_BlackTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.x = (-u_xlat16_3.x) + u_xlat16_0;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_4.x = u_xlat16_1.x * _Alpha + -0.00999999978;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_4.x<0.0);
#else
    u_xlatb0 = u_xlat16_4.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_4.xyz = u_xlat16_3.xyz / u_xlat16_1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x==0.0);
#else
    u_xlatb0 = u_xlat16_1.x==0.0;
#endif
    u_xlat16_2.w = u_xlat16_1.x * _Alpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat16_4.xyz;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Grey));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Grey);
#endif
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_10) : u_xlat16_1.xyz;
    u_xlat16_1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_1.xxxx * u_xlat16_2;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
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
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _Grey;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BlackTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat10_3.xyz = texture2D(_BlackTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.x = (-u_xlat10_3.x) + u_xlat10_0;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_4.x = u_xlat16_1.x * _Alpha + -0.00999999978;
    u_xlatb0 = u_xlat16_4.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat16_4.xyz = u_xlat10_3.xyz / u_xlat16_1.xxx;
    u_xlatb0 = u_xlat16_1.x==0.0;
    u_xlat16_2.w = u_xlat16_1.x * _Alpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat16_4.xyz;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Grey);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_10) : u_xlat16_1.xyz;
    u_xlat16_1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_1.xxxx * u_xlat16_2;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
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
uniform 	mediump float _Alpha;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _Grey;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _BlackTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).x;
    u_xlat10_3.xyz = texture2D(_BlackTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.x = (-u_xlat10_3.x) + u_xlat10_0;
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_4.x = u_xlat16_1.x * _Alpha + -0.00999999978;
    u_xlatb0 = u_xlat16_4.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat16_4.xyz = u_xlat10_3.xyz / u_xlat16_1.xxx;
    u_xlatb0 = u_xlat16_1.x==0.0;
    u_xlat16_2.w = u_xlat16_1.x * _Alpha;
    u_xlat16_1.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat16_4.xyz;
    u_xlat16_10 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Grey);
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_10) : u_xlat16_1.xyz;
    u_xlat16_1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0 = u_xlat16_1.xxxx * u_xlat16_2;
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
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
}
}
}
}