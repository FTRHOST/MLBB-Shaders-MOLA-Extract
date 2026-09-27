//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/SpaceDistort_MultiGrab" {
Properties {

[Space(5)] [Header(coord1.xy_NoiseTexOffset __ coord1.zw_MaskOffset __ coord2.xy_NoiseSpeedXY  __ coord2.z_MaskSharpness)] [Toggle(_ENABLE_CUSTOMDATA)] _EnableCustomData ("开启CustomData控制", Float) = 0.0

[Space(5)] [Enum(Off,0,On,1)] _ZWrite ("ZWrite", Float) = 0.0

[Enum(On,0,Off,4)] _ZTest ("总是在前", Float) = 4.0

[Space(5)] [Header(R channel)] _NoiseTex ("NoiseTex", 2D) = "black" { }

[Toggle(_NOISE_POLAR_UV)] _NoisePolarUV ("Noise开启极坐标", Float) = 0.0

[Header(vertexColor.a_NoiseStrength)] _NoiseStrength ("NoiseStrength", Range(0, 10)) = 1.0

_NoiseSpeedX ("NoiseSpeedX", Range(-2, 2)) = 0.0

_NoiseSpeedY ("NoiseSpeedY", Range(-2, 2)) = 0.0

[Space(5)] _MaskTex ("Mask", 2D) = "white" { }

[Toggle(_MASK_POLAR_UV)] _MaskPolarUV ("Mask开启极坐标", Float) = 0.0

_Sharpness ("Sharpness", Range(1, 128)) = 1.0

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 GrabPass {
}
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 50418
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
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
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec2 u_xlat16_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_1.x = texture(_MaskTex, u_xlat16_0.xy).x;
    u_xlat1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Sharpness;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_0.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_0.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat1.xy;
    u_xlat16_1.x = texture(_NoiseTex, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1.x + -0.5;
    u_xlat1.xy = u_xlat1.xx * u_xlat16_0.xx + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy / vs_TEXCOORD0.ww;
    u_xlat16_1.xyz = texture(_GrabTexture, u_xlat1.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
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
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec2 u_xlat16_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_1.x = texture(_MaskTex, u_xlat16_0.xy).x;
    u_xlat1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Sharpness;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_0.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_0.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat1.xy;
    u_xlat16_1.x = texture(_NoiseTex, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1.x + -0.5;
    u_xlat1.xy = u_xlat1.xx * u_xlat16_0.xx + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy / vs_TEXCOORD0.ww;
    u_xlat16_1.xyz = texture(_GrabTexture, u_xlat1.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_1.x = texture2D(_MaskTex, u_xlat16_0.xy).x;
    u_xlat1.x = max(u_xlat10_1.x, 9.99999975e-05);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Sharpness;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_0.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_0.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat1.xy;
    u_xlat10_1.x = texture2D(_NoiseTex, u_xlat1.xy).x;
    u_xlat1.x = u_xlat10_1.x + -0.5;
    u_xlat1.xy = u_xlat1.xx * u_xlat16_0.xx + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy / vs_TEXCOORD0.ww;
    u_xlat10_1.xyz = texture2D(_GrabTexture, u_xlat1.xy).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
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
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_1.x = texture2D(_MaskTex, u_xlat16_0.xy).x;
    u_xlat1.x = max(u_xlat10_1.x, 9.99999975e-05);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _Sharpness;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_0.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_0.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat1.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat1.xy;
    u_xlat10_1.x = texture2D(_NoiseTex, u_xlat1.xy).x;
    u_xlat1.x = u_xlat10_1.x + -0.5;
    u_xlat1.xy = u_xlat1.xx * u_xlat16_0.xx + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy / vs_TEXCOORD0.ww;
    u_xlat10_1.xyz = texture2D(_GrabTexture, u_xlat1.xy).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_MASK_POLAR_UV" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
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
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0.x = texture(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat16_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sharpness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_MASK_POLAR_UV" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
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
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0.x = texture(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat16_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sharpness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_MASK_POLAR_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0.x = texture2D(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat10_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sharpness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_MASK_POLAR_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0.x = texture2D(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat10_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sharpness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_NOISE_POLAR_UV" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
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
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat0.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_3 = texture(_MaskTex, u_xlat16_2.xy).x;
    u_xlat3 = max(u_xlat16_3, 9.99999975e-05);
    u_xlat3 = log2(u_xlat3);
    u_xlat3 = u_xlat3 * _Sharpness;
    u_xlat3 = exp2(u_xlat3);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat3 * u_xlat16_2.x;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_NOISE_POLAR_UV" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
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
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat0.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_3 = texture(_MaskTex, u_xlat16_2.xy).x;
    u_xlat3 = max(u_xlat16_3, 9.99999975e-05);
    u_xlat3 = log2(u_xlat3);
    u_xlat3 = u_xlat3 * _Sharpness;
    u_xlat3 = exp2(u_xlat3);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat3 * u_xlat16_2.x;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_NOISE_POLAR_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
float u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat0.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_3 = texture2D(_MaskTex, u_xlat16_2.xy).x;
    u_xlat3 = max(u_xlat10_3, 9.99999975e-05);
    u_xlat3 = log2(u_xlat3);
    u_xlat3 = u_xlat3 * _Sharpness;
    u_xlat3 = exp2(u_xlat3);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat3 * u_xlat16_2.x;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_NOISE_POLAR_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
float u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat0.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_3 = texture2D(_MaskTex, u_xlat16_2.xy).x;
    u_xlat3 = max(u_xlat10_3, 9.99999975e-05);
    u_xlat3 = log2(u_xlat3);
    u_xlat3 = u_xlat3 * _Sharpness;
    u_xlat3 = exp2(u_xlat3);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat3 * u_xlat16_2.x;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
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
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0.x = texture(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat16_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sharpness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat0.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
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
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0.x = texture(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat16_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sharpness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat0.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0.x = texture2D(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat10_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sharpness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat0.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0.x = texture2D(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat10_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Sharpness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat0.xy = _Time.yy * vec2(_NoiseSpeedX, _NoiseSpeedY) + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec2 u_xlat16_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_1.x = texture(_MaskTex, u_xlat16_0.xy).x;
    u_xlat1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat16_0.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_0.x = u_xlat16_0.x + _Sharpness;
    u_xlat1.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_0.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_0.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat1.xy = _Time.yy * u_xlat16_2.xy + u_xlat1.xy;
    u_xlat16_1.x = texture(_NoiseTex, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1.x + -0.5;
    u_xlat1.xy = u_xlat1.xx * u_xlat16_0.xx + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy / vs_TEXCOORD0.ww;
    u_xlat16_1.xyz = texture(_GrabTexture, u_xlat1.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec2 u_xlat16_0;
vec2 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_1.x = texture(_MaskTex, u_xlat16_0.xy).x;
    u_xlat1.x = max(u_xlat16_1.x, 9.99999975e-05);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat16_0.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_0.x = u_xlat16_0.x + _Sharpness;
    u_xlat1.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_0.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_0.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat1.xy = _Time.yy * u_xlat16_2.xy + u_xlat1.xy;
    u_xlat16_1.x = texture(_NoiseTex, u_xlat1.xy).x;
    u_xlat1.x = u_xlat16_1.x + -0.5;
    u_xlat1.xy = u_xlat1.xx * u_xlat16_0.xx + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy / vs_TEXCOORD0.ww;
    u_xlat16_1.xyz = texture(_GrabTexture, u_xlat1.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_1.x = texture2D(_MaskTex, u_xlat16_0.xy).x;
    u_xlat1.x = max(u_xlat10_1.x, 9.99999975e-05);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat16_0.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_0.x = u_xlat16_0.x + _Sharpness;
    u_xlat1.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_0.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_0.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat1.xy = _Time.yy * u_xlat16_2.xy + u_xlat1.xy;
    u_xlat10_1.x = texture2D(_NoiseTex, u_xlat1.xy).x;
    u_xlat1.x = u_xlat10_1.x + -0.5;
    u_xlat1.xy = u_xlat1.xx * u_xlat16_0.xx + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy / vs_TEXCOORD0.ww;
    u_xlat10_1.xyz = texture2D(_GrabTexture, u_xlat1.xy).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec2 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec2 u_xlat16_2;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_1.x = texture2D(_MaskTex, u_xlat16_0.xy).x;
    u_xlat1.x = max(u_xlat10_1.x, 9.99999975e-05);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat16_0.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_0.x = u_xlat16_0.x + _Sharpness;
    u_xlat1.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_0.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_0.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat1.xy = _Time.yy * u_xlat16_2.xy + u_xlat1.xy;
    u_xlat10_1.x = texture2D(_NoiseTex, u_xlat1.xy).x;
    u_xlat1.x = u_xlat10_1.x + -0.5;
    u_xlat1.xy = u_xlat1.xx * u_xlat16_0.xx + vs_TEXCOORD0.xy;
    u_xlat1.xy = u_xlat1.xy / vs_TEXCOORD0.ww;
    u_xlat10_1.xyz = texture2D(_GrabTexture, u_xlat1.xy).xyz;
    SV_Target0.xyz = u_xlat10_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
mediump vec2 u_xlat16_5;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0.x = texture(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat16_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_2.x = u_xlat16_2.x + _Sharpness;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = _Time.yy * u_xlat16_5.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
mediump vec2 u_xlat16_5;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0.x = texture(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat16_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_2.x = u_xlat16_2.x + _Sharpness;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = _Time.yy * u_xlat16_5.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
mediump vec2 u_xlat16_5;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0.x = texture2D(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat10_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_2.x = u_xlat16_2.x + _Sharpness;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = _Time.yy * u_xlat16_5.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
mediump vec2 u_xlat16_5;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0.x = texture2D(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat10_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_2.x = u_xlat16_2.x + _Sharpness;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = _Time.yy * u_xlat16_5.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_NOISE_POLAR_UV" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = _Time.yy * u_xlat16_2.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_3 = texture(_MaskTex, u_xlat16_2.xy).x;
    u_xlat3 = max(u_xlat16_3, 9.99999975e-05);
    u_xlat3 = log2(u_xlat3);
    u_xlat16_2.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_2.x = u_xlat16_2.x + _Sharpness;
    u_xlat3 = u_xlat3 * u_xlat16_2.x;
    u_xlat3 = exp2(u_xlat3);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat3 * u_xlat16_2.x;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_NOISE_POLAR_UV" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = _Time.yy * u_xlat16_2.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_3 = texture(_MaskTex, u_xlat16_2.xy).x;
    u_xlat3 = max(u_xlat16_3, 9.99999975e-05);
    u_xlat3 = log2(u_xlat3);
    u_xlat16_2.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_2.x = u_xlat16_2.x + _Sharpness;
    u_xlat3 = u_xlat3 * u_xlat16_2.x;
    u_xlat3 = exp2(u_xlat3);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat3 * u_xlat16_2.x;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_NOISE_POLAR_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
float u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = _Time.yy * u_xlat16_2.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_3 = texture2D(_MaskTex, u_xlat16_2.xy).x;
    u_xlat3 = max(u_xlat10_3, 9.99999975e-05);
    u_xlat3 = log2(u_xlat3);
    u_xlat16_2.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_2.x = u_xlat16_2.x + _Sharpness;
    u_xlat3 = u_xlat3 * u_xlat16_2.x;
    u_xlat3 = exp2(u_xlat3);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat3 * u_xlat16_2.x;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_NOISE_POLAR_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
float u_xlat3;
lowp float u_xlat10_3;
bool u_xlatb4;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = _Time.yy * u_xlat16_2.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_3 = texture2D(_MaskTex, u_xlat16_2.xy).x;
    u_xlat3 = max(u_xlat10_3, 9.99999975e-05);
    u_xlat3 = log2(u_xlat3);
    u_xlat16_2.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_2.x = u_xlat16_2.x + _Sharpness;
    u_xlat3 = u_xlat3 * u_xlat16_2.x;
    u_xlat3 = exp2(u_xlat3);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat3 * u_xlat16_2.x;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
mediump vec2 u_xlat16_5;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0.x = texture(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat16_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_2.x = u_xlat16_2.x + _Sharpness;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = _Time.yy * u_xlat16_5.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTexture;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
mediump vec2 u_xlat16_5;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat16_0.x = texture(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat16_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_2.x = u_xlat16_2.x + _Sharpness;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat0.y)<abs(u_xlat0.x));
#else
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
#endif
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat0.y<(-u_xlat0.y));
#else
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
#endif
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat9<(-u_xlat9));
#else
    u_xlatb9 = u_xlat9<(-u_xlat9);
#endif
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1>=(-u_xlat1));
#else
    u_xlatb1 = u_xlat1>=(-u_xlat1);
#endif
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = _Time.yy * u_xlat16_5.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
mediump vec2 u_xlat16_5;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0.x = texture2D(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat10_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_2.x = u_xlat16_2.x + _Sharpness;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = _Time.yy * u_xlat16_5.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy + in_TEXCOORD1.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec3 u_xlat10_0;
float u_xlat1;
bool u_xlatb1;
mediump vec2 u_xlat16_2;
bool u_xlatb4;
mediump vec2 u_xlat16_5;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_2.xy = u_xlat0.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat10_0.x = texture2D(_MaskTex, u_xlat16_2.xy).x;
    u_xlat0.x = max(u_xlat10_0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat16_2.x = max(vs_TEXCOORD2.z, 0.0);
    u_xlat16_2.x = u_xlat16_2.x + _Sharpness;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat16_2.x = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat0.xy = vs_TEXCOORD1.yx * _NoiseTex_ST.yx + _NoiseTex_ST.wz;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat9 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat9 = u_xlat6 * u_xlat6;
    u_xlat1 = u_xlat9 * 0.0208350997 + -0.0851330012;
    u_xlat1 = u_xlat9 * u_xlat1 + 0.180141002;
    u_xlat1 = u_xlat9 * u_xlat1 + -0.330299497;
    u_xlat9 = u_xlat9 * u_xlat1 + 0.999866009;
    u_xlat1 = u_xlat9 * u_xlat6;
    u_xlat1 = u_xlat1 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat1 = u_xlatb4 ? u_xlat1 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat9 + u_xlat1;
    u_xlatb9 = u_xlat0.y<(-u_xlat0.y);
    u_xlat9 = u_xlatb9 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat9 + u_xlat6;
    u_xlat9 = min(u_xlat0.y, u_xlat0.x);
    u_xlatb9 = u_xlat9<(-u_xlat9);
    u_xlat1 = max(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlatb1 = u_xlat1>=(-u_xlat1);
    u_xlatb9 = u_xlatb9 && u_xlatb1;
    u_xlat6 = (u_xlatb9) ? (-u_xlat6) : u_xlat6;
    u_xlat0.y = u_xlat6 * 0.159154937;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = _Time.yy * u_xlat16_5.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
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
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_MASK_POLAR_UV" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_MASK_POLAR_UV" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_MASK_POLAR_UV" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_MASK_POLAR_UV" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_NOISE_POLAR_UV" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_NOISE_POLAR_UV" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_NOISE_POLAR_UV" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_NOISE_POLAR_UV" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_NOISE_POLAR_UV" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_NOISE_POLAR_UV" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_NOISE_POLAR_UV" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_NOISE_POLAR_UV" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ENABLE_CUSTOMDATA" "_MASK_POLAR_UV" "_NOISE_POLAR_UV" }
""
}
}
}
}
}