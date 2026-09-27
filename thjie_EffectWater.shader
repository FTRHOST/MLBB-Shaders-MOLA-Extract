//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "thjie/EffectWater" {
Properties {

_BaseColor ("BaseColor", Color) = (1,1,1,1)

_MatcapTex ("Matcap Tex", 2D) = "white" { }

[Range] _MatcapStrong ("MatcapStrong", Range(0, 3)) = 1.0

[Range] _AlphaSpecFactor ("高光半透明因子", Range(0, 10)) = 0.0

[Toggle] _UseHue ("UseHue", Float) = 0.0

_Hue ("HUE", Range(-0.5, 0.5)) = 0.0

_Saturation ("Saturation", Range(0, 5)) = 1.0

_Brightness ("Brightness", Range(0, 5)) = 1.0

[Space(20)] _NormalTex ("Normal法线", 2D) = "bump" { }

_NormalScale1 ("NormalScale1", Range(0, 3)) = 1.0

_FlowSpeed1X ("FlowSpeed1X", Range(-1, 1)) = 0.0

_FlowSpeed1Y ("FlowSpeed1Y", Range(-1, 1)) = 0.0

_DetailNormal ("细节法线", 2D) = "bump" { }

_NormalScale2 ("NormalScale2", Range(0, 3)) = 1.0

_FlowSpeed2X ("FlowSpeed2X", Range(-1, 1)) = 0.0

_FlowSpeed2Y ("FlowSpeed2Y", Range(-1, 1)) = 0.0

[Space(20)] _VATex ("VATex", 2D) = "white" { }

_VA_Inten ("VA Inten", Range(-0.2, 0.2)) = 0.009999999776482582

[Space(20)] [Toggle] _UseFresnal ("UseFresnal", Float) = 0.0

_FresnalColor ("FresnalColor", Color) = (1,1,1,1)

_FresnalScale ("_FresnalScale", Range(0, 10)) = 1.0

_FresnalPower ("_FresnalPower", Range(0, 16)) = 3.0

[Space(20)] [Header(Noise Texture)] [WrapMode] _NoiseTex_Wrap ("Noise Wrap Mode", Float) = 0.0

_NoiseTex ("Noise Texture", 2D) = "white" { }

[ScaleOffset] _NoiseTex_Scroll ("Scroll", Vector) = (0,0,0,0)

_Noise_Strenght ("Noise Strenght", Float) = 0.0

[Space(20)] _DissolveValue ("Dissolve Value", Range(-1, 1)) = 0.0

_Smoothness ("Smoothness", Range(0.001, 1)) = 0.20000000298023224

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 58244
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
uniform 	vec4 _VATex_ST;
uniform 	float _VA_Inten;
uniform 	vec4 _NormalTex_ST;
uniform 	vec4 _DetailNormal_ST;
UNITY_LOCATION(4) uniform mediump sampler2D _VATex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.xy = _Time.yy * _VATex_ST.zw;
    u_xlat0.xy = in_TEXCOORD1.xy * _VATex_ST.xy + u_xlat0.xy;
    u_xlat0.x = textureLod(_VATex, u_xlat0.xy, 0.0).x;
    u_xlat3.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat3.zzz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_VA_Inten);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + in_POSITION0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _DetailNormal_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy * _DetailNormal_ST.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat0.x = dot(in_TANGENT0.xyz, in_TANGENT0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * in_TANGENT0.xyz;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat3.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat3.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz * in_TANGENT0.www;
    vs_TEXCOORD7 = in_COLOR0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _MatcapStrong;
uniform 	int _UseHue;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Brightness;
uniform 	float _NormalScale1;
uniform 	float _FlowSpeed1X;
uniform 	float _FlowSpeed1Y;
uniform 	float _NormalScale2;
uniform 	float _FlowSpeed2X;
uniform 	float _FlowSpeed2Y;
uniform 	float _AlphaSpecFactor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _DissolveValue;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec2 _NoiseTex_Scroll;
uniform 	float _Noise_Strenght;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	float _FresnalScale;
uniform 	float _FresnalPower;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DetailNormal;
UNITY_LOCATION(2) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat14;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_27;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = _NoiseTex_Scroll.xy * _Time.xx + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_DissolveValue);
#else
    u_xlatb0 = 0.0<_DissolveValue;
#endif
    u_xlat7.x = (-vs_TEXCOORD1.x) + 1.0;
    u_xlat0.x = (u_xlatb0) ? vs_TEXCOORD1.x : u_xlat7.x;
    u_xlat0.x = u_xlat16_1.x * _Noise_Strenght + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DissolveValue<0.0);
#else
    u_xlatb7 = _DissolveValue<0.0;
#endif
    u_xlat16_1.x = (u_xlatb7) ? abs(_DissolveValue) : _DissolveValue;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb0 = u_xlat0.x>=u_xlat16_1.x;
#endif
    if(!u_xlatb0){discard;}
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed2X, _FlowSpeed2Y) + vs_TEXCOORD0.zw;
    u_xlat16_0.xyz = texture(_DetailNormal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_1.xy = vec2(u_xlat16_15) * u_xlat16_1.xy;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_NormalScale2);
    u_xlat14.xy = _Time.yy * vec2(_FlowSpeed1X, _FlowSpeed1Y) + vs_TEXCOORD2.xy;
    u_xlat16_2.xyz = texture(_NormalTex, u_xlat14.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_NormalScale1) + u_xlat0.xy;
    u_xlat7.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat7.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat16_1.xy = u_xlat2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_MatcapTex, u_xlat16_1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(_MatcapStrong);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat2.y>=u_xlat2.z);
#else
    u_xlatb21 = u_xlat2.y>=u_xlat2.z;
#endif
    u_xlat16_3 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat4.xy = u_xlat2.zy;
    u_xlat5.xy = u_xlat16_1.yz * vec2(_MatcapStrong) + (-u_xlat4.xy);
    u_xlat4.z = float(-1.0);
    u_xlat4.w = float(0.666666687);
    u_xlat5.z = float(1.0);
    u_xlat5.w = float(-1.0);
    u_xlat3 = vec4(u_xlat16_3) * u_xlat5.xywz + u_xlat4.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat2.x>=u_xlat3.x);
#else
    u_xlatb21 = u_xlat2.x>=u_xlat3.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat4.z = u_xlat3.w;
    u_xlat3.w = u_xlat2.x;
    u_xlat4.xyw = u_xlat3.wyx;
    u_xlat4 = (-u_xlat3) + u_xlat4;
    u_xlat3 = vec4(u_xlat21) * u_xlat4 + u_xlat3;
    u_xlat21 = min(u_xlat3.y, u_xlat3.w);
    u_xlat21 = (-u_xlat21) + u_xlat3.x;
    u_xlat23 = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat4.x = (-u_xlat3.y) + u_xlat3.w;
    u_xlat23 = u_xlat4.x / u_xlat23;
    u_xlat23 = u_xlat23 + u_xlat3.z;
    u_xlat23 = abs(u_xlat23) + _Hue;
    u_xlat4.xyz = vec3(u_xlat23) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat23 = u_xlat3.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat23;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xyz;
    u_xlat16_6.xyz = u_xlat4.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<_UseHue);
#else
    u_xlatb21 = 0<_UseHue;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb21)) ? u_xlat16_6.xyz : u_xlat2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _BaseColor.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_27 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat16_27 = max(u_xlat16_27, 0.0);
    u_xlat16_27 = (-u_xlat16_27) + 1.0;
    u_xlat0.x = log2(u_xlat16_27);
    u_xlat16_27 = u_xlat16_1.w + u_xlat16_27;
    u_xlat7.x = u_xlat16_27 * _AlphaSpecFactor + -0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = exp2(_FresnalPower);
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnalScale;
    u_xlat0.xzw = u_xlat16_6.xyz * u_xlat0.xxx;
    u_xlat0.xzw = u_xlat0.xzw * _FresnalColor.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_UseFresnal);
#else
    u_xlatb2 = 0.0<_UseFresnal;
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat0.xzw : u_xlat16_6.xyz;
    u_xlat0.x = (-u_xlat7.x) + 1.0;
    u_xlat0.x = _BaseColor.w * u_xlat0.x + u_xlat7.x;
    SV_Target0.w = u_xlat0.x;
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
uniform 	vec4 _VATex_ST;
uniform 	float _VA_Inten;
uniform 	vec4 _NormalTex_ST;
uniform 	vec4 _DetailNormal_ST;
UNITY_LOCATION(4) uniform mediump sampler2D _VATex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.xy = _Time.yy * _VATex_ST.zw;
    u_xlat0.xy = in_TEXCOORD1.xy * _VATex_ST.xy + u_xlat0.xy;
    u_xlat0.x = textureLod(_VATex, u_xlat0.xy, 0.0).x;
    u_xlat3.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat3.zzz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_VA_Inten);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + in_POSITION0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _DetailNormal_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy * _DetailNormal_ST.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat0.x = dot(in_TANGENT0.xyz, in_TANGENT0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * in_TANGENT0.xyz;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat3.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat3.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz * in_TANGENT0.www;
    vs_TEXCOORD7 = in_COLOR0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _MatcapStrong;
uniform 	int _UseHue;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Brightness;
uniform 	float _NormalScale1;
uniform 	float _FlowSpeed1X;
uniform 	float _FlowSpeed1Y;
uniform 	float _NormalScale2;
uniform 	float _FlowSpeed2X;
uniform 	float _FlowSpeed2Y;
uniform 	float _AlphaSpecFactor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _DissolveValue;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec2 _NoiseTex_Scroll;
uniform 	float _Noise_Strenght;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	float _FresnalScale;
uniform 	float _FresnalPower;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DetailNormal;
UNITY_LOCATION(2) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec3 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat14;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_27;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = _NoiseTex_Scroll.xy * _Time.xx + u_xlat0.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_DissolveValue);
#else
    u_xlatb0 = 0.0<_DissolveValue;
#endif
    u_xlat7.x = (-vs_TEXCOORD1.x) + 1.0;
    u_xlat0.x = (u_xlatb0) ? vs_TEXCOORD1.x : u_xlat7.x;
    u_xlat0.x = u_xlat16_1.x * _Noise_Strenght + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_DissolveValue<0.0);
#else
    u_xlatb7 = _DissolveValue<0.0;
#endif
    u_xlat16_1.x = (u_xlatb7) ? abs(_DissolveValue) : _DissolveValue;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=u_xlat16_1.x);
#else
    u_xlatb0 = u_xlat0.x>=u_xlat16_1.x;
#endif
    if(!u_xlatb0){discard;}
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed2X, _FlowSpeed2Y) + vs_TEXCOORD0.zw;
    u_xlat16_0.xyz = texture(_DetailNormal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_1.xy = vec2(u_xlat16_15) * u_xlat16_1.xy;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_NormalScale2);
    u_xlat14.xy = _Time.yy * vec2(_FlowSpeed1X, _FlowSpeed1Y) + vs_TEXCOORD2.xy;
    u_xlat16_2.xyz = texture(_NormalTex, u_xlat14.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_NormalScale1) + u_xlat0.xy;
    u_xlat7.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat7.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat16_1.xy = u_xlat2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_1 = texture(_MatcapTex, u_xlat16_1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(_MatcapStrong);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat2.y>=u_xlat2.z);
#else
    u_xlatb21 = u_xlat2.y>=u_xlat2.z;
#endif
    u_xlat16_3 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat4.xy = u_xlat2.zy;
    u_xlat5.xy = u_xlat16_1.yz * vec2(_MatcapStrong) + (-u_xlat4.xy);
    u_xlat4.z = float(-1.0);
    u_xlat4.w = float(0.666666687);
    u_xlat5.z = float(1.0);
    u_xlat5.w = float(-1.0);
    u_xlat3 = vec4(u_xlat16_3) * u_xlat5.xywz + u_xlat4.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat2.x>=u_xlat3.x);
#else
    u_xlatb21 = u_xlat2.x>=u_xlat3.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat4.z = u_xlat3.w;
    u_xlat3.w = u_xlat2.x;
    u_xlat4.xyw = u_xlat3.wyx;
    u_xlat4 = (-u_xlat3) + u_xlat4;
    u_xlat3 = vec4(u_xlat21) * u_xlat4 + u_xlat3;
    u_xlat21 = min(u_xlat3.y, u_xlat3.w);
    u_xlat21 = (-u_xlat21) + u_xlat3.x;
    u_xlat23 = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat4.x = (-u_xlat3.y) + u_xlat3.w;
    u_xlat23 = u_xlat4.x / u_xlat23;
    u_xlat23 = u_xlat23 + u_xlat3.z;
    u_xlat23 = abs(u_xlat23) + _Hue;
    u_xlat4.xyz = vec3(u_xlat23) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat23 = u_xlat3.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat23;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xyz;
    u_xlat16_6.xyz = u_xlat4.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<_UseHue);
#else
    u_xlatb21 = 0<_UseHue;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb21)) ? u_xlat16_6.xyz : u_xlat2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _BaseColor.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_27 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat16_27 = max(u_xlat16_27, 0.0);
    u_xlat16_27 = (-u_xlat16_27) + 1.0;
    u_xlat0.x = log2(u_xlat16_27);
    u_xlat16_27 = u_xlat16_1.w + u_xlat16_27;
    u_xlat7.x = u_xlat16_27 * _AlphaSpecFactor + -0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = exp2(_FresnalPower);
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnalScale;
    u_xlat0.xzw = u_xlat16_6.xyz * u_xlat0.xxx;
    u_xlat0.xzw = u_xlat0.xzw * _FresnalColor.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<_UseFresnal);
#else
    u_xlatb2 = 0.0<_UseFresnal;
#endif
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat0.xzw : u_xlat16_6.xyz;
    u_xlat0.x = (-u_xlat7.x) + 1.0;
    u_xlat0.x = _BaseColor.w * u_xlat0.x + u_xlat7.x;
    SV_Target0.w = u_xlat0.x;
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
uniform 	vec4 _VATex_ST;
uniform 	float _VA_Inten;
uniform 	vec4 _NormalTex_ST;
uniform 	vec4 _DetailNormal_ST;
uniform lowp sampler2D _VATex;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying mediump vec4 vs_TEXCOORD7;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.xy = _Time.yy * _VATex_ST.zw;
    u_xlat0.xy = in_TEXCOORD1.xy * _VATex_ST.xy + u_xlat0.xy;
    u_xlat0.x = texture2DLod(_VATex, u_xlat0.xy, 0.0).x;
    u_xlat3.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat3.zzz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_VA_Inten);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + in_POSITION0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _DetailNormal_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy * _DetailNormal_ST.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat0.x = dot(in_TANGENT0.xyz, in_TANGENT0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * in_TANGENT0.xyz;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat3.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat3.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz * in_TANGENT0.www;
    vs_TEXCOORD7 = in_COLOR0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _MatcapStrong;
uniform 	int _UseHue;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Brightness;
uniform 	float _NormalScale1;
uniform 	float _FlowSpeed1X;
uniform 	float _FlowSpeed1Y;
uniform 	float _NormalScale2;
uniform 	float _FlowSpeed2X;
uniform 	float _FlowSpeed2Y;
uniform 	float _AlphaSpecFactor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _DissolveValue;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec2 _NoiseTex_Scroll;
uniform 	float _Noise_Strenght;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	float _FresnalScale;
uniform 	float _FresnalPower;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _DetailNormal;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat14;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_27;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = _NoiseTex_Scroll.xy * _Time.xx + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat10_0.x + -0.5;
    u_xlatb0 = 0.0<_DissolveValue;
    u_xlat7.x = (-vs_TEXCOORD1.x) + 1.0;
    u_xlat0.x = (u_xlatb0) ? vs_TEXCOORD1.x : u_xlat7.x;
    u_xlat0.x = u_xlat16_1.x * _Noise_Strenght + u_xlat0.x;
    u_xlatb7 = _DissolveValue<0.0;
    u_xlat16_1.x = (u_xlatb7) ? abs(_DissolveValue) : _DissolveValue;
    u_xlatb0 = u_xlat0.x>=u_xlat16_1.x;
    if(!u_xlatb0){discard;}
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed2X, _FlowSpeed2Y) + vs_TEXCOORD0.zw;
    u_xlat10_0.xyz = texture2D(_DetailNormal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_1.xy = vec2(u_xlat16_15) * u_xlat16_1.xy;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_NormalScale2);
    u_xlat14.xy = _Time.yy * vec2(_FlowSpeed1X, _FlowSpeed1Y) + vs_TEXCOORD2.xy;
    u_xlat10_2.xyz = texture2D(_NormalTex, u_xlat14.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_NormalScale1) + u_xlat0.xy;
    u_xlat7.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat7.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat16_1.xy = u_xlat2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_MatcapTex, u_xlat16_1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(_MatcapStrong);
    u_xlatb21 = u_xlat2.y>=u_xlat2.z;
    u_xlat16_3 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat4.xy = u_xlat2.zy;
    u_xlat5.xy = u_xlat10_1.yz * vec2(_MatcapStrong) + (-u_xlat4.xy);
    u_xlat4.z = float(-1.0);
    u_xlat4.w = float(0.666666687);
    u_xlat5.z = float(1.0);
    u_xlat5.w = float(-1.0);
    u_xlat3 = vec4(u_xlat16_3) * u_xlat5.xywz + u_xlat4.xywz;
    u_xlatb21 = u_xlat2.x>=u_xlat3.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat4.z = u_xlat3.w;
    u_xlat3.w = u_xlat2.x;
    u_xlat4.xyw = u_xlat3.wyx;
    u_xlat4 = (-u_xlat3) + u_xlat4;
    u_xlat3 = vec4(u_xlat21) * u_xlat4 + u_xlat3;
    u_xlat21 = min(u_xlat3.y, u_xlat3.w);
    u_xlat21 = (-u_xlat21) + u_xlat3.x;
    u_xlat23 = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat4.x = (-u_xlat3.y) + u_xlat3.w;
    u_xlat23 = u_xlat4.x / u_xlat23;
    u_xlat23 = u_xlat23 + u_xlat3.z;
    u_xlat23 = abs(u_xlat23) + _Hue;
    u_xlat4.xyz = vec3(u_xlat23) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat23 = u_xlat3.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat23;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xyz;
    u_xlat16_6.xyz = u_xlat4.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
    u_xlatb21 = 0<_UseHue;
    u_xlat16_6.xyz = (bool(u_xlatb21)) ? u_xlat16_6.xyz : u_xlat2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _BaseColor.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_27 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat16_27 = max(u_xlat16_27, 0.0);
    u_xlat16_27 = (-u_xlat16_27) + 1.0;
    u_xlat0.x = log2(u_xlat16_27);
    u_xlat16_27 = u_xlat10_1.w + u_xlat16_27;
    u_xlat7.x = u_xlat16_27 * _AlphaSpecFactor + -0.0199999996;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = exp2(_FresnalPower);
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnalScale;
    u_xlat0.xzw = u_xlat16_6.xyz * u_xlat0.xxx;
    u_xlat0.xzw = u_xlat0.xzw * _FresnalColor.xyz + u_xlat16_6.xyz;
    u_xlatb2 = 0.0<_UseFresnal;
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat0.xzw : u_xlat16_6.xyz;
    u_xlat0.x = (-u_xlat7.x) + 1.0;
    u_xlat0.x = _BaseColor.w * u_xlat0.x + u_xlat7.x;
    SV_Target0.w = u_xlat0.x;
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
uniform 	vec4 _VATex_ST;
uniform 	float _VA_Inten;
uniform 	vec4 _NormalTex_ST;
uniform 	vec4 _DetailNormal_ST;
uniform lowp sampler2D _VATex;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
varying mediump vec4 vs_TEXCOORD7;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.xy = _Time.yy * _VATex_ST.zw;
    u_xlat0.xy = in_TEXCOORD1.xy * _VATex_ST.xy + u_xlat0.xy;
    u_xlat0.x = texture2DLod(_VATex, u_xlat0.xy, 0.0).x;
    u_xlat3.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat3.xyz = u_xlat3.xxx * in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat3.xxx + u_xlat1.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat3.zzz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xxx;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_VA_Inten);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.100000001, 0.100000001, 0.100000001) + in_POSITION0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _DetailNormal_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy * _DetailNormal_ST.xy + u_xlat1.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    u_xlat0.x = dot(in_TANGENT0.xyz, in_TANGENT0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * in_TANGENT0.xyz;
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat1.zzz + u_xlat1.xyw;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.xyz = u_xlat3.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat3.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
    vs_TEXCOORD6.xyz = u_xlat0.xyz * in_TANGENT0.www;
    vs_TEXCOORD7 = in_COLOR0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	float _MatcapStrong;
uniform 	int _UseHue;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Brightness;
uniform 	float _NormalScale1;
uniform 	float _FlowSpeed1X;
uniform 	float _FlowSpeed1Y;
uniform 	float _NormalScale2;
uniform 	float _FlowSpeed2X;
uniform 	float _FlowSpeed2Y;
uniform 	float _AlphaSpecFactor;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _DissolveValue;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec2 _NoiseTex_Scroll;
uniform 	float _Noise_Strenght;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	float _FresnalScale;
uniform 	float _FresnalPower;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _DetailNormal;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _NoiseTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec3 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump float u_xlat16_3;
vec4 u_xlat4;
vec4 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
vec2 u_xlat14;
mediump float u_xlat16_15;
float u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_22;
float u_xlat23;
mediump float u_xlat16_27;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = _NoiseTex_Scroll.xy * _Time.xx + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat10_0.x + -0.5;
    u_xlatb0 = 0.0<_DissolveValue;
    u_xlat7.x = (-vs_TEXCOORD1.x) + 1.0;
    u_xlat0.x = (u_xlatb0) ? vs_TEXCOORD1.x : u_xlat7.x;
    u_xlat0.x = u_xlat16_1.x * _Noise_Strenght + u_xlat0.x;
    u_xlatb7 = _DissolveValue<0.0;
    u_xlat16_1.x = (u_xlatb7) ? abs(_DissolveValue) : _DissolveValue;
    u_xlatb0 = u_xlat0.x>=u_xlat16_1.x;
    if(!u_xlatb0){discard;}
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed2X, _FlowSpeed2Y) + vs_TEXCOORD0.zw;
    u_xlat10_0.xyz = texture2D(_DetailNormal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_15 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_15 = inversesqrt(u_xlat16_15);
    u_xlat16_1.xy = vec2(u_xlat16_15) * u_xlat16_1.xy;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_NormalScale2);
    u_xlat14.xy = _Time.yy * vec2(_FlowSpeed1X, _FlowSpeed1Y) + vs_TEXCOORD2.xy;
    u_xlat10_2.xyz = texture2D(_NormalTex, u_xlat14.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_22 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz;
    u_xlat0.xy = u_xlat16_1.xy * vec2(_NormalScale1) + u_xlat0.xy;
    u_xlat7.xyz = u_xlat0.yyy * vs_TEXCOORD6.xyz;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD5.xyz + u_xlat7.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD4.xyz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xy = vec2(u_xlat21) * u_xlat2.xy;
    u_xlat16_1.xy = u_xlat2.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_1 = texture2D(_MatcapTex, u_xlat16_1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(_MatcapStrong);
    u_xlatb21 = u_xlat2.y>=u_xlat2.z;
    u_xlat16_3 = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat4.xy = u_xlat2.zy;
    u_xlat5.xy = u_xlat10_1.yz * vec2(_MatcapStrong) + (-u_xlat4.xy);
    u_xlat4.z = float(-1.0);
    u_xlat4.w = float(0.666666687);
    u_xlat5.z = float(1.0);
    u_xlat5.w = float(-1.0);
    u_xlat3 = vec4(u_xlat16_3) * u_xlat5.xywz + u_xlat4.xywz;
    u_xlatb21 = u_xlat2.x>=u_xlat3.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat4.z = u_xlat3.w;
    u_xlat3.w = u_xlat2.x;
    u_xlat4.xyw = u_xlat3.wyx;
    u_xlat4 = (-u_xlat3) + u_xlat4;
    u_xlat3 = vec4(u_xlat21) * u_xlat4 + u_xlat3;
    u_xlat21 = min(u_xlat3.y, u_xlat3.w);
    u_xlat21 = (-u_xlat21) + u_xlat3.x;
    u_xlat23 = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat4.x = (-u_xlat3.y) + u_xlat3.w;
    u_xlat23 = u_xlat4.x / u_xlat23;
    u_xlat23 = u_xlat23 + u_xlat3.z;
    u_xlat23 = abs(u_xlat23) + _Hue;
    u_xlat4.xyz = vec3(u_xlat23) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat23 = u_xlat3.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat23;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = u_xlat3.xxx * u_xlat4.xyz;
    u_xlat16_6.xyz = u_xlat4.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
    u_xlatb21 = 0<_UseHue;
    u_xlat16_6.xyz = (bool(u_xlatb21)) ? u_xlat16_6.xyz : u_xlat2.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _BaseColor.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD3.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_27 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat16_27 = max(u_xlat16_27, 0.0);
    u_xlat16_27 = (-u_xlat16_27) + 1.0;
    u_xlat0.x = log2(u_xlat16_27);
    u_xlat16_27 = u_xlat10_1.w + u_xlat16_27;
    u_xlat7.x = u_xlat16_27 * _AlphaSpecFactor + -0.0199999996;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlat14.x = exp2(_FresnalPower);
    u_xlat0.x = u_xlat0.x * u_xlat14.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnalScale;
    u_xlat0.xzw = u_xlat16_6.xyz * u_xlat0.xxx;
    u_xlat0.xzw = u_xlat0.xzw * _FresnalColor.xyz + u_xlat16_6.xyz;
    u_xlatb2 = 0.0<_UseFresnal;
    SV_Target0.xyz = (bool(u_xlatb2)) ? u_xlat0.xzw : u_xlat16_6.xyz;
    u_xlat0.x = (-u_xlat7.x) + 1.0;
    u_xlat0.x = _BaseColor.w * u_xlat0.x + u_xlat7.x;
    SV_Target0.w = u_xlat0.x;
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