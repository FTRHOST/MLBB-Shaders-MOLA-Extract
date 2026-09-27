//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Spine/Skeleton Tint Clip" {
Properties {

_Color ("Tint Color", Color) = (1,1,1,1)

_Black ("Dark Color", Color) = (0,0,0,0)

_MainTex ("MainTex", 2D) = "black" { }

[Toggle(_STRAIGHT_ALPHA_INPUT)] _StraightAlphaInput ("Straight Alpha Texture", Float) = 0.0

_Cutoff ("Shadow alpha cutoff", Range(0, 1)) = 0.10000000149011612

[Toggle(_DARK_COLOR_ALPHA_ADDITIVE)] _DarkColorAlphaAdditive ("Additive DarkColor.A", Float) = 0.0

_StencilRef ("Stencil Reference", Float) = 1.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("Stencil Comparison", Float) = 8.0

[Space(20)] [Toggle] _UseClip ("UseClip", Float) = 0.0

_ClipRangeLeft ("ClipRangeLeft", Range(-10, 10)) = 0.0

_ClipRangeRight ("ClipRangeRight", Range(-10, 10)) = 1.0

_ClipRangeTop ("ClipRangeTop", Range(-10, 10)) = 1.0

_ClipRangeBottom ("ClipRangeBottom", Range(-10, 10)) = 0.0

_SoftnessLeft ("SoftnessLeft", Float) = 0.05000000074505806

_SoftnessRight ("SoftnessRight", Float) = 0.05000000074505806

_SoftnessTop ("SoftnessTop", Float) = 0.05000000074505806

_SoftnessBottom ("SoftnessBottom", Float) = 0.05000000074505806

_OutlineWidth ("Outline Width", Range(0, 8)) = 3.0

_OutlineColor ("Outline Color", Color) = (1,1,0,1)

_OutlineReferenceTexWidth ("Reference Texture Width", Float) = 1024.0

_ThresholdEnd ("Outline Threshold", Range(0, 1)) = 0.25

_OutlineSmoothness ("Outline Smoothness", Range(0, 1)) = 1.0

[MaterialToggle(_USE8NEIGHBOURHOOD_ON)] _Use8Neighbourhood ("Sample 8 Neighbours", Float) = 1.0

_OutlineMipLevel ("Outline Mip Level", Range(0, 3)) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "Normal"
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 41959
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat16_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.www * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat1.x = _ClipRangeLeft;
        u_xlat1.z = _ClipRangeBottom;
        u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat8.x, 0.00100000005);
        u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat8.x, 0.00100000005);
        u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
        u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
        u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
        u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
        u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
        u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
        u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat5 = u_xlat1.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
        u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
        u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
        u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
        u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
        u_xlat4 = u_xlat4 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
        u_xlat0.x = min(u_xlat4, u_xlat0.x);
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
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
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat16_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.www * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat1.x = _ClipRangeLeft;
        u_xlat1.z = _ClipRangeBottom;
        u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat8.x, 0.00100000005);
        u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat8.x, 0.00100000005);
        u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
        u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
        u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
        u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
        u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
        u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
        u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat5 = u_xlat1.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
        u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
        u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
        u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
        u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
        u_xlat4 = u_xlat4 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
        u_xlat0.x = min(u_xlat4, u_xlat0.x);
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
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
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat10_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat1.x = _ClipRangeLeft;
        u_xlat1.z = _ClipRangeBottom;
        u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat8.x, 0.00100000005);
        u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat8.x, 0.00100000005);
        u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
        u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
        u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
        u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
        u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
        u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
        u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat5 = u_xlat1.z / _SoftnessLeft;
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
        u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
        u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
        u_xlat4 = u_xlat4 / _SoftnessBottom;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
        u_xlat0.x = min(u_xlat4, u_xlat0.x);
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
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
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat10_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat1.x = _ClipRangeLeft;
        u_xlat1.z = _ClipRangeBottom;
        u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat8.x, 0.00100000005);
        u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat8.x, 0.00100000005);
        u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
        u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
        u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
        u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
        u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
        u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
        u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat5 = u_xlat1.z / _SoftnessLeft;
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
        u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
        u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
        u_xlat4 = u_xlat4 / _SoftnessBottom;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
        u_xlat0.x = min(u_xlat4, u_xlat0.x);
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_STRAIGHT_ALPHA_INPUT" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.www * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat1.x = _ClipRangeLeft;
        u_xlat1.z = _ClipRangeBottom;
        u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat8.x, 0.00100000005);
        u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat8.x, 0.00100000005);
        u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
        u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
        u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
        u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
        u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
        u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
        u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat5 = u_xlat1.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
        u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
        u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
        u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
        u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
        u_xlat4 = u_xlat4 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
        u_xlat0.x = min(u_xlat4, u_xlat0.x);
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_STRAIGHT_ALPHA_INPUT" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.www * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat1.x = _ClipRangeLeft;
        u_xlat1.z = _ClipRangeBottom;
        u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat8.x, 0.00100000005);
        u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat8.x, 0.00100000005);
        u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
        u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
        u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
        u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
        u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
        u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
        u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat5 = u_xlat1.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
        u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
        u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
        u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
        u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
        u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
        u_xlat4 = u_xlat4 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
        u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
        u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
        u_xlat0.x = min(u_xlat4, u_xlat0.x);
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_STRAIGHT_ALPHA_INPUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat1.x = _ClipRangeLeft;
        u_xlat1.z = _ClipRangeBottom;
        u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat8.x, 0.00100000005);
        u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat8.x, 0.00100000005);
        u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
        u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
        u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
        u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
        u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
        u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
        u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat5 = u_xlat1.z / _SoftnessLeft;
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
        u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
        u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
        u_xlat4 = u_xlat4 / _SoftnessBottom;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
        u_xlat0.x = min(u_xlat4, u_xlat0.x);
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_STRAIGHT_ALPHA_INPUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat1.x = _ClipRangeLeft;
        u_xlat1.z = _ClipRangeBottom;
        u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat8.x, 0.00100000005);
        u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat8.x, 0.00100000005);
        u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
        u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
        u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
        u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
        u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
        u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
        u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat5 = u_xlat1.z / _SoftnessLeft;
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
        u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
        u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
        u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
        u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
        u_xlat4 = u_xlat4 / _SoftnessBottom;
        u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
        u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
        u_xlat0.x = min(u_xlat4, u_xlat0.x);
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat16_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb1){
        u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat2.x = _ClipRangeLeft;
        u_xlat2.z = _ClipRangeBottom;
        u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat9.x, 0.00100000005);
        u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat9.x, 0.00100000005);
        u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
        u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
        u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
        u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
        u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
        u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
        u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat6 = u_xlat2.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
        u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
        u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
        u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
        u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
        u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
        u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
        u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
        u_xlat5 = u_xlat5 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
        u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
        u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
        u_xlat1.x = min(u_xlat5, u_xlat1.x);
        u_xlat1 = u_xlat0 * u_xlat1.xxxx;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat16_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb1){
        u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat2.x = _ClipRangeLeft;
        u_xlat2.z = _ClipRangeBottom;
        u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat9.x, 0.00100000005);
        u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat9.x, 0.00100000005);
        u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
        u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
        u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
        u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
        u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
        u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
        u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat6 = u_xlat2.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
        u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
        u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
        u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
        u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
        u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
        u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
        u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
        u_xlat5 = u_xlat5 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
        u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
        u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
        u_xlat1.x = min(u_xlat5, u_xlat1.x);
        u_xlat1 = u_xlat0 * u_xlat1.xxxx;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat10_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb1){
        u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat2.x = _ClipRangeLeft;
        u_xlat2.z = _ClipRangeBottom;
        u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat9.x, 0.00100000005);
        u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat9.x, 0.00100000005);
        u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
        u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
        u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
        u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
        u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
        u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
        u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat6 = u_xlat2.z / _SoftnessLeft;
        u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
        u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
        u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
        u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
        u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
        u_xlat5 = u_xlat5 / _SoftnessBottom;
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
        u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
        u_xlat1.x = min(u_xlat5, u_xlat1.x);
        u_xlat1 = u_xlat0 * u_xlat1.xxxx;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat10_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb1){
        u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat2.x = _ClipRangeLeft;
        u_xlat2.z = _ClipRangeBottom;
        u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat9.x, 0.00100000005);
        u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat9.x, 0.00100000005);
        u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
        u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
        u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
        u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
        u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
        u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
        u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat6 = u_xlat2.z / _SoftnessLeft;
        u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
        u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
        u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
        u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
        u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
        u_xlat5 = u_xlat5 / _SoftnessBottom;
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
        u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
        u_xlat1.x = min(u_xlat5, u_xlat1.x);
        u_xlat1 = u_xlat0 * u_xlat1.xxxx;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_STRAIGHT_ALPHA_INPUT" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb1){
        u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat2.x = _ClipRangeLeft;
        u_xlat2.z = _ClipRangeBottom;
        u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat9.x, 0.00100000005);
        u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat9.x, 0.00100000005);
        u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
        u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
        u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
        u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
        u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
        u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
        u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat6 = u_xlat2.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
        u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
        u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
        u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
        u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
        u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
        u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
        u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
        u_xlat5 = u_xlat5 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
        u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
        u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
        u_xlat1.x = min(u_xlat5, u_xlat1.x);
        u_xlat1 = u_xlat0 * u_xlat1.xxxx;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_STRAIGHT_ALPHA_INPUT" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb1){
        u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat2.x = _ClipRangeLeft;
        u_xlat2.z = _ClipRangeBottom;
        u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat9.x, 0.00100000005);
        u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat9.x, 0.00100000005);
        u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
        u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
        u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
        u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
        u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
        u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
        u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat6 = u_xlat2.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
        u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
        u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
        u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
        u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
        u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
        u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
        u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
        u_xlat5 = u_xlat5 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
        u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
        u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
        u_xlat1.x = min(u_xlat5, u_xlat1.x);
        u_xlat1 = u_xlat0 * u_xlat1.xxxx;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_STRAIGHT_ALPHA_INPUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb1){
        u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat2.x = _ClipRangeLeft;
        u_xlat2.z = _ClipRangeBottom;
        u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat9.x, 0.00100000005);
        u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat9.x, 0.00100000005);
        u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
        u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
        u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
        u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
        u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
        u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
        u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat6 = u_xlat2.z / _SoftnessLeft;
        u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
        u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
        u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
        u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
        u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
        u_xlat5 = u_xlat5 / _SoftnessBottom;
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
        u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
        u_xlat1.x = min(u_xlat5, u_xlat1.x);
        u_xlat1 = u_xlat0 * u_xlat1.xxxx;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_STRAIGHT_ALPHA_INPUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb1){
        u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
        u_xlat2.x = _ClipRangeLeft;
        u_xlat2.z = _ClipRangeBottom;
        u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
        u_xlat3.x = max(u_xlat9.x, 0.00100000005);
        u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
        u_xlat3.y = max(u_xlat9.x, 0.00100000005);
        u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
        u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
        u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
        u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
        u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
        u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
        u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
        u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
        u_xlat6 = u_xlat2.z / _SoftnessLeft;
        u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
        u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
        u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
        u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
        u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
        u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
        u_xlat5 = u_xlat5 / _SoftnessBottom;
        u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
        u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
        u_xlat1.x = min(u_xlat5, u_xlat1.x);
        u_xlat1 = u_xlat0 * u_xlat1.xxxx;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_SPINE_CLIP_RECT" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat16_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat1.x = _ClipRangeLeft;
    u_xlat1.z = _ClipRangeBottom;
    u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat8.x, 0.00100000005);
    u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat8.x, 0.00100000005);
    u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
    u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
    u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
    u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
    u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
    u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
    u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat5 = u_xlat1.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
    u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
    u_xlat4 = u_xlat4 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
    u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
    u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
    u_xlat0.x = min(u_xlat4, u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2;
    u_xlat2 = u_xlatb1.x ? u_xlat2 : vec4(0.0, 0.0, 0.0, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb4 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb4){
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_SPINE_CLIP_RECT" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat16_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat1.x = _ClipRangeLeft;
    u_xlat1.z = _ClipRangeBottom;
    u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat8.x, 0.00100000005);
    u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat8.x, 0.00100000005);
    u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
    u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
    u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
    u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
    u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
    u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
    u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat5 = u_xlat1.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
    u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
    u_xlat4 = u_xlat4 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
    u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
    u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
    u_xlat0.x = min(u_xlat4, u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2;
    u_xlat2 = u_xlatb1.x ? u_xlat2 : vec4(0.0, 0.0, 0.0, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb4 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb4){
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_SPINE_CLIP_RECT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat10_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat1.x = _ClipRangeLeft;
    u_xlat1.z = _ClipRangeBottom;
    u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat8.x, 0.00100000005);
    u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat8.x, 0.00100000005);
    u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
    u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
    u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
    u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
    u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
    u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
    u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat5 = u_xlat1.z / _SoftnessLeft;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
    u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
    u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
    u_xlat4 = u_xlat4 / _SoftnessBottom;
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
    u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
    u_xlat0.x = min(u_xlat4, u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2;
    u_xlat2 = u_xlatb1.x ? u_xlat2 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlatb4 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb4){
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_SPINE_CLIP_RECT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat10_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat1.x = _ClipRangeLeft;
    u_xlat1.z = _ClipRangeBottom;
    u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat8.x, 0.00100000005);
    u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat8.x, 0.00100000005);
    u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
    u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
    u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
    u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
    u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
    u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
    u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat5 = u_xlat1.z / _SoftnessLeft;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
    u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
    u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
    u_xlat4 = u_xlat4 / _SoftnessBottom;
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
    u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
    u_xlat0.x = min(u_xlat4, u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2;
    u_xlat2 = u_xlatb1.x ? u_xlat2 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlatb4 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb4){
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat1.x = _ClipRangeLeft;
    u_xlat1.z = _ClipRangeBottom;
    u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat8.x, 0.00100000005);
    u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat8.x, 0.00100000005);
    u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
    u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
    u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
    u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
    u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
    u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
    u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat5 = u_xlat1.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
    u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
    u_xlat4 = u_xlat4 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
    u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
    u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
    u_xlat0.x = min(u_xlat4, u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2;
    u_xlat2 = u_xlatb1.x ? u_xlat2 : vec4(0.0, 0.0, 0.0, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb4 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb4){
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat1.x = _ClipRangeLeft;
    u_xlat1.z = _ClipRangeBottom;
    u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat8.x, 0.00100000005);
    u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat8.x, 0.00100000005);
    u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
    u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
    u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
    u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
    u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
    u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
    u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat5 = u_xlat1.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xy = min(max(u_xlat9.xy, 0.0), 1.0);
#else
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
    u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
    u_xlat4 = u_xlat4 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
    u_xlat4 = min(max(u_xlat4, 0.0), 1.0);
#else
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
#endif
    u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
    u_xlat0.x = min(u_xlat4, u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2;
    u_xlat2 = u_xlatb1.x ? u_xlat2 : vec4(0.0, 0.0, 0.0, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb4 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb4){
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat1.x = _ClipRangeLeft;
    u_xlat1.z = _ClipRangeBottom;
    u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat8.x, 0.00100000005);
    u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat8.x, 0.00100000005);
    u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
    u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
    u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
    u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
    u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
    u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
    u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat5 = u_xlat1.z / _SoftnessLeft;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
    u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
    u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
    u_xlat4 = u_xlat4 / _SoftnessBottom;
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
    u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
    u_xlat0.x = min(u_xlat4, u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2;
    u_xlat2 = u_xlatb1.x ? u_xlat2 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlatb4 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb4){
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec2 u_xlat8;
bvec2 u_xlatb8;
vec2 u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0 * vs_COLOR0;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat0.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat1.x = _ClipRangeLeft;
    u_xlat1.z = _ClipRangeBottom;
    u_xlat8.x = (-u_xlat1.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat8.x, 0.00100000005);
    u_xlat8.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat8.x, 0.00100000005);
    u_xlat1.xyz = u_xlat0.xyx + (-u_xlat1.xzx);
    u_xlat8.xy = u_xlat1.xy / u_xlat3.xy;
    u_xlatb1.xy = greaterThanEqual(u_xlat8.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat8.xyxx).xy;
    u_xlatb1.x = u_xlatb1.x && u_xlatb3.x;
    u_xlatb1.x = u_xlatb1.y && u_xlatb1.x;
    u_xlatb1.x = u_xlatb3.y && u_xlatb1.x;
    u_xlatb8.xy = lessThan(u_xlat8.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat5 = u_xlat1.z / _SoftnessLeft;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat9.xy = (-u_xlat0.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat9.xy = u_xlat9.xy / vec2(_SoftnessRight, _SoftnessTop);
    u_xlat9.xy = clamp(u_xlat9.xy, 0.0, 1.0);
    u_xlat0.x = (u_xlatb8.x) ? u_xlat5 : u_xlat9.x;
    u_xlat4 = u_xlat0.y + (-_ClipRangeBottom);
    u_xlat4 = u_xlat4 / _SoftnessBottom;
    u_xlat4 = clamp(u_xlat4, 0.0, 1.0);
    u_xlat4 = (u_xlatb8.y) ? u_xlat4 : u_xlat9.y;
    u_xlat0.x = min(u_xlat4, u_xlat0.x);
    u_xlat2 = u_xlat0.xxxx * u_xlat2;
    u_xlat2 = u_xlatb1.x ? u_xlat2 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlatb4 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb4){
        u_xlat0 = u_xlat0.xxxx * u_xlat2;
        SV_Target0 = u_xlatb1.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat2;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat16_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat2.x = _ClipRangeLeft;
    u_xlat2.z = _ClipRangeBottom;
    u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat9.x, 0.00100000005);
    u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat9.x, 0.00100000005);
    u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
    u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
    u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
    u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat6 = u_xlat2.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
    u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
    u_xlat5 = u_xlat5 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
    u_xlat1.x = min(u_xlat5, u_xlat1.x);
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0 = u_xlatb2.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb5 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb5){
        u_xlat1 = u_xlat1.xxxx * u_xlat0;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat16_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat2.x = _ClipRangeLeft;
    u_xlat2.z = _ClipRangeBottom;
    u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat9.x, 0.00100000005);
    u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat9.x, 0.00100000005);
    u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
    u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
    u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
    u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat6 = u_xlat2.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
    u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
    u_xlat5 = u_xlat5 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
    u_xlat1.x = min(u_xlat5, u_xlat1.x);
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0 = u_xlatb2.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb5 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb5){
        u_xlat1 = u_xlat1.xxxx * u_xlat0;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat10_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat2.x = _ClipRangeLeft;
    u_xlat2.z = _ClipRangeBottom;
    u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat9.x, 0.00100000005);
    u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat9.x, 0.00100000005);
    u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
    u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
    u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
    u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat6 = u_xlat2.z / _SoftnessLeft;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
    u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
    u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
    u_xlat5 = u_xlat5 / _SoftnessBottom;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
    u_xlat1.x = min(u_xlat5, u_xlat1.x);
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0 = u_xlatb2.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlatb5 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb5){
        u_xlat1 = u_xlat1.xxxx * u_xlat0;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat10_0.www;
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat2.x = _ClipRangeLeft;
    u_xlat2.z = _ClipRangeBottom;
    u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat9.x, 0.00100000005);
    u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat9.x, 0.00100000005);
    u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
    u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
    u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
    u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat6 = u_xlat2.z / _SoftnessLeft;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
    u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
    u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
    u_xlat5 = u_xlat5 / _SoftnessBottom;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
    u_xlat1.x = min(u_xlat5, u_xlat1.x);
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0 = u_xlatb2.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlatb5 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb5){
        u_xlat1 = u_xlat1.xxxx * u_xlat0;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat2.x = _ClipRangeLeft;
    u_xlat2.z = _ClipRangeBottom;
    u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat9.x, 0.00100000005);
    u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat9.x, 0.00100000005);
    u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
    u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
    u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
    u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat6 = u_xlat2.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
    u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
    u_xlat5 = u_xlat5 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
    u_xlat1.x = min(u_xlat5, u_xlat1.x);
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0 = u_xlatb2.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb5 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb5){
        u_xlat1 = u_xlat1.xxxx * u_xlat0;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
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
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat16_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat16_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat2.x = _ClipRangeLeft;
    u_xlat2.z = _ClipRangeBottom;
    u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat9.x, 0.00100000005);
    u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat9.x, 0.00100000005);
    u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
    u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
    u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
    u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat6 = u_xlat2.z / _SoftnessLeft;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
    u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
    u_xlat5 = u_xlat5 / _SoftnessBottom;
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
    u_xlat1.x = min(u_xlat5, u_xlat1.x);
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0 = u_xlatb2.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip));
#else
    u_xlatb5 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
#endif
    if(u_xlatb5){
        u_xlat1 = u_xlat1.xxxx * u_xlat0;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat2.x = _ClipRangeLeft;
    u_xlat2.z = _ClipRangeBottom;
    u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat9.x, 0.00100000005);
    u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat9.x, 0.00100000005);
    u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
    u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
    u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
    u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat6 = u_xlat2.z / _SoftnessLeft;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
    u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
    u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
    u_xlat5 = u_xlat5 / _SoftnessBottom;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
    u_xlat1.x = min(u_xlat5, u_xlat1.x);
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0 = u_xlatb2.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlatb5 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb5){
        u_xlat1 = u_xlat1.xxxx * u_xlat0;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xyz = _Color.www * _Color.xyz;
    u_xlat0.w = _Color.w;
    vs_COLOR0 = u_xlat0 * in_COLOR0;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	vec4 _Color;
uniform 	vec4 _Black;
uniform 	float _UseClip;
uniform 	float _ClipRangeLeft;
uniform 	float _ClipRangeRight;
uniform 	float _ClipRangeTop;
uniform 	float _ClipRangeBottom;
uniform 	float _SoftnessLeft;
uniform 	float _SoftnessRight;
uniform 	float _SoftnessTop;
uniform 	float _SoftnessBottom;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
bvec2 u_xlatb3;
float u_xlat5;
bool u_xlatb5;
float u_xlat6;
vec2 u_xlat9;
bvec2 u_xlatb9;
vec2 u_xlat10;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat1.xyz * _Black.xyz;
    u_xlat2 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0.xyz = u_xlat1.xyz * _Color.www + u_xlat2.yzw;
    u_xlat0.xyz = u_xlat10_0.www * u_xlat0.xyz;
    u_xlat1.x = (-_Black.w) + 1.0;
    u_xlat0.w = u_xlat1.x * u_xlat2.x;
    u_xlat1.xy = vs_TEXCOORD2.xy * vec2(0.0480000004, 0.0540000014) + vec2(0.5, 0.5);
    u_xlat2.x = _ClipRangeLeft;
    u_xlat2.z = _ClipRangeBottom;
    u_xlat9.x = (-u_xlat2.x) + _ClipRangeRight;
    u_xlat3.x = max(u_xlat9.x, 0.00100000005);
    u_xlat9.x = _ClipRangeTop + (-_ClipRangeBottom);
    u_xlat3.y = max(u_xlat9.x, 0.00100000005);
    u_xlat2.xyz = u_xlat1.xyx + (-u_xlat2.xzx);
    u_xlat9.xy = u_xlat2.xy / u_xlat3.xy;
    u_xlatb2.xy = greaterThanEqual(u_xlat9.xyxx, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb3.xy = greaterThanEqual(vec4(1.0, 1.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlatb2.x = u_xlatb2.x && u_xlatb3.x;
    u_xlatb2.x = u_xlatb2.y && u_xlatb2.x;
    u_xlatb2.x = u_xlatb3.y && u_xlatb2.x;
    u_xlatb9.xy = lessThan(u_xlat9.xyxy, vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat6 = u_xlat2.z / _SoftnessLeft;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat10.xy = (-u_xlat1.xy) + vec2(_ClipRangeRight, _ClipRangeTop);
    u_xlat10.xy = u_xlat10.xy / vec2(_SoftnessRight, _SoftnessTop);
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
    u_xlat1.x = (u_xlatb9.x) ? u_xlat6 : u_xlat10.x;
    u_xlat5 = u_xlat1.y + (-_ClipRangeBottom);
    u_xlat5 = u_xlat5 / _SoftnessBottom;
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
    u_xlat5 = (u_xlatb9.y) ? u_xlat5 : u_xlat10.y;
    u_xlat1.x = min(u_xlat5, u_xlat1.x);
    u_xlat0 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0 = u_xlatb2.x ? u_xlat0 : vec4(0.0, 0.0, 0.0, 0.0);
    u_xlatb5 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseClip);
    if(u_xlatb5){
        u_xlat1 = u_xlat1.xxxx * u_xlat0;
        SV_Target0 = u_xlatb2.x ? u_xlat1 : vec4(0.0, 0.0, 0.0, 0.0);
    } else {
        SV_Target0 = u_xlat0;
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_SPINE_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_SPINE_CLIP_RECT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_SPINE_CLIP_RECT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_SPINE_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_DARK_COLOR_ALPHA_ADDITIVE" "_SPINE_CLIP_RECT" "_STRAIGHT_ALPHA_INPUT" }
""
}
}
}
 Pass {
 Name "Caster"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "SHADOWCASTER" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
 Cull Off
 Offset 1.0, 1.0
  GpuProgramID 130229
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vs_TEXCOORD1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vs_TEXCOORD1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat10_0 * vs_TEXCOORD1.w + (-_Cutoff);
    u_xlatb0 = u_xlat0<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat4);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat4) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat4;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat10_0 * vs_TEXCOORD1.w + (-_Cutoff);
    u_xlatb0 = u_xlat0<0.0;
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vs_TEXCOORD1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
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
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD1;
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
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vs_TEXCOORD1.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0<0.0);
#else
    u_xlatb0 = u_xlat0<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0.x = u_xlat10_0 * vs_TEXCOORD1.w + (-_Cutoff);
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = min(u_xlat0.x, 0.999000013);
    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
    u_xlat0 = fract(u_xlat0);
    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _LightPositionRange;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    vs_TEXCOORD0.xyz = u_xlat0.xyz + (-_LightPositionRange.xyz);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD1.xyz = in_TEXCOORD0.xyz;
    vs_TEXCOORD1.w = in_COLOR0.w;
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
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_LightShadowBias;
uniform 	mediump float _Cutoff;
uniform lowp sampler2D _MainTex;
varying highp vec3 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat0.x = u_xlat10_0 * vs_TEXCOORD1.w + (-_Cutoff);
    u_xlatb0 = u_xlat0.x<0.0;
    if(u_xlatb0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + unity_LightShadowBias.x;
    u_xlat0.x = u_xlat0.x * _LightPositionRange.w;
    u_xlat0.x = min(u_xlat0.x, 0.999000013);
    u_xlat0 = u_xlat0.xxxx * vec4(1.0, 255.0, 65025.0, 16581375.0);
    u_xlat0 = fract(u_xlat0);
    SV_Target0 = (-u_xlat0.yzww) * vec4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886) + u_xlat0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
}
CustomEditor "SpineShaderWithOutlineGUI"
}