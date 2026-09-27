//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "thjie/NewFurBasic8Layer" {
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

[Space(20)] [Toggle] _UseFresnel ("使用菲涅尔", Float) = 0.0

_FresnelColor ("菲涅尔颜色", Color) = (1,1,1,1)

_FresnelPower ("菲涅尔强度", Range(1, 16)) = 0.0

_FresnelScale ("菲涅尔缩放", Range(0, 10)) = 1.0

[Space(20)] [Toggle] _UseEdgeNoise ("使用边缘噪波", Float) = 0.0

_EdgeNoiseTex ("边缘噪波纹理", 2D) = "white" { }

_EdgeNoiseStrength ("边缘噪波强度", Range(1, 1.5)) = 1.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 25452
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
  GpuProgramID 67904
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.00249999994;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.00249999994 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.00249999994;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.00249999994 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.00249999994;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.00249999994 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0500000007, 0.0500000007, 0.0500000007) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.00249999994;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.00249999994 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
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
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 153450
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.150000006, 0.150000006, 0.150000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0225000009;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0225000009 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.150000006, 0.150000006, 0.150000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0225000009;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0225000009 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.150000006, 0.150000006, 0.150000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0225000009;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0225000009 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.150000006, 0.150000006, 0.150000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0225000009;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0225000009 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
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
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 261478
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0399999991;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0399999991 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0399999991;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0399999991 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0399999991;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0399999991 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.200000003, 0.200000003, 0.200000003) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0399999991;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0399999991 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
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
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 301664
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0625;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0625 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0625;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0625 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0625;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0625 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0625;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0625 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
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
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 331403
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.300000012, 0.300000012, 0.300000012) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0900000036;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0900000036 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.300000012, 0.300000012, 0.300000012) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0900000036;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0900000036 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.300000012, 0.300000012, 0.300000012) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0900000036;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0900000036 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.300000012, 0.300000012, 0.300000012) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.0900000036;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.0900000036 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
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
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 436190
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.349999994, 0.349999994, 0.349999994) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.122500002;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.122500002 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.349999994, 0.349999994, 0.349999994) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.122500002;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.122500002 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.349999994, 0.349999994, 0.349999994) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.122500002;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.122500002 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.349999994, 0.349999994, 0.349999994) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.122500002;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.122500002 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
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
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 487903
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.159999996;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.159999996 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.159999996;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.159999996 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.159999996;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.159999996 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.400000006, 0.400000006, 0.400000006) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.159999996;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.159999996 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
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
}
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 532790
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.449999988, 0.449999988, 0.449999988) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.202500001;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.202500001 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.449999988, 0.449999988, 0.449999988) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FurTex;
UNITY_LOCATION(2) uniform mediump sampler2D _EdgeNoiseTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec2 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat4;
mediump float u_xlat16_4;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseLighting);
#else
    u_xlatb9 = 0.0<_UseLighting;
#endif
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.0<_UseFresnel);
#else
    u_xlatb9 = 0.0<_UseFresnel;
#endif
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat16_1 = texture(_FurTex, u_xlat1.xy).x;
    u_xlat16_4 = texture(_FurTex, vs_TEXCOORD0.xy).y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.0<_UseEdgeNoise);
#else
    u_xlatb7 = 0.0<_UseEdgeNoise;
#endif
    if(u_xlatb7){
        u_xlat16_7 = texture(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat16_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat7==0.0);
#else
        u_xlatb10 = u_xlat7==0.0;
#endif
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.202500001;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.202500001 + u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
        u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
        u_xlat0.w = u_xlat16_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.449999988, 0.449999988, 0.449999988) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.202500001;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.202500001 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	mediump vec4 unity_SHAr;
uniform 	mediump vec4 unity_SHAg;
uniform 	mediump vec4 unity_SHAb;
uniform 	mediump vec4 unity_SHBr;
uniform 	mediump vec4 unity_SHBg;
uniform 	mediump vec4 unity_SHBb;
uniform 	mediump vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _LightColor0;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _FurTex_ST;
uniform 	float _FurLength;
uniform 	vec4 _EdgeNoiseTex_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * vec3(_FurLength);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.449999988, 0.449999988, 0.449999988) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _FurTex_ST.xy + _FurTex_ST.zw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _EdgeNoiseTex_ST.xy + _EdgeNoiseTex_ST.zw;
    u_xlat0.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat16_2.x = u_xlat0.y * u_xlat0.y;
    u_xlat16_2.x = u_xlat0.x * u_xlat0.x + (-u_xlat16_2.x);
    u_xlat16_1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat16_3.x = dot(unity_SHBr, u_xlat16_1);
    u_xlat16_3.y = dot(unity_SHBg, u_xlat16_1);
    u_xlat16_3.z = dot(unity_SHBb, u_xlat16_1);
    u_xlat16_2.xyz = unity_SHC.xyz * u_xlat16_2.xxx + u_xlat16_3.xyz;
    u_xlat0.w = 1.0;
    u_xlat16_3.x = dot(unity_SHAr, u_xlat0);
    u_xlat16_3.y = dot(unity_SHAg, u_xlat0);
    u_xlat16_3.z = dot(unity_SHAb, u_xlat0);
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat4.xyz = log2(u_xlat16_2.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat18 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat5.xyz = vec3(u_xlat18) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    vs_TEXCOORD5.xyz = _LightColor0.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.x = u_xlat0.x * _LightColor0.w;
    vs_TEXCOORD5.w = u_xlat0.x;
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
uniform 	vec4 _ShadowColor;
uniform 	float _UseFresnel;
uniform 	vec4 _FresnelColor;
uniform 	float _FresnelPower;
uniform 	float _FresnelScale;
uniform 	float _UseEdgeNoise;
uniform 	float _EdgeNoiseStrength;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurTex;
uniform lowp sampler2D _EdgeNoiseTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat4;
lowp float u_xlat10_4;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
bool u_xlatb9;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_ColorTint);
    u_xlatb9 = 0.0<_UseLighting;
    u_xlat1.x = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _WorldSpaceLightPos0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = u_xlat1.x * 0.5 + 0.5;
    u_xlat4.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat4.xyz + _ShadowColor.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb9 = 0.0<_UseFresnel;
    u_xlat1.xyz = (-vs_TEXCOORD4.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _FresnelPower;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * _FresnelColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_FresnelScale, _FresnelScale, _FresnelScale)) + u_xlat0.xyz;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * vec2(vec2(_HairThinness, _HairThinness));
    u_xlat10_1 = texture2D(_FurTex, u_xlat1.xy).x;
    u_xlat10_4 = texture2D(_FurTex, vs_TEXCOORD0.xy).y;
    u_xlatb7 = 0.0<_UseEdgeNoise;
    if(u_xlatb7){
        u_xlat10_7 = texture2D(_EdgeNoiseTex, vs_TEXCOORD2.xy).x;
        u_xlat7 = (-u_xlat10_7) + 1.0;
        u_xlat7 = u_xlat7 * _EdgeNoiseStrength;
        u_xlatb10 = u_xlat7==0.0;
        u_xlat7 = (u_xlatb10) ? 1.0 : u_xlat7;
        u_xlat10 = _EdgeFade * 0.202500001;
        u_xlat7 = u_xlat7 * u_xlat7;
        u_xlat7 = (-u_xlat10) * u_xlat7 + u_xlat10_1;
        u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat7;
    } else {
        u_xlat1.x = (-_EdgeFade) * 0.202500001 + u_xlat10_1;
        u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
        u_xlat0.w = u_xlat10_4 * u_xlat1.x;
    }
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
}
}
}
}