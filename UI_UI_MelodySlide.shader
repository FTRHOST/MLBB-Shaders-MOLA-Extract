//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/UI_MelodySlide" {
Properties {

_MainTex ("MainTex", 2D) = "white" { }

_DiffuseColor ("DiffuseColor", Color) = (1,1,1,1)

_Color01 ("颜色1", Color) = (1,1,1,1)

_Color02 ("颜色2", Color) = (1,1,1,1)

_Scale ("缩放比率", Range(1, 5)) = 1.0

_ColorSlide ("进度", Range(0, 1)) = 1.0

_Sound_Intensity ("音量影响比率", Range(1, 50)) = 25.0

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "FORWARD"
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 47198
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
uniform 	float _Scale;
uniform 	float _Sound_Intensity;
uniform 	float _Audio_Sound[11];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
float u_xlat2;
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
    u_xlat0.x = in_COLOR0.w * 10.0;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlat0.x = _Sound_Intensity * _Audio_Sound[int(u_xlatu0)];
    u_xlat2 = (-_Scale) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat2 + _Scale;
    u_xlat0.x = max(u_xlat0.x, 1.0);
    u_xlat2 = in_TEXCOORD0.y * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * u_xlat2;
    vs_TEXCOORD0.y = u_xlat0.x * 0.5 + 0.5;
    vs_TEXCOORD0.x = in_TEXCOORD0.x;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Color01;
uniform 	vec4 _Color02;
uniform 	float _ColorSlide;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
float u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(vs_TEXCOORD1.x>=_ColorSlide);
#else
    u_xlatb2 = vs_TEXCOORD1.x>=_ColorSlide;
#endif
    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1 = (-_Color01) + _Color02;
    u_xlat1 = vec4(u_xlat2) * u_xlat1 + _Color01;
    u_xlat1 = u_xlat1 * _DiffuseColor;
    SV_Target0.w = u_xlat16_0 * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	float _Scale;
uniform 	float _Sound_Intensity;
uniform 	float _Audio_Sound[11];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
float u_xlat2;
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
    u_xlat0.x = in_COLOR0.w * 10.0;
    u_xlatu0 = uint(u_xlat0.x);
    u_xlat0.x = _Sound_Intensity * _Audio_Sound[int(u_xlatu0)];
    u_xlat2 = (-_Scale) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat2 + _Scale;
    u_xlat0.x = max(u_xlat0.x, 1.0);
    u_xlat2 = in_TEXCOORD0.y * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * u_xlat2;
    vs_TEXCOORD0.y = u_xlat0.x * 0.5 + 0.5;
    vs_TEXCOORD0.x = in_TEXCOORD0.x;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Color01;
uniform 	vec4 _Color02;
uniform 	float _ColorSlide;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
float u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(vs_TEXCOORD1.x>=_ColorSlide);
#else
    u_xlatb2 = vs_TEXCOORD1.x>=_ColorSlide;
#endif
    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1 = (-_Color01) + _Color02;
    u_xlat1 = vec4(u_xlat2) * u_xlat1 + _Color01;
    u_xlat1 = u_xlat1 * _DiffuseColor;
    SV_Target0.w = u_xlat16_0 * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	float _Scale;
uniform 	float _Sound_Intensity;
uniform 	float _Audio_Sound[11];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlatu0;
vec4 u_xlat1;
float u_xlat2;
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
    u_xlat0.x = in_COLOR0.w * 10.0;
    u_xlatu0 = int(u_xlat0.x);
    u_xlat0.x = _Sound_Intensity * _Audio_Sound[int(u_xlatu0)];
    u_xlat2 = (-_Scale) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat2 + _Scale;
    u_xlat0.x = max(u_xlat0.x, 1.0);
    u_xlat2 = in_TEXCOORD0.y * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * u_xlat2;
    vs_TEXCOORD0.y = u_xlat0.x * 0.5 + 0.5;
    vs_TEXCOORD0.x = in_TEXCOORD0.x;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Color01;
uniform 	vec4 _Color02;
uniform 	float _ColorSlide;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
float u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy).x;
    u_xlatb2 = vs_TEXCOORD1.x>=_ColorSlide;
    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1 = (-_Color01) + _Color02;
    u_xlat1 = vec4(u_xlat2) * u_xlat1 + _Color01;
    u_xlat1 = u_xlat1 * _DiffuseColor;
    SV_Target0.w = u_xlat10_0 * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	float _Scale;
uniform 	float _Sound_Intensity;
uniform 	float _Audio_Sound[11];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlatu0;
vec4 u_xlat1;
float u_xlat2;
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
    u_xlat0.x = in_COLOR0.w * 10.0;
    u_xlatu0 = int(u_xlat0.x);
    u_xlat0.x = _Sound_Intensity * _Audio_Sound[int(u_xlatu0)];
    u_xlat2 = (-_Scale) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat2 + _Scale;
    u_xlat0.x = max(u_xlat0.x, 1.0);
    u_xlat2 = in_TEXCOORD0.y * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * u_xlat2;
    vs_TEXCOORD0.y = u_xlat0.x * 0.5 + 0.5;
    vs_TEXCOORD0.x = in_TEXCOORD0.x;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_COLOR0 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Color01;
uniform 	vec4 _Color02;
uniform 	float _ColorSlide;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
float u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy).x;
    u_xlatb2 = vs_TEXCOORD1.x>=_ColorSlide;
    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1 = (-_Color01) + _Color02;
    u_xlat1 = vec4(u_xlat2) * u_xlat1 + _Color01;
    u_xlat1 = u_xlat1 * _DiffuseColor;
    SV_Target0.w = u_xlat10_0 * u_xlat1.w;
    SV_Target0.xyz = u_xlat1.xyz;
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