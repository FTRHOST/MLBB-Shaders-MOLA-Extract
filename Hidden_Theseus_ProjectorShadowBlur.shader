//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/ProjectorShadowBlur" {
Properties {

}
SubShader {
 Pass {
 Name "DepthConvert"
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 53151
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapDepth;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture(_ShadowMapDepth, vs_TEXCOORD0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<1.0);
#else
    u_xlatb0 = u_xlat0<1.0;
#endif
    SV_Target0 = (bool(u_xlatb0)) ? vec4(0.0, 0.0, 0.0, 1.0) : vec4(1.0, 1.0, 1.0, 1.0);
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapDepth;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture(_ShadowMapDepth, vs_TEXCOORD0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<1.0);
#else
    u_xlatb0 = u_xlat0<1.0;
#endif
    SV_Target0 = (bool(u_xlatb0)) ? vec4(0.0, 0.0, 0.0, 1.0) : vec4(1.0, 1.0, 1.0, 1.0);
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
varying highp vec2 vs_TEXCOORD0;
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
uniform lowp sampler2D _ShadowMapDepth;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture2D(_ShadowMapDepth, vs_TEXCOORD0.xy).x;
    u_xlatb0 = u_xlat0<1.0;
    SV_Target0 = (bool(u_xlatb0)) ? vec4(0.0, 0.0, 0.0, 1.0) : vec4(1.0, 1.0, 1.0, 1.0);
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
varying highp vec2 vs_TEXCOORD0;
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
uniform lowp sampler2D _ShadowMapDepth;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture2D(_ShadowMapDepth, vs_TEXCOORD0.xy).x;
    u_xlatb0 = u_xlat0<1.0;
    SV_Target0 = (bool(u_xlatb0)) ? vec4(0.0, 0.0, 0.0, 1.0) : vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapDepth;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture(_ShadowMapDepth, vs_TEXCOORD0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<1.0);
#else
    u_xlatb0 = u_xlat0<1.0;
#endif
    SV_Target0 = (bool(u_xlatb0)) ? vec4(0.0, 0.0, 0.0, 1.0) : vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowMapDepth;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture(_ShadowMapDepth, vs_TEXCOORD0.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<1.0);
#else
    u_xlatb0 = u_xlat0<1.0;
#endif
    SV_Target0 = (bool(u_xlatb0)) ? vec4(0.0, 0.0, 0.0, 1.0) : vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform lowp sampler2D _ShadowMapDepth;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture2D(_ShadowMapDepth, vs_TEXCOORD0.xy).x;
    u_xlatb0 = u_xlat0<1.0;
    SV_Target0 = (bool(u_xlatb0)) ? vec4(0.0, 0.0, 0.0, 1.0) : vec4(1.0, 1.0, 1.0, 1.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform lowp sampler2D _ShadowMapDepth;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
bool u_xlatb0;
void main()
{
    u_xlat0 = texture2D(_ShadowMapDepth, vs_TEXCOORD0.xy).x;
    u_xlatb0 = u_xlat0<1.0;
    SV_Target0 = (bool(u_xlatb0)) ? vec4(0.0, 0.0, 0.0, 1.0) : vec4(1.0, 1.0, 1.0, 1.0);
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
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
}
}
 Pass {
 Name "Copy"
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 122296
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0;
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
varying highp vec2 vs_TEXCOORD0;
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
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0;
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
varying highp vec2 vs_TEXCOORD0;
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
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0;
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
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
}
}
 Pass {
 Name "Kawase"
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 133985
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat11;
void main()
{
    u_xlat16_0 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1 = vec4(_Offset) + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2.xy = u_xlat1.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat2.xy);
    u_xlat2 = u_xlat16_2 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat0 = u_xlat16_0 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat2;
    u_xlat2 = u_xlat1 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat1.xy = (-u_xlat1.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat16_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat16_1 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.y = u_xlat2.w;
    u_xlat2.w = (-u_xlat2.w);
    u_xlat2.x = float(0.0);
    u_xlat2.z = float(0.0);
    u_xlat1 = u_xlat2 + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat1.zw);
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat16_2 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat11;
void main()
{
    u_xlat16_0 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1 = vec4(_Offset) + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2.xy = u_xlat1.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat2.xy);
    u_xlat2 = u_xlat16_2 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat0 = u_xlat16_0 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat2;
    u_xlat2 = u_xlat1 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat1.xy = (-u_xlat1.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat16_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat16_1 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.y = u_xlat2.w;
    u_xlat2.w = (-u_xlat2.w);
    u_xlat2.x = float(0.0);
    u_xlat2.z = float(0.0);
    u_xlat1 = u_xlat2 + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat1.zw);
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat16_2 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
    SV_Target0 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
vec2 u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1 = vec4(_Offset) + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2.xy = u_xlat1.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat2.xy);
    u_xlat2 = u_xlat10_2 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat0 = u_xlat10_0 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat2;
    u_xlat2 = u_xlat1 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat1.xy = (-u_xlat1.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat10_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat10_1 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.y = u_xlat2.w;
    u_xlat2.w = (-u_xlat2.w);
    u_xlat2.x = float(0.0);
    u_xlat2.z = float(0.0);
    u_xlat1 = u_xlat2 + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat1.zw);
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat10_2 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
    SV_Target0 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
vec2 u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1 = vec4(_Offset) + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2.xy = u_xlat1.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat2.xy);
    u_xlat2 = u_xlat10_2 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat0 = u_xlat10_0 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat2;
    u_xlat2 = u_xlat1 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat1.xy = (-u_xlat1.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat10_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat10_1 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.y = u_xlat2.w;
    u_xlat2.w = (-u_xlat2.w);
    u_xlat2.x = float(0.0);
    u_xlat2.z = float(0.0);
    u_xlat1 = u_xlat2 + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat1.zw);
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat10_2 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat11;
void main()
{
    u_xlat16_0 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1 = vec4(_Offset) + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2.xy = u_xlat1.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat2.xy);
    u_xlat2 = u_xlat16_2 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat0 = u_xlat16_0 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat2;
    u_xlat2 = u_xlat1 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat1.xy = (-u_xlat1.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat16_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat16_1 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.y = u_xlat2.w;
    u_xlat2.w = (-u_xlat2.w);
    u_xlat2.x = float(0.0);
    u_xlat2.z = float(0.0);
    u_xlat1 = u_xlat2 + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat1.zw);
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat16_2 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat11;
void main()
{
    u_xlat16_0 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1 = vec4(_Offset) + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2.xy = u_xlat1.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat2.xy);
    u_xlat2 = u_xlat16_2 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat0 = u_xlat16_0 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat2;
    u_xlat2 = u_xlat1 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat1.xy = (-u_xlat1.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat16_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat16_1 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.y = u_xlat2.w;
    u_xlat2.w = (-u_xlat2.w);
    u_xlat2.x = float(0.0);
    u_xlat2.z = float(0.0);
    u_xlat1 = u_xlat2 + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat1.zw);
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat16_2 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
vec2 u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1 = vec4(_Offset) + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2.xy = u_xlat1.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat2.xy);
    u_xlat2 = u_xlat10_2 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat0 = u_xlat10_0 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat2;
    u_xlat2 = u_xlat1 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat1.xy = (-u_xlat1.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat10_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat10_1 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.y = u_xlat2.w;
    u_xlat2.w = (-u_xlat2.w);
    u_xlat2.x = float(0.0);
    u_xlat2.z = float(0.0);
    u_xlat1 = u_xlat2 + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat1.zw);
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat10_2 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
vec2 u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1 = vec4(_Offset) + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2.xy = u_xlat1.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat2.xy);
    u_xlat2 = u_xlat10_2 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat0 = u_xlat10_0 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat2;
    u_xlat2 = u_xlat1 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat1.xy = (-u_xlat1.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat10_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat0 = u_xlat10_1 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat0;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.y = u_xlat2.w;
    u_xlat2.w = (-u_xlat2.w);
    u_xlat2.x = float(0.0);
    u_xlat2.z = float(0.0);
    u_xlat1 = u_xlat2 + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat1.zw);
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat10_2 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
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
SubProgram "gles3 hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
}
}
 Pass {
 Name "Separable"
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 214609
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat11;
void main()
{
    u_xlat16_0 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat2 = u_xlat1.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat2.xy);
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat2.zw);
    u_xlat3 = u_xlat16_3 * _GaussWeights.yyyy;
    u_xlat0 = u_xlat16_0 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat1.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat16_4 * _GaussWeights.yyyy + u_xlat0;
    u_xlat0 = u_xlat16_2 * _GaussWeights.zzzz + u_xlat0;
    u_xlat0 = u_xlat16_3 * _GaussWeights.zzzz + u_xlat0;
    u_xlat11.xy = u_xlat1.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat1.xy = (-u_xlat1.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat11.xy);
    u_xlat0 = u_xlat16_1 * _GaussWeights.wwww + u_xlat0;
    u_xlat0 = u_xlat16_2 * _GaussWeights.wwww + u_xlat0;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat11;
void main()
{
    u_xlat16_0 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat2 = u_xlat1.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat2.xy);
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat2.zw);
    u_xlat3 = u_xlat16_3 * _GaussWeights.yyyy;
    u_xlat0 = u_xlat16_0 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat1.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat16_4 * _GaussWeights.yyyy + u_xlat0;
    u_xlat0 = u_xlat16_2 * _GaussWeights.zzzz + u_xlat0;
    u_xlat0 = u_xlat16_3 * _GaussWeights.zzzz + u_xlat0;
    u_xlat11.xy = u_xlat1.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat1.xy = (-u_xlat1.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat11.xy);
    u_xlat0 = u_xlat16_1 * _GaussWeights.wwww + u_xlat0;
    u_xlat0 = u_xlat16_2 * _GaussWeights.wwww + u_xlat0;
    SV_Target0 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
vec2 u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat2 = u_xlat1.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat2.xy);
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat2.zw);
    u_xlat3 = u_xlat10_3 * _GaussWeights.yyyy;
    u_xlat0 = u_xlat10_0 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat1.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat10_4 * _GaussWeights.yyyy + u_xlat0;
    u_xlat0 = u_xlat10_2 * _GaussWeights.zzzz + u_xlat0;
    u_xlat0 = u_xlat10_3 * _GaussWeights.zzzz + u_xlat0;
    u_xlat11.xy = u_xlat1.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat1.xy = (-u_xlat1.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat11.xy);
    u_xlat0 = u_xlat10_1 * _GaussWeights.wwww + u_xlat0;
    u_xlat0 = u_xlat10_2 * _GaussWeights.wwww + u_xlat0;
    SV_Target0 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
vec2 u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat2 = u_xlat1.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat2.xy);
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat2.zw);
    u_xlat3 = u_xlat10_3 * _GaussWeights.yyyy;
    u_xlat0 = u_xlat10_0 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat1.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat10_4 * _GaussWeights.yyyy + u_xlat0;
    u_xlat0 = u_xlat10_2 * _GaussWeights.zzzz + u_xlat0;
    u_xlat0 = u_xlat10_3 * _GaussWeights.zzzz + u_xlat0;
    u_xlat11.xy = u_xlat1.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat1.xy = (-u_xlat1.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat11.xy);
    u_xlat0 = u_xlat10_1 * _GaussWeights.wwww + u_xlat0;
    u_xlat0 = u_xlat10_2 * _GaussWeights.wwww + u_xlat0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat11;
void main()
{
    u_xlat16_0 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat2 = u_xlat1.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat2.xy);
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat2.zw);
    u_xlat3 = u_xlat16_3 * _GaussWeights.yyyy;
    u_xlat0 = u_xlat16_0 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat1.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat16_4 * _GaussWeights.yyyy + u_xlat0;
    u_xlat0 = u_xlat16_2 * _GaussWeights.zzzz + u_xlat0;
    u_xlat0 = u_xlat16_3 * _GaussWeights.zzzz + u_xlat0;
    u_xlat11.xy = u_xlat1.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat1.xy = (-u_xlat1.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat11.xy);
    u_xlat0 = u_xlat16_1 * _GaussWeights.wwww + u_xlat0;
    u_xlat0 = u_xlat16_2 * _GaussWeights.wwww + u_xlat0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat11;
void main()
{
    u_xlat16_0 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat2 = u_xlat1.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat2.xy);
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat2.zw);
    u_xlat3 = u_xlat16_3 * _GaussWeights.yyyy;
    u_xlat0 = u_xlat16_0 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat1.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat16_4 * _GaussWeights.yyyy + u_xlat0;
    u_xlat0 = u_xlat16_2 * _GaussWeights.zzzz + u_xlat0;
    u_xlat0 = u_xlat16_3 * _GaussWeights.zzzz + u_xlat0;
    u_xlat11.xy = u_xlat1.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat1.xy = (-u_xlat1.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat11.xy);
    u_xlat0 = u_xlat16_1 * _GaussWeights.wwww + u_xlat0;
    u_xlat0 = u_xlat16_2 * _GaussWeights.wwww + u_xlat0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
vec2 u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat2 = u_xlat1.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat2.xy);
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat2.zw);
    u_xlat3 = u_xlat10_3 * _GaussWeights.yyyy;
    u_xlat0 = u_xlat10_0 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat1.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat10_4 * _GaussWeights.yyyy + u_xlat0;
    u_xlat0 = u_xlat10_2 * _GaussWeights.zzzz + u_xlat0;
    u_xlat0 = u_xlat10_3 * _GaussWeights.zzzz + u_xlat0;
    u_xlat11.xy = u_xlat1.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat1.xy = (-u_xlat1.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat11.xy);
    u_xlat0 = u_xlat10_1 * _GaussWeights.wwww + u_xlat0;
    u_xlat0 = u_xlat10_2 * _GaussWeights.wwww + u_xlat0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
vec2 u_xlat11;
void main()
{
    u_xlat10_0 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlat1.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat2 = u_xlat1.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat2.xy);
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat2.zw);
    u_xlat3 = u_xlat10_3 * _GaussWeights.yyyy;
    u_xlat0 = u_xlat10_0 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat1.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat0 = u_xlat10_4 * _GaussWeights.yyyy + u_xlat0;
    u_xlat0 = u_xlat10_2 * _GaussWeights.zzzz + u_xlat0;
    u_xlat0 = u_xlat10_3 * _GaussWeights.zzzz + u_xlat0;
    u_xlat11.xy = u_xlat1.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat1.xy = (-u_xlat1.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat11.xy);
    u_xlat0 = u_xlat10_1 * _GaussWeights.wwww + u_xlat0;
    u_xlat0 = u_xlat10_2 * _GaussWeights.wwww + u_xlat0;
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
SubProgram "gles3 hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
}
}
 Pass {
 Name "VariableKawase"
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 290477
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
bool u_xlatb10;
vec2 u_xlat11;
vec2 u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5 = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5 = max(u_xlat5, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5 + u_xlat0.x;
    u_xlat16_1 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_VariableBlurMinRatio<0.00999999978);
#else
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x<0.00999999978);
#else
    u_xlatb10 = u_xlat0.x<0.00999999978;
#endif
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat16_1;
        return;
    }
    u_xlat5 = _Offset + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5 + _VariableBlurMinRatio;
    u_xlat16_0 = u_xlat0.xxxx + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2 = u_xlat16_0 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat3.xy = u_xlat16_0.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat3 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat1 = u_xlat16_1 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat3;
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat16_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat3.xy = (-u_xlat16_0.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat0 = u_xlat16_0 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.x = float(0.0);
    u_xlat12.x = float(0.0);
    u_xlat2.y = u_xlat2.w;
    u_xlat1.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat12.y = (-u_xlat2.w);
    u_xlat1.xy = u_xlat12.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
bool u_xlatb10;
vec2 u_xlat11;
vec2 u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5 = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5 = max(u_xlat5, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5 + u_xlat0.x;
    u_xlat16_1 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_VariableBlurMinRatio<0.00999999978);
#else
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x<0.00999999978);
#else
    u_xlatb10 = u_xlat0.x<0.00999999978;
#endif
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat16_1;
        return;
    }
    u_xlat5 = _Offset + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5 + _VariableBlurMinRatio;
    u_xlat16_0 = u_xlat0.xxxx + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2 = u_xlat16_0 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat3.xy = u_xlat16_0.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat3 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat1 = u_xlat16_1 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat3;
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat16_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat3.xy = (-u_xlat16_0.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat0 = u_xlat16_0 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.x = float(0.0);
    u_xlat12.x = float(0.0);
    u_xlat2.y = u_xlat2.w;
    u_xlat1.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat12.y = (-u_xlat2.w);
    u_xlat1.xy = u_xlat12.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
    SV_Target0 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
float u_xlat5;
bool u_xlatb5;
bool u_xlatb10;
vec2 u_xlat11;
vec2 u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5 = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5 = max(u_xlat5, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5 = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5 + u_xlat0.x;
    u_xlat10_1 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
    u_xlatb10 = u_xlat0.x<0.00999999978;
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat10_1;
        return;
    }
    u_xlat5 = _Offset + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5 + _VariableBlurMinRatio;
    u_xlat16_0 = u_xlat0.xxxx + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2 = u_xlat16_0 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat3.xy = u_xlat16_0.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat1 = u_xlat10_1 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat3;
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat10_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat3.xy = (-u_xlat16_0.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat0 = u_xlat10_0 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.x = float(0.0);
    u_xlat12.x = float(0.0);
    u_xlat2.y = u_xlat2.w;
    u_xlat1.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat12.y = (-u_xlat2.w);
    u_xlat1.xy = u_xlat12.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
    SV_Target0 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
float u_xlat5;
bool u_xlatb5;
bool u_xlatb10;
vec2 u_xlat11;
vec2 u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5 = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5 = max(u_xlat5, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5 = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5 + u_xlat0.x;
    u_xlat10_1 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
    u_xlatb10 = u_xlat0.x<0.00999999978;
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat10_1;
        return;
    }
    u_xlat5 = _Offset + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5 + _VariableBlurMinRatio;
    u_xlat16_0 = u_xlat0.xxxx + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2 = u_xlat16_0 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat3.xy = u_xlat16_0.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat1 = u_xlat10_1 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat3;
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat10_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat3.xy = (-u_xlat16_0.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat0 = u_xlat10_0 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.x = float(0.0);
    u_xlat12.x = float(0.0);
    u_xlat2.y = u_xlat2.w;
    u_xlat1.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat12.y = (-u_xlat2.w);
    u_xlat1.xy = u_xlat12.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
UNITY_LOCATION(1) uniform mediump sampler2D _ProjectorFadeCurveLut;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
bool u_xlatb10;
vec2 u_xlat11;
vec2 u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5 = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5 = max(u_xlat5, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5 + u_xlat0.x;
    u_xlat0.y = 0.5;
    u_xlat0.x = textureLod(_ProjectorFadeCurveLut, u_xlat0.xy, 0.0).x;
    u_xlat16_1 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_VariableBlurMinRatio<0.00999999978);
#else
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x<0.00999999978);
#else
    u_xlatb10 = u_xlat0.x<0.00999999978;
#endif
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat16_1;
        return;
    }
    u_xlat5 = _Offset + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5 + _VariableBlurMinRatio;
    u_xlat16_0 = u_xlat0.xxxx + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2 = u_xlat16_0 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat3.xy = u_xlat16_0.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat3 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat1 = u_xlat16_1 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat3;
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat16_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat3.xy = (-u_xlat16_0.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat0 = u_xlat16_0 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.x = float(0.0);
    u_xlat12.x = float(0.0);
    u_xlat2.y = u_xlat2.w;
    u_xlat1.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat12.y = (-u_xlat2.w);
    u_xlat1.xy = u_xlat12.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
UNITY_LOCATION(1) uniform mediump sampler2D _ProjectorFadeCurveLut;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
bool u_xlatb5;
bool u_xlatb10;
vec2 u_xlat11;
vec2 u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5 = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5 = max(u_xlat5, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5 = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5 + u_xlat0.x;
    u_xlat0.y = 0.5;
    u_xlat0.x = textureLod(_ProjectorFadeCurveLut, u_xlat0.xy, 0.0).x;
    u_xlat16_1 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_VariableBlurMinRatio<0.00999999978);
#else
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x<0.00999999978);
#else
    u_xlatb10 = u_xlat0.x<0.00999999978;
#endif
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat16_1;
        return;
    }
    u_xlat5 = _Offset + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5 + _VariableBlurMinRatio;
    u_xlat16_0 = u_xlat0.xxxx + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2 = u_xlat16_0 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat3.xy = u_xlat16_0.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat3 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat1 = u_xlat16_1 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat3;
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat16_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat16_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat3.xy = (-u_xlat16_0.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat0 = u_xlat16_0 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.x = float(0.0);
    u_xlat12.x = float(0.0);
    u_xlat2.y = u_xlat2.w;
    u_xlat1.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat12.y = (-u_xlat2.w);
    u_xlat1.xy = u_xlat12.xy + vs_TEXCOORD0.xy;
    u_xlat16_1 = texture(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat16_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
uniform lowp sampler2D _ProjectorFadeCurveLut;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
float u_xlat5;
bool u_xlatb5;
bool u_xlatb10;
vec2 u_xlat11;
vec2 u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5 = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5 = max(u_xlat5, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5 = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5 + u_xlat0.x;
    u_xlat0.y = 0.5;
    u_xlat0.x = texture2D(_ProjectorFadeCurveLut, u_xlat0.xy, 0.0).x;
    u_xlat10_1 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
    u_xlatb10 = u_xlat0.x<0.00999999978;
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat10_1;
        return;
    }
    u_xlat5 = _Offset + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5 + _VariableBlurMinRatio;
    u_xlat16_0 = u_xlat0.xxxx + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2 = u_xlat16_0 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat3.xy = u_xlat16_0.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat1 = u_xlat10_1 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat3;
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat10_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat3.xy = (-u_xlat16_0.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat0 = u_xlat10_0 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.x = float(0.0);
    u_xlat12.x = float(0.0);
    u_xlat2.y = u_xlat2.w;
    u_xlat1.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat12.y = (-u_xlat2.w);
    u_xlat1.xy = u_xlat12.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	float _Offset;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
uniform lowp sampler2D _ProjectorFadeCurveLut;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
float u_xlat5;
bool u_xlatb5;
bool u_xlatb10;
vec2 u_xlat11;
vec2 u_xlat12;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5 = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5 = max(u_xlat5, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5 = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5 + u_xlat0.x;
    u_xlat0.y = 0.5;
    u_xlat0.x = texture2D(_ProjectorFadeCurveLut, u_xlat0.xy, 0.0).x;
    u_xlat10_1 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
    u_xlatb10 = u_xlat0.x<0.00999999978;
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat10_1;
        return;
    }
    u_xlat5 = _Offset + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5 + _VariableBlurMinRatio;
    u_xlat16_0 = u_xlat0.xxxx + vec4(0.5, 0.5, 1.5, 1.5);
    u_xlat2 = u_xlat16_0 * _CameraProjectorMap_TexelSize.xyxy;
    u_xlat3.xy = u_xlat16_0.xy * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat3 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007);
    u_xlat1 = u_xlat10_1 * vec4(0.280000001, 0.280000001, 0.280000001, 0.280000001) + u_xlat3;
    u_xlat3 = u_xlat2.xyxy * vec4(-1.0, 1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat10_4 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat10_3 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat3.xy = (-u_xlat16_0.xy) * _CameraProjectorMap_TexelSize.xy + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat0 = u_xlat10_0 * vec4(0.180000007, 0.180000007, 0.180000007, 0.180000007) + u_xlat1;
    u_xlat1.x = u_xlat2.z;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat1.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_3 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat11.x = (-u_xlat2.z);
    u_xlat1.xy = u_xlat11.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat2.x = float(0.0);
    u_xlat12.x = float(0.0);
    u_xlat2.y = u_xlat2.w;
    u_xlat1.xy = u_xlat2.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat12.y = (-u_xlat2.w);
    u_xlat1.xy = u_xlat12.xy + vs_TEXCOORD0.xy;
    u_xlat10_1 = texture2D(_CameraProjectorMap, u_xlat1.xy);
    u_xlat0 = u_xlat10_1 * vec4(0.0799999982, 0.0799999982, 0.0799999982, 0.0799999982) + u_xlat0;
    u_xlat0 = u_xlat0 * vec4(0.75757575, 0.75757575, 0.75757575, 0.75757575);
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
SubProgram "gles3 hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
}
}
 Pass {
 Name "VariableSeparable"
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 360064
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5.x = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5.x = max(u_xlat5.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5.x + u_xlat0.x;
    u_xlat16_1 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_VariableBlurMinRatio<0.00999999978);
#else
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x<0.00999999978);
#else
    u_xlatb10 = u_xlat0.x<0.00999999978;
#endif
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat16_1;
        return;
    }
    u_xlat5.x = _GaussOffsets.x + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _VariableBlurMinRatio;
    u_xlat5.x = max(_GaussOffsets.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat5.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat0.xy = u_xlat0.xx * u_xlat5.xy;
    u_xlat2 = u_xlat0.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat2.xy);
    u_xlat3 = u_xlat16_3 * _GaussWeights.yyyy;
    u_xlat1 = u_xlat16_1 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat0.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat16_4 * _GaussWeights.yyyy + u_xlat1;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat2.zw);
    u_xlat1 = u_xlat16_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat16_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat10.xy = u_xlat0.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat10.xy);
    u_xlat1 = u_xlat16_2 * _GaussWeights.wwww + u_xlat1;
    u_xlat0.xy = (-u_xlat0.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_CameraProjectorMap, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _GaussWeights.wwww + u_xlat1;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5.x = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5.x = max(u_xlat5.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5.x + u_xlat0.x;
    u_xlat16_1 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_VariableBlurMinRatio<0.00999999978);
#else
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x<0.00999999978);
#else
    u_xlatb10 = u_xlat0.x<0.00999999978;
#endif
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat16_1;
        return;
    }
    u_xlat5.x = _GaussOffsets.x + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _VariableBlurMinRatio;
    u_xlat5.x = max(_GaussOffsets.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat5.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat0.xy = u_xlat0.xx * u_xlat5.xy;
    u_xlat2 = u_xlat0.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat2.xy);
    u_xlat3 = u_xlat16_3 * _GaussWeights.yyyy;
    u_xlat1 = u_xlat16_1 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat0.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat16_4 * _GaussWeights.yyyy + u_xlat1;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat2.zw);
    u_xlat1 = u_xlat16_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat16_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat10.xy = u_xlat0.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat10.xy);
    u_xlat1 = u_xlat16_2 * _GaussWeights.wwww + u_xlat1;
    u_xlat0.xy = (-u_xlat0.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_CameraProjectorMap, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _GaussWeights.wwww + u_xlat1;
    SV_Target0 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5.x = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5.x = max(u_xlat5.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5.x = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5.x + u_xlat0.x;
    u_xlat10_1 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
    u_xlatb10 = u_xlat0.x<0.00999999978;
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat10_1;
        return;
    }
    u_xlat5.x = _GaussOffsets.x + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _VariableBlurMinRatio;
    u_xlat5.x = max(_GaussOffsets.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat5.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat0.xy = u_xlat0.xx * u_xlat5.xy;
    u_xlat2 = u_xlat0.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat2.xy);
    u_xlat3 = u_xlat10_3 * _GaussWeights.yyyy;
    u_xlat1 = u_xlat10_1 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat0.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat10_4 * _GaussWeights.yyyy + u_xlat1;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat2.zw);
    u_xlat1 = u_xlat10_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat10_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat10.xy = u_xlat0.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat10.xy);
    u_xlat1 = u_xlat10_2 * _GaussWeights.wwww + u_xlat1;
    u_xlat0.xy = (-u_xlat0.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_CameraProjectorMap, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * _GaussWeights.wwww + u_xlat1;
    SV_Target0 = u_xlat0;
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
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5.x = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5.x = max(u_xlat5.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5.x = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5.x + u_xlat0.x;
    u_xlat10_1 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
    u_xlatb10 = u_xlat0.x<0.00999999978;
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat10_1;
        return;
    }
    u_xlat5.x = _GaussOffsets.x + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _VariableBlurMinRatio;
    u_xlat5.x = max(_GaussOffsets.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat5.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat0.xy = u_xlat0.xx * u_xlat5.xy;
    u_xlat2 = u_xlat0.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat2.xy);
    u_xlat3 = u_xlat10_3 * _GaussWeights.yyyy;
    u_xlat1 = u_xlat10_1 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat0.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat10_4 * _GaussWeights.yyyy + u_xlat1;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat2.zw);
    u_xlat1 = u_xlat10_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat10_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat10.xy = u_xlat0.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat10.xy);
    u_xlat1 = u_xlat10_2 * _GaussWeights.wwww + u_xlat1;
    u_xlat0.xy = (-u_xlat0.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_CameraProjectorMap, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * _GaussWeights.wwww + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
UNITY_LOCATION(1) uniform mediump sampler2D _ProjectorFadeCurveLut;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5.x = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5.x = max(u_xlat5.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5.x + u_xlat0.x;
    u_xlat0.y = 0.5;
    u_xlat0.x = textureLod(_ProjectorFadeCurveLut, u_xlat0.xy, 0.0).x;
    u_xlat16_1 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_VariableBlurMinRatio<0.00999999978);
#else
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x<0.00999999978);
#else
    u_xlatb10 = u_xlat0.x<0.00999999978;
#endif
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat16_1;
        return;
    }
    u_xlat5.x = _GaussOffsets.x + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _VariableBlurMinRatio;
    u_xlat5.x = max(_GaussOffsets.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat5.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat0.xy = u_xlat0.xx * u_xlat5.xy;
    u_xlat2 = u_xlat0.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat2.xy);
    u_xlat3 = u_xlat16_3 * _GaussWeights.yyyy;
    u_xlat1 = u_xlat16_1 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat0.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat16_4 * _GaussWeights.yyyy + u_xlat1;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat2.zw);
    u_xlat1 = u_xlat16_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat16_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat10.xy = u_xlat0.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat10.xy);
    u_xlat1 = u_xlat16_2 * _GaussWeights.wwww + u_xlat1;
    u_xlat0.xy = (-u_xlat0.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_CameraProjectorMap, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _GaussWeights.wwww + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
UNITY_LOCATION(0) uniform mediump sampler2D _CameraProjectorMap;
UNITY_LOCATION(1) uniform mediump sampler2D _ProjectorFadeCurveLut;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5.x = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5.x = max(u_xlat5.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5.x + u_xlat0.x;
    u_xlat0.y = 0.5;
    u_xlat0.x = textureLod(_ProjectorFadeCurveLut, u_xlat0.xy, 0.0).x;
    u_xlat16_1 = texture(_CameraProjectorMap, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_VariableBlurMinRatio<0.00999999978);
#else
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat0.x<0.00999999978);
#else
    u_xlatb10 = u_xlat0.x<0.00999999978;
#endif
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat16_1;
        return;
    }
    u_xlat5.x = _GaussOffsets.x + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _VariableBlurMinRatio;
    u_xlat5.x = max(_GaussOffsets.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat5.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat0.xy = u_xlat0.xx * u_xlat5.xy;
    u_xlat2 = u_xlat0.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_CameraProjectorMap, u_xlat2.xy);
    u_xlat3 = u_xlat16_3 * _GaussWeights.yyyy;
    u_xlat1 = u_xlat16_1 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat0.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat16_4 = texture(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat16_4 * _GaussWeights.yyyy + u_xlat1;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat2.zw);
    u_xlat1 = u_xlat16_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat16_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat10.xy = u_xlat0.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat16_2 = texture(_CameraProjectorMap, u_xlat10.xy);
    u_xlat1 = u_xlat16_2 * _GaussWeights.wwww + u_xlat1;
    u_xlat0.xy = (-u_xlat0.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_CameraProjectorMap, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * _GaussWeights.wwww + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
uniform lowp sampler2D _ProjectorFadeCurveLut;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5.x = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5.x = max(u_xlat5.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5.x = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5.x + u_xlat0.x;
    u_xlat0.y = 0.5;
    u_xlat0.x = texture2D(_ProjectorFadeCurveLut, u_xlat0.xy, 0.0).x;
    u_xlat10_1 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
    u_xlatb10 = u_xlat0.x<0.00999999978;
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat10_1;
        return;
    }
    u_xlat5.x = _GaussOffsets.x + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _VariableBlurMinRatio;
    u_xlat5.x = max(_GaussOffsets.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat5.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat0.xy = u_xlat0.xx * u_xlat5.xy;
    u_xlat2 = u_xlat0.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat2.xy);
    u_xlat3 = u_xlat10_3 * _GaussWeights.yyyy;
    u_xlat1 = u_xlat10_1 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat0.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat10_4 * _GaussWeights.yyyy + u_xlat1;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat2.zw);
    u_xlat1 = u_xlat10_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat10_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat10.xy = u_xlat0.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat10.xy);
    u_xlat1 = u_xlat10_2 * _GaussWeights.wwww + u_xlat1;
    u_xlat0.xy = (-u_xlat0.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_CameraProjectorMap, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * _GaussWeights.wwww + u_xlat1;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
uniform 	vec4 _CameraProjectorMap_TexelSize;
uniform 	vec2 _BlurDir;
uniform 	vec4 _GaussWeights;
uniform 	vec4 _GaussOffsets;
uniform 	vec4 _BlurFadeParams;
uniform 	float _VariableBlurMinRatio;
uniform 	float _ProjectorFadeReverse;
uniform lowp sampler2D _ProjectorFadeCurveLut;
uniform lowp sampler2D _CameraProjectorMap;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
lowp vec4 u_xlat10_4;
vec2 u_xlat5;
bool u_xlatb5;
vec2 u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat0.x = dot(u_xlat0.xy, _BlurFadeParams.xy);
    u_xlat0.x = u_xlat0.x + (-_BlurFadeParams.z);
    u_xlat5.x = (-_BlurFadeParams.z) + _BlurFadeParams.w;
    u_xlat5.x = max(u_xlat5.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5.x = u_xlat0.x * -2.0 + 1.0;
    u_xlat0.x = _ProjectorFadeReverse * u_xlat5.x + u_xlat0.x;
    u_xlat0.y = 0.5;
    u_xlat0.x = texture2D(_ProjectorFadeCurveLut, u_xlat0.xy, 0.0).x;
    u_xlat10_1 = texture2D(_CameraProjectorMap, vs_TEXCOORD0.xy);
    u_xlatb5 = _VariableBlurMinRatio<0.00999999978;
    u_xlatb10 = u_xlat0.x<0.00999999978;
    u_xlatb5 = u_xlatb10 && u_xlatb5;
    if(u_xlatb5){
        SV_Target0 = u_xlat10_1;
        return;
    }
    u_xlat5.x = _GaussOffsets.x + (-_VariableBlurMinRatio);
    u_xlat0.x = u_xlat0.x * u_xlat5.x + _VariableBlurMinRatio;
    u_xlat5.x = max(_GaussOffsets.x, 9.99999975e-05);
    u_xlat0.x = u_xlat0.x / u_xlat5.x;
    u_xlat5.xy = _CameraProjectorMap_TexelSize.xy * vec2(_BlurDir.x, _BlurDir.y);
    u_xlat0.xy = u_xlat0.xx * u_xlat5.xy;
    u_xlat2 = u_xlat0.xyxy * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_CameraProjectorMap, u_xlat2.xy);
    u_xlat3 = u_xlat10_3 * _GaussWeights.yyyy;
    u_xlat1 = u_xlat10_1 * _GaussWeights.xxxx + u_xlat3;
    u_xlat3 = (-u_xlat0.xyxy) * _GaussOffsets.xxyy + vs_TEXCOORD0.xyxy;
    u_xlat10_4 = texture2D(_CameraProjectorMap, u_xlat3.xy);
    u_xlat1 = u_xlat10_4 * _GaussWeights.yyyy + u_xlat1;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat2.zw);
    u_xlat1 = u_xlat10_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat3.zw);
    u_xlat1 = u_xlat10_2 * _GaussWeights.zzzz + u_xlat1;
    u_xlat10.xy = u_xlat0.xy * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat10_2 = texture2D(_CameraProjectorMap, u_xlat10.xy);
    u_xlat1 = u_xlat10_2 * _GaussWeights.wwww + u_xlat1;
    u_xlat0.xy = (-u_xlat0.xy) * _GaussOffsets.zz + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_CameraProjectorMap, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * _GaussWeights.wwww + u_xlat1;
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
SubProgram "gles3 hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "PROJECTOR_SHADOW_FADE_CURVE_LUT" }
""
}
}
}
}
}