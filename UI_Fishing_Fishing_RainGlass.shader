//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/Fishing/Fishing_RainGlass" {
Properties {

_MainTex ("Sprite Texture", 2D) = "white" { }

_Color ("Tint", Color) = (1,1,1,1)

[Toggle(_CHEAP_NORMAL)] _CHEAP_NORMAL ("Use Cheap Normals", Float) = 0.0

_TimeScale ("Time Scale", Range(0, 3)) = 1.0

_Speed ("Drop Speed", Range(0, 3)) = 1.0

_RainAmount ("Rain Amount", Range(0, 1)) = 0.800000011920929

_NormalScale ("Normal Scale", Range(0, 3)) = 1.0

_DropScale ("Drop Scale", Range(0.5, 2)) = 1.0

_GlassTintColor ("Glass Tint Color", Color) = (1,1,1,1)

_GlassTintStrength ("Glass Tint Strength", Range(0, 1)) = 0.10000000149011612

_SpawnThreshold_Flow ("Flow Spawn Threshold", Range(0, 1)) = 1.0

_SpawnThreshold_Persistent ("Persistent Spawn Threshold", Range(0, 1)) = 1.0

_RainMask ("Rain Mask", 2D) = "white" { }

_MaskFadeStrength ("Mask Fade Strength", Range(0, 1)) = 1.0

[Toggle(_USE_SPECULAR)] _USE_SPECULAR ("Use Specular/Rim", Float) = 0.0

_SpecularColor ("Specular Color", Color) = (1,1,1,1)

_SpecularIntensity ("Specular Intensity", Range(0, 2)) = 0.6000000238418579

_SpecularPower ("Specular Power", Range(4, 64)) = 16.0

_LightDir ("Light Dir (xy)", Vector) = (-0.5,0.5,0,0)

_RimIntensity ("Rim Intensity", Range(0, 2)) = 0.5

_RimWidth ("Rim Width", Range(0, 1)) = 0.25

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 GrabPass {
 "_GrabTexture"
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 55024
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
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD2;
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
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump float _TimeScale;
uniform 	mediump float _Speed;
uniform 	mediump float _RainAmount;
uniform 	mediump float _NormalScale;
uniform 	float _DropScale;
uniform 	mediump float _SpawnThreshold_Flow;
uniform 	mediump float _SpawnThreshold_Persistent;
uniform 	vec4 _RainMask_ST;
uniform 	mediump float _MaskFadeStrength;
uniform 	mediump vec4 _GlassTintColor;
uniform 	mediump float _GlassTintStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _RainMask;
UNITY_LOCATION(1) uniform mediump sampler2D _GrabTexture;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
bool u_xlatb12;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
vec3 u_xlat16;
mediump float u_xlat16_18;
vec2 u_xlat24;
vec2 u_xlat25;
mediump float u_xlat16_25;
bool u_xlatb25;
float u_xlat26;
vec2 u_xlat27;
float u_xlat28;
vec2 u_xlat29;
mediump float u_xlat16_30;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
bool u_xlatb37;
float u_xlat38;
float u_xlat39;
float u_xlat40;
void main()
{
    u_xlat0.x = max(_DropScale, 9.99999975e-05);
    u_xlat12.xy = _ScreenParams.xy / _ScreenParams.yy;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat1.z = (-u_xlat1.y);
    u_xlat2.xy = u_xlat1.xz + vec2(-0.5, 0.5);
    u_xlat12.xy = u_xlat12.xy * u_xlat2.xy;
    u_xlat0.xy = u_xlat12.xy / u_xlat0.xx;
    u_xlat2 = u_xlat0.xyxy * vec4(40.0, 40.0, 12.0, 20.0);
    u_xlat3.xyz = floor(u_xlat2.xyz);
    u_xlat25.x = u_xlat3.z * 12345.5645;
    u_xlat26 = dot(u_xlat3.xy, vec2(107.449997, 3543.65405));
    u_xlat3.xyz = vec3(u_xlat26) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat25.x = sin(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * 7658.75977;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat26 = _Time.y * _TimeScale;
    u_xlat26 = u_xlat26 * 0.200000003;
    u_xlat3.w = u_xlat26 * _Speed;
    u_xlat4.x = u_xlat3.w * 0.75 + u_xlat0.y;
    u_xlat0.z = u_xlat25.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat0.xzy * vec3(12.0, 2.0, 18.5);
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat16_6.x = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat7.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat24.x = dot(u_xlat5.zyx, u_xlat7.xyz);
    u_xlat5.xyz = u_xlat24.xxx + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat24.x = u_xlat26 * _Speed + u_xlat5.z;
    u_xlat24.x = fract(u_xlat24.x);
    u_xlat25.x = u_xlat24.x + -0.850000024;
    u_xlat24.x = u_xlat24.x * 1.17647052;
    u_xlat24.x = min(u_xlat24.x, 1.0);
    u_xlat25.x = u_xlat25.x * 6.66666794;
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat40 = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = (-u_xlat40) * u_xlat25.x + 1.0;
    u_xlat40 = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat40;
    u_xlat24.x = u_xlat24.x * u_xlat25.x + -0.5;
    u_xlat7.y = u_xlat24.x * 0.899999976 + 0.5;
    u_xlat24.x = sin(u_xlat2.w);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat24.x = u_xlat0.y * 20.0 + u_xlat24.x;
    u_xlat24.x = sin(u_xlat24.x);
    u_xlat5.xz = u_xlat5.xz + vec2(-0.5, -0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(_SpawnThreshold_Flow>=u_xlat5.y);
#else
    u_xlatb25 = _SpawnThreshold_Flow>=u_xlat5.y;
#endif
    u_xlat25.x = u_xlatb25 ? 1.0 : float(0.0);
    u_xlat38 = -abs(u_xlat5.x) + 0.5;
    u_xlat24.x = u_xlat24.x * u_xlat38;
    u_xlat24.x = u_xlat24.x * u_xlat5.z + u_xlat5.x;
    u_xlat7.x = u_xlat24.x * 0.699999988;
    u_xlat4.xw = u_xlat4.xy + vec2(-0.5, -0.0);
    u_xlat5.xy = (-u_xlat7.xy) + u_xlat4.xw;
    u_xlat24.x = (-u_xlat7.y) + 1.0;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat5.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = (-u_xlat38) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat8.xyz = u_xlat0.yxy * vec3(10.0, 22.2000008, 37.0);
    u_xlat38 = fract(u_xlat8.x);
    u_xlat38 = u_xlat38 + u_xlat4.y;
    u_xlat7.z = u_xlat38 + -0.5;
    u_xlat4.xy = u_xlat4.xw + (-u_xlat7.xz);
    u_xlat38 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat38 = sqrt(u_xlat38);
    u_xlat38 = u_xlat38 * 3.33333325;
    u_xlat38 = min(u_xlat38, 1.0);
    u_xlat4.x = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = (-u_xlat4.x) * u_xlat38 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat38;
    u_xlat4.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat38 = u_xlat5.y + 0.0199999996;
    u_xlat38 = u_xlat38 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * 2.5;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat16.x = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = (-u_xlat16.x) * u_xlat4.x + 1.0;
    u_xlat16.x = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = u_xlat38 * u_xlat16.x;
    u_xlat24.x = u_xlat24.x * u_xlat38 + u_xlat4.x;
    u_xlat24.x = u_xlat25.x * u_xlat24.x;
    u_xlat16_6.xy = vec2(vec2(_RainAmount, _RainAmount)) + vec2(0.5, -0.25);
    u_xlat16_18 = u_xlat16_6.y + u_xlat16_6.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18 = min(max(u_xlat16_18, 0.0), 1.0);
#else
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_6.x * 0.666666687;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_18 * -2.0 + 3.0;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_30;
    u_xlat1.w = (-u_xlat1.y) + 1.0;
    u_xlat25.xy = u_xlat1.xw * _RainMask_ST.xy + _RainMask_ST.zw;
    u_xlat16_25 = texture(_RainMask, u_xlat25.xy).x;
    u_xlat37 = (-u_xlat16_25) + 1.0;
    u_xlat25.x = (-u_xlat16_25) * _MaskFadeStrength + 1.0;
    u_xlat2.w = u_xlat37 * u_xlat16_18;
    u_xlat24.x = u_xlat24.x * u_xlat2.w;
    u_xlat4.xyw = u_xlat3.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat4.x = dot(u_xlat3.zyx, u_xlat4.xyw);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xxx;
    u_xlat4.xyw = u_xlat3.yxx + u_xlat3.zzy;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyw;
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat4.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat2.xy = (-u_xlat4.xy) * vec2(0.699999988, 0.699999988) + u_xlat2.xy;
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 3.33333325;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat14 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat14) * u_xlat2.x + 1.0;
    u_xlat14 = u_xlat3.z * 10.0;
    u_xlat14 = fract(u_xlat14);
    u_xlat2.x = u_xlat14 * u_xlat2.x;
    u_xlat14 = u_xlat26 * _Speed + u_xlat3.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_SpawnThreshold_Persistent>=u_xlat3.x);
#else
    u_xlatb3 = _SpawnThreshold_Persistent>=u_xlat3.x;
#endif
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat14 = fract(u_xlat14);
    u_xlat15 = u_xlat14 + -0.0250000004;
    u_xlat14 = u_xlat14 * 40.0;
    u_xlat14 = min(u_xlat14, 1.0);
    u_xlat15 = u_xlat15 * 1.02564096;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat27.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = (-u_xlat27.x) * u_xlat15 + 1.0;
    u_xlat27.x = u_xlat14 * -2.0 + 3.0;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat14 = u_xlat14 * u_xlat27.x;
    u_xlat14 = u_xlat15 * u_xlat14;
    u_xlat2.x = u_xlat14 * u_xlat2.x;
    u_xlat2.x = u_xlat3.x * u_xlat2.x;
    u_xlat16_18 = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = dot(vec2(u_xlat16_18), u_xlat16_6.xx);
    u_xlat14 = u_xlat37 * u_xlat16_6.x;
    u_xlat24.x = u_xlat2.x * u_xlat14 + u_xlat24.x;
    u_xlat2.x = sin(u_xlat8.z);
    u_xlat3.x = floor(u_xlat8.y);
    u_xlat3.xy = u_xlat3.xw * vec2(12345.5645, 0.75);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 7658.75977;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat2.x = u_xlat0.y * 37.0 + u_xlat2.x;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat27.x = u_xlat0.y * 1.85000002 + u_xlat3.y;
    u_xlat0.w = u_xlat3.x + u_xlat27.x;
    u_xlat3.xz = u_xlat0.xw * vec2(22.2000008, 2.0);
    u_xlat5 = u_xlat0.xyxy + vec4(0.00100000005, 0.0, 0.0, 0.00100000005);
    u_xlat0.xy = floor(u_xlat3.xz);
    u_xlat3.xz = fract(u_xlat3.xz);
    u_xlat16_6.x = dot(u_xlat0.xy, vec2(35.2000008, 2376.1001));
    u_xlat0.xyw = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat0.xyw = fract(u_xlat0.xyw);
    u_xlat4.xyw = u_xlat0.yxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat4.x = dot(u_xlat0.wyx, u_xlat4.xyw);
    u_xlat0.xyw = u_xlat0.xyw + u_xlat4.xxx;
    u_xlat4.xyw = u_xlat0.yxx + u_xlat0.wwy;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat4.xyw;
    u_xlat0.xyw = fract(u_xlat0.xyw);
    u_xlat4.xy = u_xlat0.xw + vec2(-0.5, -0.5);
    u_xlat0.x = -abs(u_xlat4.x) + 0.5;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.y + u_xlat4.x;
    u_xlat7.x = u_xlat0.x * 0.699999988;
    u_xlat0.x = u_xlat4.z + u_xlat3.z;
    u_xlat3.xz = u_xlat3.xz + vec2(-0.5, -0.0);
    u_xlat7.z = u_xlat0.x + -0.5;
    u_xlat4.xy = u_xlat3.xz + (-u_xlat7.xz);
    u_xlat0.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3.33333325;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat2.x) * u_xlat0.x + 1.0;
    u_xlat36 = u_xlat26 * _Speed + u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_SpawnThreshold_Flow>=u_xlat0.y);
#else
    u_xlatb12 = _SpawnThreshold_Flow>=u_xlat0.y;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat36 = fract(u_xlat36);
    u_xlat2.x = u_xlat36 + -0.850000024;
    u_xlat36 = u_xlat36 * 1.17647052;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat4.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) * u_xlat2.x + 1.0;
    u_xlat4.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat4.x;
    u_xlat36 = u_xlat36 * u_xlat2.x + -0.5;
    u_xlat7.y = u_xlat36 * 0.899999976 + 0.5;
    u_xlat3.xz = u_xlat3.xz + (-u_xlat7.xy);
    u_xlat36 = (-u_xlat7.y) + 1.0;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat3.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat2.x) * u_xlat36 + 1.0;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat0.x = u_xlat36 * u_xlat0.x;
    u_xlat4.xy = u_xlat3.xz * vec2(1.0, 6.0);
    u_xlat36 = u_xlat3.z + 0.0199999996;
    u_xlat36 = u_xlat36 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 2.5;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat3.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat3.x) * u_xlat2.x + 1.0;
    u_xlat3.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat3.x;
    u_xlat0.x = u_xlat0.x * u_xlat36 + u_xlat2.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat16_6.x = _RainAmount + _RainAmount;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_18 = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_18;
    u_xlat12.x = u_xlat37 * u_xlat16_6.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x + u_xlat24.x;
    u_xlat0.x = u_xlat0.x + -0.300000012;
    u_xlat0.x = u_xlat0.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat24.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat5.yzwz * vec4(18.5, 40.0, 40.0, 12.0);
    u_xlat7.xyz = floor(u_xlat4.yzw);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat24.x = u_xlat7.z * 12345.5645;
    u_xlat36 = dot(u_xlat7.xy, vec2(107.449997, 3543.65405));
    u_xlat7.xyz = vec3(u_xlat36) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat24.x = sin(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 7658.75977;
    u_xlat24.x = fract(u_xlat24.x);
    u_xlat25.xy = u_xlat3.ww * vec2(0.75, 0.75) + u_xlat5.yw;
    u_xlat8.x = u_xlat24.x + u_xlat25.y;
    u_xlat8.y = u_xlat5.z;
    u_xlat24.xy = u_xlat8.yx * vec2(12.0, 2.0);
    u_xlat3.xz = floor(u_xlat24.xy);
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat16_6.x = dot(u_xlat3.xz, vec2(35.2000008, 2376.1001));
    u_xlat3.xzw = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat3.xzw = fract(u_xlat3.xzw);
    u_xlat9.xyz = u_xlat3.zxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat37 = dot(u_xlat3.wzx, u_xlat9.xyz);
    u_xlat3.xzw = vec3(u_xlat37) + u_xlat3.xzw;
    u_xlat9.xyz = u_xlat3.zxx + u_xlat3.wwz;
    u_xlat3.xzw = u_xlat3.xzw * u_xlat9.xyz;
    u_xlat3.xzw = fract(u_xlat3.xzw);
    u_xlat37 = u_xlat26 * _Speed + u_xlat3.w;
    u_xlat37 = fract(u_xlat37);
    u_xlat2.x = u_xlat37 + -0.850000024;
    u_xlat37 = u_xlat37 * 1.17647052;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat40 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat40) * u_xlat2.x + 1.0;
    u_xlat40 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat40;
    u_xlat37 = u_xlat37 * u_xlat2.x + -0.5;
    u_xlat9.y = u_xlat37 * 0.899999976 + 0.5;
    u_xlat3.xw = u_xlat3.xw + vec2(-0.5, -0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(_SpawnThreshold_Flow>=u_xlat3.z);
#else
    u_xlatb37 = _SpawnThreshold_Flow>=u_xlat3.z;
#endif
    u_xlat37 = u_xlatb37 ? 1.0 : float(0.0);
    u_xlat2.x = -abs(u_xlat3.x) + 0.5;
    u_xlat10.xyz = u_xlat5.wwz * vec3(20.0, 10.0, 22.2000008);
    u_xlat27.x = sin(u_xlat10.x);
    u_xlat27.x = u_xlat5.w * 20.0 + u_xlat27.x;
    u_xlat27.x = sin(u_xlat27.x);
    u_xlat2.x = u_xlat2.x * u_xlat27.x;
    u_xlat2.x = u_xlat2.x * u_xlat3.w + u_xlat3.x;
    u_xlat9.x = u_xlat2.x * 0.699999988;
    u_xlat3.xz = u_xlat24.xy + vec2(-0.5, -0.0);
    u_xlat8.xw = (-u_xlat9.xy) + u_xlat3.xz;
    u_xlat24.x = (-u_xlat9.y) + 1.0;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat8.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = (-u_xlat2.x) * u_xlat24.x + 1.0;
    u_xlat2.x = fract(u_xlat10.y);
    u_xlat39 = floor(u_xlat10.z);
    u_xlat39 = u_xlat39 * 12345.5645;
    u_xlat39 = sin(u_xlat39);
    u_xlat39 = u_xlat39 * 7658.75977;
    u_xlat39 = fract(u_xlat39);
    u_xlat36 = u_xlat24.y + u_xlat2.x;
    u_xlat9.z = u_xlat36 + -0.5;
    u_xlat3.xz = u_xlat3.xz + (-u_xlat9.xz);
    u_xlat24.y = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat24.xy = sqrt(u_xlat24.xy);
    u_xlat36 = u_xlat24.y * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat2.x) * u_xlat36 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat36;
    u_xlat3.xz = u_xlat8.xw * vec2(1.0, 6.0);
    u_xlat36 = u_xlat8.w + 0.0199999996;
    u_xlat36 = u_xlat36 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 2.5;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat3.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat3.x) * u_xlat2.x + 1.0;
    u_xlat3.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat3.x;
    u_xlat24.x = u_xlat24.x * u_xlat36 + u_xlat2.x;
    u_xlat24.x = u_xlat37 * u_xlat24.x;
    u_xlat9.xyz = u_xlat7.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat36 = dot(u_xlat7.zyx, u_xlat9.xyz);
    u_xlat7.xyz = vec3(u_xlat36) + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat7.yxx + u_xlat7.zzy;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat9.xyz;
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat3.xz = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16.xy = u_xlat4.yz + vec2(-0.5, -0.5);
    u_xlat3.xz = (-u_xlat3.xz) * vec2(0.699999988, 0.699999988) + u_xlat16.xy;
    u_xlat36 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat37) * u_xlat36 + 1.0;
    u_xlat37 = u_xlat7.z * 10.0;
    u_xlat37 = fract(u_xlat37);
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat37 = u_xlat26 * _Speed + u_xlat7.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_SpawnThreshold_Persistent>=u_xlat7.x);
#else
    u_xlatb2 = _SpawnThreshold_Persistent>=u_xlat7.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat37 = fract(u_xlat37);
    u_xlat3.x = u_xlat37 + -0.0250000004;
    u_xlat37 = u_xlat37 * 40.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat3.x * 1.02564096;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat27.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat27.x) * u_xlat3.x + 1.0;
    u_xlat27.x = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat27.x;
    u_xlat37 = u_xlat3.x * u_xlat37;
    u_xlat24.y = u_xlat36 * u_xlat37;
    u_xlat24.xy = u_xlat24.xy * u_xlat2.wx;
    u_xlat24.x = u_xlat24.y * u_xlat14 + u_xlat24.x;
    u_xlat36 = u_xlat5.w * 1.85000002 + u_xlat3.y;
    u_xlat37 = u_xlat5.y * 1.85000002 + u_xlat3.y;
    u_xlat8.z = u_xlat39 + u_xlat36;
    u_xlat3.xy = u_xlat8.yz * vec2(22.2000008, 2.0);
    u_xlat27.xy = floor(u_xlat3.xy);
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat16_6.x = dot(u_xlat27.xy, vec2(35.2000008, 2376.1001));
    u_xlat16.xyz = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat7.xyz = u_xlat16.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat36 = dot(u_xlat16.zyx, u_xlat7.xyz);
    u_xlat16.xyz = vec3(u_xlat36) + u_xlat16.xyz;
    u_xlat7.xyz = u_xlat16.yxx + u_xlat16.zzy;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat7.xyz;
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat36 = u_xlat26 * _Speed + u_xlat16.z;
    u_xlat36 = fract(u_xlat36);
    u_xlat2.x = u_xlat36 + -0.850000024;
    u_xlat36 = u_xlat36 * 1.17647052;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat27.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat27.x) * u_xlat2.x + 1.0;
    u_xlat27.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat27.x;
    u_xlat36 = u_xlat36 * u_xlat2.x + -0.5;
    u_xlat7.y = u_xlat36 * 0.899999976 + 0.5;
    u_xlat27.xy = u_xlat16.xz + vec2(-0.5, -0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_SpawnThreshold_Flow>=u_xlat16.y);
#else
    u_xlatb36 = _SpawnThreshold_Flow>=u_xlat16.y;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat2.x = -abs(u_xlat27.x) + 0.5;
    u_xlat16.xy = u_xlat5.ww * vec2(37.0, 18.5);
    u_xlat16.x = sin(u_xlat16.x);
    u_xlat28 = fract(u_xlat16.y);
    u_xlat28 = u_xlat3.y + u_xlat28;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.0);
    u_xlat7.z = u_xlat28 + -0.5;
    u_xlat16.x = u_xlat5.w * 37.0 + u_xlat16.x;
    u_xlat16.x = sin(u_xlat16.x);
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat27.y + u_xlat27.x;
    u_xlat7.x = u_xlat2.x * 0.699999988;
    u_xlat27.xy = (-u_xlat7.xy) + u_xlat3.xy;
    u_xlat2.x = (-u_xlat7.y) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat27.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat3.xy = u_xlat3.xy + (-u_xlat7.xz);
    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 3.33333325;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat15 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat15) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat15 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat15) * u_xlat3.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat3.x;
    u_xlat3.xy = u_xlat27.xy * vec2(1.0, 6.0);
    u_xlat27.x = u_xlat27.y + 0.0199999996;
    u_xlat27.x = u_xlat27.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 2.5;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat15 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat15) * u_xlat3.x + 1.0;
    u_xlat15 = u_xlat27.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat15 = u_xlat27.x * u_xlat15;
    u_xlat2.x = u_xlat2.x * u_xlat15 + u_xlat3.x;
    u_xlat36 = u_xlat36 * u_xlat2.x;
    u_xlat24.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + -0.300000012;
    u_xlat24.x = u_xlat24.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat36 = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat3.y = u_xlat36 * u_xlat24.x + (-u_xlat0.x);
    u_xlat6 = u_xlat5.xyxy * vec4(40.0, 40.0, 12.0, 20.0);
    u_xlat16.xyz = floor(u_xlat6.xyz);
    u_xlat24.x = u_xlat16.z * 12345.5645;
    u_xlat36 = dot(u_xlat16.xy, vec2(107.449997, 3543.65405));
    u_xlat16.xyz = vec3(u_xlat36) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat24.x = sin(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 7658.75977;
    u_xlat24.x = fract(u_xlat24.x);
    u_xlat7.x = u_xlat24.x + u_xlat25.x;
    u_xlat7.y = u_xlat5.x;
    u_xlat24.xy = u_xlat7.yx * vec2(12.0, 2.0);
    u_xlat27.xy = floor(u_xlat24.xy);
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat16_11.x = dot(u_xlat27.xy, vec2(35.2000008, 2376.1001));
    u_xlat8.xyz = u_xlat16_11.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat9.xyz = u_xlat8.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat25.x = dot(u_xlat8.zyx, u_xlat9.xyz);
    u_xlat8.xyz = u_xlat25.xxx + u_xlat8.xyz;
    u_xlat9.xyz = u_xlat8.yxx + u_xlat8.zzy;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat25.x = u_xlat26 * _Speed + u_xlat8.z;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat2.x = u_xlat25.x + -0.850000024;
    u_xlat25.x = u_xlat25.x * 1.17647052;
    u_xlat25.x = min(u_xlat25.x, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat27.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat27.x) * u_xlat2.x + 1.0;
    u_xlat27.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat27.x;
    u_xlat25.x = u_xlat25.x * u_xlat2.x + -0.5;
    u_xlat9.y = u_xlat25.x * 0.899999976 + 0.5;
    u_xlat25.x = sin(u_xlat6.w);
    u_xlat27.xy = fract(u_xlat6.xy);
    u_xlat27.xy = u_xlat27.xy + vec2(-0.5, -0.5);
    u_xlat25.x = u_xlat5.y * 20.0 + u_xlat25.x;
    u_xlat25.x = sin(u_xlat25.x);
    u_xlat29.xy = u_xlat8.xz + vec2(-0.5, -0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_SpawnThreshold_Flow>=u_xlat8.y);
#else
    u_xlatb2 = _SpawnThreshold_Flow>=u_xlat8.y;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat7.x = -abs(u_xlat29.x) + 0.5;
    u_xlat25.x = u_xlat25.x * u_xlat7.x;
    u_xlat25.x = u_xlat25.x * u_xlat29.y + u_xlat29.x;
    u_xlat9.x = u_xlat25.x * 0.699999988;
    u_xlat29.xy = u_xlat24.xy + vec2(-0.5, -0.0);
    u_xlat7.xw = (-u_xlat9.xy) + u_xlat29.xy;
    u_xlat24.x = (-u_xlat9.y) + 1.0;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat25.x = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = (-u_xlat25.x) * u_xlat24.x + 1.0;
    u_xlat8.xyz = u_xlat5.yxy * vec3(10.0, 22.2000008, 37.0);
    u_xlat25.x = fract(u_xlat8.x);
    u_xlat36 = u_xlat24.y + u_xlat25.x;
    u_xlat9.z = u_xlat36 + -0.5;
    u_xlat5.xz = u_xlat29.xy + (-u_xlat9.xz);
    u_xlat24.y = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat24.xy = sqrt(u_xlat24.xy);
    u_xlat36 = u_xlat24.y * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat25.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat25.x) * u_xlat36 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat36;
    u_xlat5.xz = u_xlat7.xw * vec2(1.0, 6.0);
    u_xlat36 = u_xlat7.w + 0.0199999996;
    u_xlat36 = u_xlat36 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat25.x = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * 2.5;
    u_xlat25.x = min(u_xlat25.x, 1.0);
    u_xlat5.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = (-u_xlat5.x) * u_xlat25.x + 1.0;
    u_xlat5.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat5.x;
    u_xlat24.x = u_xlat24.x * u_xlat36 + u_xlat25.x;
    u_xlat24.x = u_xlat2.x * u_xlat24.x;
    u_xlat24.x = u_xlat2.w * u_xlat24.x;
    u_xlat5.xzw = u_xlat16.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat36 = dot(u_xlat16.zyx, u_xlat5.xzw);
    u_xlat16.xyz = vec3(u_xlat36) + u_xlat16.xyz;
    u_xlat5.xzw = u_xlat16.yxx + u_xlat16.zzy;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat5.xzw;
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat2.xw = u_xlat16.xy + vec2(-0.5, -0.5);
    u_xlat2.xw = (-u_xlat2.xw) * vec2(0.699999988, 0.699999988) + u_xlat27.xy;
    u_xlat36 = dot(u_xlat2.xw, u_xlat2.xw);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat25.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat25.x) * u_xlat36 + 1.0;
    u_xlat25.x = u_xlat16.z * 10.0;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat36 = u_xlat36 * u_xlat25.x;
    u_xlat25.x = u_xlat26 * _Speed + u_xlat16.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_SpawnThreshold_Persistent>=u_xlat16.x);
#else
    u_xlatb2 = _SpawnThreshold_Persistent>=u_xlat16.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat38 = u_xlat25.x + -0.0250000004;
    u_xlat25.x = u_xlat25.x * 40.0;
    u_xlat25.x = min(u_xlat25.x, 1.0);
    u_xlat38 = u_xlat38 * 1.02564096;
    u_xlat38 = max(u_xlat38, 0.0);
    u_xlat27.x = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = (-u_xlat27.x) * u_xlat38 + 1.0;
    u_xlat27.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat27.x;
    u_xlat25.x = u_xlat38 * u_xlat25.x;
    u_xlat36 = u_xlat36 * u_xlat25.x;
    u_xlat36 = u_xlat2.x * u_xlat36;
    u_xlat24.x = u_xlat36 * u_xlat14 + u_xlat24.x;
    u_xlat36 = sin(u_xlat8.z);
    u_xlat25.x = floor(u_xlat8.y);
    u_xlat25.x = u_xlat25.x * 12345.5645;
    u_xlat25.x = sin(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * 7658.75977;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat7.z = u_xlat25.x + u_xlat37;
    u_xlat25.xy = u_xlat7.yz * vec2(22.2000008, 2.0);
    u_xlat36 = u_xlat5.y * 37.0 + u_xlat36;
    u_xlat36 = sin(u_xlat36);
    u_xlat2.xy = floor(u_xlat25.xy);
    u_xlat25.xy = fract(u_xlat25.xy);
    u_xlat16_11.x = dot(u_xlat2.xy, vec2(35.2000008, 2376.1001));
    u_xlat2.xyw = u_xlat16_11.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat16.xyz = u_xlat2.yxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat27.x = dot(u_xlat2.wyx, u_xlat16.xyz);
    u_xlat2.xyw = u_xlat2.xyw + u_xlat27.xxx;
    u_xlat16.xyz = u_xlat2.yxx + u_xlat2.wwy;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat16.xyz;
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat27.xy = u_xlat2.xw + vec2(-0.5, -0.5);
    u_xlat2.x = -abs(u_xlat27.x) + 0.5;
    u_xlat36 = u_xlat36 * u_xlat2.x;
    u_xlat36 = u_xlat36 * u_xlat27.y + u_xlat27.x;
    u_xlat5.x = u_xlat36 * 0.699999988;
    u_xlat36 = u_xlat4.x + u_xlat25.y;
    u_xlat25.xy = u_xlat25.xy + vec2(-0.5, -0.0);
    u_xlat5.z = u_xlat36 + -0.5;
    u_xlat27.xy = u_xlat25.xy + (-u_xlat5.xz);
    u_xlat36 = dot(u_xlat27.xy, u_xlat27.xy);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat2.x) * u_xlat36 + 1.0;
    u_xlat2.x = u_xlat26 * _Speed + u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(_SpawnThreshold_Flow>=u_xlat2.y);
#else
    u_xlatb14 = _SpawnThreshold_Flow>=u_xlat2.y;
#endif
    u_xlat14 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat2.z = u_xlat2.x + -0.850000024;
    u_xlat2.xz = u_xlat2.xz * vec2(1.17647052, 6.66666794);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat26 = max(u_xlat2.z, 0.0);
    u_xlat38 = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = (-u_xlat38) * u_xlat26 + 1.0;
    u_xlat38 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat38;
    u_xlat2.x = u_xlat2.x * u_xlat26 + -0.5;
    u_xlat5.y = u_xlat2.x * 0.899999976 + 0.5;
    u_xlat25.xy = u_xlat25.xy + (-u_xlat5.xy);
    u_xlat2.x = (-u_xlat5.y) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat25.y * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat26) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat36 = u_xlat36 * u_xlat2.x;
    u_xlat2.xz = u_xlat25.xy * vec2(1.0, 6.0);
    u_xlat25.x = u_xlat25.y + 0.0199999996;
    u_xlat25.x = u_xlat25.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat37 = sqrt(u_xlat37);
    u_xlat37 = u_xlat37 * 2.5;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat2.x = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = (-u_xlat2.x) * u_xlat37 + 1.0;
    u_xlat2.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat2.x;
    u_xlat36 = u_xlat36 * u_xlat25.x + u_xlat37;
    u_xlat36 = u_xlat14 * u_xlat36;
    u_xlat12.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
    u_xlat12.x = u_xlat12.x + -0.300000012;
    u_xlat12.x = u_xlat12.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat3.x = u_xlat24.x * u_xlat12.x + (-u_xlat0.x);
    u_xlat0.xy = u_xlat3.xy * vec2(vec2(_NormalScale, _NormalScale));
    u_xlat0.z = (-u_xlat0.y);
    u_xlat0.xy = u_xlat0.xz + u_xlat1.xy;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_11.xyz = (-u_xlat16_0.xyz) + _GlassTintColor.xyz;
    u_xlat16_0.xyz = vec3(_GlassTintStrength) * u_xlat16_11.xyz + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.w = 1.0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD2;
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
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump float _TimeScale;
uniform 	mediump float _Speed;
uniform 	mediump float _RainAmount;
uniform 	mediump float _NormalScale;
uniform 	float _DropScale;
uniform 	mediump float _SpawnThreshold_Flow;
uniform 	mediump float _SpawnThreshold_Persistent;
uniform 	vec4 _RainMask_ST;
uniform 	mediump float _MaskFadeStrength;
uniform 	mediump vec4 _GlassTintColor;
uniform 	mediump float _GlassTintStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _RainMask;
UNITY_LOCATION(1) uniform mediump sampler2D _GrabTexture;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
bool u_xlatb12;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
vec3 u_xlat16;
mediump float u_xlat16_18;
vec2 u_xlat24;
vec2 u_xlat25;
mediump float u_xlat16_25;
bool u_xlatb25;
float u_xlat26;
vec2 u_xlat27;
float u_xlat28;
vec2 u_xlat29;
mediump float u_xlat16_30;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
bool u_xlatb37;
float u_xlat38;
float u_xlat39;
float u_xlat40;
void main()
{
    u_xlat0.x = max(_DropScale, 9.99999975e-05);
    u_xlat12.xy = _ScreenParams.xy / _ScreenParams.yy;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat1.z = (-u_xlat1.y);
    u_xlat2.xy = u_xlat1.xz + vec2(-0.5, 0.5);
    u_xlat12.xy = u_xlat12.xy * u_xlat2.xy;
    u_xlat0.xy = u_xlat12.xy / u_xlat0.xx;
    u_xlat2 = u_xlat0.xyxy * vec4(40.0, 40.0, 12.0, 20.0);
    u_xlat3.xyz = floor(u_xlat2.xyz);
    u_xlat25.x = u_xlat3.z * 12345.5645;
    u_xlat26 = dot(u_xlat3.xy, vec2(107.449997, 3543.65405));
    u_xlat3.xyz = vec3(u_xlat26) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat25.x = sin(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * 7658.75977;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat26 = _Time.y * _TimeScale;
    u_xlat26 = u_xlat26 * 0.200000003;
    u_xlat3.w = u_xlat26 * _Speed;
    u_xlat4.x = u_xlat3.w * 0.75 + u_xlat0.y;
    u_xlat0.z = u_xlat25.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat0.xzy * vec3(12.0, 2.0, 18.5);
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat16_6.x = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat7.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat24.x = dot(u_xlat5.zyx, u_xlat7.xyz);
    u_xlat5.xyz = u_xlat24.xxx + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat24.x = u_xlat26 * _Speed + u_xlat5.z;
    u_xlat24.x = fract(u_xlat24.x);
    u_xlat25.x = u_xlat24.x + -0.850000024;
    u_xlat24.x = u_xlat24.x * 1.17647052;
    u_xlat24.x = min(u_xlat24.x, 1.0);
    u_xlat25.x = u_xlat25.x * 6.66666794;
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat40 = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = (-u_xlat40) * u_xlat25.x + 1.0;
    u_xlat40 = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat40;
    u_xlat24.x = u_xlat24.x * u_xlat25.x + -0.5;
    u_xlat7.y = u_xlat24.x * 0.899999976 + 0.5;
    u_xlat24.x = sin(u_xlat2.w);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat24.x = u_xlat0.y * 20.0 + u_xlat24.x;
    u_xlat24.x = sin(u_xlat24.x);
    u_xlat5.xz = u_xlat5.xz + vec2(-0.5, -0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb25 = !!(_SpawnThreshold_Flow>=u_xlat5.y);
#else
    u_xlatb25 = _SpawnThreshold_Flow>=u_xlat5.y;
#endif
    u_xlat25.x = u_xlatb25 ? 1.0 : float(0.0);
    u_xlat38 = -abs(u_xlat5.x) + 0.5;
    u_xlat24.x = u_xlat24.x * u_xlat38;
    u_xlat24.x = u_xlat24.x * u_xlat5.z + u_xlat5.x;
    u_xlat7.x = u_xlat24.x * 0.699999988;
    u_xlat4.xw = u_xlat4.xy + vec2(-0.5, -0.0);
    u_xlat5.xy = (-u_xlat7.xy) + u_xlat4.xw;
    u_xlat24.x = (-u_xlat7.y) + 1.0;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat5.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat38 = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = (-u_xlat38) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat8.xyz = u_xlat0.yxy * vec3(10.0, 22.2000008, 37.0);
    u_xlat38 = fract(u_xlat8.x);
    u_xlat38 = u_xlat38 + u_xlat4.y;
    u_xlat7.z = u_xlat38 + -0.5;
    u_xlat4.xy = u_xlat4.xw + (-u_xlat7.xz);
    u_xlat38 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat38 = sqrt(u_xlat38);
    u_xlat38 = u_xlat38 * 3.33333325;
    u_xlat38 = min(u_xlat38, 1.0);
    u_xlat4.x = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = (-u_xlat4.x) * u_xlat38 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat38;
    u_xlat4.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat38 = u_xlat5.y + 0.0199999996;
    u_xlat38 = u_xlat38 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat38 = min(max(u_xlat38, 0.0), 1.0);
#else
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * 2.5;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat16.x = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = (-u_xlat16.x) * u_xlat4.x + 1.0;
    u_xlat16.x = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = u_xlat38 * u_xlat16.x;
    u_xlat24.x = u_xlat24.x * u_xlat38 + u_xlat4.x;
    u_xlat24.x = u_xlat25.x * u_xlat24.x;
    u_xlat16_6.xy = vec2(vec2(_RainAmount, _RainAmount)) + vec2(0.5, -0.25);
    u_xlat16_18 = u_xlat16_6.y + u_xlat16_6.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18 = min(max(u_xlat16_18, 0.0), 1.0);
#else
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_6.x * 0.666666687;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_30 = u_xlat16_18 * -2.0 + 3.0;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_30;
    u_xlat1.w = (-u_xlat1.y) + 1.0;
    u_xlat25.xy = u_xlat1.xw * _RainMask_ST.xy + _RainMask_ST.zw;
    u_xlat16_25 = texture(_RainMask, u_xlat25.xy).x;
    u_xlat37 = (-u_xlat16_25) + 1.0;
    u_xlat25.x = (-u_xlat16_25) * _MaskFadeStrength + 1.0;
    u_xlat2.w = u_xlat37 * u_xlat16_18;
    u_xlat24.x = u_xlat24.x * u_xlat2.w;
    u_xlat4.xyw = u_xlat3.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat4.x = dot(u_xlat3.zyx, u_xlat4.xyw);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xxx;
    u_xlat4.xyw = u_xlat3.yxx + u_xlat3.zzy;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyw;
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat4.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat2.xy = (-u_xlat4.xy) * vec2(0.699999988, 0.699999988) + u_xlat2.xy;
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 3.33333325;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat14 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat14) * u_xlat2.x + 1.0;
    u_xlat14 = u_xlat3.z * 10.0;
    u_xlat14 = fract(u_xlat14);
    u_xlat2.x = u_xlat14 * u_xlat2.x;
    u_xlat14 = u_xlat26 * _Speed + u_xlat3.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_SpawnThreshold_Persistent>=u_xlat3.x);
#else
    u_xlatb3 = _SpawnThreshold_Persistent>=u_xlat3.x;
#endif
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat14 = fract(u_xlat14);
    u_xlat15 = u_xlat14 + -0.0250000004;
    u_xlat14 = u_xlat14 * 40.0;
    u_xlat14 = min(u_xlat14, 1.0);
    u_xlat15 = u_xlat15 * 1.02564096;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat27.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = (-u_xlat27.x) * u_xlat15 + 1.0;
    u_xlat27.x = u_xlat14 * -2.0 + 3.0;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat14 = u_xlat14 * u_xlat27.x;
    u_xlat14 = u_xlat15 * u_xlat14;
    u_xlat2.x = u_xlat14 * u_xlat2.x;
    u_xlat2.x = u_xlat3.x * u_xlat2.x;
    u_xlat16_18 = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = dot(vec2(u_xlat16_18), u_xlat16_6.xx);
    u_xlat14 = u_xlat37 * u_xlat16_6.x;
    u_xlat24.x = u_xlat2.x * u_xlat14 + u_xlat24.x;
    u_xlat2.x = sin(u_xlat8.z);
    u_xlat3.x = floor(u_xlat8.y);
    u_xlat3.xy = u_xlat3.xw * vec2(12345.5645, 0.75);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 7658.75977;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat2.x = u_xlat0.y * 37.0 + u_xlat2.x;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat27.x = u_xlat0.y * 1.85000002 + u_xlat3.y;
    u_xlat0.w = u_xlat3.x + u_xlat27.x;
    u_xlat3.xz = u_xlat0.xw * vec2(22.2000008, 2.0);
    u_xlat5 = u_xlat0.xyxy + vec4(0.00100000005, 0.0, 0.0, 0.00100000005);
    u_xlat0.xy = floor(u_xlat3.xz);
    u_xlat3.xz = fract(u_xlat3.xz);
    u_xlat16_6.x = dot(u_xlat0.xy, vec2(35.2000008, 2376.1001));
    u_xlat0.xyw = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat0.xyw = fract(u_xlat0.xyw);
    u_xlat4.xyw = u_xlat0.yxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat4.x = dot(u_xlat0.wyx, u_xlat4.xyw);
    u_xlat0.xyw = u_xlat0.xyw + u_xlat4.xxx;
    u_xlat4.xyw = u_xlat0.yxx + u_xlat0.wwy;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat4.xyw;
    u_xlat0.xyw = fract(u_xlat0.xyw);
    u_xlat4.xy = u_xlat0.xw + vec2(-0.5, -0.5);
    u_xlat0.x = -abs(u_xlat4.x) + 0.5;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.y + u_xlat4.x;
    u_xlat7.x = u_xlat0.x * 0.699999988;
    u_xlat0.x = u_xlat4.z + u_xlat3.z;
    u_xlat3.xz = u_xlat3.xz + vec2(-0.5, -0.0);
    u_xlat7.z = u_xlat0.x + -0.5;
    u_xlat4.xy = u_xlat3.xz + (-u_xlat7.xz);
    u_xlat0.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3.33333325;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat2.x) * u_xlat0.x + 1.0;
    u_xlat36 = u_xlat26 * _Speed + u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_SpawnThreshold_Flow>=u_xlat0.y);
#else
    u_xlatb12 = _SpawnThreshold_Flow>=u_xlat0.y;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat36 = fract(u_xlat36);
    u_xlat2.x = u_xlat36 + -0.850000024;
    u_xlat36 = u_xlat36 * 1.17647052;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat4.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) * u_xlat2.x + 1.0;
    u_xlat4.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat4.x;
    u_xlat36 = u_xlat36 * u_xlat2.x + -0.5;
    u_xlat7.y = u_xlat36 * 0.899999976 + 0.5;
    u_xlat3.xz = u_xlat3.xz + (-u_xlat7.xy);
    u_xlat36 = (-u_xlat7.y) + 1.0;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat3.z;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat2.x) * u_xlat36 + 1.0;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat0.x = u_xlat36 * u_xlat0.x;
    u_xlat4.xy = u_xlat3.xz * vec2(1.0, 6.0);
    u_xlat36 = u_xlat3.z + 0.0199999996;
    u_xlat36 = u_xlat36 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 2.5;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat3.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat3.x) * u_xlat2.x + 1.0;
    u_xlat3.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat3.x;
    u_xlat0.x = u_xlat0.x * u_xlat36 + u_xlat2.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat16_6.x = _RainAmount + _RainAmount;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_18 = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_18;
    u_xlat12.x = u_xlat37 * u_xlat16_6.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x + u_xlat24.x;
    u_xlat0.x = u_xlat0.x + -0.300000012;
    u_xlat0.x = u_xlat0.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat24.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat5.yzwz * vec4(18.5, 40.0, 40.0, 12.0);
    u_xlat7.xyz = floor(u_xlat4.yzw);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat24.x = u_xlat7.z * 12345.5645;
    u_xlat36 = dot(u_xlat7.xy, vec2(107.449997, 3543.65405));
    u_xlat7.xyz = vec3(u_xlat36) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat24.x = sin(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 7658.75977;
    u_xlat24.x = fract(u_xlat24.x);
    u_xlat25.xy = u_xlat3.ww * vec2(0.75, 0.75) + u_xlat5.yw;
    u_xlat8.x = u_xlat24.x + u_xlat25.y;
    u_xlat8.y = u_xlat5.z;
    u_xlat24.xy = u_xlat8.yx * vec2(12.0, 2.0);
    u_xlat3.xz = floor(u_xlat24.xy);
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat16_6.x = dot(u_xlat3.xz, vec2(35.2000008, 2376.1001));
    u_xlat3.xzw = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat3.xzw = fract(u_xlat3.xzw);
    u_xlat9.xyz = u_xlat3.zxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat37 = dot(u_xlat3.wzx, u_xlat9.xyz);
    u_xlat3.xzw = vec3(u_xlat37) + u_xlat3.xzw;
    u_xlat9.xyz = u_xlat3.zxx + u_xlat3.wwz;
    u_xlat3.xzw = u_xlat3.xzw * u_xlat9.xyz;
    u_xlat3.xzw = fract(u_xlat3.xzw);
    u_xlat37 = u_xlat26 * _Speed + u_xlat3.w;
    u_xlat37 = fract(u_xlat37);
    u_xlat2.x = u_xlat37 + -0.850000024;
    u_xlat37 = u_xlat37 * 1.17647052;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat40 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat40) * u_xlat2.x + 1.0;
    u_xlat40 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat40;
    u_xlat37 = u_xlat37 * u_xlat2.x + -0.5;
    u_xlat9.y = u_xlat37 * 0.899999976 + 0.5;
    u_xlat3.xw = u_xlat3.xw + vec2(-0.5, -0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(_SpawnThreshold_Flow>=u_xlat3.z);
#else
    u_xlatb37 = _SpawnThreshold_Flow>=u_xlat3.z;
#endif
    u_xlat37 = u_xlatb37 ? 1.0 : float(0.0);
    u_xlat2.x = -abs(u_xlat3.x) + 0.5;
    u_xlat10.xyz = u_xlat5.wwz * vec3(20.0, 10.0, 22.2000008);
    u_xlat27.x = sin(u_xlat10.x);
    u_xlat27.x = u_xlat5.w * 20.0 + u_xlat27.x;
    u_xlat27.x = sin(u_xlat27.x);
    u_xlat2.x = u_xlat2.x * u_xlat27.x;
    u_xlat2.x = u_xlat2.x * u_xlat3.w + u_xlat3.x;
    u_xlat9.x = u_xlat2.x * 0.699999988;
    u_xlat3.xz = u_xlat24.xy + vec2(-0.5, -0.0);
    u_xlat8.xw = (-u_xlat9.xy) + u_xlat3.xz;
    u_xlat24.x = (-u_xlat9.y) + 1.0;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat8.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = (-u_xlat2.x) * u_xlat24.x + 1.0;
    u_xlat2.x = fract(u_xlat10.y);
    u_xlat39 = floor(u_xlat10.z);
    u_xlat39 = u_xlat39 * 12345.5645;
    u_xlat39 = sin(u_xlat39);
    u_xlat39 = u_xlat39 * 7658.75977;
    u_xlat39 = fract(u_xlat39);
    u_xlat36 = u_xlat24.y + u_xlat2.x;
    u_xlat9.z = u_xlat36 + -0.5;
    u_xlat3.xz = u_xlat3.xz + (-u_xlat9.xz);
    u_xlat24.y = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat24.xy = sqrt(u_xlat24.xy);
    u_xlat36 = u_xlat24.y * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat2.x) * u_xlat36 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat36;
    u_xlat3.xz = u_xlat8.xw * vec2(1.0, 6.0);
    u_xlat36 = u_xlat8.w + 0.0199999996;
    u_xlat36 = u_xlat36 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 2.5;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat3.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat3.x) * u_xlat2.x + 1.0;
    u_xlat3.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat3.x;
    u_xlat24.x = u_xlat24.x * u_xlat36 + u_xlat2.x;
    u_xlat24.x = u_xlat37 * u_xlat24.x;
    u_xlat9.xyz = u_xlat7.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat36 = dot(u_xlat7.zyx, u_xlat9.xyz);
    u_xlat7.xyz = vec3(u_xlat36) + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat7.yxx + u_xlat7.zzy;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat9.xyz;
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat3.xz = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16.xy = u_xlat4.yz + vec2(-0.5, -0.5);
    u_xlat3.xz = (-u_xlat3.xz) * vec2(0.699999988, 0.699999988) + u_xlat16.xy;
    u_xlat36 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat37) * u_xlat36 + 1.0;
    u_xlat37 = u_xlat7.z * 10.0;
    u_xlat37 = fract(u_xlat37);
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat37 = u_xlat26 * _Speed + u_xlat7.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_SpawnThreshold_Persistent>=u_xlat7.x);
#else
    u_xlatb2 = _SpawnThreshold_Persistent>=u_xlat7.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat37 = fract(u_xlat37);
    u_xlat3.x = u_xlat37 + -0.0250000004;
    u_xlat37 = u_xlat37 * 40.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat3.x * 1.02564096;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat27.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat27.x) * u_xlat3.x + 1.0;
    u_xlat27.x = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat27.x;
    u_xlat37 = u_xlat3.x * u_xlat37;
    u_xlat24.y = u_xlat36 * u_xlat37;
    u_xlat24.xy = u_xlat24.xy * u_xlat2.wx;
    u_xlat24.x = u_xlat24.y * u_xlat14 + u_xlat24.x;
    u_xlat36 = u_xlat5.w * 1.85000002 + u_xlat3.y;
    u_xlat37 = u_xlat5.y * 1.85000002 + u_xlat3.y;
    u_xlat8.z = u_xlat39 + u_xlat36;
    u_xlat3.xy = u_xlat8.yz * vec2(22.2000008, 2.0);
    u_xlat27.xy = floor(u_xlat3.xy);
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat16_6.x = dot(u_xlat27.xy, vec2(35.2000008, 2376.1001));
    u_xlat16.xyz = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat7.xyz = u_xlat16.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat36 = dot(u_xlat16.zyx, u_xlat7.xyz);
    u_xlat16.xyz = vec3(u_xlat36) + u_xlat16.xyz;
    u_xlat7.xyz = u_xlat16.yxx + u_xlat16.zzy;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat7.xyz;
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat36 = u_xlat26 * _Speed + u_xlat16.z;
    u_xlat36 = fract(u_xlat36);
    u_xlat2.x = u_xlat36 + -0.850000024;
    u_xlat36 = u_xlat36 * 1.17647052;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat27.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat27.x) * u_xlat2.x + 1.0;
    u_xlat27.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat27.x;
    u_xlat36 = u_xlat36 * u_xlat2.x + -0.5;
    u_xlat7.y = u_xlat36 * 0.899999976 + 0.5;
    u_xlat27.xy = u_xlat16.xz + vec2(-0.5, -0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_SpawnThreshold_Flow>=u_xlat16.y);
#else
    u_xlatb36 = _SpawnThreshold_Flow>=u_xlat16.y;
#endif
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat2.x = -abs(u_xlat27.x) + 0.5;
    u_xlat16.xy = u_xlat5.ww * vec2(37.0, 18.5);
    u_xlat16.x = sin(u_xlat16.x);
    u_xlat28 = fract(u_xlat16.y);
    u_xlat28 = u_xlat3.y + u_xlat28;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.0);
    u_xlat7.z = u_xlat28 + -0.5;
    u_xlat16.x = u_xlat5.w * 37.0 + u_xlat16.x;
    u_xlat16.x = sin(u_xlat16.x);
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat27.y + u_xlat27.x;
    u_xlat7.x = u_xlat2.x * 0.699999988;
    u_xlat27.xy = (-u_xlat7.xy) + u_xlat3.xy;
    u_xlat2.x = (-u_xlat7.y) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat27.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat3.xy = u_xlat3.xy + (-u_xlat7.xz);
    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 3.33333325;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat15 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat15) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat15 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat15) * u_xlat3.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat3.x;
    u_xlat3.xy = u_xlat27.xy * vec2(1.0, 6.0);
    u_xlat27.x = u_xlat27.y + 0.0199999996;
    u_xlat27.x = u_xlat27.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 2.5;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat15 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat15) * u_xlat3.x + 1.0;
    u_xlat15 = u_xlat27.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat15 = u_xlat27.x * u_xlat15;
    u_xlat2.x = u_xlat2.x * u_xlat15 + u_xlat3.x;
    u_xlat36 = u_xlat36 * u_xlat2.x;
    u_xlat24.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + -0.300000012;
    u_xlat24.x = u_xlat24.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat36 = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat3.y = u_xlat36 * u_xlat24.x + (-u_xlat0.x);
    u_xlat6 = u_xlat5.xyxy * vec4(40.0, 40.0, 12.0, 20.0);
    u_xlat16.xyz = floor(u_xlat6.xyz);
    u_xlat24.x = u_xlat16.z * 12345.5645;
    u_xlat36 = dot(u_xlat16.xy, vec2(107.449997, 3543.65405));
    u_xlat16.xyz = vec3(u_xlat36) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat24.x = sin(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 7658.75977;
    u_xlat24.x = fract(u_xlat24.x);
    u_xlat7.x = u_xlat24.x + u_xlat25.x;
    u_xlat7.y = u_xlat5.x;
    u_xlat24.xy = u_xlat7.yx * vec2(12.0, 2.0);
    u_xlat27.xy = floor(u_xlat24.xy);
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat16_11.x = dot(u_xlat27.xy, vec2(35.2000008, 2376.1001));
    u_xlat8.xyz = u_xlat16_11.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat9.xyz = u_xlat8.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat25.x = dot(u_xlat8.zyx, u_xlat9.xyz);
    u_xlat8.xyz = u_xlat25.xxx + u_xlat8.xyz;
    u_xlat9.xyz = u_xlat8.yxx + u_xlat8.zzy;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat25.x = u_xlat26 * _Speed + u_xlat8.z;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat2.x = u_xlat25.x + -0.850000024;
    u_xlat25.x = u_xlat25.x * 1.17647052;
    u_xlat25.x = min(u_xlat25.x, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat27.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat27.x) * u_xlat2.x + 1.0;
    u_xlat27.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat27.x;
    u_xlat25.x = u_xlat25.x * u_xlat2.x + -0.5;
    u_xlat9.y = u_xlat25.x * 0.899999976 + 0.5;
    u_xlat25.x = sin(u_xlat6.w);
    u_xlat27.xy = fract(u_xlat6.xy);
    u_xlat27.xy = u_xlat27.xy + vec2(-0.5, -0.5);
    u_xlat25.x = u_xlat5.y * 20.0 + u_xlat25.x;
    u_xlat25.x = sin(u_xlat25.x);
    u_xlat29.xy = u_xlat8.xz + vec2(-0.5, -0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_SpawnThreshold_Flow>=u_xlat8.y);
#else
    u_xlatb2 = _SpawnThreshold_Flow>=u_xlat8.y;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat7.x = -abs(u_xlat29.x) + 0.5;
    u_xlat25.x = u_xlat25.x * u_xlat7.x;
    u_xlat25.x = u_xlat25.x * u_xlat29.y + u_xlat29.x;
    u_xlat9.x = u_xlat25.x * 0.699999988;
    u_xlat29.xy = u_xlat24.xy + vec2(-0.5, -0.0);
    u_xlat7.xw = (-u_xlat9.xy) + u_xlat29.xy;
    u_xlat24.x = (-u_xlat9.y) + 1.0;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat7.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat25.x = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = (-u_xlat25.x) * u_xlat24.x + 1.0;
    u_xlat8.xyz = u_xlat5.yxy * vec3(10.0, 22.2000008, 37.0);
    u_xlat25.x = fract(u_xlat8.x);
    u_xlat36 = u_xlat24.y + u_xlat25.x;
    u_xlat9.z = u_xlat36 + -0.5;
    u_xlat5.xz = u_xlat29.xy + (-u_xlat9.xz);
    u_xlat24.y = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat24.xy = sqrt(u_xlat24.xy);
    u_xlat36 = u_xlat24.y * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat25.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat25.x) * u_xlat36 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat36;
    u_xlat5.xz = u_xlat7.xw * vec2(1.0, 6.0);
    u_xlat36 = u_xlat7.w + 0.0199999996;
    u_xlat36 = u_xlat36 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat25.x = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * 2.5;
    u_xlat25.x = min(u_xlat25.x, 1.0);
    u_xlat5.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = (-u_xlat5.x) * u_xlat25.x + 1.0;
    u_xlat5.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat5.x;
    u_xlat24.x = u_xlat24.x * u_xlat36 + u_xlat25.x;
    u_xlat24.x = u_xlat2.x * u_xlat24.x;
    u_xlat24.x = u_xlat2.w * u_xlat24.x;
    u_xlat5.xzw = u_xlat16.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat36 = dot(u_xlat16.zyx, u_xlat5.xzw);
    u_xlat16.xyz = vec3(u_xlat36) + u_xlat16.xyz;
    u_xlat5.xzw = u_xlat16.yxx + u_xlat16.zzy;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat5.xzw;
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat2.xw = u_xlat16.xy + vec2(-0.5, -0.5);
    u_xlat2.xw = (-u_xlat2.xw) * vec2(0.699999988, 0.699999988) + u_xlat27.xy;
    u_xlat36 = dot(u_xlat2.xw, u_xlat2.xw);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat25.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat25.x) * u_xlat36 + 1.0;
    u_xlat25.x = u_xlat16.z * 10.0;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat36 = u_xlat36 * u_xlat25.x;
    u_xlat25.x = u_xlat26 * _Speed + u_xlat16.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_SpawnThreshold_Persistent>=u_xlat16.x);
#else
    u_xlatb2 = _SpawnThreshold_Persistent>=u_xlat16.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat38 = u_xlat25.x + -0.0250000004;
    u_xlat25.x = u_xlat25.x * 40.0;
    u_xlat25.x = min(u_xlat25.x, 1.0);
    u_xlat38 = u_xlat38 * 1.02564096;
    u_xlat38 = max(u_xlat38, 0.0);
    u_xlat27.x = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = (-u_xlat27.x) * u_xlat38 + 1.0;
    u_xlat27.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat27.x;
    u_xlat25.x = u_xlat38 * u_xlat25.x;
    u_xlat36 = u_xlat36 * u_xlat25.x;
    u_xlat36 = u_xlat2.x * u_xlat36;
    u_xlat24.x = u_xlat36 * u_xlat14 + u_xlat24.x;
    u_xlat36 = sin(u_xlat8.z);
    u_xlat25.x = floor(u_xlat8.y);
    u_xlat25.x = u_xlat25.x * 12345.5645;
    u_xlat25.x = sin(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * 7658.75977;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat7.z = u_xlat25.x + u_xlat37;
    u_xlat25.xy = u_xlat7.yz * vec2(22.2000008, 2.0);
    u_xlat36 = u_xlat5.y * 37.0 + u_xlat36;
    u_xlat36 = sin(u_xlat36);
    u_xlat2.xy = floor(u_xlat25.xy);
    u_xlat25.xy = fract(u_xlat25.xy);
    u_xlat16_11.x = dot(u_xlat2.xy, vec2(35.2000008, 2376.1001));
    u_xlat2.xyw = u_xlat16_11.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat16.xyz = u_xlat2.yxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat27.x = dot(u_xlat2.wyx, u_xlat16.xyz);
    u_xlat2.xyw = u_xlat2.xyw + u_xlat27.xxx;
    u_xlat16.xyz = u_xlat2.yxx + u_xlat2.wwy;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat16.xyz;
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat27.xy = u_xlat2.xw + vec2(-0.5, -0.5);
    u_xlat2.x = -abs(u_xlat27.x) + 0.5;
    u_xlat36 = u_xlat36 * u_xlat2.x;
    u_xlat36 = u_xlat36 * u_xlat27.y + u_xlat27.x;
    u_xlat5.x = u_xlat36 * 0.699999988;
    u_xlat36 = u_xlat4.x + u_xlat25.y;
    u_xlat25.xy = u_xlat25.xy + vec2(-0.5, -0.0);
    u_xlat5.z = u_xlat36 + -0.5;
    u_xlat27.xy = u_xlat25.xy + (-u_xlat5.xz);
    u_xlat36 = dot(u_xlat27.xy, u_xlat27.xy);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat2.x) * u_xlat36 + 1.0;
    u_xlat2.x = u_xlat26 * _Speed + u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(_SpawnThreshold_Flow>=u_xlat2.y);
#else
    u_xlatb14 = _SpawnThreshold_Flow>=u_xlat2.y;
#endif
    u_xlat14 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat2.z = u_xlat2.x + -0.850000024;
    u_xlat2.xz = u_xlat2.xz * vec2(1.17647052, 6.66666794);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat26 = max(u_xlat2.z, 0.0);
    u_xlat38 = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = (-u_xlat38) * u_xlat26 + 1.0;
    u_xlat38 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat38;
    u_xlat2.x = u_xlat2.x * u_xlat26 + -0.5;
    u_xlat5.y = u_xlat2.x * 0.899999976 + 0.5;
    u_xlat25.xy = u_xlat25.xy + (-u_xlat5.xy);
    u_xlat2.x = (-u_xlat5.y) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat25.y * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat26 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat26) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat36 = u_xlat36 * u_xlat2.x;
    u_xlat2.xz = u_xlat25.xy * vec2(1.0, 6.0);
    u_xlat25.x = u_xlat25.y + 0.0199999996;
    u_xlat25.x = u_xlat25.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat25.x = min(max(u_xlat25.x, 0.0), 1.0);
#else
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat37 = sqrt(u_xlat37);
    u_xlat37 = u_xlat37 * 2.5;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat2.x = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = (-u_xlat2.x) * u_xlat37 + 1.0;
    u_xlat2.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat2.x;
    u_xlat36 = u_xlat36 * u_xlat25.x + u_xlat37;
    u_xlat36 = u_xlat14 * u_xlat36;
    u_xlat12.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
    u_xlat12.x = u_xlat12.x + -0.300000012;
    u_xlat12.x = u_xlat12.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat24.x = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat3.x = u_xlat24.x * u_xlat12.x + (-u_xlat0.x);
    u_xlat0.xy = u_xlat3.xy * vec2(vec2(_NormalScale, _NormalScale));
    u_xlat0.z = (-u_xlat0.y);
    u_xlat0.xy = u_xlat0.xz + u_xlat1.xy;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_11.xyz = (-u_xlat16_0.xyz) + _GlassTintColor.xyz;
    u_xlat16_0.xyz = vec3(_GlassTintStrength) * u_xlat16_11.xyz + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.w = 1.0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
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
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump float _TimeScale;
uniform 	mediump float _Speed;
uniform 	mediump float _RainAmount;
uniform 	mediump float _NormalScale;
uniform 	float _DropScale;
uniform 	mediump float _SpawnThreshold_Flow;
uniform 	mediump float _SpawnThreshold_Persistent;
uniform 	vec4 _RainMask_ST;
uniform 	mediump float _MaskFadeStrength;
uniform 	mediump vec4 _GlassTintColor;
uniform 	mediump float _GlassTintStrength;
uniform lowp sampler2D _RainMask;
uniform lowp sampler2D _GrabTexture;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
bool u_xlatb12;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
vec3 u_xlat16;
mediump float u_xlat16_18;
vec2 u_xlat24;
vec2 u_xlat25;
lowp float u_xlat10_25;
bool u_xlatb25;
float u_xlat26;
vec2 u_xlat27;
float u_xlat28;
vec2 u_xlat29;
mediump float u_xlat16_30;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
bool u_xlatb37;
float u_xlat38;
float u_xlat39;
float u_xlat40;
void main()
{
    u_xlat0.x = max(_DropScale, 9.99999975e-05);
    u_xlat12.xy = _ScreenParams.xy / _ScreenParams.yy;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat1.z = (-u_xlat1.y);
    u_xlat2.xy = u_xlat1.xz + vec2(-0.5, 0.5);
    u_xlat12.xy = u_xlat12.xy * u_xlat2.xy;
    u_xlat0.xy = u_xlat12.xy / u_xlat0.xx;
    u_xlat2 = u_xlat0.xyxy * vec4(40.0, 40.0, 12.0, 20.0);
    u_xlat3.xyz = floor(u_xlat2.xyz);
    u_xlat25.x = u_xlat3.z * 12345.5645;
    u_xlat26 = dot(u_xlat3.xy, vec2(107.449997, 3543.65405));
    u_xlat3.xyz = vec3(u_xlat26) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat25.x = sin(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * 7658.75977;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat26 = _Time.y * _TimeScale;
    u_xlat26 = u_xlat26 * 0.200000003;
    u_xlat3.w = u_xlat26 * _Speed;
    u_xlat4.x = u_xlat3.w * 0.75 + u_xlat0.y;
    u_xlat0.z = u_xlat25.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat0.xzy * vec3(12.0, 2.0, 18.5);
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat16_6.x = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat7.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat24.x = dot(u_xlat5.zyx, u_xlat7.xyz);
    u_xlat5.xyz = u_xlat24.xxx + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat24.x = u_xlat26 * _Speed + u_xlat5.z;
    u_xlat24.x = fract(u_xlat24.x);
    u_xlat25.x = u_xlat24.x + -0.850000024;
    u_xlat24.x = u_xlat24.x * 1.17647052;
    u_xlat24.x = min(u_xlat24.x, 1.0);
    u_xlat25.x = u_xlat25.x * 6.66666794;
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat40 = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = (-u_xlat40) * u_xlat25.x + 1.0;
    u_xlat40 = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat40;
    u_xlat24.x = u_xlat24.x * u_xlat25.x + -0.5;
    u_xlat7.y = u_xlat24.x * 0.899999976 + 0.5;
    u_xlat24.x = sin(u_xlat2.w);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat24.x = u_xlat0.y * 20.0 + u_xlat24.x;
    u_xlat24.x = sin(u_xlat24.x);
    u_xlat5.xz = u_xlat5.xz + vec2(-0.5, -0.5);
    u_xlatb25 = _SpawnThreshold_Flow>=u_xlat5.y;
    u_xlat25.x = u_xlatb25 ? 1.0 : float(0.0);
    u_xlat38 = -abs(u_xlat5.x) + 0.5;
    u_xlat24.x = u_xlat24.x * u_xlat38;
    u_xlat24.x = u_xlat24.x * u_xlat5.z + u_xlat5.x;
    u_xlat7.x = u_xlat24.x * 0.699999988;
    u_xlat4.xw = u_xlat4.xy + vec2(-0.5, -0.0);
    u_xlat5.xy = (-u_xlat7.xy) + u_xlat4.xw;
    u_xlat24.x = (-u_xlat7.y) + 1.0;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat5.y;
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
    u_xlat38 = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = (-u_xlat38) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat8.xyz = u_xlat0.yxy * vec3(10.0, 22.2000008, 37.0);
    u_xlat38 = fract(u_xlat8.x);
    u_xlat38 = u_xlat38 + u_xlat4.y;
    u_xlat7.z = u_xlat38 + -0.5;
    u_xlat4.xy = u_xlat4.xw + (-u_xlat7.xz);
    u_xlat38 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat38 = sqrt(u_xlat38);
    u_xlat38 = u_xlat38 * 3.33333325;
    u_xlat38 = min(u_xlat38, 1.0);
    u_xlat4.x = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = (-u_xlat4.x) * u_xlat38 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat38;
    u_xlat4.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat38 = u_xlat5.y + 0.0199999996;
    u_xlat38 = u_xlat38 * 25.0;
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * 2.5;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat16.x = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = (-u_xlat16.x) * u_xlat4.x + 1.0;
    u_xlat16.x = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = u_xlat38 * u_xlat16.x;
    u_xlat24.x = u_xlat24.x * u_xlat38 + u_xlat4.x;
    u_xlat24.x = u_xlat25.x * u_xlat24.x;
    u_xlat16_6.xy = vec2(vec2(_RainAmount, _RainAmount)) + vec2(0.5, -0.25);
    u_xlat16_18 = u_xlat16_6.y + u_xlat16_6.y;
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * 0.666666687;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_30 = u_xlat16_18 * -2.0 + 3.0;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_30;
    u_xlat1.w = (-u_xlat1.y) + 1.0;
    u_xlat25.xy = u_xlat1.xw * _RainMask_ST.xy + _RainMask_ST.zw;
    u_xlat10_25 = texture2D(_RainMask, u_xlat25.xy).x;
    u_xlat37 = (-u_xlat10_25) + 1.0;
    u_xlat25.x = (-u_xlat10_25) * _MaskFadeStrength + 1.0;
    u_xlat2.w = u_xlat37 * u_xlat16_18;
    u_xlat24.x = u_xlat24.x * u_xlat2.w;
    u_xlat4.xyw = u_xlat3.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat4.x = dot(u_xlat3.zyx, u_xlat4.xyw);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xxx;
    u_xlat4.xyw = u_xlat3.yxx + u_xlat3.zzy;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyw;
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat4.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat2.xy = (-u_xlat4.xy) * vec2(0.699999988, 0.699999988) + u_xlat2.xy;
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 3.33333325;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat14 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat14) * u_xlat2.x + 1.0;
    u_xlat14 = u_xlat3.z * 10.0;
    u_xlat14 = fract(u_xlat14);
    u_xlat2.x = u_xlat14 * u_xlat2.x;
    u_xlat14 = u_xlat26 * _Speed + u_xlat3.z;
    u_xlatb3 = _SpawnThreshold_Persistent>=u_xlat3.x;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat14 = fract(u_xlat14);
    u_xlat15 = u_xlat14 + -0.0250000004;
    u_xlat14 = u_xlat14 * 40.0;
    u_xlat14 = min(u_xlat14, 1.0);
    u_xlat15 = u_xlat15 * 1.02564096;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat27.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = (-u_xlat27.x) * u_xlat15 + 1.0;
    u_xlat27.x = u_xlat14 * -2.0 + 3.0;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat14 = u_xlat14 * u_xlat27.x;
    u_xlat14 = u_xlat15 * u_xlat14;
    u_xlat2.x = u_xlat14 * u_xlat2.x;
    u_xlat2.x = u_xlat3.x * u_xlat2.x;
    u_xlat16_18 = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = dot(vec2(u_xlat16_18), u_xlat16_6.xx);
    u_xlat14 = u_xlat37 * u_xlat16_6.x;
    u_xlat24.x = u_xlat2.x * u_xlat14 + u_xlat24.x;
    u_xlat2.x = sin(u_xlat8.z);
    u_xlat3.x = floor(u_xlat8.y);
    u_xlat3.xy = u_xlat3.xw * vec2(12345.5645, 0.75);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 7658.75977;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat2.x = u_xlat0.y * 37.0 + u_xlat2.x;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat27.x = u_xlat0.y * 1.85000002 + u_xlat3.y;
    u_xlat0.w = u_xlat3.x + u_xlat27.x;
    u_xlat3.xz = u_xlat0.xw * vec2(22.2000008, 2.0);
    u_xlat5 = u_xlat0.xyxy + vec4(0.00100000005, 0.0, 0.0, 0.00100000005);
    u_xlat0.xy = floor(u_xlat3.xz);
    u_xlat3.xz = fract(u_xlat3.xz);
    u_xlat16_6.x = dot(u_xlat0.xy, vec2(35.2000008, 2376.1001));
    u_xlat0.xyw = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat0.xyw = fract(u_xlat0.xyw);
    u_xlat4.xyw = u_xlat0.yxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat4.x = dot(u_xlat0.wyx, u_xlat4.xyw);
    u_xlat0.xyw = u_xlat0.xyw + u_xlat4.xxx;
    u_xlat4.xyw = u_xlat0.yxx + u_xlat0.wwy;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat4.xyw;
    u_xlat0.xyw = fract(u_xlat0.xyw);
    u_xlat4.xy = u_xlat0.xw + vec2(-0.5, -0.5);
    u_xlat0.x = -abs(u_xlat4.x) + 0.5;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.y + u_xlat4.x;
    u_xlat7.x = u_xlat0.x * 0.699999988;
    u_xlat0.x = u_xlat4.z + u_xlat3.z;
    u_xlat3.xz = u_xlat3.xz + vec2(-0.5, -0.0);
    u_xlat7.z = u_xlat0.x + -0.5;
    u_xlat4.xy = u_xlat3.xz + (-u_xlat7.xz);
    u_xlat0.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3.33333325;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat2.x) * u_xlat0.x + 1.0;
    u_xlat36 = u_xlat26 * _Speed + u_xlat0.w;
    u_xlatb12 = _SpawnThreshold_Flow>=u_xlat0.y;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat36 = fract(u_xlat36);
    u_xlat2.x = u_xlat36 + -0.850000024;
    u_xlat36 = u_xlat36 * 1.17647052;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat4.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) * u_xlat2.x + 1.0;
    u_xlat4.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat4.x;
    u_xlat36 = u_xlat36 * u_xlat2.x + -0.5;
    u_xlat7.y = u_xlat36 * 0.899999976 + 0.5;
    u_xlat3.xz = u_xlat3.xz + (-u_xlat7.xy);
    u_xlat36 = (-u_xlat7.y) + 1.0;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat3.z;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat2.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat2.x) * u_xlat36 + 1.0;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat0.x = u_xlat36 * u_xlat0.x;
    u_xlat4.xy = u_xlat3.xz * vec2(1.0, 6.0);
    u_xlat36 = u_xlat3.z + 0.0199999996;
    u_xlat36 = u_xlat36 * 25.0;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 2.5;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat3.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat3.x) * u_xlat2.x + 1.0;
    u_xlat3.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat3.x;
    u_xlat0.x = u_xlat0.x * u_xlat36 + u_xlat2.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat16_6.x = _RainAmount + _RainAmount;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_18 = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_18;
    u_xlat12.x = u_xlat37 * u_xlat16_6.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x + u_xlat24.x;
    u_xlat0.x = u_xlat0.x + -0.300000012;
    u_xlat0.x = u_xlat0.x * 1.42857146;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat24.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4 = u_xlat5.yzwz * vec4(18.5, 40.0, 40.0, 12.0);
    u_xlat7.xyz = floor(u_xlat4.yzw);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat24.x = u_xlat7.z * 12345.5645;
    u_xlat36 = dot(u_xlat7.xy, vec2(107.449997, 3543.65405));
    u_xlat7.xyz = vec3(u_xlat36) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat24.x = sin(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 7658.75977;
    u_xlat24.x = fract(u_xlat24.x);
    u_xlat25.xy = u_xlat3.ww * vec2(0.75, 0.75) + u_xlat5.yw;
    u_xlat8.x = u_xlat24.x + u_xlat25.y;
    u_xlat8.y = u_xlat5.z;
    u_xlat24.xy = u_xlat8.yx * vec2(12.0, 2.0);
    u_xlat3.xz = floor(u_xlat24.xy);
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat16_6.x = dot(u_xlat3.xz, vec2(35.2000008, 2376.1001));
    u_xlat3.xzw = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat3.xzw = fract(u_xlat3.xzw);
    u_xlat9.xyz = u_xlat3.zxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat37 = dot(u_xlat3.wzx, u_xlat9.xyz);
    u_xlat3.xzw = vec3(u_xlat37) + u_xlat3.xzw;
    u_xlat9.xyz = u_xlat3.zxx + u_xlat3.wwz;
    u_xlat3.xzw = u_xlat3.xzw * u_xlat9.xyz;
    u_xlat3.xzw = fract(u_xlat3.xzw);
    u_xlat37 = u_xlat26 * _Speed + u_xlat3.w;
    u_xlat37 = fract(u_xlat37);
    u_xlat2.x = u_xlat37 + -0.850000024;
    u_xlat37 = u_xlat37 * 1.17647052;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat40 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat40) * u_xlat2.x + 1.0;
    u_xlat40 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat40;
    u_xlat37 = u_xlat37 * u_xlat2.x + -0.5;
    u_xlat9.y = u_xlat37 * 0.899999976 + 0.5;
    u_xlat3.xw = u_xlat3.xw + vec2(-0.5, -0.5);
    u_xlatb37 = _SpawnThreshold_Flow>=u_xlat3.z;
    u_xlat37 = u_xlatb37 ? 1.0 : float(0.0);
    u_xlat2.x = -abs(u_xlat3.x) + 0.5;
    u_xlat10.xyz = u_xlat5.wwz * vec3(20.0, 10.0, 22.2000008);
    u_xlat27.x = sin(u_xlat10.x);
    u_xlat27.x = u_xlat5.w * 20.0 + u_xlat27.x;
    u_xlat27.x = sin(u_xlat27.x);
    u_xlat2.x = u_xlat2.x * u_xlat27.x;
    u_xlat2.x = u_xlat2.x * u_xlat3.w + u_xlat3.x;
    u_xlat9.x = u_xlat2.x * 0.699999988;
    u_xlat3.xz = u_xlat24.xy + vec2(-0.5, -0.0);
    u_xlat8.xw = (-u_xlat9.xy) + u_xlat3.xz;
    u_xlat24.x = (-u_xlat9.y) + 1.0;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat8.w;
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
    u_xlat2.x = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = (-u_xlat2.x) * u_xlat24.x + 1.0;
    u_xlat2.x = fract(u_xlat10.y);
    u_xlat39 = floor(u_xlat10.z);
    u_xlat39 = u_xlat39 * 12345.5645;
    u_xlat39 = sin(u_xlat39);
    u_xlat39 = u_xlat39 * 7658.75977;
    u_xlat39 = fract(u_xlat39);
    u_xlat36 = u_xlat24.y + u_xlat2.x;
    u_xlat9.z = u_xlat36 + -0.5;
    u_xlat3.xz = u_xlat3.xz + (-u_xlat9.xz);
    u_xlat24.y = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat24.xy = sqrt(u_xlat24.xy);
    u_xlat36 = u_xlat24.y * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat2.x) * u_xlat36 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat36;
    u_xlat3.xz = u_xlat8.xw * vec2(1.0, 6.0);
    u_xlat36 = u_xlat8.w + 0.0199999996;
    u_xlat36 = u_xlat36 * 25.0;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 2.5;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat3.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat3.x) * u_xlat2.x + 1.0;
    u_xlat3.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat3.x;
    u_xlat24.x = u_xlat24.x * u_xlat36 + u_xlat2.x;
    u_xlat24.x = u_xlat37 * u_xlat24.x;
    u_xlat9.xyz = u_xlat7.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat36 = dot(u_xlat7.zyx, u_xlat9.xyz);
    u_xlat7.xyz = vec3(u_xlat36) + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat7.yxx + u_xlat7.zzy;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat9.xyz;
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat3.xz = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16.xy = u_xlat4.yz + vec2(-0.5, -0.5);
    u_xlat3.xz = (-u_xlat3.xz) * vec2(0.699999988, 0.699999988) + u_xlat16.xy;
    u_xlat36 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat37) * u_xlat36 + 1.0;
    u_xlat37 = u_xlat7.z * 10.0;
    u_xlat37 = fract(u_xlat37);
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat37 = u_xlat26 * _Speed + u_xlat7.z;
    u_xlatb2 = _SpawnThreshold_Persistent>=u_xlat7.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat37 = fract(u_xlat37);
    u_xlat3.x = u_xlat37 + -0.0250000004;
    u_xlat37 = u_xlat37 * 40.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat3.x * 1.02564096;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat27.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat27.x) * u_xlat3.x + 1.0;
    u_xlat27.x = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat27.x;
    u_xlat37 = u_xlat3.x * u_xlat37;
    u_xlat24.y = u_xlat36 * u_xlat37;
    u_xlat24.xy = u_xlat24.xy * u_xlat2.wx;
    u_xlat24.x = u_xlat24.y * u_xlat14 + u_xlat24.x;
    u_xlat36 = u_xlat5.w * 1.85000002 + u_xlat3.y;
    u_xlat37 = u_xlat5.y * 1.85000002 + u_xlat3.y;
    u_xlat8.z = u_xlat39 + u_xlat36;
    u_xlat3.xy = u_xlat8.yz * vec2(22.2000008, 2.0);
    u_xlat27.xy = floor(u_xlat3.xy);
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat16_6.x = dot(u_xlat27.xy, vec2(35.2000008, 2376.1001));
    u_xlat16.xyz = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat7.xyz = u_xlat16.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat36 = dot(u_xlat16.zyx, u_xlat7.xyz);
    u_xlat16.xyz = vec3(u_xlat36) + u_xlat16.xyz;
    u_xlat7.xyz = u_xlat16.yxx + u_xlat16.zzy;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat7.xyz;
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat36 = u_xlat26 * _Speed + u_xlat16.z;
    u_xlat36 = fract(u_xlat36);
    u_xlat2.x = u_xlat36 + -0.850000024;
    u_xlat36 = u_xlat36 * 1.17647052;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat27.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat27.x) * u_xlat2.x + 1.0;
    u_xlat27.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat27.x;
    u_xlat36 = u_xlat36 * u_xlat2.x + -0.5;
    u_xlat7.y = u_xlat36 * 0.899999976 + 0.5;
    u_xlat27.xy = u_xlat16.xz + vec2(-0.5, -0.5);
    u_xlatb36 = _SpawnThreshold_Flow>=u_xlat16.y;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat2.x = -abs(u_xlat27.x) + 0.5;
    u_xlat16.xy = u_xlat5.ww * vec2(37.0, 18.5);
    u_xlat16.x = sin(u_xlat16.x);
    u_xlat28 = fract(u_xlat16.y);
    u_xlat28 = u_xlat3.y + u_xlat28;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.0);
    u_xlat7.z = u_xlat28 + -0.5;
    u_xlat16.x = u_xlat5.w * 37.0 + u_xlat16.x;
    u_xlat16.x = sin(u_xlat16.x);
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat27.y + u_xlat27.x;
    u_xlat7.x = u_xlat2.x * 0.699999988;
    u_xlat27.xy = (-u_xlat7.xy) + u_xlat3.xy;
    u_xlat2.x = (-u_xlat7.y) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat27.y;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat3.xy = u_xlat3.xy + (-u_xlat7.xz);
    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 3.33333325;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat15 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat15) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat15 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat15) * u_xlat3.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat3.x;
    u_xlat3.xy = u_xlat27.xy * vec2(1.0, 6.0);
    u_xlat27.x = u_xlat27.y + 0.0199999996;
    u_xlat27.x = u_xlat27.x * 25.0;
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 2.5;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat15 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat15) * u_xlat3.x + 1.0;
    u_xlat15 = u_xlat27.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat15 = u_xlat27.x * u_xlat15;
    u_xlat2.x = u_xlat2.x * u_xlat15 + u_xlat3.x;
    u_xlat36 = u_xlat36 * u_xlat2.x;
    u_xlat24.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + -0.300000012;
    u_xlat24.x = u_xlat24.x * 1.42857146;
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
    u_xlat36 = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat3.y = u_xlat36 * u_xlat24.x + (-u_xlat0.x);
    u_xlat6 = u_xlat5.xyxy * vec4(40.0, 40.0, 12.0, 20.0);
    u_xlat16.xyz = floor(u_xlat6.xyz);
    u_xlat24.x = u_xlat16.z * 12345.5645;
    u_xlat36 = dot(u_xlat16.xy, vec2(107.449997, 3543.65405));
    u_xlat16.xyz = vec3(u_xlat36) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat24.x = sin(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 7658.75977;
    u_xlat24.x = fract(u_xlat24.x);
    u_xlat7.x = u_xlat24.x + u_xlat25.x;
    u_xlat7.y = u_xlat5.x;
    u_xlat24.xy = u_xlat7.yx * vec2(12.0, 2.0);
    u_xlat27.xy = floor(u_xlat24.xy);
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat16_11.x = dot(u_xlat27.xy, vec2(35.2000008, 2376.1001));
    u_xlat8.xyz = u_xlat16_11.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat9.xyz = u_xlat8.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat25.x = dot(u_xlat8.zyx, u_xlat9.xyz);
    u_xlat8.xyz = u_xlat25.xxx + u_xlat8.xyz;
    u_xlat9.xyz = u_xlat8.yxx + u_xlat8.zzy;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat25.x = u_xlat26 * _Speed + u_xlat8.z;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat2.x = u_xlat25.x + -0.850000024;
    u_xlat25.x = u_xlat25.x * 1.17647052;
    u_xlat25.x = min(u_xlat25.x, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat27.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat27.x) * u_xlat2.x + 1.0;
    u_xlat27.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat27.x;
    u_xlat25.x = u_xlat25.x * u_xlat2.x + -0.5;
    u_xlat9.y = u_xlat25.x * 0.899999976 + 0.5;
    u_xlat25.x = sin(u_xlat6.w);
    u_xlat27.xy = fract(u_xlat6.xy);
    u_xlat27.xy = u_xlat27.xy + vec2(-0.5, -0.5);
    u_xlat25.x = u_xlat5.y * 20.0 + u_xlat25.x;
    u_xlat25.x = sin(u_xlat25.x);
    u_xlat29.xy = u_xlat8.xz + vec2(-0.5, -0.5);
    u_xlatb2 = _SpawnThreshold_Flow>=u_xlat8.y;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat7.x = -abs(u_xlat29.x) + 0.5;
    u_xlat25.x = u_xlat25.x * u_xlat7.x;
    u_xlat25.x = u_xlat25.x * u_xlat29.y + u_xlat29.x;
    u_xlat9.x = u_xlat25.x * 0.699999988;
    u_xlat29.xy = u_xlat24.xy + vec2(-0.5, -0.0);
    u_xlat7.xw = (-u_xlat9.xy) + u_xlat29.xy;
    u_xlat24.x = (-u_xlat9.y) + 1.0;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat7.w;
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
    u_xlat25.x = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = (-u_xlat25.x) * u_xlat24.x + 1.0;
    u_xlat8.xyz = u_xlat5.yxy * vec3(10.0, 22.2000008, 37.0);
    u_xlat25.x = fract(u_xlat8.x);
    u_xlat36 = u_xlat24.y + u_xlat25.x;
    u_xlat9.z = u_xlat36 + -0.5;
    u_xlat5.xz = u_xlat29.xy + (-u_xlat9.xz);
    u_xlat24.y = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat24.xy = sqrt(u_xlat24.xy);
    u_xlat36 = u_xlat24.y * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat25.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat25.x) * u_xlat36 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat36;
    u_xlat5.xz = u_xlat7.xw * vec2(1.0, 6.0);
    u_xlat36 = u_xlat7.w + 0.0199999996;
    u_xlat36 = u_xlat36 * 25.0;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat25.x = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * 2.5;
    u_xlat25.x = min(u_xlat25.x, 1.0);
    u_xlat5.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = (-u_xlat5.x) * u_xlat25.x + 1.0;
    u_xlat5.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat5.x;
    u_xlat24.x = u_xlat24.x * u_xlat36 + u_xlat25.x;
    u_xlat24.x = u_xlat2.x * u_xlat24.x;
    u_xlat24.x = u_xlat2.w * u_xlat24.x;
    u_xlat5.xzw = u_xlat16.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat36 = dot(u_xlat16.zyx, u_xlat5.xzw);
    u_xlat16.xyz = vec3(u_xlat36) + u_xlat16.xyz;
    u_xlat5.xzw = u_xlat16.yxx + u_xlat16.zzy;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat5.xzw;
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat2.xw = u_xlat16.xy + vec2(-0.5, -0.5);
    u_xlat2.xw = (-u_xlat2.xw) * vec2(0.699999988, 0.699999988) + u_xlat27.xy;
    u_xlat36 = dot(u_xlat2.xw, u_xlat2.xw);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat25.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat25.x) * u_xlat36 + 1.0;
    u_xlat25.x = u_xlat16.z * 10.0;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat36 = u_xlat36 * u_xlat25.x;
    u_xlat25.x = u_xlat26 * _Speed + u_xlat16.z;
    u_xlatb2 = _SpawnThreshold_Persistent>=u_xlat16.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat38 = u_xlat25.x + -0.0250000004;
    u_xlat25.x = u_xlat25.x * 40.0;
    u_xlat25.x = min(u_xlat25.x, 1.0);
    u_xlat38 = u_xlat38 * 1.02564096;
    u_xlat38 = max(u_xlat38, 0.0);
    u_xlat27.x = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = (-u_xlat27.x) * u_xlat38 + 1.0;
    u_xlat27.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat27.x;
    u_xlat25.x = u_xlat38 * u_xlat25.x;
    u_xlat36 = u_xlat36 * u_xlat25.x;
    u_xlat36 = u_xlat2.x * u_xlat36;
    u_xlat24.x = u_xlat36 * u_xlat14 + u_xlat24.x;
    u_xlat36 = sin(u_xlat8.z);
    u_xlat25.x = floor(u_xlat8.y);
    u_xlat25.x = u_xlat25.x * 12345.5645;
    u_xlat25.x = sin(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * 7658.75977;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat7.z = u_xlat25.x + u_xlat37;
    u_xlat25.xy = u_xlat7.yz * vec2(22.2000008, 2.0);
    u_xlat36 = u_xlat5.y * 37.0 + u_xlat36;
    u_xlat36 = sin(u_xlat36);
    u_xlat2.xy = floor(u_xlat25.xy);
    u_xlat25.xy = fract(u_xlat25.xy);
    u_xlat16_11.x = dot(u_xlat2.xy, vec2(35.2000008, 2376.1001));
    u_xlat2.xyw = u_xlat16_11.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat16.xyz = u_xlat2.yxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat27.x = dot(u_xlat2.wyx, u_xlat16.xyz);
    u_xlat2.xyw = u_xlat2.xyw + u_xlat27.xxx;
    u_xlat16.xyz = u_xlat2.yxx + u_xlat2.wwy;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat16.xyz;
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat27.xy = u_xlat2.xw + vec2(-0.5, -0.5);
    u_xlat2.x = -abs(u_xlat27.x) + 0.5;
    u_xlat36 = u_xlat36 * u_xlat2.x;
    u_xlat36 = u_xlat36 * u_xlat27.y + u_xlat27.x;
    u_xlat5.x = u_xlat36 * 0.699999988;
    u_xlat36 = u_xlat4.x + u_xlat25.y;
    u_xlat25.xy = u_xlat25.xy + vec2(-0.5, -0.0);
    u_xlat5.z = u_xlat36 + -0.5;
    u_xlat27.xy = u_xlat25.xy + (-u_xlat5.xz);
    u_xlat36 = dot(u_xlat27.xy, u_xlat27.xy);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat2.x) * u_xlat36 + 1.0;
    u_xlat2.x = u_xlat26 * _Speed + u_xlat2.w;
    u_xlatb14 = _SpawnThreshold_Flow>=u_xlat2.y;
    u_xlat14 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat2.z = u_xlat2.x + -0.850000024;
    u_xlat2.xz = u_xlat2.xz * vec2(1.17647052, 6.66666794);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat26 = max(u_xlat2.z, 0.0);
    u_xlat38 = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = (-u_xlat38) * u_xlat26 + 1.0;
    u_xlat38 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat38;
    u_xlat2.x = u_xlat2.x * u_xlat26 + -0.5;
    u_xlat5.y = u_xlat2.x * 0.899999976 + 0.5;
    u_xlat25.xy = u_xlat25.xy + (-u_xlat5.xy);
    u_xlat2.x = (-u_xlat5.y) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat25.y * u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat26 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat26) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat36 = u_xlat36 * u_xlat2.x;
    u_xlat2.xz = u_xlat25.xy * vec2(1.0, 6.0);
    u_xlat25.x = u_xlat25.y + 0.0199999996;
    u_xlat25.x = u_xlat25.x * 25.0;
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
    u_xlat37 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat37 = sqrt(u_xlat37);
    u_xlat37 = u_xlat37 * 2.5;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat2.x = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = (-u_xlat2.x) * u_xlat37 + 1.0;
    u_xlat2.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat2.x;
    u_xlat36 = u_xlat36 * u_xlat25.x + u_xlat37;
    u_xlat36 = u_xlat14 * u_xlat36;
    u_xlat12.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
    u_xlat12.x = u_xlat12.x + -0.300000012;
    u_xlat12.x = u_xlat12.x * 1.42857146;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat24.x = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat3.x = u_xlat24.x * u_xlat12.x + (-u_xlat0.x);
    u_xlat0.xy = u_xlat3.xy * vec2(vec2(_NormalScale, _NormalScale));
    u_xlat0.z = (-u_xlat0.y);
    u_xlat0.xy = u_xlat0.xz + u_xlat1.xy;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_11.xyz = (-u_xlat10_0.xyz) + _GlassTintColor.xyz;
    u_xlat16_0.xyz = vec3(_GlassTintStrength) * u_xlat16_11.xyz + u_xlat10_0.xyz;
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat16_0.w = 1.0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
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
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump float _TimeScale;
uniform 	mediump float _Speed;
uniform 	mediump float _RainAmount;
uniform 	mediump float _NormalScale;
uniform 	float _DropScale;
uniform 	mediump float _SpawnThreshold_Flow;
uniform 	mediump float _SpawnThreshold_Persistent;
uniform 	vec4 _RainMask_ST;
uniform 	mediump float _MaskFadeStrength;
uniform 	mediump vec4 _GlassTintColor;
uniform 	mediump float _GlassTintStrength;
uniform lowp sampler2D _RainMask;
uniform lowp sampler2D _GrabTexture;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
bool u_xlatb3;
vec4 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat6;
mediump vec2 u_xlat16_6;
vec4 u_xlat7;
vec4 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
vec2 u_xlat12;
bool u_xlatb12;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
vec3 u_xlat16;
mediump float u_xlat16_18;
vec2 u_xlat24;
vec2 u_xlat25;
lowp float u_xlat10_25;
bool u_xlatb25;
float u_xlat26;
vec2 u_xlat27;
float u_xlat28;
vec2 u_xlat29;
mediump float u_xlat16_30;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
bool u_xlatb37;
float u_xlat38;
float u_xlat39;
float u_xlat40;
void main()
{
    u_xlat0.x = max(_DropScale, 9.99999975e-05);
    u_xlat12.xy = _ScreenParams.xy / _ScreenParams.yy;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat1.z = (-u_xlat1.y);
    u_xlat2.xy = u_xlat1.xz + vec2(-0.5, 0.5);
    u_xlat12.xy = u_xlat12.xy * u_xlat2.xy;
    u_xlat0.xy = u_xlat12.xy / u_xlat0.xx;
    u_xlat2 = u_xlat0.xyxy * vec4(40.0, 40.0, 12.0, 20.0);
    u_xlat3.xyz = floor(u_xlat2.xyz);
    u_xlat25.x = u_xlat3.z * 12345.5645;
    u_xlat26 = dot(u_xlat3.xy, vec2(107.449997, 3543.65405));
    u_xlat3.xyz = vec3(u_xlat26) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat25.x = sin(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * 7658.75977;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat26 = _Time.y * _TimeScale;
    u_xlat26 = u_xlat26 * 0.200000003;
    u_xlat3.w = u_xlat26 * _Speed;
    u_xlat4.x = u_xlat3.w * 0.75 + u_xlat0.y;
    u_xlat0.z = u_xlat25.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat0.xzy * vec3(12.0, 2.0, 18.5);
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat16_6.x = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat7.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat24.x = dot(u_xlat5.zyx, u_xlat7.xyz);
    u_xlat5.xyz = u_xlat24.xxx + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat24.x = u_xlat26 * _Speed + u_xlat5.z;
    u_xlat24.x = fract(u_xlat24.x);
    u_xlat25.x = u_xlat24.x + -0.850000024;
    u_xlat24.x = u_xlat24.x * 1.17647052;
    u_xlat24.x = min(u_xlat24.x, 1.0);
    u_xlat25.x = u_xlat25.x * 6.66666794;
    u_xlat25.x = max(u_xlat25.x, 0.0);
    u_xlat40 = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = (-u_xlat40) * u_xlat25.x + 1.0;
    u_xlat40 = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat40;
    u_xlat24.x = u_xlat24.x * u_xlat25.x + -0.5;
    u_xlat7.y = u_xlat24.x * 0.899999976 + 0.5;
    u_xlat24.x = sin(u_xlat2.w);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat24.x = u_xlat0.y * 20.0 + u_xlat24.x;
    u_xlat24.x = sin(u_xlat24.x);
    u_xlat5.xz = u_xlat5.xz + vec2(-0.5, -0.5);
    u_xlatb25 = _SpawnThreshold_Flow>=u_xlat5.y;
    u_xlat25.x = u_xlatb25 ? 1.0 : float(0.0);
    u_xlat38 = -abs(u_xlat5.x) + 0.5;
    u_xlat24.x = u_xlat24.x * u_xlat38;
    u_xlat24.x = u_xlat24.x * u_xlat5.z + u_xlat5.x;
    u_xlat7.x = u_xlat24.x * 0.699999988;
    u_xlat4.xw = u_xlat4.xy + vec2(-0.5, -0.0);
    u_xlat5.xy = (-u_xlat7.xy) + u_xlat4.xw;
    u_xlat24.x = (-u_xlat7.y) + 1.0;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat5.y;
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
    u_xlat38 = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = (-u_xlat38) * u_xlat24.x + 1.0;
    u_xlat24.x = sqrt(u_xlat24.x);
    u_xlat8.xyz = u_xlat0.yxy * vec3(10.0, 22.2000008, 37.0);
    u_xlat38 = fract(u_xlat8.x);
    u_xlat38 = u_xlat38 + u_xlat4.y;
    u_xlat7.z = u_xlat38 + -0.5;
    u_xlat4.xy = u_xlat4.xw + (-u_xlat7.xz);
    u_xlat38 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat38 = sqrt(u_xlat38);
    u_xlat38 = u_xlat38 * 3.33333325;
    u_xlat38 = min(u_xlat38, 1.0);
    u_xlat4.x = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = (-u_xlat4.x) * u_xlat38 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat38;
    u_xlat4.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat38 = u_xlat5.y + 0.0199999996;
    u_xlat38 = u_xlat38 * 25.0;
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * 2.5;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat16.x = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = (-u_xlat16.x) * u_xlat4.x + 1.0;
    u_xlat16.x = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = u_xlat38 * u_xlat16.x;
    u_xlat24.x = u_xlat24.x * u_xlat38 + u_xlat4.x;
    u_xlat24.x = u_xlat25.x * u_xlat24.x;
    u_xlat16_6.xy = vec2(vec2(_RainAmount, _RainAmount)) + vec2(0.5, -0.25);
    u_xlat16_18 = u_xlat16_6.y + u_xlat16_6.y;
    u_xlat16_18 = clamp(u_xlat16_18, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * 0.666666687;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_30 = u_xlat16_18 * -2.0 + 3.0;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_18;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_30;
    u_xlat1.w = (-u_xlat1.y) + 1.0;
    u_xlat25.xy = u_xlat1.xw * _RainMask_ST.xy + _RainMask_ST.zw;
    u_xlat10_25 = texture2D(_RainMask, u_xlat25.xy).x;
    u_xlat37 = (-u_xlat10_25) + 1.0;
    u_xlat25.x = (-u_xlat10_25) * _MaskFadeStrength + 1.0;
    u_xlat2.w = u_xlat37 * u_xlat16_18;
    u_xlat24.x = u_xlat24.x * u_xlat2.w;
    u_xlat4.xyw = u_xlat3.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat4.x = dot(u_xlat3.zyx, u_xlat4.xyw);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat4.xxx;
    u_xlat4.xyw = u_xlat3.yxx + u_xlat3.zzy;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyw;
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat4.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat2.xy = (-u_xlat4.xy) * vec2(0.699999988, 0.699999988) + u_xlat2.xy;
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 3.33333325;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat14 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat14) * u_xlat2.x + 1.0;
    u_xlat14 = u_xlat3.z * 10.0;
    u_xlat14 = fract(u_xlat14);
    u_xlat2.x = u_xlat14 * u_xlat2.x;
    u_xlat14 = u_xlat26 * _Speed + u_xlat3.z;
    u_xlatb3 = _SpawnThreshold_Persistent>=u_xlat3.x;
    u_xlat3.x = u_xlatb3 ? 1.0 : float(0.0);
    u_xlat14 = fract(u_xlat14);
    u_xlat15 = u_xlat14 + -0.0250000004;
    u_xlat14 = u_xlat14 * 40.0;
    u_xlat14 = min(u_xlat14, 1.0);
    u_xlat15 = u_xlat15 * 1.02564096;
    u_xlat15 = max(u_xlat15, 0.0);
    u_xlat27.x = u_xlat15 * -2.0 + 3.0;
    u_xlat15 = u_xlat15 * u_xlat15;
    u_xlat15 = (-u_xlat27.x) * u_xlat15 + 1.0;
    u_xlat27.x = u_xlat14 * -2.0 + 3.0;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat14 = u_xlat14 * u_xlat27.x;
    u_xlat14 = u_xlat15 * u_xlat14;
    u_xlat2.x = u_xlat14 * u_xlat2.x;
    u_xlat2.x = u_xlat3.x * u_xlat2.x;
    u_xlat16_18 = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = dot(vec2(u_xlat16_18), u_xlat16_6.xx);
    u_xlat14 = u_xlat37 * u_xlat16_6.x;
    u_xlat24.x = u_xlat2.x * u_xlat14 + u_xlat24.x;
    u_xlat2.x = sin(u_xlat8.z);
    u_xlat3.x = floor(u_xlat8.y);
    u_xlat3.xy = u_xlat3.xw * vec2(12345.5645, 0.75);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 7658.75977;
    u_xlat3.x = fract(u_xlat3.x);
    u_xlat2.x = u_xlat0.y * 37.0 + u_xlat2.x;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat27.x = u_xlat0.y * 1.85000002 + u_xlat3.y;
    u_xlat0.w = u_xlat3.x + u_xlat27.x;
    u_xlat3.xz = u_xlat0.xw * vec2(22.2000008, 2.0);
    u_xlat5 = u_xlat0.xyxy + vec4(0.00100000005, 0.0, 0.0, 0.00100000005);
    u_xlat0.xy = floor(u_xlat3.xz);
    u_xlat3.xz = fract(u_xlat3.xz);
    u_xlat16_6.x = dot(u_xlat0.xy, vec2(35.2000008, 2376.1001));
    u_xlat0.xyw = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat0.xyw = fract(u_xlat0.xyw);
    u_xlat4.xyw = u_xlat0.yxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat4.x = dot(u_xlat0.wyx, u_xlat4.xyw);
    u_xlat0.xyw = u_xlat0.xyw + u_xlat4.xxx;
    u_xlat4.xyw = u_xlat0.yxx + u_xlat0.wwy;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat4.xyw;
    u_xlat0.xyw = fract(u_xlat0.xyw);
    u_xlat4.xy = u_xlat0.xw + vec2(-0.5, -0.5);
    u_xlat0.x = -abs(u_xlat4.x) + 0.5;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = u_xlat0.x * u_xlat4.y + u_xlat4.x;
    u_xlat7.x = u_xlat0.x * 0.699999988;
    u_xlat0.x = u_xlat4.z + u_xlat3.z;
    u_xlat3.xz = u_xlat3.xz + vec2(-0.5, -0.0);
    u_xlat7.z = u_xlat0.x + -0.5;
    u_xlat4.xy = u_xlat3.xz + (-u_xlat7.xz);
    u_xlat0.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3.33333325;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat2.x) * u_xlat0.x + 1.0;
    u_xlat36 = u_xlat26 * _Speed + u_xlat0.w;
    u_xlatb12 = _SpawnThreshold_Flow>=u_xlat0.y;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat36 = fract(u_xlat36);
    u_xlat2.x = u_xlat36 + -0.850000024;
    u_xlat36 = u_xlat36 * 1.17647052;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat4.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat4.x) * u_xlat2.x + 1.0;
    u_xlat4.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat4.x;
    u_xlat36 = u_xlat36 * u_xlat2.x + -0.5;
    u_xlat7.y = u_xlat36 * 0.899999976 + 0.5;
    u_xlat3.xz = u_xlat3.xz + (-u_xlat7.xy);
    u_xlat36 = (-u_xlat7.y) + 1.0;
    u_xlat36 = float(1.0) / u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat3.z;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat2.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat2.x) * u_xlat36 + 1.0;
    u_xlat36 = sqrt(u_xlat36);
    u_xlat0.x = u_xlat36 * u_xlat0.x;
    u_xlat4.xy = u_xlat3.xz * vec2(1.0, 6.0);
    u_xlat36 = u_xlat3.z + 0.0199999996;
    u_xlat36 = u_xlat36 * 25.0;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 2.5;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat3.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat3.x) * u_xlat2.x + 1.0;
    u_xlat3.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat3.x;
    u_xlat0.x = u_xlat0.x * u_xlat36 + u_xlat2.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x;
    u_xlat16_6.x = _RainAmount + _RainAmount;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_18 = u_xlat16_6.x * -2.0 + 3.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_18;
    u_xlat12.x = u_xlat37 * u_xlat16_6.x;
    u_xlat0.x = u_xlat0.x * u_xlat12.x + u_xlat24.x;
    u_xlat0.x = u_xlat0.x + -0.300000012;
    u_xlat0.x = u_xlat0.x * 1.42857146;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat24.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat24.x;
    u_xlat0.x = u_xlat25.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4 = u_xlat5.yzwz * vec4(18.5, 40.0, 40.0, 12.0);
    u_xlat7.xyz = floor(u_xlat4.yzw);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat24.x = u_xlat7.z * 12345.5645;
    u_xlat36 = dot(u_xlat7.xy, vec2(107.449997, 3543.65405));
    u_xlat7.xyz = vec3(u_xlat36) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat24.x = sin(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 7658.75977;
    u_xlat24.x = fract(u_xlat24.x);
    u_xlat25.xy = u_xlat3.ww * vec2(0.75, 0.75) + u_xlat5.yw;
    u_xlat8.x = u_xlat24.x + u_xlat25.y;
    u_xlat8.y = u_xlat5.z;
    u_xlat24.xy = u_xlat8.yx * vec2(12.0, 2.0);
    u_xlat3.xz = floor(u_xlat24.xy);
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat16_6.x = dot(u_xlat3.xz, vec2(35.2000008, 2376.1001));
    u_xlat3.xzw = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat3.xzw = fract(u_xlat3.xzw);
    u_xlat9.xyz = u_xlat3.zxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat37 = dot(u_xlat3.wzx, u_xlat9.xyz);
    u_xlat3.xzw = vec3(u_xlat37) + u_xlat3.xzw;
    u_xlat9.xyz = u_xlat3.zxx + u_xlat3.wwz;
    u_xlat3.xzw = u_xlat3.xzw * u_xlat9.xyz;
    u_xlat3.xzw = fract(u_xlat3.xzw);
    u_xlat37 = u_xlat26 * _Speed + u_xlat3.w;
    u_xlat37 = fract(u_xlat37);
    u_xlat2.x = u_xlat37 + -0.850000024;
    u_xlat37 = u_xlat37 * 1.17647052;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat40 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat40) * u_xlat2.x + 1.0;
    u_xlat40 = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat40;
    u_xlat37 = u_xlat37 * u_xlat2.x + -0.5;
    u_xlat9.y = u_xlat37 * 0.899999976 + 0.5;
    u_xlat3.xw = u_xlat3.xw + vec2(-0.5, -0.5);
    u_xlatb37 = _SpawnThreshold_Flow>=u_xlat3.z;
    u_xlat37 = u_xlatb37 ? 1.0 : float(0.0);
    u_xlat2.x = -abs(u_xlat3.x) + 0.5;
    u_xlat10.xyz = u_xlat5.wwz * vec3(20.0, 10.0, 22.2000008);
    u_xlat27.x = sin(u_xlat10.x);
    u_xlat27.x = u_xlat5.w * 20.0 + u_xlat27.x;
    u_xlat27.x = sin(u_xlat27.x);
    u_xlat2.x = u_xlat2.x * u_xlat27.x;
    u_xlat2.x = u_xlat2.x * u_xlat3.w + u_xlat3.x;
    u_xlat9.x = u_xlat2.x * 0.699999988;
    u_xlat3.xz = u_xlat24.xy + vec2(-0.5, -0.0);
    u_xlat8.xw = (-u_xlat9.xy) + u_xlat3.xz;
    u_xlat24.x = (-u_xlat9.y) + 1.0;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat8.w;
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
    u_xlat2.x = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = (-u_xlat2.x) * u_xlat24.x + 1.0;
    u_xlat2.x = fract(u_xlat10.y);
    u_xlat39 = floor(u_xlat10.z);
    u_xlat39 = u_xlat39 * 12345.5645;
    u_xlat39 = sin(u_xlat39);
    u_xlat39 = u_xlat39 * 7658.75977;
    u_xlat39 = fract(u_xlat39);
    u_xlat36 = u_xlat24.y + u_xlat2.x;
    u_xlat9.z = u_xlat36 + -0.5;
    u_xlat3.xz = u_xlat3.xz + (-u_xlat9.xz);
    u_xlat24.y = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat24.xy = sqrt(u_xlat24.xy);
    u_xlat36 = u_xlat24.y * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat2.x) * u_xlat36 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat36;
    u_xlat3.xz = u_xlat8.xw * vec2(1.0, 6.0);
    u_xlat36 = u_xlat8.w + 0.0199999996;
    u_xlat36 = u_xlat36 * 25.0;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat2.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 2.5;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat3.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat3.x) * u_xlat2.x + 1.0;
    u_xlat3.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat3.x;
    u_xlat24.x = u_xlat24.x * u_xlat36 + u_xlat2.x;
    u_xlat24.x = u_xlat37 * u_xlat24.x;
    u_xlat9.xyz = u_xlat7.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat36 = dot(u_xlat7.zyx, u_xlat9.xyz);
    u_xlat7.xyz = vec3(u_xlat36) + u_xlat7.xyz;
    u_xlat9.xyz = u_xlat7.yxx + u_xlat7.zzy;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat9.xyz;
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat3.xz = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat16.xy = u_xlat4.yz + vec2(-0.5, -0.5);
    u_xlat3.xz = (-u_xlat3.xz) * vec2(0.699999988, 0.699999988) + u_xlat16.xy;
    u_xlat36 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat37 = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat37) * u_xlat36 + 1.0;
    u_xlat37 = u_xlat7.z * 10.0;
    u_xlat37 = fract(u_xlat37);
    u_xlat36 = u_xlat36 * u_xlat37;
    u_xlat37 = u_xlat26 * _Speed + u_xlat7.z;
    u_xlatb2 = _SpawnThreshold_Persistent>=u_xlat7.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat37 = fract(u_xlat37);
    u_xlat3.x = u_xlat37 + -0.0250000004;
    u_xlat37 = u_xlat37 * 40.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat3.x * 1.02564096;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat27.x = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat27.x) * u_xlat3.x + 1.0;
    u_xlat27.x = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = u_xlat37 * u_xlat27.x;
    u_xlat37 = u_xlat3.x * u_xlat37;
    u_xlat24.y = u_xlat36 * u_xlat37;
    u_xlat24.xy = u_xlat24.xy * u_xlat2.wx;
    u_xlat24.x = u_xlat24.y * u_xlat14 + u_xlat24.x;
    u_xlat36 = u_xlat5.w * 1.85000002 + u_xlat3.y;
    u_xlat37 = u_xlat5.y * 1.85000002 + u_xlat3.y;
    u_xlat8.z = u_xlat39 + u_xlat36;
    u_xlat3.xy = u_xlat8.yz * vec2(22.2000008, 2.0);
    u_xlat27.xy = floor(u_xlat3.xy);
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat16_6.x = dot(u_xlat27.xy, vec2(35.2000008, 2376.1001));
    u_xlat16.xyz = u_xlat16_6.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat7.xyz = u_xlat16.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat36 = dot(u_xlat16.zyx, u_xlat7.xyz);
    u_xlat16.xyz = vec3(u_xlat36) + u_xlat16.xyz;
    u_xlat7.xyz = u_xlat16.yxx + u_xlat16.zzy;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat7.xyz;
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat36 = u_xlat26 * _Speed + u_xlat16.z;
    u_xlat36 = fract(u_xlat36);
    u_xlat2.x = u_xlat36 + -0.850000024;
    u_xlat36 = u_xlat36 * 1.17647052;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat27.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat27.x) * u_xlat2.x + 1.0;
    u_xlat27.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat27.x;
    u_xlat36 = u_xlat36 * u_xlat2.x + -0.5;
    u_xlat7.y = u_xlat36 * 0.899999976 + 0.5;
    u_xlat27.xy = u_xlat16.xz + vec2(-0.5, -0.5);
    u_xlatb36 = _SpawnThreshold_Flow>=u_xlat16.y;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat2.x = -abs(u_xlat27.x) + 0.5;
    u_xlat16.xy = u_xlat5.ww * vec2(37.0, 18.5);
    u_xlat16.x = sin(u_xlat16.x);
    u_xlat28 = fract(u_xlat16.y);
    u_xlat28 = u_xlat3.y + u_xlat28;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.0);
    u_xlat7.z = u_xlat28 + -0.5;
    u_xlat16.x = u_xlat5.w * 37.0 + u_xlat16.x;
    u_xlat16.x = sin(u_xlat16.x);
    u_xlat2.x = u_xlat2.x * u_xlat16.x;
    u_xlat2.x = u_xlat2.x * u_xlat27.y + u_xlat27.x;
    u_xlat7.x = u_xlat2.x * 0.699999988;
    u_xlat27.xy = (-u_xlat7.xy) + u_xlat3.xy;
    u_xlat2.x = (-u_xlat7.y) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat27.y;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat3.xy = u_xlat3.xy + (-u_xlat7.xz);
    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 3.33333325;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat15 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat15) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat15 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat15) * u_xlat3.x + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat3.x;
    u_xlat3.xy = u_xlat27.xy * vec2(1.0, 6.0);
    u_xlat27.x = u_xlat27.y + 0.0199999996;
    u_xlat27.x = u_xlat27.x * 25.0;
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * 2.5;
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat15 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat15) * u_xlat3.x + 1.0;
    u_xlat15 = u_xlat27.x * -2.0 + 3.0;
    u_xlat27.x = u_xlat27.x * u_xlat27.x;
    u_xlat15 = u_xlat27.x * u_xlat15;
    u_xlat2.x = u_xlat2.x * u_xlat15 + u_xlat3.x;
    u_xlat36 = u_xlat36 * u_xlat2.x;
    u_xlat24.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
    u_xlat24.x = u_xlat24.x + -0.300000012;
    u_xlat24.x = u_xlat24.x * 1.42857146;
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
    u_xlat36 = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat3.y = u_xlat36 * u_xlat24.x + (-u_xlat0.x);
    u_xlat6 = u_xlat5.xyxy * vec4(40.0, 40.0, 12.0, 20.0);
    u_xlat16.xyz = floor(u_xlat6.xyz);
    u_xlat24.x = u_xlat16.z * 12345.5645;
    u_xlat36 = dot(u_xlat16.xy, vec2(107.449997, 3543.65405));
    u_xlat16.xyz = vec3(u_xlat36) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat24.x = sin(u_xlat24.x);
    u_xlat24.x = u_xlat24.x * 7658.75977;
    u_xlat24.x = fract(u_xlat24.x);
    u_xlat7.x = u_xlat24.x + u_xlat25.x;
    u_xlat7.y = u_xlat5.x;
    u_xlat24.xy = u_xlat7.yx * vec2(12.0, 2.0);
    u_xlat27.xy = floor(u_xlat24.xy);
    u_xlat24.xy = fract(u_xlat24.xy);
    u_xlat16_11.x = dot(u_xlat27.xy, vec2(35.2000008, 2376.1001));
    u_xlat8.xyz = u_xlat16_11.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat9.xyz = u_xlat8.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat25.x = dot(u_xlat8.zyx, u_xlat9.xyz);
    u_xlat8.xyz = u_xlat25.xxx + u_xlat8.xyz;
    u_xlat9.xyz = u_xlat8.yxx + u_xlat8.zzy;
    u_xlat8.xyz = u_xlat8.xyz * u_xlat9.xyz;
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat25.x = u_xlat26 * _Speed + u_xlat8.z;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat2.x = u_xlat25.x + -0.850000024;
    u_xlat25.x = u_xlat25.x * 1.17647052;
    u_xlat25.x = min(u_xlat25.x, 1.0);
    u_xlat2.x = u_xlat2.x * 6.66666794;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat27.x = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat27.x) * u_xlat2.x + 1.0;
    u_xlat27.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat27.x;
    u_xlat25.x = u_xlat25.x * u_xlat2.x + -0.5;
    u_xlat9.y = u_xlat25.x * 0.899999976 + 0.5;
    u_xlat25.x = sin(u_xlat6.w);
    u_xlat27.xy = fract(u_xlat6.xy);
    u_xlat27.xy = u_xlat27.xy + vec2(-0.5, -0.5);
    u_xlat25.x = u_xlat5.y * 20.0 + u_xlat25.x;
    u_xlat25.x = sin(u_xlat25.x);
    u_xlat29.xy = u_xlat8.xz + vec2(-0.5, -0.5);
    u_xlatb2 = _SpawnThreshold_Flow>=u_xlat8.y;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat7.x = -abs(u_xlat29.x) + 0.5;
    u_xlat25.x = u_xlat25.x * u_xlat7.x;
    u_xlat25.x = u_xlat25.x * u_xlat29.y + u_xlat29.x;
    u_xlat9.x = u_xlat25.x * 0.699999988;
    u_xlat29.xy = u_xlat24.xy + vec2(-0.5, -0.0);
    u_xlat7.xw = (-u_xlat9.xy) + u_xlat29.xy;
    u_xlat24.x = (-u_xlat9.y) + 1.0;
    u_xlat24.x = float(1.0) / u_xlat24.x;
    u_xlat24.x = u_xlat24.x * u_xlat7.w;
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
    u_xlat25.x = u_xlat24.x * -2.0 + 3.0;
    u_xlat24.x = u_xlat24.x * u_xlat24.x;
    u_xlat24.x = (-u_xlat25.x) * u_xlat24.x + 1.0;
    u_xlat8.xyz = u_xlat5.yxy * vec3(10.0, 22.2000008, 37.0);
    u_xlat25.x = fract(u_xlat8.x);
    u_xlat36 = u_xlat24.y + u_xlat25.x;
    u_xlat9.z = u_xlat36 + -0.5;
    u_xlat5.xz = u_xlat29.xy + (-u_xlat9.xz);
    u_xlat24.y = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat24.xy = sqrt(u_xlat24.xy);
    u_xlat36 = u_xlat24.y * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat25.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat25.x) * u_xlat36 + 1.0;
    u_xlat24.x = u_xlat24.x * u_xlat36;
    u_xlat5.xz = u_xlat7.xw * vec2(1.0, 6.0);
    u_xlat36 = u_xlat7.w + 0.0199999996;
    u_xlat36 = u_xlat36 * 25.0;
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat25.x = dot(u_xlat5.xz, u_xlat5.xz);
    u_xlat25.x = sqrt(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * 2.5;
    u_xlat25.x = min(u_xlat25.x, 1.0);
    u_xlat5.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = (-u_xlat5.x) * u_xlat25.x + 1.0;
    u_xlat5.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = u_xlat36 * u_xlat5.x;
    u_xlat24.x = u_xlat24.x * u_xlat36 + u_xlat25.x;
    u_xlat24.x = u_xlat2.x * u_xlat24.x;
    u_xlat24.x = u_xlat2.w * u_xlat24.x;
    u_xlat5.xzw = u_xlat16.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat36 = dot(u_xlat16.zyx, u_xlat5.xzw);
    u_xlat16.xyz = vec3(u_xlat36) + u_xlat16.xyz;
    u_xlat5.xzw = u_xlat16.yxx + u_xlat16.zzy;
    u_xlat16.xyz = u_xlat16.xyz * u_xlat5.xzw;
    u_xlat16.xyz = fract(u_xlat16.xyz);
    u_xlat2.xw = u_xlat16.xy + vec2(-0.5, -0.5);
    u_xlat2.xw = (-u_xlat2.xw) * vec2(0.699999988, 0.699999988) + u_xlat27.xy;
    u_xlat36 = dot(u_xlat2.xw, u_xlat2.xw);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat25.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat25.x) * u_xlat36 + 1.0;
    u_xlat25.x = u_xlat16.z * 10.0;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat36 = u_xlat36 * u_xlat25.x;
    u_xlat25.x = u_xlat26 * _Speed + u_xlat16.z;
    u_xlatb2 = _SpawnThreshold_Persistent>=u_xlat16.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat38 = u_xlat25.x + -0.0250000004;
    u_xlat25.x = u_xlat25.x * 40.0;
    u_xlat25.x = min(u_xlat25.x, 1.0);
    u_xlat38 = u_xlat38 * 1.02564096;
    u_xlat38 = max(u_xlat38, 0.0);
    u_xlat27.x = u_xlat38 * -2.0 + 3.0;
    u_xlat38 = u_xlat38 * u_xlat38;
    u_xlat38 = (-u_xlat27.x) * u_xlat38 + 1.0;
    u_xlat27.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat27.x;
    u_xlat25.x = u_xlat38 * u_xlat25.x;
    u_xlat36 = u_xlat36 * u_xlat25.x;
    u_xlat36 = u_xlat2.x * u_xlat36;
    u_xlat24.x = u_xlat36 * u_xlat14 + u_xlat24.x;
    u_xlat36 = sin(u_xlat8.z);
    u_xlat25.x = floor(u_xlat8.y);
    u_xlat25.x = u_xlat25.x * 12345.5645;
    u_xlat25.x = sin(u_xlat25.x);
    u_xlat25.x = u_xlat25.x * 7658.75977;
    u_xlat25.x = fract(u_xlat25.x);
    u_xlat7.z = u_xlat25.x + u_xlat37;
    u_xlat25.xy = u_xlat7.yz * vec2(22.2000008, 2.0);
    u_xlat36 = u_xlat5.y * 37.0 + u_xlat36;
    u_xlat36 = sin(u_xlat36);
    u_xlat2.xy = floor(u_xlat25.xy);
    u_xlat25.xy = fract(u_xlat25.xy);
    u_xlat16_11.x = dot(u_xlat2.xy, vec2(35.2000008, 2376.1001));
    u_xlat2.xyw = u_xlat16_11.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat16.xyz = u_xlat2.yxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat27.x = dot(u_xlat2.wyx, u_xlat16.xyz);
    u_xlat2.xyw = u_xlat2.xyw + u_xlat27.xxx;
    u_xlat16.xyz = u_xlat2.yxx + u_xlat2.wwy;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat16.xyz;
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat27.xy = u_xlat2.xw + vec2(-0.5, -0.5);
    u_xlat2.x = -abs(u_xlat27.x) + 0.5;
    u_xlat36 = u_xlat36 * u_xlat2.x;
    u_xlat36 = u_xlat36 * u_xlat27.y + u_xlat27.x;
    u_xlat5.x = u_xlat36 * 0.699999988;
    u_xlat36 = u_xlat4.x + u_xlat25.y;
    u_xlat25.xy = u_xlat25.xy + vec2(-0.5, -0.0);
    u_xlat5.z = u_xlat36 + -0.5;
    u_xlat27.xy = u_xlat25.xy + (-u_xlat5.xz);
    u_xlat36 = dot(u_xlat27.xy, u_xlat27.xy);
    u_xlat36 = sqrt(u_xlat36);
    u_xlat36 = u_xlat36 * 3.33333325;
    u_xlat36 = min(u_xlat36, 1.0);
    u_xlat2.x = u_xlat36 * -2.0 + 3.0;
    u_xlat36 = u_xlat36 * u_xlat36;
    u_xlat36 = (-u_xlat2.x) * u_xlat36 + 1.0;
    u_xlat2.x = u_xlat26 * _Speed + u_xlat2.w;
    u_xlatb14 = _SpawnThreshold_Flow>=u_xlat2.y;
    u_xlat14 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat2.z = u_xlat2.x + -0.850000024;
    u_xlat2.xz = u_xlat2.xz * vec2(1.17647052, 6.66666794);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat26 = max(u_xlat2.z, 0.0);
    u_xlat38 = u_xlat26 * -2.0 + 3.0;
    u_xlat26 = u_xlat26 * u_xlat26;
    u_xlat26 = (-u_xlat38) * u_xlat26 + 1.0;
    u_xlat38 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat38;
    u_xlat2.x = u_xlat2.x * u_xlat26 + -0.5;
    u_xlat5.y = u_xlat2.x * 0.899999976 + 0.5;
    u_xlat25.xy = u_xlat25.xy + (-u_xlat5.xy);
    u_xlat2.x = (-u_xlat5.y) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat25.y * u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat26 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat26) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat36 = u_xlat36 * u_xlat2.x;
    u_xlat2.xz = u_xlat25.xy * vec2(1.0, 6.0);
    u_xlat25.x = u_xlat25.y + 0.0199999996;
    u_xlat25.x = u_xlat25.x * 25.0;
    u_xlat25.x = clamp(u_xlat25.x, 0.0, 1.0);
    u_xlat37 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat37 = sqrt(u_xlat37);
    u_xlat37 = u_xlat37 * 2.5;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat2.x = u_xlat37 * -2.0 + 3.0;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = (-u_xlat2.x) * u_xlat37 + 1.0;
    u_xlat2.x = u_xlat25.x * -2.0 + 3.0;
    u_xlat25.x = u_xlat25.x * u_xlat25.x;
    u_xlat25.x = u_xlat25.x * u_xlat2.x;
    u_xlat36 = u_xlat36 * u_xlat25.x + u_xlat37;
    u_xlat36 = u_xlat14 * u_xlat36;
    u_xlat12.x = u_xlat36 * u_xlat12.x + u_xlat24.x;
    u_xlat12.x = u_xlat12.x + -0.300000012;
    u_xlat12.x = u_xlat12.x * 1.42857146;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat24.x = u_xlat12.x * -2.0 + 3.0;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat3.x = u_xlat24.x * u_xlat12.x + (-u_xlat0.x);
    u_xlat0.xy = u_xlat3.xy * vec2(vec2(_NormalScale, _NormalScale));
    u_xlat0.z = (-u_xlat0.y);
    u_xlat0.xy = u_xlat0.xz + u_xlat1.xy;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_11.xyz = (-u_xlat10_0.xyz) + _GlassTintColor.xyz;
    u_xlat16_0.xyz = vec3(_GlassTintStrength) * u_xlat16_11.xyz + u_xlat10_0.xyz;
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat16_0.w = 1.0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_CHEAP_NORMAL" }
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
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD2;
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
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump float _TimeScale;
uniform 	mediump float _Speed;
uniform 	mediump float _RainAmount;
uniform 	mediump float _NormalScale;
uniform 	float _DropScale;
uniform 	mediump float _SpawnThreshold_Flow;
uniform 	mediump float _SpawnThreshold_Persistent;
uniform 	vec4 _RainMask_ST;
uniform 	mediump float _MaskFadeStrength;
uniform 	mediump vec4 _GlassTintColor;
uniform 	mediump float _GlassTintStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _RainMask;
UNITY_LOCATION(1) uniform mediump sampler2D _GrabTexture;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
float u_xlat11;
bool u_xlatb11;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_17;
float u_xlat18;
bool u_xlatb18;
vec2 u_xlat19;
mediump float u_xlat16_19;
float u_xlat20;
vec2 u_xlat21;
mediump float u_xlat16_26;
float u_xlat27;
float u_xlat28;
float u_xlat29;
bool u_xlatb29;
float u_xlat30;
float u_xlat31;
void main()
{
    u_xlat0.x = max(_DropScale, 9.99999975e-05);
    u_xlat9.xy = _ScreenParams.xy / _ScreenParams.yy;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat1.z = (-u_xlat1.y);
    u_xlat2.xy = u_xlat1.xz + vec2(-0.5, 0.5);
    u_xlat9.xy = u_xlat9.xy * u_xlat2.xy;
    u_xlat0.xy = u_xlat9.xy / u_xlat0.xx;
    u_xlat2 = u_xlat0.xyxy * vec4(40.0, 40.0, 12.0, 20.0);
    u_xlat3.xyz = floor(u_xlat2.xyz);
    u_xlat19.x = u_xlat3.z * 12345.5645;
    u_xlat20 = dot(u_xlat3.xy, vec2(107.449997, 3543.65405));
    u_xlat3.xyz = vec3(u_xlat20) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat19.x = sin(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * 7658.75977;
    u_xlat19.x = fract(u_xlat19.x);
    u_xlat20 = _Time.y * _TimeScale;
    u_xlat20 = u_xlat20 * 0.200000003;
    u_xlat30 = u_xlat20 * _Speed;
    u_xlat4.x = u_xlat30 * 0.75 + u_xlat0.y;
    u_xlat0.z = u_xlat19.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat0.xzy * vec3(12.0, 2.0, 18.5);
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat16_6 = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = vec3(u_xlat16_6) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat7.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat18 = dot(u_xlat5.zyx, u_xlat7.xyz);
    u_xlat5.xyz = vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat18 = u_xlat20 * _Speed + u_xlat5.z;
    u_xlat18 = fract(u_xlat18);
    u_xlat19.x = u_xlat18 + -0.850000024;
    u_xlat18 = u_xlat18 * 1.17647052;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat19.x = u_xlat19.x * 6.66666794;
    u_xlat19.x = max(u_xlat19.x, 0.0);
    u_xlat31 = u_xlat19.x * -2.0 + 3.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = (-u_xlat31) * u_xlat19.x + 1.0;
    u_xlat31 = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat31;
    u_xlat18 = u_xlat18 * u_xlat19.x + -0.5;
    u_xlat7.y = u_xlat18 * 0.899999976 + 0.5;
    u_xlat5.xz = u_xlat5.xz + vec2(-0.5, -0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SpawnThreshold_Flow>=u_xlat5.y);
#else
    u_xlatb18 = _SpawnThreshold_Flow>=u_xlat5.y;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat19.x = -abs(u_xlat5.x) + 0.5;
    u_xlat29 = sin(u_xlat2.w);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat29 = u_xlat0.y * 20.0 + u_xlat29;
    u_xlat29 = sin(u_xlat29);
    u_xlat19.x = u_xlat19.x * u_xlat29;
    u_xlat19.x = u_xlat19.x * u_xlat5.z + u_xlat5.x;
    u_xlat7.x = u_xlat19.x * 0.699999988;
    u_xlat4.xw = u_xlat4.xy + vec2(-0.5, -0.0);
    u_xlat5.xy = (-u_xlat7.xy) + u_xlat4.xw;
    u_xlat19.x = (-u_xlat7.y) + 1.0;
    u_xlat19.x = float(1.0) / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat5.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat29 = u_xlat19.x * -2.0 + 3.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = (-u_xlat29) * u_xlat19.x + 1.0;
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat6 = u_xlat0.yyxy * vec4(10.0, 1.85000002, 22.2000008, 37.0);
    u_xlat29 = fract(u_xlat6.x);
    u_xlat29 = u_xlat29 + u_xlat4.y;
    u_xlat7.z = u_xlat29 + -0.5;
    u_xlat4.xy = u_xlat4.xw + (-u_xlat7.xz);
    u_xlat29 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 * 3.33333325;
    u_xlat29 = min(u_xlat29, 1.0);
    u_xlat4.x = u_xlat29 * -2.0 + 3.0;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat29 = (-u_xlat4.x) * u_xlat29 + 1.0;
    u_xlat19.x = u_xlat19.x * u_xlat29;
    u_xlat4.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat29 = u_xlat5.y + 0.0199999996;
    u_xlat29 = u_xlat29 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * 2.5;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat13 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = (-u_xlat13) * u_xlat4.x + 1.0;
    u_xlat13 = u_xlat29 * -2.0 + 3.0;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat29 = u_xlat29 * u_xlat13;
    u_xlat19.x = u_xlat19.x * u_xlat29 + u_xlat4.x;
    u_xlat18 = u_xlat18 * u_xlat19.x;
    u_xlat16_8.xy = vec2(vec2(_RainAmount, _RainAmount)) + vec2(0.5, -0.25);
    u_xlat16_17 = u_xlat16_8.y + u_xlat16_8.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * 0.666666687;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_17 * -2.0 + 3.0;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_17;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_26;
    u_xlat1.w = (-u_xlat1.y) + 1.0;
    u_xlat19.xy = u_xlat1.xw * _RainMask_ST.xy + _RainMask_ST.zw;
    u_xlat16_19 = texture(_RainMask, u_xlat19.xy).x;
    u_xlat28 = (-u_xlat16_19) + 1.0;
    u_xlat19.x = (-u_xlat16_19) * _MaskFadeStrength + 1.0;
    u_xlat29 = u_xlat28 * u_xlat16_17;
    u_xlat18 = u_xlat18 * u_xlat29;
    u_xlat4.xyw = u_xlat3.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat29 = dot(u_xlat3.zyx, u_xlat4.xyw);
    u_xlat3.xyz = vec3(u_xlat29) + u_xlat3.xyz;
    u_xlat4.xyw = u_xlat3.yxx + u_xlat3.zzy;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyw;
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat4.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat2.xy = (-u_xlat4.xy) * vec2(0.699999988, 0.699999988) + u_xlat2.xy;
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 3.33333325;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat11 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat11) * u_xlat2.x + 1.0;
    u_xlat11 = u_xlat3.z * 10.0;
    u_xlat11 = fract(u_xlat11);
    u_xlat2.x = u_xlat11 * u_xlat2.x;
    u_xlat11 = u_xlat20 * _Speed + u_xlat3.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_SpawnThreshold_Persistent>=u_xlat3.x);
#else
    u_xlatb29 = _SpawnThreshold_Persistent>=u_xlat3.x;
#endif
    u_xlat29 = u_xlatb29 ? 1.0 : float(0.0);
    u_xlat11 = fract(u_xlat11);
    u_xlat3.x = u_xlat11 + -0.0250000004;
    u_xlat11 = u_xlat11 * 40.0;
    u_xlat11 = min(u_xlat11, 1.0);
    u_xlat3.x = u_xlat3.x * 1.02564096;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat12 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat12) * u_xlat3.x + 1.0;
    u_xlat12 = u_xlat11 * -2.0 + 3.0;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat11 = u_xlat11 * u_xlat12;
    u_xlat11 = u_xlat3.x * u_xlat11;
    u_xlat2.x = u_xlat11 * u_xlat2.x;
    u_xlat2.x = u_xlat29 * u_xlat2.x;
    u_xlat16_17 = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = dot(vec2(u_xlat16_17), u_xlat16_8.xx);
    u_xlat11 = u_xlat28 * u_xlat16_8.x;
    u_xlat18 = u_xlat2.x * u_xlat11 + u_xlat18;
    u_xlat2.x = floor(u_xlat6.z);
    u_xlat2.x = u_xlat2.x * 12345.5645;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 7658.75977;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat11 = u_xlat30 * 0.75 + u_xlat6.y;
    u_xlat29 = sin(u_xlat6.w);
    u_xlat9.x = u_xlat0.y * 37.0 + u_xlat29;
    u_xlat9.x = sin(u_xlat9.x);
    u_xlat0.w = u_xlat2.x + u_xlat11;
    u_xlat0.xw = u_xlat0.xw * vec2(22.2000008, 2.0);
    u_xlat2.xy = floor(u_xlat0.xw);
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat16_8.x = dot(u_xlat2.xy, vec2(35.2000008, 2376.1001));
    u_xlat2.xyw = u_xlat16_8.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat3.xyz = u_xlat2.yxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat3.x = dot(u_xlat2.wyx, u_xlat3.xyz);
    u_xlat2.xyw = u_xlat2.xyw + u_xlat3.xxx;
    u_xlat3.xyz = u_xlat2.yxx + u_xlat2.wwy;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat3.xyz;
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat3.xy = u_xlat2.xw + vec2(-0.5, -0.5);
    u_xlat2.x = -abs(u_xlat3.x) + 0.5;
    u_xlat9.x = u_xlat9.x * u_xlat2.x;
    u_xlat9.x = u_xlat9.x * u_xlat3.y + u_xlat3.x;
    u_xlat3.x = u_xlat9.x * 0.699999988;
    u_xlat9.x = u_xlat4.z + u_xlat0.w;
    u_xlat0.xw = u_xlat0.xw + vec2(-0.5, -0.0);
    u_xlat3.z = u_xlat9.x + -0.5;
    u_xlat21.xy = u_xlat0.xw + (-u_xlat3.xz);
    u_xlat9.x = dot(u_xlat21.xy, u_xlat21.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat9.x * 3.33333325;
    u_xlat9.x = min(u_xlat9.x, 1.0);
    u_xlat2.x = u_xlat9.x * -2.0 + 3.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = (-u_xlat2.x) * u_xlat9.x + 1.0;
    u_xlat2.x = u_xlat20 * _Speed + u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(_SpawnThreshold_Flow>=u_xlat2.y);
#else
    u_xlatb11 = _SpawnThreshold_Flow>=u_xlat2.y;
#endif
    u_xlat11 = u_xlatb11 ? 1.0 : float(0.0);
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat2.z = u_xlat2.x + -0.850000024;
    u_xlat2.xz = u_xlat2.xz * vec2(1.17647052, 6.66666794);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat20 = max(u_xlat2.z, 0.0);
    u_xlat29 = u_xlat20 * -2.0 + 3.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat20 = (-u_xlat29) * u_xlat20 + 1.0;
    u_xlat29 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat29;
    u_xlat2.x = u_xlat2.x * u_xlat20 + -0.5;
    u_xlat3.y = u_xlat2.x * 0.899999976 + 0.5;
    u_xlat0.xw = u_xlat0.xw + (-u_xlat3.xy);
    u_xlat2.x = (-u_xlat3.y) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat0.w * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat20 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat20) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat9.x = u_xlat9.x * u_xlat2.x;
    u_xlat2.xz = u_xlat0.xw * vec2(1.0, 6.0);
    u_xlat0.x = u_xlat0.w + 0.0199999996;
    u_xlat0.x = u_xlat0.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat27 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 * 2.5;
    u_xlat27 = min(u_xlat27, 1.0);
    u_xlat2.x = u_xlat27 * -2.0 + 3.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = (-u_xlat2.x) * u_xlat27 + 1.0;
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = u_xlat9.x * u_xlat0.x + u_xlat27;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
    u_xlat16_8.x = _RainAmount + _RainAmount;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_17 = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_17;
    u_xlat9.x = u_xlat28 * u_xlat16_8.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat18;
    u_xlat0.x = u_xlat0.x + -0.300000012;
    u_xlat0.x = u_xlat0.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = u_xlat19.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.x = dFdx(u_xlat0.x);
    u_xlat2.y = dFdy(u_xlat0.x);
    u_xlat0.xy = u_xlat2.xy * vec2(vec2(_NormalScale, _NormalScale));
    u_xlat0.z = (-u_xlat0.y);
    u_xlat0.xy = u_xlat0.xz + u_xlat1.xy;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = (-u_xlat16_0.xyz) + _GlassTintColor.xyz;
    u_xlat16_0.xyz = vec3(_GlassTintStrength) * u_xlat16_8.xyz + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.w = 1.0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_CHEAP_NORMAL" }
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
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD2;
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
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump float _TimeScale;
uniform 	mediump float _Speed;
uniform 	mediump float _RainAmount;
uniform 	mediump float _NormalScale;
uniform 	float _DropScale;
uniform 	mediump float _SpawnThreshold_Flow;
uniform 	mediump float _SpawnThreshold_Persistent;
uniform 	vec4 _RainMask_ST;
uniform 	mediump float _MaskFadeStrength;
uniform 	mediump vec4 _GlassTintColor;
uniform 	mediump float _GlassTintStrength;
UNITY_LOCATION(0) uniform mediump sampler2D _RainMask;
UNITY_LOCATION(1) uniform mediump sampler2D _GrabTexture;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
float u_xlat11;
bool u_xlatb11;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_17;
float u_xlat18;
bool u_xlatb18;
vec2 u_xlat19;
mediump float u_xlat16_19;
float u_xlat20;
vec2 u_xlat21;
mediump float u_xlat16_26;
float u_xlat27;
float u_xlat28;
float u_xlat29;
bool u_xlatb29;
float u_xlat30;
float u_xlat31;
void main()
{
    u_xlat0.x = max(_DropScale, 9.99999975e-05);
    u_xlat9.xy = _ScreenParams.xy / _ScreenParams.yy;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat1.z = (-u_xlat1.y);
    u_xlat2.xy = u_xlat1.xz + vec2(-0.5, 0.5);
    u_xlat9.xy = u_xlat9.xy * u_xlat2.xy;
    u_xlat0.xy = u_xlat9.xy / u_xlat0.xx;
    u_xlat2 = u_xlat0.xyxy * vec4(40.0, 40.0, 12.0, 20.0);
    u_xlat3.xyz = floor(u_xlat2.xyz);
    u_xlat19.x = u_xlat3.z * 12345.5645;
    u_xlat20 = dot(u_xlat3.xy, vec2(107.449997, 3543.65405));
    u_xlat3.xyz = vec3(u_xlat20) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat19.x = sin(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * 7658.75977;
    u_xlat19.x = fract(u_xlat19.x);
    u_xlat20 = _Time.y * _TimeScale;
    u_xlat20 = u_xlat20 * 0.200000003;
    u_xlat30 = u_xlat20 * _Speed;
    u_xlat4.x = u_xlat30 * 0.75 + u_xlat0.y;
    u_xlat0.z = u_xlat19.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat0.xzy * vec3(12.0, 2.0, 18.5);
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat16_6 = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = vec3(u_xlat16_6) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat7.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat18 = dot(u_xlat5.zyx, u_xlat7.xyz);
    u_xlat5.xyz = vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat18 = u_xlat20 * _Speed + u_xlat5.z;
    u_xlat18 = fract(u_xlat18);
    u_xlat19.x = u_xlat18 + -0.850000024;
    u_xlat18 = u_xlat18 * 1.17647052;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat19.x = u_xlat19.x * 6.66666794;
    u_xlat19.x = max(u_xlat19.x, 0.0);
    u_xlat31 = u_xlat19.x * -2.0 + 3.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = (-u_xlat31) * u_xlat19.x + 1.0;
    u_xlat31 = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat31;
    u_xlat18 = u_xlat18 * u_xlat19.x + -0.5;
    u_xlat7.y = u_xlat18 * 0.899999976 + 0.5;
    u_xlat5.xz = u_xlat5.xz + vec2(-0.5, -0.5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SpawnThreshold_Flow>=u_xlat5.y);
#else
    u_xlatb18 = _SpawnThreshold_Flow>=u_xlat5.y;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat19.x = -abs(u_xlat5.x) + 0.5;
    u_xlat29 = sin(u_xlat2.w);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat29 = u_xlat0.y * 20.0 + u_xlat29;
    u_xlat29 = sin(u_xlat29);
    u_xlat19.x = u_xlat19.x * u_xlat29;
    u_xlat19.x = u_xlat19.x * u_xlat5.z + u_xlat5.x;
    u_xlat7.x = u_xlat19.x * 0.699999988;
    u_xlat4.xw = u_xlat4.xy + vec2(-0.5, -0.0);
    u_xlat5.xy = (-u_xlat7.xy) + u_xlat4.xw;
    u_xlat19.x = (-u_xlat7.y) + 1.0;
    u_xlat19.x = float(1.0) / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat5.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat29 = u_xlat19.x * -2.0 + 3.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = (-u_xlat29) * u_xlat19.x + 1.0;
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat6 = u_xlat0.yyxy * vec4(10.0, 1.85000002, 22.2000008, 37.0);
    u_xlat29 = fract(u_xlat6.x);
    u_xlat29 = u_xlat29 + u_xlat4.y;
    u_xlat7.z = u_xlat29 + -0.5;
    u_xlat4.xy = u_xlat4.xw + (-u_xlat7.xz);
    u_xlat29 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 * 3.33333325;
    u_xlat29 = min(u_xlat29, 1.0);
    u_xlat4.x = u_xlat29 * -2.0 + 3.0;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat29 = (-u_xlat4.x) * u_xlat29 + 1.0;
    u_xlat19.x = u_xlat19.x * u_xlat29;
    u_xlat4.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat29 = u_xlat5.y + 0.0199999996;
    u_xlat29 = u_xlat29 * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat29 = min(max(u_xlat29, 0.0), 1.0);
#else
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
#endif
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * 2.5;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat13 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = (-u_xlat13) * u_xlat4.x + 1.0;
    u_xlat13 = u_xlat29 * -2.0 + 3.0;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat29 = u_xlat29 * u_xlat13;
    u_xlat19.x = u_xlat19.x * u_xlat29 + u_xlat4.x;
    u_xlat18 = u_xlat18 * u_xlat19.x;
    u_xlat16_8.xy = vec2(vec2(_RainAmount, _RainAmount)) + vec2(0.5, -0.25);
    u_xlat16_17 = u_xlat16_8.y + u_xlat16_8.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat16_8.x = u_xlat16_8.x * 0.666666687;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_17 * -2.0 + 3.0;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_17;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_26;
    u_xlat1.w = (-u_xlat1.y) + 1.0;
    u_xlat19.xy = u_xlat1.xw * _RainMask_ST.xy + _RainMask_ST.zw;
    u_xlat16_19 = texture(_RainMask, u_xlat19.xy).x;
    u_xlat28 = (-u_xlat16_19) + 1.0;
    u_xlat19.x = (-u_xlat16_19) * _MaskFadeStrength + 1.0;
    u_xlat29 = u_xlat28 * u_xlat16_17;
    u_xlat18 = u_xlat18 * u_xlat29;
    u_xlat4.xyw = u_xlat3.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat29 = dot(u_xlat3.zyx, u_xlat4.xyw);
    u_xlat3.xyz = vec3(u_xlat29) + u_xlat3.xyz;
    u_xlat4.xyw = u_xlat3.yxx + u_xlat3.zzy;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyw;
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat4.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat2.xy = (-u_xlat4.xy) * vec2(0.699999988, 0.699999988) + u_xlat2.xy;
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 3.33333325;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat11 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat11) * u_xlat2.x + 1.0;
    u_xlat11 = u_xlat3.z * 10.0;
    u_xlat11 = fract(u_xlat11);
    u_xlat2.x = u_xlat11 * u_xlat2.x;
    u_xlat11 = u_xlat20 * _Speed + u_xlat3.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_SpawnThreshold_Persistent>=u_xlat3.x);
#else
    u_xlatb29 = _SpawnThreshold_Persistent>=u_xlat3.x;
#endif
    u_xlat29 = u_xlatb29 ? 1.0 : float(0.0);
    u_xlat11 = fract(u_xlat11);
    u_xlat3.x = u_xlat11 + -0.0250000004;
    u_xlat11 = u_xlat11 * 40.0;
    u_xlat11 = min(u_xlat11, 1.0);
    u_xlat3.x = u_xlat3.x * 1.02564096;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat12 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat12) * u_xlat3.x + 1.0;
    u_xlat12 = u_xlat11 * -2.0 + 3.0;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat11 = u_xlat11 * u_xlat12;
    u_xlat11 = u_xlat3.x * u_xlat11;
    u_xlat2.x = u_xlat11 * u_xlat2.x;
    u_xlat2.x = u_xlat29 * u_xlat2.x;
    u_xlat16_17 = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = dot(vec2(u_xlat16_17), u_xlat16_8.xx);
    u_xlat11 = u_xlat28 * u_xlat16_8.x;
    u_xlat18 = u_xlat2.x * u_xlat11 + u_xlat18;
    u_xlat2.x = floor(u_xlat6.z);
    u_xlat2.x = u_xlat2.x * 12345.5645;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 7658.75977;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat11 = u_xlat30 * 0.75 + u_xlat6.y;
    u_xlat29 = sin(u_xlat6.w);
    u_xlat9.x = u_xlat0.y * 37.0 + u_xlat29;
    u_xlat9.x = sin(u_xlat9.x);
    u_xlat0.w = u_xlat2.x + u_xlat11;
    u_xlat0.xw = u_xlat0.xw * vec2(22.2000008, 2.0);
    u_xlat2.xy = floor(u_xlat0.xw);
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat16_8.x = dot(u_xlat2.xy, vec2(35.2000008, 2376.1001));
    u_xlat2.xyw = u_xlat16_8.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat3.xyz = u_xlat2.yxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat3.x = dot(u_xlat2.wyx, u_xlat3.xyz);
    u_xlat2.xyw = u_xlat2.xyw + u_xlat3.xxx;
    u_xlat3.xyz = u_xlat2.yxx + u_xlat2.wwy;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat3.xyz;
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat3.xy = u_xlat2.xw + vec2(-0.5, -0.5);
    u_xlat2.x = -abs(u_xlat3.x) + 0.5;
    u_xlat9.x = u_xlat9.x * u_xlat2.x;
    u_xlat9.x = u_xlat9.x * u_xlat3.y + u_xlat3.x;
    u_xlat3.x = u_xlat9.x * 0.699999988;
    u_xlat9.x = u_xlat4.z + u_xlat0.w;
    u_xlat0.xw = u_xlat0.xw + vec2(-0.5, -0.0);
    u_xlat3.z = u_xlat9.x + -0.5;
    u_xlat21.xy = u_xlat0.xw + (-u_xlat3.xz);
    u_xlat9.x = dot(u_xlat21.xy, u_xlat21.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat9.x * 3.33333325;
    u_xlat9.x = min(u_xlat9.x, 1.0);
    u_xlat2.x = u_xlat9.x * -2.0 + 3.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = (-u_xlat2.x) * u_xlat9.x + 1.0;
    u_xlat2.x = u_xlat20 * _Speed + u_xlat2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(_SpawnThreshold_Flow>=u_xlat2.y);
#else
    u_xlatb11 = _SpawnThreshold_Flow>=u_xlat2.y;
#endif
    u_xlat11 = u_xlatb11 ? 1.0 : float(0.0);
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat2.z = u_xlat2.x + -0.850000024;
    u_xlat2.xz = u_xlat2.xz * vec2(1.17647052, 6.66666794);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat20 = max(u_xlat2.z, 0.0);
    u_xlat29 = u_xlat20 * -2.0 + 3.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat20 = (-u_xlat29) * u_xlat20 + 1.0;
    u_xlat29 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat29;
    u_xlat2.x = u_xlat2.x * u_xlat20 + -0.5;
    u_xlat3.y = u_xlat2.x * 0.899999976 + 0.5;
    u_xlat0.xw = u_xlat0.xw + (-u_xlat3.xy);
    u_xlat2.x = (-u_xlat3.y) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat0.w * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat20 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat20) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat9.x = u_xlat9.x * u_xlat2.x;
    u_xlat2.xz = u_xlat0.xw * vec2(1.0, 6.0);
    u_xlat0.x = u_xlat0.w + 0.0199999996;
    u_xlat0.x = u_xlat0.x * 25.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat27 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 * 2.5;
    u_xlat27 = min(u_xlat27, 1.0);
    u_xlat2.x = u_xlat27 * -2.0 + 3.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = (-u_xlat2.x) * u_xlat27 + 1.0;
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = u_xlat9.x * u_xlat0.x + u_xlat27;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
    u_xlat16_8.x = _RainAmount + _RainAmount;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat16_17 = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_17;
    u_xlat9.x = u_xlat28 * u_xlat16_8.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat18;
    u_xlat0.x = u_xlat0.x + -0.300000012;
    u_xlat0.x = u_xlat0.x * 1.42857146;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = u_xlat19.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.x = dFdx(u_xlat0.x);
    u_xlat2.y = dFdy(u_xlat0.x);
    u_xlat0.xy = u_xlat2.xy * vec2(vec2(_NormalScale, _NormalScale));
    u_xlat0.z = (-u_xlat0.y);
    u_xlat0.xy = u_xlat0.xz + u_xlat1.xy;
    u_xlat16_0.xyz = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = (-u_xlat16_0.xyz) + _GlassTintColor.xyz;
    u_xlat16_0.xyz = vec3(_GlassTintStrength) * u_xlat16_8.xyz + u_xlat16_0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.w = 1.0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_CHEAP_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
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
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_OES_standard_derivatives
#extension GL_OES_standard_derivatives : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	mediump float _TimeScale;
uniform 	mediump float _Speed;
uniform 	mediump float _RainAmount;
uniform 	mediump float _NormalScale;
uniform 	float _DropScale;
uniform 	mediump float _SpawnThreshold_Flow;
uniform 	mediump float _SpawnThreshold_Persistent;
uniform 	vec4 _RainMask_ST;
uniform 	mediump float _MaskFadeStrength;
uniform 	mediump vec4 _GlassTintColor;
uniform 	mediump float _GlassTintStrength;
uniform lowp sampler2D _RainMask;
uniform lowp sampler2D _GrabTexture;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
float u_xlat11;
bool u_xlatb11;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_17;
float u_xlat18;
bool u_xlatb18;
vec2 u_xlat19;
lowp float u_xlat10_19;
float u_xlat20;
vec2 u_xlat21;
mediump float u_xlat16_26;
float u_xlat27;
float u_xlat28;
float u_xlat29;
bool u_xlatb29;
float u_xlat30;
float u_xlat31;
void main()
{
    u_xlat0.x = max(_DropScale, 9.99999975e-05);
    u_xlat9.xy = _ScreenParams.xy / _ScreenParams.yy;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat1.z = (-u_xlat1.y);
    u_xlat2.xy = u_xlat1.xz + vec2(-0.5, 0.5);
    u_xlat9.xy = u_xlat9.xy * u_xlat2.xy;
    u_xlat0.xy = u_xlat9.xy / u_xlat0.xx;
    u_xlat2 = u_xlat0.xyxy * vec4(40.0, 40.0, 12.0, 20.0);
    u_xlat3.xyz = floor(u_xlat2.xyz);
    u_xlat19.x = u_xlat3.z * 12345.5645;
    u_xlat20 = dot(u_xlat3.xy, vec2(107.449997, 3543.65405));
    u_xlat3.xyz = vec3(u_xlat20) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat19.x = sin(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * 7658.75977;
    u_xlat19.x = fract(u_xlat19.x);
    u_xlat20 = _Time.y * _TimeScale;
    u_xlat20 = u_xlat20 * 0.200000003;
    u_xlat30 = u_xlat20 * _Speed;
    u_xlat4.x = u_xlat30 * 0.75 + u_xlat0.y;
    u_xlat0.z = u_xlat19.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat0.xzy * vec3(12.0, 2.0, 18.5);
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat16_6 = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = vec3(u_xlat16_6) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat7.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat18 = dot(u_xlat5.zyx, u_xlat7.xyz);
    u_xlat5.xyz = vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat18 = u_xlat20 * _Speed + u_xlat5.z;
    u_xlat18 = fract(u_xlat18);
    u_xlat19.x = u_xlat18 + -0.850000024;
    u_xlat18 = u_xlat18 * 1.17647052;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat19.x = u_xlat19.x * 6.66666794;
    u_xlat19.x = max(u_xlat19.x, 0.0);
    u_xlat31 = u_xlat19.x * -2.0 + 3.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = (-u_xlat31) * u_xlat19.x + 1.0;
    u_xlat31 = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat31;
    u_xlat18 = u_xlat18 * u_xlat19.x + -0.5;
    u_xlat7.y = u_xlat18 * 0.899999976 + 0.5;
    u_xlat5.xz = u_xlat5.xz + vec2(-0.5, -0.5);
    u_xlatb18 = _SpawnThreshold_Flow>=u_xlat5.y;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat19.x = -abs(u_xlat5.x) + 0.5;
    u_xlat29 = sin(u_xlat2.w);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat29 = u_xlat0.y * 20.0 + u_xlat29;
    u_xlat29 = sin(u_xlat29);
    u_xlat19.x = u_xlat19.x * u_xlat29;
    u_xlat19.x = u_xlat19.x * u_xlat5.z + u_xlat5.x;
    u_xlat7.x = u_xlat19.x * 0.699999988;
    u_xlat4.xw = u_xlat4.xy + vec2(-0.5, -0.0);
    u_xlat5.xy = (-u_xlat7.xy) + u_xlat4.xw;
    u_xlat19.x = (-u_xlat7.y) + 1.0;
    u_xlat19.x = float(1.0) / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat5.y;
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
    u_xlat29 = u_xlat19.x * -2.0 + 3.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = (-u_xlat29) * u_xlat19.x + 1.0;
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat6 = u_xlat0.yyxy * vec4(10.0, 1.85000002, 22.2000008, 37.0);
    u_xlat29 = fract(u_xlat6.x);
    u_xlat29 = u_xlat29 + u_xlat4.y;
    u_xlat7.z = u_xlat29 + -0.5;
    u_xlat4.xy = u_xlat4.xw + (-u_xlat7.xz);
    u_xlat29 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 * 3.33333325;
    u_xlat29 = min(u_xlat29, 1.0);
    u_xlat4.x = u_xlat29 * -2.0 + 3.0;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat29 = (-u_xlat4.x) * u_xlat29 + 1.0;
    u_xlat19.x = u_xlat19.x * u_xlat29;
    u_xlat4.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat29 = u_xlat5.y + 0.0199999996;
    u_xlat29 = u_xlat29 * 25.0;
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * 2.5;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat13 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = (-u_xlat13) * u_xlat4.x + 1.0;
    u_xlat13 = u_xlat29 * -2.0 + 3.0;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat29 = u_xlat29 * u_xlat13;
    u_xlat19.x = u_xlat19.x * u_xlat29 + u_xlat4.x;
    u_xlat18 = u_xlat18 * u_xlat19.x;
    u_xlat16_8.xy = vec2(vec2(_RainAmount, _RainAmount)) + vec2(0.5, -0.25);
    u_xlat16_17 = u_xlat16_8.y + u_xlat16_8.y;
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_8.x * 0.666666687;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat16_26 = u_xlat16_17 * -2.0 + 3.0;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_17;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_26;
    u_xlat1.w = (-u_xlat1.y) + 1.0;
    u_xlat19.xy = u_xlat1.xw * _RainMask_ST.xy + _RainMask_ST.zw;
    u_xlat10_19 = texture2D(_RainMask, u_xlat19.xy).x;
    u_xlat28 = (-u_xlat10_19) + 1.0;
    u_xlat19.x = (-u_xlat10_19) * _MaskFadeStrength + 1.0;
    u_xlat29 = u_xlat28 * u_xlat16_17;
    u_xlat18 = u_xlat18 * u_xlat29;
    u_xlat4.xyw = u_xlat3.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat29 = dot(u_xlat3.zyx, u_xlat4.xyw);
    u_xlat3.xyz = vec3(u_xlat29) + u_xlat3.xyz;
    u_xlat4.xyw = u_xlat3.yxx + u_xlat3.zzy;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyw;
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat4.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat2.xy = (-u_xlat4.xy) * vec2(0.699999988, 0.699999988) + u_xlat2.xy;
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 3.33333325;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat11 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat11) * u_xlat2.x + 1.0;
    u_xlat11 = u_xlat3.z * 10.0;
    u_xlat11 = fract(u_xlat11);
    u_xlat2.x = u_xlat11 * u_xlat2.x;
    u_xlat11 = u_xlat20 * _Speed + u_xlat3.z;
    u_xlatb29 = _SpawnThreshold_Persistent>=u_xlat3.x;
    u_xlat29 = u_xlatb29 ? 1.0 : float(0.0);
    u_xlat11 = fract(u_xlat11);
    u_xlat3.x = u_xlat11 + -0.0250000004;
    u_xlat11 = u_xlat11 * 40.0;
    u_xlat11 = min(u_xlat11, 1.0);
    u_xlat3.x = u_xlat3.x * 1.02564096;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat12 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat12) * u_xlat3.x + 1.0;
    u_xlat12 = u_xlat11 * -2.0 + 3.0;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat11 = u_xlat11 * u_xlat12;
    u_xlat11 = u_xlat3.x * u_xlat11;
    u_xlat2.x = u_xlat11 * u_xlat2.x;
    u_xlat2.x = u_xlat29 * u_xlat2.x;
    u_xlat16_17 = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = dot(vec2(u_xlat16_17), u_xlat16_8.xx);
    u_xlat11 = u_xlat28 * u_xlat16_8.x;
    u_xlat18 = u_xlat2.x * u_xlat11 + u_xlat18;
    u_xlat2.x = floor(u_xlat6.z);
    u_xlat2.x = u_xlat2.x * 12345.5645;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 7658.75977;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat11 = u_xlat30 * 0.75 + u_xlat6.y;
    u_xlat29 = sin(u_xlat6.w);
    u_xlat9.x = u_xlat0.y * 37.0 + u_xlat29;
    u_xlat9.x = sin(u_xlat9.x);
    u_xlat0.w = u_xlat2.x + u_xlat11;
    u_xlat0.xw = u_xlat0.xw * vec2(22.2000008, 2.0);
    u_xlat2.xy = floor(u_xlat0.xw);
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat16_8.x = dot(u_xlat2.xy, vec2(35.2000008, 2376.1001));
    u_xlat2.xyw = u_xlat16_8.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat3.xyz = u_xlat2.yxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat3.x = dot(u_xlat2.wyx, u_xlat3.xyz);
    u_xlat2.xyw = u_xlat2.xyw + u_xlat3.xxx;
    u_xlat3.xyz = u_xlat2.yxx + u_xlat2.wwy;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat3.xyz;
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat3.xy = u_xlat2.xw + vec2(-0.5, -0.5);
    u_xlat2.x = -abs(u_xlat3.x) + 0.5;
    u_xlat9.x = u_xlat9.x * u_xlat2.x;
    u_xlat9.x = u_xlat9.x * u_xlat3.y + u_xlat3.x;
    u_xlat3.x = u_xlat9.x * 0.699999988;
    u_xlat9.x = u_xlat4.z + u_xlat0.w;
    u_xlat0.xw = u_xlat0.xw + vec2(-0.5, -0.0);
    u_xlat3.z = u_xlat9.x + -0.5;
    u_xlat21.xy = u_xlat0.xw + (-u_xlat3.xz);
    u_xlat9.x = dot(u_xlat21.xy, u_xlat21.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat9.x * 3.33333325;
    u_xlat9.x = min(u_xlat9.x, 1.0);
    u_xlat2.x = u_xlat9.x * -2.0 + 3.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = (-u_xlat2.x) * u_xlat9.x + 1.0;
    u_xlat2.x = u_xlat20 * _Speed + u_xlat2.w;
    u_xlatb11 = _SpawnThreshold_Flow>=u_xlat2.y;
    u_xlat11 = u_xlatb11 ? 1.0 : float(0.0);
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat2.z = u_xlat2.x + -0.850000024;
    u_xlat2.xz = u_xlat2.xz * vec2(1.17647052, 6.66666794);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat20 = max(u_xlat2.z, 0.0);
    u_xlat29 = u_xlat20 * -2.0 + 3.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat20 = (-u_xlat29) * u_xlat20 + 1.0;
    u_xlat29 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat29;
    u_xlat2.x = u_xlat2.x * u_xlat20 + -0.5;
    u_xlat3.y = u_xlat2.x * 0.899999976 + 0.5;
    u_xlat0.xw = u_xlat0.xw + (-u_xlat3.xy);
    u_xlat2.x = (-u_xlat3.y) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat0.w * u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat20 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat20) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat9.x = u_xlat9.x * u_xlat2.x;
    u_xlat2.xz = u_xlat0.xw * vec2(1.0, 6.0);
    u_xlat0.x = u_xlat0.w + 0.0199999996;
    u_xlat0.x = u_xlat0.x * 25.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat27 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 * 2.5;
    u_xlat27 = min(u_xlat27, 1.0);
    u_xlat2.x = u_xlat27 * -2.0 + 3.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = (-u_xlat2.x) * u_xlat27 + 1.0;
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = u_xlat9.x * u_xlat0.x + u_xlat27;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
    u_xlat16_8.x = _RainAmount + _RainAmount;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat16_17 = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_17;
    u_xlat9.x = u_xlat28 * u_xlat16_8.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat18;
    u_xlat0.x = u_xlat0.x + -0.300000012;
    u_xlat0.x = u_xlat0.x * 1.42857146;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = u_xlat19.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = dFdx(u_xlat0.x);
    u_xlat2.y = dFdy(u_xlat0.x);
    u_xlat0.xy = u_xlat2.xy * vec2(vec2(_NormalScale, _NormalScale));
    u_xlat0.z = (-u_xlat0.y);
    u_xlat0.xy = u_xlat0.xz + u_xlat1.xy;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = (-u_xlat10_0.xyz) + _GlassTintColor.xyz;
    u_xlat16_0.xyz = vec3(_GlassTintStrength) * u_xlat16_8.xyz + u_xlat10_0.xyz;
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat16_0.w = 1.0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_CHEAP_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
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
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_OES_standard_derivatives
#extension GL_OES_standard_derivatives : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	mediump float _TimeScale;
uniform 	mediump float _Speed;
uniform 	mediump float _RainAmount;
uniform 	mediump float _NormalScale;
uniform 	float _DropScale;
uniform 	mediump float _SpawnThreshold_Flow;
uniform 	mediump float _SpawnThreshold_Persistent;
uniform 	vec4 _RainMask_ST;
uniform 	mediump float _MaskFadeStrength;
uniform 	mediump vec4 _GlassTintColor;
uniform 	mediump float _GlassTintStrength;
uniform lowp sampler2D _RainMask;
uniform lowp sampler2D _GrabTexture;
varying mediump vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat6;
mediump float u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec2 u_xlat9;
float u_xlat11;
bool u_xlatb11;
float u_xlat12;
float u_xlat13;
mediump float u_xlat16_17;
float u_xlat18;
bool u_xlatb18;
vec2 u_xlat19;
lowp float u_xlat10_19;
float u_xlat20;
vec2 u_xlat21;
mediump float u_xlat16_26;
float u_xlat27;
float u_xlat28;
float u_xlat29;
bool u_xlatb29;
float u_xlat30;
float u_xlat31;
void main()
{
    u_xlat0.x = max(_DropScale, 9.99999975e-05);
    u_xlat9.xy = _ScreenParams.xy / _ScreenParams.yy;
    u_xlat1.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat1.z = (-u_xlat1.y);
    u_xlat2.xy = u_xlat1.xz + vec2(-0.5, 0.5);
    u_xlat9.xy = u_xlat9.xy * u_xlat2.xy;
    u_xlat0.xy = u_xlat9.xy / u_xlat0.xx;
    u_xlat2 = u_xlat0.xyxy * vec4(40.0, 40.0, 12.0, 20.0);
    u_xlat3.xyz = floor(u_xlat2.xyz);
    u_xlat19.x = u_xlat3.z * 12345.5645;
    u_xlat20 = dot(u_xlat3.xy, vec2(107.449997, 3543.65405));
    u_xlat3.xyz = vec3(u_xlat20) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat19.x = sin(u_xlat19.x);
    u_xlat19.x = u_xlat19.x * 7658.75977;
    u_xlat19.x = fract(u_xlat19.x);
    u_xlat20 = _Time.y * _TimeScale;
    u_xlat20 = u_xlat20 * 0.200000003;
    u_xlat30 = u_xlat20 * _Speed;
    u_xlat4.x = u_xlat30 * 0.75 + u_xlat0.y;
    u_xlat0.z = u_xlat19.x + u_xlat4.x;
    u_xlat4.xyz = u_xlat0.xzy * vec3(12.0, 2.0, 18.5);
    u_xlat5.xy = floor(u_xlat4.xy);
    u_xlat4.xyz = fract(u_xlat4.xyz);
    u_xlat16_6 = dot(u_xlat5.xy, vec2(35.2000008, 2376.1001));
    u_xlat5.xyz = vec3(u_xlat16_6) * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat7.xyz = u_xlat5.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat18 = dot(u_xlat5.zyx, u_xlat7.xyz);
    u_xlat5.xyz = vec3(u_xlat18) + u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yxx + u_xlat5.zzy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat18 = u_xlat20 * _Speed + u_xlat5.z;
    u_xlat18 = fract(u_xlat18);
    u_xlat19.x = u_xlat18 + -0.850000024;
    u_xlat18 = u_xlat18 * 1.17647052;
    u_xlat18 = min(u_xlat18, 1.0);
    u_xlat19.x = u_xlat19.x * 6.66666794;
    u_xlat19.x = max(u_xlat19.x, 0.0);
    u_xlat31 = u_xlat19.x * -2.0 + 3.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = (-u_xlat31) * u_xlat19.x + 1.0;
    u_xlat31 = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat31;
    u_xlat18 = u_xlat18 * u_xlat19.x + -0.5;
    u_xlat7.y = u_xlat18 * 0.899999976 + 0.5;
    u_xlat5.xz = u_xlat5.xz + vec2(-0.5, -0.5);
    u_xlatb18 = _SpawnThreshold_Flow>=u_xlat5.y;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat19.x = -abs(u_xlat5.x) + 0.5;
    u_xlat29 = sin(u_xlat2.w);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat29 = u_xlat0.y * 20.0 + u_xlat29;
    u_xlat29 = sin(u_xlat29);
    u_xlat19.x = u_xlat19.x * u_xlat29;
    u_xlat19.x = u_xlat19.x * u_xlat5.z + u_xlat5.x;
    u_xlat7.x = u_xlat19.x * 0.699999988;
    u_xlat4.xw = u_xlat4.xy + vec2(-0.5, -0.0);
    u_xlat5.xy = (-u_xlat7.xy) + u_xlat4.xw;
    u_xlat19.x = (-u_xlat7.y) + 1.0;
    u_xlat19.x = float(1.0) / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat5.y;
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
    u_xlat29 = u_xlat19.x * -2.0 + 3.0;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = (-u_xlat29) * u_xlat19.x + 1.0;
    u_xlat19.x = sqrt(u_xlat19.x);
    u_xlat6 = u_xlat0.yyxy * vec4(10.0, 1.85000002, 22.2000008, 37.0);
    u_xlat29 = fract(u_xlat6.x);
    u_xlat29 = u_xlat29 + u_xlat4.y;
    u_xlat7.z = u_xlat29 + -0.5;
    u_xlat4.xy = u_xlat4.xw + (-u_xlat7.xz);
    u_xlat29 = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat29 = sqrt(u_xlat29);
    u_xlat29 = u_xlat29 * 3.33333325;
    u_xlat29 = min(u_xlat29, 1.0);
    u_xlat4.x = u_xlat29 * -2.0 + 3.0;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat29 = (-u_xlat4.x) * u_xlat29 + 1.0;
    u_xlat19.x = u_xlat19.x * u_xlat29;
    u_xlat4.xy = u_xlat5.xy * vec2(1.0, 6.0);
    u_xlat29 = u_xlat5.y + 0.0199999996;
    u_xlat29 = u_xlat29 * 25.0;
    u_xlat29 = clamp(u_xlat29, 0.0, 1.0);
    u_xlat4.x = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat4.x = u_xlat4.x * 2.5;
    u_xlat4.x = min(u_xlat4.x, 1.0);
    u_xlat13 = u_xlat4.x * -2.0 + 3.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = (-u_xlat13) * u_xlat4.x + 1.0;
    u_xlat13 = u_xlat29 * -2.0 + 3.0;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat29 = u_xlat29 * u_xlat13;
    u_xlat19.x = u_xlat19.x * u_xlat29 + u_xlat4.x;
    u_xlat18 = u_xlat18 * u_xlat19.x;
    u_xlat16_8.xy = vec2(vec2(_RainAmount, _RainAmount)) + vec2(0.5, -0.25);
    u_xlat16_17 = u_xlat16_8.y + u_xlat16_8.y;
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
    u_xlat16_8.x = u_xlat16_8.x * 0.666666687;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat16_26 = u_xlat16_17 * -2.0 + 3.0;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_17;
    u_xlat16_17 = u_xlat16_17 * u_xlat16_26;
    u_xlat1.w = (-u_xlat1.y) + 1.0;
    u_xlat19.xy = u_xlat1.xw * _RainMask_ST.xy + _RainMask_ST.zw;
    u_xlat10_19 = texture2D(_RainMask, u_xlat19.xy).x;
    u_xlat28 = (-u_xlat10_19) + 1.0;
    u_xlat19.x = (-u_xlat10_19) * _MaskFadeStrength + 1.0;
    u_xlat29 = u_xlat28 * u_xlat16_17;
    u_xlat18 = u_xlat18 * u_xlat29;
    u_xlat4.xyw = u_xlat3.yxz + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat29 = dot(u_xlat3.zyx, u_xlat4.xyw);
    u_xlat3.xyz = vec3(u_xlat29) + u_xlat3.xyz;
    u_xlat4.xyw = u_xlat3.yxx + u_xlat3.zzy;
    u_xlat3.xyz = u_xlat3.xyz * u_xlat4.xyw;
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat4.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat2.xy = (-u_xlat4.xy) * vec2(0.699999988, 0.699999988) + u_xlat2.xy;
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 3.33333325;
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat11 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat11) * u_xlat2.x + 1.0;
    u_xlat11 = u_xlat3.z * 10.0;
    u_xlat11 = fract(u_xlat11);
    u_xlat2.x = u_xlat11 * u_xlat2.x;
    u_xlat11 = u_xlat20 * _Speed + u_xlat3.z;
    u_xlatb29 = _SpawnThreshold_Persistent>=u_xlat3.x;
    u_xlat29 = u_xlatb29 ? 1.0 : float(0.0);
    u_xlat11 = fract(u_xlat11);
    u_xlat3.x = u_xlat11 + -0.0250000004;
    u_xlat11 = u_xlat11 * 40.0;
    u_xlat11 = min(u_xlat11, 1.0);
    u_xlat3.x = u_xlat3.x * 1.02564096;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat12 = u_xlat3.x * -2.0 + 3.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat3.x = (-u_xlat12) * u_xlat3.x + 1.0;
    u_xlat12 = u_xlat11 * -2.0 + 3.0;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat11 = u_xlat11 * u_xlat12;
    u_xlat11 = u_xlat3.x * u_xlat11;
    u_xlat2.x = u_xlat11 * u_xlat2.x;
    u_xlat2.x = u_xlat29 * u_xlat2.x;
    u_xlat16_17 = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = dot(vec2(u_xlat16_17), u_xlat16_8.xx);
    u_xlat11 = u_xlat28 * u_xlat16_8.x;
    u_xlat18 = u_xlat2.x * u_xlat11 + u_xlat18;
    u_xlat2.x = floor(u_xlat6.z);
    u_xlat2.x = u_xlat2.x * 12345.5645;
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 7658.75977;
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat11 = u_xlat30 * 0.75 + u_xlat6.y;
    u_xlat29 = sin(u_xlat6.w);
    u_xlat9.x = u_xlat0.y * 37.0 + u_xlat29;
    u_xlat9.x = sin(u_xlat9.x);
    u_xlat0.w = u_xlat2.x + u_xlat11;
    u_xlat0.xw = u_xlat0.xw * vec2(22.2000008, 2.0);
    u_xlat2.xy = floor(u_xlat0.xw);
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat16_8.x = dot(u_xlat2.xy, vec2(35.2000008, 2376.1001));
    u_xlat2.xyw = u_xlat16_8.xxx * vec3(0.137869999, 0.113689996, 0.103100002);
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat3.xyz = u_xlat2.yxw + vec3(19.1900005, 19.1900005, 19.1900005);
    u_xlat3.x = dot(u_xlat2.wyx, u_xlat3.xyz);
    u_xlat2.xyw = u_xlat2.xyw + u_xlat3.xxx;
    u_xlat3.xyz = u_xlat2.yxx + u_xlat2.wwy;
    u_xlat2.xyw = u_xlat2.xyw * u_xlat3.xyz;
    u_xlat2.xyw = fract(u_xlat2.xyw);
    u_xlat3.xy = u_xlat2.xw + vec2(-0.5, -0.5);
    u_xlat2.x = -abs(u_xlat3.x) + 0.5;
    u_xlat9.x = u_xlat9.x * u_xlat2.x;
    u_xlat9.x = u_xlat9.x * u_xlat3.y + u_xlat3.x;
    u_xlat3.x = u_xlat9.x * 0.699999988;
    u_xlat9.x = u_xlat4.z + u_xlat0.w;
    u_xlat0.xw = u_xlat0.xw + vec2(-0.5, -0.0);
    u_xlat3.z = u_xlat9.x + -0.5;
    u_xlat21.xy = u_xlat0.xw + (-u_xlat3.xz);
    u_xlat9.x = dot(u_xlat21.xy, u_xlat21.xy);
    u_xlat9.x = sqrt(u_xlat9.x);
    u_xlat9.x = u_xlat9.x * 3.33333325;
    u_xlat9.x = min(u_xlat9.x, 1.0);
    u_xlat2.x = u_xlat9.x * -2.0 + 3.0;
    u_xlat9.x = u_xlat9.x * u_xlat9.x;
    u_xlat9.x = (-u_xlat2.x) * u_xlat9.x + 1.0;
    u_xlat2.x = u_xlat20 * _Speed + u_xlat2.w;
    u_xlatb11 = _SpawnThreshold_Flow>=u_xlat2.y;
    u_xlat11 = u_xlatb11 ? 1.0 : float(0.0);
    u_xlat2.x = fract(u_xlat2.x);
    u_xlat2.z = u_xlat2.x + -0.850000024;
    u_xlat2.xz = u_xlat2.xz * vec2(1.17647052, 6.66666794);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat20 = max(u_xlat2.z, 0.0);
    u_xlat29 = u_xlat20 * -2.0 + 3.0;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat20 = (-u_xlat29) * u_xlat20 + 1.0;
    u_xlat29 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat29;
    u_xlat2.x = u_xlat2.x * u_xlat20 + -0.5;
    u_xlat3.y = u_xlat2.x * 0.899999976 + 0.5;
    u_xlat0.xw = u_xlat0.xw + (-u_xlat3.xy);
    u_xlat2.x = (-u_xlat3.y) + 1.0;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat0.w * u_xlat2.x;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat20 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat20) * u_xlat2.x + 1.0;
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat9.x = u_xlat9.x * u_xlat2.x;
    u_xlat2.xz = u_xlat0.xw * vec2(1.0, 6.0);
    u_xlat0.x = u_xlat0.w + 0.0199999996;
    u_xlat0.x = u_xlat0.x * 25.0;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat27 = dot(u_xlat2.xz, u_xlat2.xz);
    u_xlat27 = sqrt(u_xlat27);
    u_xlat27 = u_xlat27 * 2.5;
    u_xlat27 = min(u_xlat27, 1.0);
    u_xlat2.x = u_xlat27 * -2.0 + 3.0;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat27 = (-u_xlat2.x) * u_xlat27 + 1.0;
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat0.x = u_xlat9.x * u_xlat0.x + u_xlat27;
    u_xlat0.x = u_xlat11 * u_xlat0.x;
    u_xlat16_8.x = _RainAmount + _RainAmount;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat16_17 = u_xlat16_8.x * -2.0 + 3.0;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_17;
    u_xlat9.x = u_xlat28 * u_xlat16_8.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x + u_xlat18;
    u_xlat0.x = u_xlat0.x + -0.300000012;
    u_xlat0.x = u_xlat0.x * 1.42857146;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat9.x;
    u_xlat0.x = u_xlat19.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = dFdx(u_xlat0.x);
    u_xlat2.y = dFdy(u_xlat0.x);
    u_xlat0.xy = u_xlat2.xy * vec2(vec2(_NormalScale, _NormalScale));
    u_xlat0.z = (-u_xlat0.y);
    u_xlat0.xy = u_xlat0.xz + u_xlat1.xy;
    u_xlat10_0.xyz = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = (-u_xlat10_0.xyz) + _GlassTintColor.xyz;
    u_xlat16_0.xyz = vec3(_GlassTintStrength) * u_xlat16_8.xyz + u_xlat10_0.xyz;
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat16_0.w = 1.0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
Local Keywords { "_CHEAP_NORMAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_CHEAP_NORMAL" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_CHEAP_NORMAL" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_CHEAP_NORMAL" }
""
}
}
}
}
}