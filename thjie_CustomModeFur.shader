//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "thjie/CustomModeFur" {
Properties {

_Color ("主颜色", Color) = (1,1,1,1)

_ColorTint ("主颜色强度", Float) = 1.0

_MainTex ("主纹理", 2D) = "white" { }

_FurTex ("毛发纹理", 2D) = "white" { }

_FurLength ("毛发长度", Range(0.05, 0.2)) = 0.15000000596046448

_HairThinness ("毛发密度", Range(1, 15)) = 10.0

_EdgeFade ("边缘渐变", Range(0, 10)) = 2.2100000381469727

[Space(20)] [Toggle] _UseLighting ("使用光照", Float) = 0.0

_ShadowColor ("阴影颜色", Color) = (1,1,1,1)

_LutTex ("LutTex", 2D) = "white" { }

_LutRate ("漫反射渐变偏移", Range(-1, 1)) = 0.0

[Space(20)] [Toggle] _UseFresnel ("使用菲涅尔", Float) = 0.0

_FresnelColor ("菲涅尔颜色", Color) = (1,1,1,1)

_FresnelPower ("菲涅尔强度", Range(1, 16)) = 0.0

_FresnelScale ("菲涅尔缩放", Range(0, 10)) = 1.0

[Space(20)] [Toggle] _UseEdgeNoise ("使用边缘噪波", Float) = 0.0

_EdgeNoiseTex ("边缘噪波纹理", 2D) = "white" { }

_EdgeNoiseStrength ("边缘噪波强度", Range(1, 1.5)) = 1.0

[Space(20)] [Toggle] _UseFlowmap ("UseFlowmap", Float) = 0.0

_FlowMap ("FlowMap", 2D) = "black" { }

_FlowSpeed ("FlowSpeed", Range(0, 20)) = 0.5

_TimeSpeed ("TimeSpeed", Range(0, 10)) = 2.0

[Toggle] _ReverseFlow ("ReverseFlow", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 63895
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
out highp vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = vec2(0.0, 0.0);
    vs_TEXCOORD2.xy = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = vec2(0.0, 0.0);
    vs_TEXCOORD2.xy = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = vec2(0.0, 0.0);
    vs_TEXCOORD2.xy = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
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

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = vec2(0.0, 0.0);
    vs_TEXCOORD2.xy = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
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
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 118645
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.00249999994;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.00249999994 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.00249999994;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.00249999994 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.00249999994;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.00249999994 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.00249999994;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.00249999994 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 180324
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.150000006, 0.150000006, 0.150000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0225000009;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0225000009 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.150000006, 0.150000006, 0.150000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0225000009;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0225000009 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.150000006, 0.150000006, 0.150000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0225000009;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0225000009 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.150000006, 0.150000006, 0.150000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0225000009;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0225000009 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 245657
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0399999991;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0399999991 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0399999991;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0399999991 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0399999991;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0399999991 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0399999991;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0399999991 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 317944
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0625;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0625 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0625;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0625 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0625;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0625 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0625;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0625 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 332687
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.300000012, 0.300000012, 0.300000012) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0900000036;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0900000036 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.300000012, 0.300000012, 0.300000012) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0900000036;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0900000036 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.300000012, 0.300000012, 0.300000012) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0900000036;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0900000036 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.300000012, 0.300000012, 0.300000012) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.0900000036;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.0900000036 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 411331
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.349999994, 0.349999994, 0.349999994) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.122500002;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.122500002 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.349999994, 0.349999994, 0.349999994) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.122500002;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.122500002 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.349999994, 0.349999994, 0.349999994) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.122500002;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.122500002 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.349999994, 0.349999994, 0.349999994) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.122500002;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.122500002 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 470957
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.159999996;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.159999996 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.159999996;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.159999996 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.159999996;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.159999996 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.159999996;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.159999996 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 578147
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.449999988, 0.449999988, 0.449999988) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.202500001;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.202500001 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
UNITY_LOCATION(4) uniform mediump sampler2D _FlowMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_UseFlowmap);
#else
    u_xlatb0 = 0.0<_UseFlowmap;
#endif
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = textureLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(0<_ReverseFlow);
#else
        u_xlatb6 = 0<_ReverseFlow;
#endif
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.449999988, 0.449999988, 0.449999988) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(3) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat4;
mediump float u_xlat16_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseLighting);
#else
    u_xlatb6 = 0.0<_UseLighting;
#endif
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat16_1.xyz = texture(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0<_UseFresnel);
#else
    u_xlatb6 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_0.x = texture(_FurTex, u_xlat0.xy).x;
    u_xlat16_2 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb4 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb4){
        u_xlat16_4 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat16_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb6 = !!(u_xlat4==0.0);
#else
        u_xlatb6 = u_xlat4==0.0;
#endif
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.202500001;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.202500001 + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
        SV_Target0.w = u_xlat16_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.449999988, 0.449999988, 0.449999988) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.202500001;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.202500001 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
uniform 	float _UseFlowmap;
uniform 	vec4 _FlowMap_ST;
uniform 	float _FlowSpeed;
uniform 	int _ReverseFlow;
uniform lowp sampler2D _FlowMap;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb6;
float u_xlat9;
void main()
{
    u_xlatb0 = 0.0<_UseFlowmap;
    if(u_xlatb0){
        u_xlat0.xy = in_TEXCOORD0.xy * _FlowMap_ST.xy + _FlowMap_ST.zw;
        u_xlat0.xy = texture2DLod(_FlowMap, u_xlat0.xy, 0.0).xy;
        u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
        u_xlat0.xy = u_xlat0.xy * vec2(_FlowSpeed);
        u_xlatb6 = 0<_ReverseFlow;
        u_xlat0.xy = (bool(u_xlatb6)) ? (-u_xlat0.xy) : u_xlat0.xy;
        u_xlat0.z = 0.0;
        u_xlat0.xyz = u_xlat0.xyz + in_NORMAL0.xyz;
        u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat9 = inversesqrt(u_xlat9);
        u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    } else {
        u_xlat0.xyz = in_NORMAL0.xyz;
    }
    u_xlat0.xyz = u_xlat0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.449999988, 0.449999988, 0.449999988) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat1.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat1.xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    vs_TEXCOORD3.xyz = vec3(u_xlat9) * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 _Color;
uniform 	mediump float _ColorTint;
uniform 	float _EdgeFade;
uniform 	float _HairThinness;
uniform 	float _UseLighting;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform 	float _LutRate;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _LutTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
lowp float u_xlat10_2;
float u_xlat4;
lowp float u_xlat10_4;
bool u_xlatb4;
float u_xlat6;
bool u_xlatb6;
float u_xlat7;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb6 = 0.0<_UseLighting;
    if(u_xlatb6){
        u_xlat6 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
        u_xlat6 = inversesqrt(u_xlat6);
        u_xlat1.xyz = vec3(u_xlat6) * _WorldSpaceLightPos0.xyz;
        u_xlat6 = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
        u_xlat6 = u_xlat6 * 0.5 + 0.5;
        u_xlat1.x = (-_LutRate) + 1.0;
        u_xlat6 = log2(u_xlat6);
        u_xlat6 = u_xlat6 * u_xlat1.x;
        u_xlat6 = exp2(u_xlat6);
        u_xlat1.x = min(u_xlat6, 1.0);
        u_xlat1.y = 0.5;
        u_xlat10_1.xyz = texture2D(_LutTex, u_xlat1.xy).xyz;
        u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    }
    u_xlatb6 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    SV_Target0.xyz = (bool(u_xlatb6)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_0.x = texture2D(_FurTex, u_xlat0.xy).x;
    u_xlat10_2 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb4 = 0.0<_UseEdgeNoise;
    if(u_xlatb4){
        u_xlat10_4 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat4 = (-u_xlat10_4) + 1.0;
        u_xlat4 = u_xlat4 * _EdgeNoiseStrength;
        u_xlatb6 = u_xlat4==0.0;
        u_xlat4 = (u_xlatb6) ? 1.0 : u_xlat4;
        u_xlat6 = _EdgeFade * 0.202500001;
        u_xlat4 = u_xlat4 * u_xlat4;
        u_xlat4 = (-u_xlat6) * u_xlat4 + u_xlat10_0.x;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat4;
    } else {
        u_xlat0.x = (-_EdgeFade) * 0.202500001 + u_xlat10_0.x;
        u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
        SV_Target0.w = u_xlat10_2 * u_xlat0.x;
    }
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