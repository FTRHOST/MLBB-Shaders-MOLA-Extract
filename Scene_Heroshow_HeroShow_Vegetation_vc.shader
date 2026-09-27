//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Scene/Heroshow/HeroShow_Vegetation_vc" {
Properties {

_MainTex ("Base (RGB)", 2D) = "" { }

_MainMask ("Mask (A)", 2D) = "" { }

_Cutoff ("CutOff", Range(0, 0.9)) = 0.5

[Space(10)] [Header(ColorRed)] _WindEdgeFlutterFactorColR ("红色部分振幅", Float) = 0.5

_WindEdgeFlutterFrequenceColR ("红色部分振频", Float) = 0.5

[Space(10)] [Header(ColorGreen)] _WindEdgeFlutterFactorColG ("绿色部分振幅", Float) = 0.5

_WindEdgeFlutterFrequenceColG ("绿色部分振频", Float) = 0.5

[Space(10)] [Header(WindParams)] _WindParams ("风向参数XYZ是风的方向W是风的大小", Vector) = (1,1,1,1)

_EdgeBendingFactor ("混合法线振幅", Float) = 0.0

[Toggle(_SHOW_COLOR_R)] _SHOW_COLOR_R ("SHOW COLOR R", Float) = 0.0

[Toggle(_SHOW_COLOR_G)] _SHOW_COLOR_G ("SHOW COLOR G", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "AlphaTest" "RenderType" = "TransparentCutout" }
 AlphaToMask On
 Cull Off
  GpuProgramID 21671
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _WindEdgeFlutterFrequenceColR;
uniform 	float _WindEdgeFlutterFrequenceColG;
uniform 	float _WindEdgeFlutterFactorColR;
uniform 	float _WindEdgeFlutterFactorColG;
uniform 	vec4 _WindParams;
uniform 	float _EdgeBendingFactor;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in highp vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat8;
vec2 u_xlat9;
bvec2 u_xlatb9;
float u_xlat12;
void main()
{
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat4.xy = vec2(1.0, 1.0) / vec2(_WindEdgeFlutterFrequenceColR, _WindEdgeFlutterFrequenceColG);
    u_xlat4.xy = max(u_xlat4.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat4.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat8.xy = abs(u_xlat0.xy) * abs(u_xlat0.xy);
    u_xlat0.xy = -abs(u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat4.x = dot(u_xlat8.yy, u_xlat0.yy);
    u_xlat0.x = dot(u_xlat8.xx, u_xlat0.xx);
    u_xlat1.y = u_xlat4.x * in_COLOR0.y;
    u_xlat2.y = u_xlat0.x * in_COLOR0.x;
    u_xlat8.x = u_xlat2.y * _WindEdgeFlutterFactorColR;
    u_xlat12 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat2.xz = vec2(u_xlat12) * u_xlat8.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat8.x = u_xlat1.y * _WindEdgeFlutterFactorColG;
    u_xlat1.xz = vec2(u_xlat12) * u_xlat8.xx;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * _WindParams.yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.yyy;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_COLOR0.xxx;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat1.xyz;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(-1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(-1.0) : 0.0;
;
    u_xlatb9.xy = lessThan(in_NORMAL0.xzxz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec4 hlslcc_movcTemp = u_xlat1;
        hlslcc_movcTemp.x = (u_xlatb9.x) ? float(1.0) : u_xlat1.x;
        hlslcc_movcTemp.y = (u_xlatb9.y) ? float(1.0) : u_xlat1.y;
        u_xlat1 = hlslcc_movcTemp;
    }
    u_xlat9.x = in_COLOR0.x * 0.100000001;
    u_xlat9.xy = u_xlat9.xx * in_NORMAL0.xz;
    u_xlat1.xy = u_xlat1.xy * u_xlat9.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(_EdgeBendingFactor);
    u_xlat1.xz = vec2(u_xlat12) * u_xlat1.xy;
    u_xlat1.y = 0.0;
    u_xlat1.xyz = u_xlat1.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainMask;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
void main()
{
    u_xlat16_0 = texture(_MainMask, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat16_0 * u_xlat16_1.w + (-_Cutoff);
    u_xlat16_2.x = u_xlat16_0 * u_xlat16_1.w;
    SV_Target0.w = u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat3<0.0);
#else
    u_xlatb0.x = u_xlat3<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlatb0.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb0.x) ? vs_COLOR0.x : u_xlat16_1.x;
    u_xlat16_2.yz = (u_xlatb0.x) ? vec2(0.0, 0.0) : u_xlat16_1.yz;
    SV_Target0.xz = (u_xlatb0.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb0.y) ? vs_COLOR0.y : u_xlat16_2.y;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _WindEdgeFlutterFrequenceColR;
uniform 	float _WindEdgeFlutterFrequenceColG;
uniform 	float _WindEdgeFlutterFactorColR;
uniform 	float _WindEdgeFlutterFactorColG;
uniform 	vec4 _WindParams;
uniform 	float _EdgeBendingFactor;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in highp vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat8;
vec2 u_xlat9;
bvec2 u_xlatb9;
float u_xlat12;
void main()
{
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat4.xy = vec2(1.0, 1.0) / vec2(_WindEdgeFlutterFrequenceColR, _WindEdgeFlutterFrequenceColG);
    u_xlat4.xy = max(u_xlat4.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat4.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat8.xy = abs(u_xlat0.xy) * abs(u_xlat0.xy);
    u_xlat0.xy = -abs(u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat4.x = dot(u_xlat8.yy, u_xlat0.yy);
    u_xlat0.x = dot(u_xlat8.xx, u_xlat0.xx);
    u_xlat1.y = u_xlat4.x * in_COLOR0.y;
    u_xlat2.y = u_xlat0.x * in_COLOR0.x;
    u_xlat8.x = u_xlat2.y * _WindEdgeFlutterFactorColR;
    u_xlat12 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat2.xz = vec2(u_xlat12) * u_xlat8.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat8.x = u_xlat1.y * _WindEdgeFlutterFactorColG;
    u_xlat1.xz = vec2(u_xlat12) * u_xlat8.xx;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * _WindParams.yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.yyy;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_COLOR0.xxx;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat1.xyz;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(-1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(-1.0) : 0.0;
;
    u_xlatb9.xy = lessThan(in_NORMAL0.xzxz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec4 hlslcc_movcTemp = u_xlat1;
        hlslcc_movcTemp.x = (u_xlatb9.x) ? float(1.0) : u_xlat1.x;
        hlslcc_movcTemp.y = (u_xlatb9.y) ? float(1.0) : u_xlat1.y;
        u_xlat1 = hlslcc_movcTemp;
    }
    u_xlat9.x = in_COLOR0.x * 0.100000001;
    u_xlat9.xy = u_xlat9.xx * in_NORMAL0.xz;
    u_xlat1.xy = u_xlat1.xy * u_xlat9.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(_EdgeBendingFactor);
    u_xlat1.xz = vec2(u_xlat12) * u_xlat1.xy;
    u_xlat1.y = 0.0;
    u_xlat1.xyz = u_xlat1.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainMask;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bvec2 u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
void main()
{
    u_xlat16_0 = texture(_MainMask, vs_TEXCOORD0.xy).x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat16_0 * u_xlat16_1.w + (-_Cutoff);
    u_xlat16_2.x = u_xlat16_0 * u_xlat16_1.w;
    SV_Target0.w = u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat3<0.0);
#else
    u_xlatb0.x = u_xlat3<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlatb0.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb0.x) ? vs_COLOR0.x : u_xlat16_1.x;
    u_xlat16_2.yz = (u_xlatb0.x) ? vec2(0.0, 0.0) : u_xlat16_1.yz;
    SV_Target0.xz = (u_xlatb0.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb0.y) ? vs_COLOR0.y : u_xlat16_2.y;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _WindEdgeFlutterFrequenceColR;
uniform 	float _WindEdgeFlutterFrequenceColG;
uniform 	float _WindEdgeFlutterFactorColR;
uniform 	float _WindEdgeFlutterFactorColG;
uniform 	vec4 _WindParams;
uniform 	float _EdgeBendingFactor;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat8;
vec2 u_xlat9;
bvec2 u_xlatb9;
float u_xlat12;
void main()
{
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat4.xy = vec2(1.0, 1.0) / vec2(_WindEdgeFlutterFrequenceColR, _WindEdgeFlutterFrequenceColG);
    u_xlat4.xy = max(u_xlat4.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat4.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat8.xy = abs(u_xlat0.xy) * abs(u_xlat0.xy);
    u_xlat0.xy = -abs(u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat4.x = dot(u_xlat8.yy, u_xlat0.yy);
    u_xlat0.x = dot(u_xlat8.xx, u_xlat0.xx);
    u_xlat1.y = u_xlat4.x * in_COLOR0.y;
    u_xlat2.y = u_xlat0.x * in_COLOR0.x;
    u_xlat8.x = u_xlat2.y * _WindEdgeFlutterFactorColR;
    u_xlat12 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat2.xz = vec2(u_xlat12) * u_xlat8.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat8.x = u_xlat1.y * _WindEdgeFlutterFactorColG;
    u_xlat1.xz = vec2(u_xlat12) * u_xlat8.xx;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * _WindParams.yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.yyy;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_COLOR0.xxx;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat1.xyz;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(-1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(-1.0) : 0.0;
;
    u_xlatb9.xy = lessThan(in_NORMAL0.xzxz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec4 hlslcc_movcTemp = u_xlat1;
        hlslcc_movcTemp.x = (u_xlatb9.x) ? float(1.0) : u_xlat1.x;
        hlslcc_movcTemp.y = (u_xlatb9.y) ? float(1.0) : u_xlat1.y;
        u_xlat1 = hlslcc_movcTemp;
    }
    u_xlat9.x = in_COLOR0.x * 0.100000001;
    u_xlat9.xy = u_xlat9.xx * in_NORMAL0.xz;
    u_xlat1.xy = u_xlat1.xy * u_xlat9.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(_EdgeBendingFactor);
    u_xlat1.xz = vec2(u_xlat12) * u_xlat1.xy;
    u_xlat1.y = 0.0;
    u_xlat1.xyz = u_xlat1.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MainMask;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bvec2 u_xlatb0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
void main()
{
    u_xlat10_0 = texture2D(_MainMask, vs_TEXCOORD0.xy).x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat10_0 * u_xlat10_1.w + (-_Cutoff);
    u_xlat16_2.x = u_xlat10_0 * u_xlat10_1.w;
    SV_Target0.w = u_xlat16_2.x;
    u_xlatb0.x = u_xlat3<0.0;
    if(u_xlatb0.x){discard;}
    u_xlatb0.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb0.x) ? vs_COLOR0.x : u_xlat10_1.x;
    u_xlat16_2.yz = (u_xlatb0.x) ? vec2(0.0, 0.0) : u_xlat10_1.yz;
    SV_Target0.xz = (u_xlatb0.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb0.y) ? vs_COLOR0.y : u_xlat16_2.y;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _WindEdgeFlutterFrequenceColR;
uniform 	float _WindEdgeFlutterFrequenceColG;
uniform 	float _WindEdgeFlutterFactorColR;
uniform 	float _WindEdgeFlutterFactorColG;
uniform 	vec4 _WindParams;
uniform 	float _EdgeBendingFactor;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_NORMAL0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat4;
vec2 u_xlat8;
vec2 u_xlat9;
bvec2 u_xlatb9;
float u_xlat12;
void main()
{
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = _Time.x * 10.0 + u_xlat0.x;
    u_xlat4.xy = vec2(1.0, 1.0) / vec2(_WindEdgeFlutterFrequenceColR, _WindEdgeFlutterFrequenceColG);
    u_xlat4.xy = max(u_xlat4.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = u_xlat0.xx / u_xlat4.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + vec2(0.5, 0.5);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat8.xy = abs(u_xlat0.xy) * abs(u_xlat0.xy);
    u_xlat0.xy = -abs(u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat4.x = dot(u_xlat8.yy, u_xlat0.yy);
    u_xlat0.x = dot(u_xlat8.xx, u_xlat0.xx);
    u_xlat1.y = u_xlat4.x * in_COLOR0.y;
    u_xlat2.y = u_xlat0.x * in_COLOR0.x;
    u_xlat8.x = u_xlat2.y * _WindEdgeFlutterFactorColR;
    u_xlat12 = in_TEXCOORD0.y * _WindParams.w;
    u_xlat2.xz = vec2(u_xlat12) * u_xlat8.xx;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + in_POSITION0.xyz;
    u_xlat8.x = u_xlat1.y * _WindEdgeFlutterFactorColG;
    u_xlat1.xz = vec2(u_xlat12) * u_xlat8.xx;
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * _WindParams.yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat4.xxx * u_xlat2.xyz;
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_COLOR0.yyy;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_COLOR0.xxx;
    u_xlat1.xyz = u_xlat2.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00312500005, 0.00312500005, 0.00312500005) + u_xlat1.xyz;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), in_NORMAL0.xzxx).xy;
    u_xlat1.x = u_xlatb1.x ? float(-1.0) : 0.0;
    u_xlat1.y = u_xlatb1.y ? float(-1.0) : 0.0;
;
    u_xlatb9.xy = lessThan(in_NORMAL0.xzxz, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    {
        vec4 hlslcc_movcTemp = u_xlat1;
        hlslcc_movcTemp.x = (u_xlatb9.x) ? float(1.0) : u_xlat1.x;
        hlslcc_movcTemp.y = (u_xlatb9.y) ? float(1.0) : u_xlat1.y;
        u_xlat1 = hlslcc_movcTemp;
    }
    u_xlat9.x = in_COLOR0.x * 0.100000001;
    u_xlat9.xy = u_xlat9.xx * in_NORMAL0.xz;
    u_xlat1.xy = u_xlat1.xy * u_xlat9.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(_EdgeBendingFactor);
    u_xlat1.xz = vec2(u_xlat12) * u_xlat1.xy;
    u_xlat1.y = 0.0;
    u_xlat1.xyz = u_xlat1.xyz / vec3(320.0, 320.0, 320.0);
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD1.xyz = vec3(u_xlat12) * u_xlat0.xyz;
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
uniform 	float _Cutoff;
uniform 	int _SHOW_COLOR_R;
uniform 	int _SHOW_COLOR_G;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _MainMask;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
bvec2 u_xlatb0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
float u_xlat3;
void main()
{
    u_xlat10_0 = texture2D(_MainMask, vs_TEXCOORD0.xy).x;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3 = u_xlat10_0 * u_xlat10_1.w + (-_Cutoff);
    u_xlat16_2.x = u_xlat10_0 * u_xlat10_1.w;
    SV_Target0.w = u_xlat16_2.x;
    u_xlatb0.x = u_xlat3<0.0;
    if(u_xlatb0.x){discard;}
    u_xlatb0.xy = equal(ivec4(_SHOW_COLOR_R, _SHOW_COLOR_G, _SHOW_COLOR_R, _SHOW_COLOR_R), ivec4(1, 1, 0, 0)).xy;
    u_xlat16_2.x = (u_xlatb0.x) ? vs_COLOR0.x : u_xlat10_1.x;
    u_xlat16_2.yz = (u_xlatb0.x) ? vec2(0.0, 0.0) : u_xlat10_1.yz;
    SV_Target0.xz = (u_xlatb0.y) ? vec2(0.0, 0.0) : u_xlat16_2.xz;
    SV_Target0.y = (u_xlatb0.y) ? vs_COLOR0.y : u_xlat16_2.y;
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