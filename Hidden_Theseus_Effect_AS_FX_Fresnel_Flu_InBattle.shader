//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/Effect/AS_FX_Fresnel_Flu_InBattle" {
Properties {

_Usage ("仅能用于Theseus工艺的皮肤特效", Float) = 1.0

_MainColorPower ("MainColorPower", Float) = 0.0

_MainColor ("MainColor", Color) = (0,0,0,0)

_MainTex ("MainTex", 2D) = "white" { }

_BackPower ("BackPower", Float) = 2.0

_BackColor ("BackColor", Color) = (0,0,0,0)

_FresnelPower ("FresnelPower", Float) = 0.0

_FresnelScale ("FresnelScale", Float) = 1.0

_FresnelColor ("FresnelColor", Color) = (0,0,0,0)

_Mask ("Mask(R:菲涅尔)(G:流光)(B:透明区域)", 2D) = "white" { }

_Mask_B_Alpha ("Mask_B_Alpha", Range(0, 1)) = 1.0

_Alpha ("Alpha", Range(0, 1)) = 1.0

[Enum(2U,0,ScreenUV,1)] _Flu_UV ("Flu_UV", Float) = 0.0

_Flu_Tex ("Flu_Tex", 2D) = "black" { }

_Flu_Color ("Flu_Color", Color) = (1,1,1,1)

_Flu_Speed_U ("Flu_Speed_U", Float) = 0.0

_Flu_Speed_V ("Flu_Speed_V", Float) = 0.0

_Flu_Power ("Flu_Power", Float) = 1.0

}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 52819
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _BackColor;
uniform 	mediump float _BackPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Alpha;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Flu_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_1 = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat5.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV);
#endif
    u_xlat5.xy = (bool(u_xlatb15)) ? u_xlat5.xy : vs_TEXCOORD1.xy;
    u_xlat15 = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat5.y * 10.0 + u_xlat15;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat5.x;
    u_xlat16_6.xy = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_5.xyz = texture(_Flu_Tex, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _Flu_Color.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power));
    u_xlat16_3.xyz = u_xlat0.xxx * _FresnelColor.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_5.xyz = texture(_Mask, u_xlat5.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xxx * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_5.yyy + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.www * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_1) + u_xlat16_6.xyz;
    u_xlat16_1 = u_xlat16_5.z + _Mask_B_Alpha;
    u_xlat16_1 = u_xlat16_5.z * u_xlat16_1;
    u_xlat16_1 = u_xlat16_2.w * u_xlat16_1;
    u_xlat16_6.x = u_xlat16_1 * _Alpha;
    u_xlat16_6.x = u_xlat16_6.x * _MainColor.w;
    u_xlat16_1 = u_xlat16_1 * _Alpha + (-u_xlat16_6.x);
    SV_Target0.w = u_xlat0.x * u_xlat16_1 + u_xlat16_6.x;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _BackColor;
uniform 	mediump float _BackPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Alpha;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Flu_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_1 = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat5.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV);
#endif
    u_xlat5.xy = (bool(u_xlatb15)) ? u_xlat5.xy : vs_TEXCOORD1.xy;
    u_xlat15 = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat5.y * 10.0 + u_xlat15;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat5.x;
    u_xlat16_6.xy = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_5.xyz = texture(_Flu_Tex, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * _Flu_Color.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power));
    u_xlat16_3.xyz = u_xlat0.xxx * _FresnelColor.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_5.xyz = texture(_Mask, u_xlat5.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.xxx * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_5.yyy + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.www * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_1) + u_xlat16_6.xyz;
    u_xlat16_1 = u_xlat16_5.z + _Mask_B_Alpha;
    u_xlat16_1 = u_xlat16_5.z * u_xlat16_1;
    u_xlat16_1 = u_xlat16_2.w * u_xlat16_1;
    u_xlat16_6.x = u_xlat16_1 * _Alpha;
    u_xlat16_6.x = u_xlat16_6.x * _MainColor.w;
    u_xlat16_1 = u_xlat16_1 * _Alpha + (-u_xlat16_6.x);
    SV_Target0.w = u_xlat0.x * u_xlat16_1 + u_xlat16_6.x;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _BackColor;
uniform 	mediump float _BackPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Alpha;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_1 = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat5.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV);
    u_xlat5.xy = (bool(u_xlatb15)) ? u_xlat5.xy : vs_TEXCOORD1.xy;
    u_xlat15 = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat5.y * 10.0 + u_xlat15;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat5.x;
    u_xlat16_6.xy = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_5.xyz = texture2D(_Flu_Tex, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_5.xyz * _Flu_Color.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power));
    u_xlat16_3.xyz = u_xlat0.xxx * _FresnelColor.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_5.xyz = texture2D(_Mask, u_xlat5.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_5.xxx * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat10_2.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_5.yyy + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.www * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_1) + u_xlat16_6.xyz;
    u_xlat16_1 = u_xlat10_5.z + _Mask_B_Alpha;
    u_xlat16_1 = u_xlat10_5.z * u_xlat16_1;
    u_xlat16_1 = u_xlat10_2.w * u_xlat16_1;
    u_xlat16_6.x = u_xlat16_1 * _Alpha;
    u_xlat16_6.x = u_xlat16_6.x * _MainColor.w;
    u_xlat16_1 = u_xlat16_1 * _Alpha + (-u_xlat16_6.x);
    SV_Target0.w = u_xlat0.x * u_xlat16_1 + u_xlat16_6.x;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _BackColor;
uniform 	mediump float _BackPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Alpha;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump float u_xlat16_1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_1 = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat5.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV);
    u_xlat5.xy = (bool(u_xlatb15)) ? u_xlat5.xy : vs_TEXCOORD1.xy;
    u_xlat15 = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat5.y * 10.0 + u_xlat15;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat5.x;
    u_xlat16_6.xy = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_5.xyz = texture2D(_Flu_Tex, u_xlat16_6.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_5.xyz * _Flu_Color.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power));
    u_xlat16_3.xyz = u_xlat0.xxx * _FresnelColor.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_5.xyz = texture2D(_Mask, u_xlat5.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_5.xxx * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat10_2.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_3.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat10_5.yyy + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.www * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_1) + u_xlat16_6.xyz;
    u_xlat16_1 = u_xlat10_5.z + _Mask_B_Alpha;
    u_xlat16_1 = u_xlat10_5.z * u_xlat16_1;
    u_xlat16_1 = u_xlat10_2.w * u_xlat16_1;
    u_xlat16_6.x = u_xlat16_1 * _Alpha;
    u_xlat16_6.x = u_xlat16_6.x * _MainColor.w;
    u_xlat16_1 = u_xlat16_1 * _Alpha + (-u_xlat16_6.x);
    SV_Target0.w = u_xlat0.x * u_xlat16_1 + u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _BackColor;
uniform 	mediump float _BackPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Alpha;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Flu_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_1.x = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat6.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV);
#endif
    u_xlat6.xy = (bool(u_xlatb18)) ? u_xlat6.xy : vs_TEXCOORD1.xy;
    u_xlat18 = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat6.y * 10.0 + u_xlat18;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat6.x;
    u_xlat16_7.xy = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_6.xyz = texture(_Flu_Tex, u_xlat16_7.xy).xyz;
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat2.xyz;
    u_xlat16_7.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat16_7.xyz = u_xlat6.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power));
    u_xlat16_3.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_6.xyz = texture(_Mask, u_xlat6.xy).xyz;
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyw = u_xlat16_6.xyz * u_xlat2.xyz;
    u_xlat16_21 = u_xlat16_6.z * u_xlat2.z + _Mask_B_Alpha;
    u_xlat16_21 = u_xlat2.w * u_xlat16_21;
    u_xlat16_3.xyz = u_xlat2.xxx * u_xlat16_3.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_4.w;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat6.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat2.yyy + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _BackColor.www;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat16_1.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat16_1.x = u_xlat16_21 * _Alpha;
    u_xlat16_1.x = u_xlat16_1.x * _MainColor.w;
    u_xlat16_7.x = u_xlat16_21 * _Alpha + (-u_xlat16_1.x);
    SV_Target0.w = u_xlat0.x * u_xlat16_7.x + u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in mediump vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _BackColor;
uniform 	mediump float _BackPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Alpha;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Flu_Tex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_1.x = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat6.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV);
#endif
    u_xlat6.xy = (bool(u_xlatb18)) ? u_xlat6.xy : vs_TEXCOORD1.xy;
    u_xlat18 = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat6.y * 10.0 + u_xlat18;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat6.x;
    u_xlat16_7.xy = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_6.xyz = texture(_Flu_Tex, u_xlat16_7.xy).xyz;
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_6.xyz * u_xlat2.xyz;
    u_xlat16_7.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat16_7.xyz = u_xlat6.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power));
    u_xlat16_3.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_6.xyz = texture(_Mask, u_xlat6.xy).xyz;
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyw = u_xlat16_6.xyz * u_xlat2.xyz;
    u_xlat16_21 = u_xlat16_6.z * u_xlat2.z + _Mask_B_Alpha;
    u_xlat16_21 = u_xlat2.w * u_xlat16_21;
    u_xlat16_3.xyz = u_xlat2.xxx * u_xlat16_3.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_4.xyz;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_4.w;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat6.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat2.yyy + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _BackColor.www;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat16_1.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat16_1.x = u_xlat16_21 * _Alpha;
    u_xlat16_1.x = u_xlat16_1.x * _MainColor.w;
    u_xlat16_7.x = u_xlat16_21 * _Alpha + (-u_xlat16_1.x);
    SV_Target0.w = u_xlat0.x * u_xlat16_7.x + u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _BackColor;
uniform 	mediump float _BackPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Alpha;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_1.x = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat6.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV);
    u_xlat6.xy = (bool(u_xlatb18)) ? u_xlat6.xy : vs_TEXCOORD1.xy;
    u_xlat18 = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat6.y * 10.0 + u_xlat18;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat6.x;
    u_xlat16_7.xy = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_6.xyz = texture2D(_Flu_Tex, u_xlat16_7.xy).xyz;
    u_xlat2.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat10_6.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat2.xyz;
    u_xlat16_7.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat16_7.xyz = u_xlat6.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power));
    u_xlat16_3.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_6.xyz = texture2D(_Mask, u_xlat6.xy).xyz;
    u_xlat2.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat10_6.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyw = u_xlat10_6.xyz * u_xlat2.xyz;
    u_xlat16_21 = u_xlat10_6.z * u_xlat2.z + _Mask_B_Alpha;
    u_xlat16_21 = u_xlat2.w * u_xlat16_21;
    u_xlat16_3.xyz = u_xlat2.xxx * u_xlat16_3.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_4 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat10_4.xyz;
    u_xlat16_21 = u_xlat16_21 * u_xlat10_4.w;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat6.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat2.yyy + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _BackColor.www;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat16_1.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat16_1.x = u_xlat16_21 * _Alpha;
    u_xlat16_1.x = u_xlat16_1.x * _MainColor.w;
    u_xlat16_7.x = u_xlat16_21 * _Alpha + (-u_xlat16_1.x);
    SV_Target0.w = u_xlat0.x * u_xlat16_7.x + u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute mediump vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    u_xlat1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _BackColor;
uniform 	mediump float _BackPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Alpha;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
lowp vec4 u_xlat10_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
mediump vec3 u_xlat16_7;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_1.x = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat6.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Flu_UV);
    u_xlat6.xy = (bool(u_xlatb18)) ? u_xlat6.xy : vs_TEXCOORD1.xy;
    u_xlat18 = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat6.y * 10.0 + u_xlat18;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat6.x;
    u_xlat16_7.xy = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_6.xyz = texture2D(_Flu_Tex, u_xlat16_7.xy).xyz;
    u_xlat2.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat10_6.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_6.xyz * u_xlat2.xyz;
    u_xlat16_7.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat16_7.xyz = u_xlat6.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power));
    u_xlat16_3.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_6.xyz = texture2D(_Mask, u_xlat6.xy).xyz;
    u_xlat2.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat10_6.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat2.xyw = u_xlat10_6.xyz * u_xlat2.xyz;
    u_xlat16_21 = u_xlat10_6.z * u_xlat2.z + _Mask_B_Alpha;
    u_xlat16_21 = u_xlat2.w * u_xlat16_21;
    u_xlat16_3.xyz = u_xlat2.xxx * u_xlat16_3.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_4 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat10_4.xyz;
    u_xlat16_21 = u_xlat16_21 * u_xlat10_4.w;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_5.xyz = u_xlat6.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_5.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat2.yyy + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _BackColor.www;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat16_1.xxx + u_xlat16_7.xyz;
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat16_1.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat16_1.x = u_xlat16_21 * _Alpha;
    u_xlat16_1.x = u_xlat16_1.x * _MainColor.w;
    u_xlat16_7.x = u_xlat16_21 * _Alpha + (-u_xlat16_1.x);
    SV_Target0.w = u_xlat0.x * u_xlat16_7.x + u_xlat16_1.x;
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
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
}
}
}
CustomEditor "HeroShowRenderingGUI.VFX.ASEffectShaderGUI"
}