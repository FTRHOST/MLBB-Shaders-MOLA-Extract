//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/Transparent Colored Sharp" {
Properties {

_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" { }

_Sharpness ("Unsharp Strength (0=off)", Range(0, 1.5)) = 0.30000001192092896

_AntiRing ("Anti-Ringing (0=off, 1=hard)", Range(0, 1)) = 0.6000000238418579

_PanelRect ("PanelRect", Vector) = (0,0,1,1)

_PanelClipInfo ("PanelClipInfo", Vector) = (1,1,1,1)

}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
 Offset -1.0, -1.0
  GpuProgramID 32179
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
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
    vs_TEXCOORD1 = dot(in_COLOR0.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Sharpness;
uniform 	float _AntiRing;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_15;
vec2 u_xlat19;
mediump float u_xlat16_32;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005<_Sharpness);
#else
    u_xlatb1 = 0.00100000005<_Sharpness;
#endif
    if(u_xlatb1){
        u_xlat1.xy = dFdx(vs_TEXCOORD0.xy);
        u_xlat19.xy = dFdy(vs_TEXCOORD0.xy);
        u_xlat1.xy = abs(u_xlat19.xy) + abs(u_xlat1.xy);
        u_xlat1.xy = max(u_xlat1.xy, _MainTex_TexelSize.xy);
        u_xlat2.x = (-u_xlat1.x);
        u_xlat2.z = 0.0;
        u_xlat2.xy = u_xlat2.xz + vs_TEXCOORD0.xy;
        u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
        u_xlat1.z = 0.0;
        u_xlat3 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
        u_xlat16_4.xyz = texture(_MainTex, u_xlat3.xy).xyz;
        u_xlat1.w = (-u_xlat1.y);
        u_xlat1.xy = u_xlat1.zw + vs_TEXCOORD0.xy;
        u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
        u_xlat16_3.xyz = texture(_MainTex, u_xlat3.zw).xyz;
        u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat16_2.xyz);
        u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat16_3.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Sharpness) + u_xlat16_0.xyz;
        u_xlat16_32 = _AntiRing;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_32 = min(max(u_xlat16_32, 0.0), 1.0);
#else
        u_xlat16_32 = clamp(u_xlat16_32, 0.0, 1.0);
#endif
        u_xlat16_6.x = (-u_xlat16_32) + 1.0;
        u_xlat16_15.xyz = min(u_xlat16_2.xyz, u_xlat16_4.xyz);
        u_xlat16_7.xyz = min(u_xlat16_1.xyz, u_xlat16_3.xyz);
        u_xlat16_15.xyz = min(u_xlat16_15.xyz, u_xlat16_7.xyz);
        u_xlat16_15.xyz = min(u_xlat16_0.xyz, u_xlat16_15.xyz);
        u_xlat16_7.xyz = max(u_xlat16_2.xyz, u_xlat16_4.xyz);
        u_xlat16_8.xyz = max(u_xlat16_1.xyz, u_xlat16_3.xyz);
        u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
        u_xlat16_7.xyz = max(u_xlat16_0.xyz, u_xlat16_7.xyz);
        u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
        u_xlat16_15.xyz = (-u_xlat16_6.xxx) * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_15.xyz;
        u_xlat16_7.xyz = u_xlat16_6.xxx * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_7.xyz;
        u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_15.xyz);
        u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_6.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
        u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    } else {
        u_xlat16_5.xyz = u_xlat16_0.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vs_TEXCOORD1==0.0);
#else
    u_xlatb0 = vs_TEXCOORD1==0.0;
#endif
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat16_6.x = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_32) : u_xlat16_5.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_0.w : u_xlat16_6.x;
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
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
    vs_TEXCOORD1 = dot(in_COLOR0.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Sharpness;
uniform 	float _AntiRing;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_15;
vec2 u_xlat19;
mediump float u_xlat16_32;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005<_Sharpness);
#else
    u_xlatb1 = 0.00100000005<_Sharpness;
#endif
    if(u_xlatb1){
        u_xlat1.xy = dFdx(vs_TEXCOORD0.xy);
        u_xlat19.xy = dFdy(vs_TEXCOORD0.xy);
        u_xlat1.xy = abs(u_xlat19.xy) + abs(u_xlat1.xy);
        u_xlat1.xy = max(u_xlat1.xy, _MainTex_TexelSize.xy);
        u_xlat2.x = (-u_xlat1.x);
        u_xlat2.z = 0.0;
        u_xlat2.xy = u_xlat2.xz + vs_TEXCOORD0.xy;
        u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
        u_xlat1.z = 0.0;
        u_xlat3 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
        u_xlat16_4.xyz = texture(_MainTex, u_xlat3.xy).xyz;
        u_xlat1.w = (-u_xlat1.y);
        u_xlat1.xy = u_xlat1.zw + vs_TEXCOORD0.xy;
        u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
        u_xlat16_3.xyz = texture(_MainTex, u_xlat3.zw).xyz;
        u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat16_2.xyz);
        u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat16_3.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Sharpness) + u_xlat16_0.xyz;
        u_xlat16_32 = _AntiRing;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_32 = min(max(u_xlat16_32, 0.0), 1.0);
#else
        u_xlat16_32 = clamp(u_xlat16_32, 0.0, 1.0);
#endif
        u_xlat16_6.x = (-u_xlat16_32) + 1.0;
        u_xlat16_15.xyz = min(u_xlat16_2.xyz, u_xlat16_4.xyz);
        u_xlat16_7.xyz = min(u_xlat16_1.xyz, u_xlat16_3.xyz);
        u_xlat16_15.xyz = min(u_xlat16_15.xyz, u_xlat16_7.xyz);
        u_xlat16_15.xyz = min(u_xlat16_0.xyz, u_xlat16_15.xyz);
        u_xlat16_7.xyz = max(u_xlat16_2.xyz, u_xlat16_4.xyz);
        u_xlat16_8.xyz = max(u_xlat16_1.xyz, u_xlat16_3.xyz);
        u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
        u_xlat16_7.xyz = max(u_xlat16_0.xyz, u_xlat16_7.xyz);
        u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
        u_xlat16_15.xyz = (-u_xlat16_6.xxx) * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_15.xyz;
        u_xlat16_7.xyz = u_xlat16_6.xxx * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_7.xyz;
        u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_15.xyz);
        u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_6.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
        u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    } else {
        u_xlat16_5.xyz = u_xlat16_0.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vs_TEXCOORD1==0.0);
#else
    u_xlatb0 = vs_TEXCOORD1==0.0;
#endif
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat16_6.x = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_32) : u_xlat16_5.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat16_0.w : u_xlat16_6.x;
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
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
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
    vs_TEXCOORD1 = dot(in_COLOR0.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Sharpness;
uniform 	float _AntiRing;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_15;
vec2 u_xlat19;
mediump float u_xlat16_32;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb1 = 0.00100000005<_Sharpness;
    if(u_xlatb1){
        u_xlat1.xy = dFdx(vs_TEXCOORD0.xy);
        u_xlat19.xy = dFdy(vs_TEXCOORD0.xy);
        u_xlat1.xy = abs(u_xlat19.xy) + abs(u_xlat1.xy);
        u_xlat1.xy = max(u_xlat1.xy, _MainTex_TexelSize.xy);
        u_xlat2.x = (-u_xlat1.x);
        u_xlat2.z = 0.0;
        u_xlat2.xy = u_xlat2.xz + vs_TEXCOORD0.xy;
        u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
        u_xlat1.z = 0.0;
        u_xlat3 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
        u_xlat10_4.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
        u_xlat1.w = (-u_xlat1.y);
        u_xlat1.xy = u_xlat1.zw + vs_TEXCOORD0.xy;
        u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
        u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.zw).xyz;
        u_xlat16_5.xyz = u_xlat10_0.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat10_2.xyz);
        u_xlat16_5.xyz = (-u_xlat10_4.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat10_1.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat10_3.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Sharpness) + u_xlat10_0.xyz;
        u_xlat16_32 = _AntiRing;
        u_xlat16_32 = clamp(u_xlat16_32, 0.0, 1.0);
        u_xlat16_6.x = (-u_xlat16_32) + 1.0;
        u_xlat16_15.xyz = min(u_xlat10_2.xyz, u_xlat10_4.xyz);
        u_xlat16_7.xyz = min(u_xlat10_1.xyz, u_xlat10_3.xyz);
        u_xlat16_15.xyz = min(u_xlat16_15.xyz, u_xlat16_7.xyz);
        u_xlat16_15.xyz = min(u_xlat10_0.xyz, u_xlat16_15.xyz);
        u_xlat16_7.xyz = max(u_xlat10_2.xyz, u_xlat10_4.xyz);
        u_xlat16_8.xyz = max(u_xlat10_1.xyz, u_xlat10_3.xyz);
        u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
        u_xlat16_7.xyz = max(u_xlat10_0.xyz, u_xlat16_7.xyz);
        u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
        u_xlat16_15.xyz = (-u_xlat16_6.xxx) * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_15.xyz;
        u_xlat16_7.xyz = u_xlat16_6.xxx * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_7.xyz;
        u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_15.xyz);
        u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
    } else {
        u_xlat16_5.xyz = u_xlat10_0.xyz;
    }
    u_xlatb0 = vs_TEXCOORD1==0.0;
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat16_6.x = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_32) : u_xlat16_5.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat10_0.w : u_xlat16_6.x;
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
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
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
    vs_TEXCOORD1 = dot(in_COLOR0.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Sharpness;
uniform 	float _AntiRing;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_15;
vec2 u_xlat19;
mediump float u_xlat16_32;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb1 = 0.00100000005<_Sharpness;
    if(u_xlatb1){
        u_xlat1.xy = dFdx(vs_TEXCOORD0.xy);
        u_xlat19.xy = dFdy(vs_TEXCOORD0.xy);
        u_xlat1.xy = abs(u_xlat19.xy) + abs(u_xlat1.xy);
        u_xlat1.xy = max(u_xlat1.xy, _MainTex_TexelSize.xy);
        u_xlat2.x = (-u_xlat1.x);
        u_xlat2.z = 0.0;
        u_xlat2.xy = u_xlat2.xz + vs_TEXCOORD0.xy;
        u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
        u_xlat1.z = 0.0;
        u_xlat3 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
        u_xlat10_4.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
        u_xlat1.w = (-u_xlat1.y);
        u_xlat1.xy = u_xlat1.zw + vs_TEXCOORD0.xy;
        u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
        u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.zw).xyz;
        u_xlat16_5.xyz = u_xlat10_0.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat10_2.xyz);
        u_xlat16_5.xyz = (-u_xlat10_4.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat10_1.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat10_3.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Sharpness) + u_xlat10_0.xyz;
        u_xlat16_32 = _AntiRing;
        u_xlat16_32 = clamp(u_xlat16_32, 0.0, 1.0);
        u_xlat16_6.x = (-u_xlat16_32) + 1.0;
        u_xlat16_15.xyz = min(u_xlat10_2.xyz, u_xlat10_4.xyz);
        u_xlat16_7.xyz = min(u_xlat10_1.xyz, u_xlat10_3.xyz);
        u_xlat16_15.xyz = min(u_xlat16_15.xyz, u_xlat16_7.xyz);
        u_xlat16_15.xyz = min(u_xlat10_0.xyz, u_xlat16_15.xyz);
        u_xlat16_7.xyz = max(u_xlat10_2.xyz, u_xlat10_4.xyz);
        u_xlat16_8.xyz = max(u_xlat10_1.xyz, u_xlat10_3.xyz);
        u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
        u_xlat16_7.xyz = max(u_xlat10_0.xyz, u_xlat16_7.xyz);
        u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
        u_xlat16_15.xyz = (-u_xlat16_6.xxx) * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_15.xyz;
        u_xlat16_7.xyz = u_xlat16_6.xxx * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_7.xyz;
        u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_15.xyz);
        u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
    } else {
        u_xlat16_5.xyz = u_xlat10_0.xyz;
    }
    u_xlatb0 = vs_TEXCOORD1==0.0;
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat16_6.x = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_32) : u_xlat16_5.xyz;
    SV_Target0.w = (u_xlatb0) ? u_xlat10_0.w : u_xlat16_6.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = dot(in_COLOR0.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Sharpness;
uniform 	float _AntiRing;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat19;
mediump float u_xlat16_32;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005<_Sharpness);
#else
    u_xlatb1 = 0.00100000005<_Sharpness;
#endif
    if(u_xlatb1){
        u_xlat1.xy = dFdx(vs_TEXCOORD0.xy);
        u_xlat19.xy = dFdy(vs_TEXCOORD0.xy);
        u_xlat1.xy = abs(u_xlat19.xy) + abs(u_xlat1.xy);
        u_xlat1.xy = max(u_xlat1.xy, _MainTex_TexelSize.xy);
        u_xlat2.x = (-u_xlat1.x);
        u_xlat2.z = 0.0;
        u_xlat2.xy = u_xlat2.xz + vs_TEXCOORD0.xy;
        u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
        u_xlat1.z = 0.0;
        u_xlat3 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
        u_xlat16_4.xyz = texture(_MainTex, u_xlat3.xy).xyz;
        u_xlat1.w = (-u_xlat1.y);
        u_xlat1.xy = u_xlat1.zw + vs_TEXCOORD0.xy;
        u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
        u_xlat16_3.xyz = texture(_MainTex, u_xlat3.zw).xyz;
        u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat16_2.xyz);
        u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat16_3.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Sharpness) + u_xlat16_0.xyz;
        u_xlat16_32 = _AntiRing;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_32 = min(max(u_xlat16_32, 0.0), 1.0);
#else
        u_xlat16_32 = clamp(u_xlat16_32, 0.0, 1.0);
#endif
        u_xlat16_6.x = (-u_xlat16_32) + 1.0;
        u_xlat16_15.xyz = min(u_xlat16_2.xyz, u_xlat16_4.xyz);
        u_xlat16_7.xyz = min(u_xlat16_1.xyz, u_xlat16_3.xyz);
        u_xlat16_15.xyz = min(u_xlat16_15.xyz, u_xlat16_7.xyz);
        u_xlat16_15.xyz = min(u_xlat16_0.xyz, u_xlat16_15.xyz);
        u_xlat16_7.xyz = max(u_xlat16_2.xyz, u_xlat16_4.xyz);
        u_xlat16_8.xyz = max(u_xlat16_1.xyz, u_xlat16_3.xyz);
        u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
        u_xlat16_7.xyz = max(u_xlat16_0.xyz, u_xlat16_7.xyz);
        u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
        u_xlat16_15.xyz = (-u_xlat16_6.xxx) * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_15.xyz;
        u_xlat16_7.xyz = u_xlat16_6.xxx * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_7.xyz;
        u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_15.xyz);
        u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_6.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
        u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    } else {
        u_xlat16_5.xyz = u_xlat16_0.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vs_TEXCOORD1==0.0);
#else
    u_xlatb0 = vs_TEXCOORD1==0.0;
#endif
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat16_6.x = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_32) : u_xlat16_5.xyz;
    u_xlat16_5.x = (u_xlatb0) ? u_xlat16_0.w : u_xlat16_6.x;
    u_xlat16_14.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_14.xy = u_xlat16_14.xy + u_xlat16_14.xy;
    u_xlat16_14.xy = abs(u_xlat16_14.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xy = min(max(u_xlat16_14.xy, 0.0), 1.0);
#else
    u_xlat16_14.xy = clamp(u_xlat16_14.xy, 0.0, 1.0);
#endif
    u_xlat16_14.x = max(u_xlat16_14.y, u_xlat16_14.x);
    u_xlat16_14.x = (-u_xlat16_14.x) + 1.0;
    SV_Target0.w = u_xlat16_14.x * u_xlat16_5.x;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = dot(in_COLOR0.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Sharpness;
uniform 	float _AntiRing;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat19;
mediump float u_xlat16_32;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.00100000005<_Sharpness);
#else
    u_xlatb1 = 0.00100000005<_Sharpness;
#endif
    if(u_xlatb1){
        u_xlat1.xy = dFdx(vs_TEXCOORD0.xy);
        u_xlat19.xy = dFdy(vs_TEXCOORD0.xy);
        u_xlat1.xy = abs(u_xlat19.xy) + abs(u_xlat1.xy);
        u_xlat1.xy = max(u_xlat1.xy, _MainTex_TexelSize.xy);
        u_xlat2.x = (-u_xlat1.x);
        u_xlat2.z = 0.0;
        u_xlat2.xy = u_xlat2.xz + vs_TEXCOORD0.xy;
        u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
        u_xlat1.z = 0.0;
        u_xlat3 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
        u_xlat16_4.xyz = texture(_MainTex, u_xlat3.xy).xyz;
        u_xlat1.w = (-u_xlat1.y);
        u_xlat1.xy = u_xlat1.zw + vs_TEXCOORD0.xy;
        u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
        u_xlat16_3.xyz = texture(_MainTex, u_xlat3.zw).xyz;
        u_xlat16_5.xyz = u_xlat16_0.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat16_2.xyz);
        u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat16_1.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat16_3.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Sharpness) + u_xlat16_0.xyz;
        u_xlat16_32 = _AntiRing;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_32 = min(max(u_xlat16_32, 0.0), 1.0);
#else
        u_xlat16_32 = clamp(u_xlat16_32, 0.0, 1.0);
#endif
        u_xlat16_6.x = (-u_xlat16_32) + 1.0;
        u_xlat16_15.xyz = min(u_xlat16_2.xyz, u_xlat16_4.xyz);
        u_xlat16_7.xyz = min(u_xlat16_1.xyz, u_xlat16_3.xyz);
        u_xlat16_15.xyz = min(u_xlat16_15.xyz, u_xlat16_7.xyz);
        u_xlat16_15.xyz = min(u_xlat16_0.xyz, u_xlat16_15.xyz);
        u_xlat16_7.xyz = max(u_xlat16_2.xyz, u_xlat16_4.xyz);
        u_xlat16_8.xyz = max(u_xlat16_1.xyz, u_xlat16_3.xyz);
        u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
        u_xlat16_7.xyz = max(u_xlat16_0.xyz, u_xlat16_7.xyz);
        u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
        u_xlat16_15.xyz = (-u_xlat16_6.xxx) * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_15.xyz;
        u_xlat16_7.xyz = u_xlat16_6.xxx * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_7.xyz;
        u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_15.xyz);
        u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_6.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
        u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    } else {
        u_xlat16_5.xyz = u_xlat16_0.xyz;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vs_TEXCOORD1==0.0);
#else
    u_xlatb0 = vs_TEXCOORD1==0.0;
#endif
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat16_6.x = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_32) : u_xlat16_5.xyz;
    u_xlat16_5.x = (u_xlatb0) ? u_xlat16_0.w : u_xlat16_6.x;
    u_xlat16_14.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_14.xy = u_xlat16_14.xy + u_xlat16_14.xy;
    u_xlat16_14.xy = abs(u_xlat16_14.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xy = min(max(u_xlat16_14.xy, 0.0), 1.0);
#else
    u_xlat16_14.xy = clamp(u_xlat16_14.xy, 0.0, 1.0);
#endif
    u_xlat16_14.x = max(u_xlat16_14.y, u_xlat16_14.x);
    u_xlat16_14.x = (-u_xlat16_14.x) + 1.0;
    SV_Target0.w = u_xlat16_14.x * u_xlat16_5.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = dot(in_COLOR0.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Sharpness;
uniform 	float _AntiRing;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat19;
mediump float u_xlat16_32;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb1 = 0.00100000005<_Sharpness;
    if(u_xlatb1){
        u_xlat1.xy = dFdx(vs_TEXCOORD0.xy);
        u_xlat19.xy = dFdy(vs_TEXCOORD0.xy);
        u_xlat1.xy = abs(u_xlat19.xy) + abs(u_xlat1.xy);
        u_xlat1.xy = max(u_xlat1.xy, _MainTex_TexelSize.xy);
        u_xlat2.x = (-u_xlat1.x);
        u_xlat2.z = 0.0;
        u_xlat2.xy = u_xlat2.xz + vs_TEXCOORD0.xy;
        u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
        u_xlat1.z = 0.0;
        u_xlat3 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
        u_xlat10_4.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
        u_xlat1.w = (-u_xlat1.y);
        u_xlat1.xy = u_xlat1.zw + vs_TEXCOORD0.xy;
        u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
        u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.zw).xyz;
        u_xlat16_5.xyz = u_xlat10_0.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat10_2.xyz);
        u_xlat16_5.xyz = (-u_xlat10_4.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat10_1.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat10_3.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Sharpness) + u_xlat10_0.xyz;
        u_xlat16_32 = _AntiRing;
        u_xlat16_32 = clamp(u_xlat16_32, 0.0, 1.0);
        u_xlat16_6.x = (-u_xlat16_32) + 1.0;
        u_xlat16_15.xyz = min(u_xlat10_2.xyz, u_xlat10_4.xyz);
        u_xlat16_7.xyz = min(u_xlat10_1.xyz, u_xlat10_3.xyz);
        u_xlat16_15.xyz = min(u_xlat16_15.xyz, u_xlat16_7.xyz);
        u_xlat16_15.xyz = min(u_xlat10_0.xyz, u_xlat16_15.xyz);
        u_xlat16_7.xyz = max(u_xlat10_2.xyz, u_xlat10_4.xyz);
        u_xlat16_8.xyz = max(u_xlat10_1.xyz, u_xlat10_3.xyz);
        u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
        u_xlat16_7.xyz = max(u_xlat10_0.xyz, u_xlat16_7.xyz);
        u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
        u_xlat16_15.xyz = (-u_xlat16_6.xxx) * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_15.xyz;
        u_xlat16_7.xyz = u_xlat16_6.xxx * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_7.xyz;
        u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_15.xyz);
        u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
    } else {
        u_xlat16_5.xyz = u_xlat10_0.xyz;
    }
    u_xlatb0 = vs_TEXCOORD1==0.0;
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat16_6.x = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_32) : u_xlat16_5.xyz;
    u_xlat16_5.x = (u_xlatb0) ? u_xlat10_0.w : u_xlat16_6.x;
    u_xlat16_14.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_14.xy = u_xlat16_14.xy + u_xlat16_14.xy;
    u_xlat16_14.xy = abs(u_xlat16_14.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_14.xy = clamp(u_xlat16_14.xy, 0.0, 1.0);
    u_xlat16_14.x = max(u_xlat16_14.y, u_xlat16_14.x);
    u_xlat16_14.x = (-u_xlat16_14.x) + 1.0;
    SV_Target0.w = u_xlat16_14.x * u_xlat16_5.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD1 = dot(in_COLOR0.xyz, vec3(1.0, 1.0, 1.0));
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Sharpness;
uniform 	float _AntiRing;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat19;
mediump float u_xlat16_32;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlatb1 = 0.00100000005<_Sharpness;
    if(u_xlatb1){
        u_xlat1.xy = dFdx(vs_TEXCOORD0.xy);
        u_xlat19.xy = dFdy(vs_TEXCOORD0.xy);
        u_xlat1.xy = abs(u_xlat19.xy) + abs(u_xlat1.xy);
        u_xlat1.xy = max(u_xlat1.xy, _MainTex_TexelSize.xy);
        u_xlat2.x = (-u_xlat1.x);
        u_xlat2.z = 0.0;
        u_xlat2.xy = u_xlat2.xz + vs_TEXCOORD0.xy;
        u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
        u_xlat1.z = 0.0;
        u_xlat3 = u_xlat1.xzzy + vs_TEXCOORD0.xyxy;
        u_xlat10_4.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
        u_xlat1.w = (-u_xlat1.y);
        u_xlat1.xy = u_xlat1.zw + vs_TEXCOORD0.xy;
        u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
        u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.zw).xyz;
        u_xlat16_5.xyz = u_xlat10_0.xyz * vec3(4.0, 4.0, 4.0) + (-u_xlat10_2.xyz);
        u_xlat16_5.xyz = (-u_xlat10_4.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat10_1.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = (-u_xlat10_3.xyz) + u_xlat16_5.xyz;
        u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Sharpness) + u_xlat10_0.xyz;
        u_xlat16_32 = _AntiRing;
        u_xlat16_32 = clamp(u_xlat16_32, 0.0, 1.0);
        u_xlat16_6.x = (-u_xlat16_32) + 1.0;
        u_xlat16_15.xyz = min(u_xlat10_2.xyz, u_xlat10_4.xyz);
        u_xlat16_7.xyz = min(u_xlat10_1.xyz, u_xlat10_3.xyz);
        u_xlat16_15.xyz = min(u_xlat16_15.xyz, u_xlat16_7.xyz);
        u_xlat16_15.xyz = min(u_xlat10_0.xyz, u_xlat16_15.xyz);
        u_xlat16_7.xyz = max(u_xlat10_2.xyz, u_xlat10_4.xyz);
        u_xlat16_8.xyz = max(u_xlat10_1.xyz, u_xlat10_3.xyz);
        u_xlat16_7.xyz = max(u_xlat16_7.xyz, u_xlat16_8.xyz);
        u_xlat16_7.xyz = max(u_xlat10_0.xyz, u_xlat16_7.xyz);
        u_xlat16_6.x = u_xlat16_6.x * u_xlat16_6.x;
        u_xlat16_15.xyz = (-u_xlat16_6.xxx) * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_15.xyz;
        u_xlat16_7.xyz = u_xlat16_6.xxx * vec3(0.200000003, 0.200000003, 0.200000003) + u_xlat16_7.xyz;
        u_xlat16_6.xyz = max(u_xlat16_5.xyz, u_xlat16_15.xyz);
        u_xlat16_6.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
        u_xlat16_6.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_32) * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
    } else {
        u_xlat16_5.xyz = u_xlat10_0.xyz;
    }
    u_xlatb0 = vs_TEXCOORD1==0.0;
    u_xlat16_32 = dot(u_xlat16_5.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat16_6.x = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.xyz = (bool(u_xlatb0)) ? vec3(u_xlat16_32) : u_xlat16_5.xyz;
    u_xlat16_5.x = (u_xlatb0) ? u_xlat10_0.w : u_xlat16_6.x;
    u_xlat16_14.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_14.xy = u_xlat16_14.xy + u_xlat16_14.xy;
    u_xlat16_14.xy = abs(u_xlat16_14.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_14.xy = clamp(u_xlat16_14.xy, 0.0, 1.0);
    u_xlat16_14.x = max(u_xlat16_14.y, u_xlat16_14.x);
    u_xlat16_14.x = (-u_xlat16_14.x) + 1.0;
    SV_Target0.w = u_xlat16_14.x * u_xlat16_5.x;
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
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
}
}
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
 Offset -1.0, -1.0
  GpuProgramID 77046
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
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
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
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
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
Fall back "Unlit/Transparent Colored"
}