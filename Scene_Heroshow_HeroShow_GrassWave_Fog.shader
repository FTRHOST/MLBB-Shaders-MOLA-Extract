//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Scene/Heroshow/HeroShow_GrassWave_Fog" {
Properties {

_MainTex ("主帖图(RGB)", 2D) = "white" { }

_MainMask ("主帖图(Alpha)", 2D) = "white" { }

_Cutoff ("Base Alpha cutoff", Range(0, 1)) = 0.5

[Space] _WaveAmplitude ("振幅(XYZ控制三个方向，W控制强度）", Vector) = (0,0,0,1)

_WaveFrequence ("频率(XYZ控制三个方向，W控制强度）", Vector) = (0,0,0,1)

[Header(Fog)] [MaterialToggle] _EnableCustomFog ("打开雾效", Float) = 0.0

_FogColor ("雾效颜色", Color) = (1,1,1,1)

_FogDistance ("雾效距离", Float) = 1000.0

_FogFade ("雾效衰减", Float) = 1.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
 Cull Off
  GpuProgramID 4306
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _WaveAmplitude;
uniform 	vec4 _WaveFrequence;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0.x = dot(in_POSITION0.xyz, _WaveFrequence.xyz);
    u_xlat0.x = _Time.y * _WaveFrequence.w + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xyz = _WaveAmplitude.www * _WaveAmplitude.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	float _Cutoff;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainMask;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
vec3 u_xlat3;
void main()
{
    u_xlat16_0 = texture(_MainMask, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.x = u_xlat16_0 * u_xlat16_1.w + (-_Cutoff);
    u_xlat16_2 = u_xlat16_0 * u_xlat16_1.w;
    SV_Target0.w = u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat3.x<0.0);
#else
    u_xlatb0 = u_xlat3.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat0.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _FogDistance;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3.x = max(_FogFade, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3.xyz = (-u_xlat16_1.xyz) + _FogColor.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xxx;
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _WaveAmplitude;
uniform 	vec4 _WaveFrequence;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0.x = dot(in_POSITION0.xyz, _WaveFrequence.xyz);
    u_xlat0.x = _Time.y * _WaveFrequence.w + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xyz = _WaveAmplitude.www * _WaveAmplitude.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	float _Cutoff;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainMask;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
vec3 u_xlat3;
void main()
{
    u_xlat16_0 = texture(_MainMask, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.x = u_xlat16_0 * u_xlat16_1.w + (-_Cutoff);
    u_xlat16_2 = u_xlat16_0 * u_xlat16_1.w;
    SV_Target0.w = u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat3.x<0.0);
#else
    u_xlatb0 = u_xlat3.x<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat0.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _FogDistance;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3.x = max(_FogFade, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3.xyz = (-u_xlat16_1.xyz) + _FogColor.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xxx;
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _WaveAmplitude;
uniform 	vec4 _WaveFrequence;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0.x = dot(in_POSITION0.xyz, _WaveFrequence.xyz);
    u_xlat0.x = _Time.y * _WaveFrequence.w + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xyz = _WaveAmplitude.www * _WaveAmplitude.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	float _Cutoff;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MainMask;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
vec3 u_xlat3;
void main()
{
    u_xlat10_0 = texture2D(_MainMask, vs_TEXCOORD0.xy).x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.x = u_xlat10_0 * u_xlat10_1.w + (-_Cutoff);
    u_xlat16_2 = u_xlat10_0 * u_xlat10_1.w;
    SV_Target0.w = u_xlat16_2;
    u_xlatb0 = u_xlat3.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat0.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _FogDistance;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3.x = max(_FogFade, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3.xyz = (-u_xlat10_1.xyz) + _FogColor.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xxx;
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _WaveAmplitude;
uniform 	vec4 _WaveFrequence;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0.x = dot(in_POSITION0.xyz, _WaveFrequence.xyz);
    u_xlat0.x = _Time.y * _WaveFrequence.w + u_xlat0.x;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat2.xyz = _WaveAmplitude.www * _WaveAmplitude.xyz;
    u_xlat0.xyz = u_xlat2.xyz * u_xlat0.xxx;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.www + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	float _Cutoff;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MainMask;
varying mediump vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
vec3 u_xlat3;
void main()
{
    u_xlat10_0 = texture2D(_MainMask, vs_TEXCOORD0.xy).x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.x = u_xlat10_0 * u_xlat10_1.w + (-_Cutoff);
    u_xlat16_2 = u_xlat10_0 * u_xlat10_1.w;
    SV_Target0.w = u_xlat16_2;
    u_xlatb0 = u_xlat3.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat0.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _FogDistance;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat3.x = max(_FogFade, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat3.xyz = (-u_xlat10_1.xyz) + _FogColor.xyz;
    u_xlat0.xyz = u_xlat3.xyz * u_xlat0.xxx;
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat0.xyz + u_xlat10_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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