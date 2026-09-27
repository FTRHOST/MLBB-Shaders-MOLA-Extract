//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/TemporalAA" {
Properties {

_MainTex ("Texture", any) = "" { }

}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "TAA - PC"
  LOD 100
  Tags { "RenderType" = "Opaque" }
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 57545
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
out highp vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _JitterParams;
uniform 	mediump float _Reset;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TaaHistoryBuffer;
UNITY_LOCATION(2) uniform highp sampler2D _MotionVectorBuffer;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_TARGET0;
vec3 u_xlat0;
mediump vec4 u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
mediump vec3 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_17;
float u_xlat23;
mediump float u_xlat16_39;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Reset);
#else
    u_xlatb0 = 0.5<_Reset;
#endif
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD0.xy + (-_JitterParams.xy);
        SV_TARGET0 = texture(_MainTex, u_xlat0.xy);
        return;
    }
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xy = texture(_MotionVectorBuffer, vs_TEXCOORD0.xy).xy;
    u_xlat23 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 0.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat4 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_5.xyz = texture(_MainTex, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture(_MainTex, u_xlat4.zw).xyz;
    u_xlat16_6.x = u_xlat23 * 500.0;
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * 0.400000006 + 0.100000001;
    u_xlat16_17.xyz = u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat16_17.xyz = u_xlat10_5.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat10_4.xyz + u_xlat16_17.xyz;
    u_xlat7.xyz = (-u_xlat16_17.xyz) * vec3(0.25, 0.25, 0.25) + u_xlat10_0.xyz;
    u_xlat7.xyz = u_xlat16_6.xxx * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat7.xyz * vec3(2.71828198, 2.71828198, 2.71828198) + u_xlat10_0.xyz;
    u_xlat16_6.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(64500.0, 64500.0, 64500.0));
    u_xlat0.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
    u_xlat0.xyz = texture(_TaaHistoryBuffer, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = max(u_xlat10_5.xyz, u_xlat16_6.xyz);
    u_xlat16_8.xyz = max(u_xlat10_4.xyz, u_xlat16_8.xyz);
    u_xlat16_8.xyz = max(u_xlat10_3.xyz, u_xlat16_8.xyz);
    u_xlat16_8.xyz = max(u_xlat10_2.xyz, u_xlat16_8.xyz);
    u_xlat16_9.xyz = min(u_xlat10_5.xyz, u_xlat16_6.xyz);
    u_xlat16_9.xyz = min(u_xlat10_4.xyz, u_xlat16_9.xyz);
    u_xlat16_9.xyz = min(u_xlat10_3.xyz, u_xlat16_9.xyz);
    u_xlat16_9.xyz = min(u_xlat10_2.xyz, u_xlat16_9.xyz);
    u_xlat16_10.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_9.xyz = (-u_xlat16_10.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_9.xyz / u_xlat16_8.xyz;
    u_xlat16_39 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
    u_xlat16_39 = max(abs(u_xlat16_8.z), u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(1.0<u_xlat16_39);
#else
    u_xlatb1 = 1.0<u_xlat16_39;
#endif
    u_xlat16_8.xyz = u_xlat16_9.xyz / vec3(u_xlat16_39);
    u_xlat16_8.xyz = u_xlat16_10.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xyz : u_xlat0.xyz;
    u_xlat0.x = u_xlat23 * 6000.0;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * -0.149999976 + 0.949999988;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat0.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(64500.0, 64500.0, 64500.0));
    SV_TARGET0.xyz = u_xlat16_6.xyz;
    SV_TARGET0.w = u_xlat10_0.w;
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
out highp vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _JitterParams;
uniform 	mediump float _Reset;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TaaHistoryBuffer;
UNITY_LOCATION(2) uniform highp sampler2D _MotionVectorBuffer;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_TARGET0;
vec3 u_xlat0;
mediump vec4 u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
mediump vec3 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_17;
float u_xlat23;
mediump float u_xlat16_39;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Reset);
#else
    u_xlatb0 = 0.5<_Reset;
#endif
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD0.xy + (-_JitterParams.xy);
        SV_TARGET0 = texture(_MainTex, u_xlat0.xy);
        return;
    }
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xy = texture(_MotionVectorBuffer, vs_TEXCOORD0.xy).xy;
    u_xlat23 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 0.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat4 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_5.xyz = texture(_MainTex, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture(_MainTex, u_xlat4.zw).xyz;
    u_xlat16_6.x = u_xlat23 * 500.0;
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * 0.400000006 + 0.100000001;
    u_xlat16_17.xyz = u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat16_17.xyz = u_xlat10_5.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat10_4.xyz + u_xlat16_17.xyz;
    u_xlat7.xyz = (-u_xlat16_17.xyz) * vec3(0.25, 0.25, 0.25) + u_xlat10_0.xyz;
    u_xlat7.xyz = u_xlat16_6.xxx * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat7.xyz * vec3(2.71828198, 2.71828198, 2.71828198) + u_xlat10_0.xyz;
    u_xlat16_6.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(64500.0, 64500.0, 64500.0));
    u_xlat0.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
    u_xlat0.xyz = texture(_TaaHistoryBuffer, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = max(u_xlat10_5.xyz, u_xlat16_6.xyz);
    u_xlat16_8.xyz = max(u_xlat10_4.xyz, u_xlat16_8.xyz);
    u_xlat16_8.xyz = max(u_xlat10_3.xyz, u_xlat16_8.xyz);
    u_xlat16_8.xyz = max(u_xlat10_2.xyz, u_xlat16_8.xyz);
    u_xlat16_9.xyz = min(u_xlat10_5.xyz, u_xlat16_6.xyz);
    u_xlat16_9.xyz = min(u_xlat10_4.xyz, u_xlat16_9.xyz);
    u_xlat16_9.xyz = min(u_xlat10_3.xyz, u_xlat16_9.xyz);
    u_xlat16_9.xyz = min(u_xlat10_2.xyz, u_xlat16_9.xyz);
    u_xlat16_10.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_9.xyz = (-u_xlat16_10.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_9.xyz / u_xlat16_8.xyz;
    u_xlat16_39 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
    u_xlat16_39 = max(abs(u_xlat16_8.z), u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(1.0<u_xlat16_39);
#else
    u_xlatb1 = 1.0<u_xlat16_39;
#endif
    u_xlat16_8.xyz = u_xlat16_9.xyz / vec3(u_xlat16_39);
    u_xlat16_8.xyz = u_xlat16_10.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xyz : u_xlat0.xyz;
    u_xlat0.x = u_xlat23 * 6000.0;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * -0.149999976 + 0.949999988;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat0.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(64500.0, 64500.0, 64500.0));
    SV_TARGET0.xyz = u_xlat16_6.xyz;
    SV_TARGET0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "TAA_ENABLE_ALPHA" }
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
out highp vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _JitterParams;
uniform 	mediump float _Reset;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TaaHistoryBuffer;
UNITY_LOCATION(2) uniform highp sampler2D _MotionVectorBuffer;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_TARGET0;
vec3 u_xlat0;
mediump vec4 u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
mediump vec3 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_17;
float u_xlat23;
mediump float u_xlat16_39;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Reset);
#else
    u_xlatb0 = 0.5<_Reset;
#endif
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD0.xy + (-_JitterParams.xy);
        SV_TARGET0 = texture(_MainTex, u_xlat0.xy);
        return;
    }
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xy = texture(_MotionVectorBuffer, vs_TEXCOORD0.xy).xy;
    u_xlat23 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 0.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat4 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_5.xyz = texture(_MainTex, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture(_MainTex, u_xlat4.zw).xyz;
    u_xlat16_6.x = u_xlat23 * 500.0;
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * 0.400000006 + 0.100000001;
    u_xlat16_17.xyz = u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat16_17.xyz = u_xlat10_5.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat10_4.xyz + u_xlat16_17.xyz;
    u_xlat7.xyz = (-u_xlat16_17.xyz) * vec3(0.25, 0.25, 0.25) + u_xlat10_0.xyz;
    u_xlat7.xyz = u_xlat16_6.xxx * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat7.xyz * vec3(2.71828198, 2.71828198, 2.71828198) + u_xlat10_0.xyz;
    u_xlat16_6.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(64500.0, 64500.0, 64500.0));
    u_xlat0.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
    u_xlat0.xyz = texture(_TaaHistoryBuffer, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = max(u_xlat10_5.xyz, u_xlat16_6.xyz);
    u_xlat16_8.xyz = max(u_xlat10_4.xyz, u_xlat16_8.xyz);
    u_xlat16_8.xyz = max(u_xlat10_3.xyz, u_xlat16_8.xyz);
    u_xlat16_8.xyz = max(u_xlat10_2.xyz, u_xlat16_8.xyz);
    u_xlat16_9.xyz = min(u_xlat10_5.xyz, u_xlat16_6.xyz);
    u_xlat16_9.xyz = min(u_xlat10_4.xyz, u_xlat16_9.xyz);
    u_xlat16_9.xyz = min(u_xlat10_3.xyz, u_xlat16_9.xyz);
    u_xlat16_9.xyz = min(u_xlat10_2.xyz, u_xlat16_9.xyz);
    u_xlat16_10.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_9.xyz = (-u_xlat16_10.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_9.xyz / u_xlat16_8.xyz;
    u_xlat16_39 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
    u_xlat16_39 = max(abs(u_xlat16_8.z), u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(1.0<u_xlat16_39);
#else
    u_xlatb1 = 1.0<u_xlat16_39;
#endif
    u_xlat16_8.xyz = u_xlat16_9.xyz / vec3(u_xlat16_39);
    u_xlat16_8.xyz = u_xlat16_10.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xyz : u_xlat0.xyz;
    u_xlat0.x = u_xlat23 * 6000.0;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * -0.149999976 + 0.949999988;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat0.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(64500.0, 64500.0, 64500.0));
    SV_TARGET0.xyz = u_xlat16_6.xyz;
    SV_TARGET0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "TAA_ENABLE_ALPHA" }
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
out highp vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.zw = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _JitterParams;
uniform 	mediump float _Reset;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _TaaHistoryBuffer;
UNITY_LOCATION(2) uniform highp sampler2D _MotionVectorBuffer;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_TARGET0;
vec3 u_xlat0;
mediump vec4 u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat10_2;
mediump vec3 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat10_4;
mediump vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_17;
float u_xlat23;
mediump float u_xlat16_39;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Reset);
#else
    u_xlatb0 = 0.5<_Reset;
#endif
    if(u_xlatb0){
        u_xlat0.xy = vs_TEXCOORD0.xy + (-_JitterParams.xy);
        SV_TARGET0 = texture(_MainTex, u_xlat0.xy);
        return;
    }
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xy = texture(_MotionVectorBuffer, vs_TEXCOORD0.xy).xy;
    u_xlat23 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.0, 1.0, 0.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture(_MainTex, u_xlat2.xy).xyz;
    u_xlat10_2.xyz = texture(_MainTex, u_xlat2.zw).xyz;
    u_xlat4 = _MainTex_TexelSize.xyxy * vec4(-1.0, 0.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_5.xyz = texture(_MainTex, u_xlat4.xy).xyz;
    u_xlat10_4.xyz = texture(_MainTex, u_xlat4.zw).xyz;
    u_xlat16_6.x = u_xlat23 * 500.0;
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * 0.400000006 + 0.100000001;
    u_xlat16_17.xyz = u_xlat10_2.xyz + u_xlat10_3.xyz;
    u_xlat16_17.xyz = u_xlat10_5.xyz + u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat10_4.xyz + u_xlat16_17.xyz;
    u_xlat7.xyz = (-u_xlat16_17.xyz) * vec3(0.25, 0.25, 0.25) + u_xlat10_0.xyz;
    u_xlat7.xyz = u_xlat16_6.xxx * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat7.xyz * vec3(2.71828198, 2.71828198, 2.71828198) + u_xlat10_0.xyz;
    u_xlat16_6.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(64500.0, 64500.0, 64500.0));
    u_xlat0.xy = (-u_xlat1.xy) + vs_TEXCOORD0.xy;
    u_xlat0.xyz = texture(_TaaHistoryBuffer, u_xlat0.xy).xyz;
    u_xlat16_8.xyz = max(u_xlat10_5.xyz, u_xlat16_6.xyz);
    u_xlat16_8.xyz = max(u_xlat10_4.xyz, u_xlat16_8.xyz);
    u_xlat16_8.xyz = max(u_xlat10_3.xyz, u_xlat16_8.xyz);
    u_xlat16_8.xyz = max(u_xlat10_2.xyz, u_xlat16_8.xyz);
    u_xlat16_9.xyz = min(u_xlat10_5.xyz, u_xlat16_6.xyz);
    u_xlat16_9.xyz = min(u_xlat10_4.xyz, u_xlat16_9.xyz);
    u_xlat16_9.xyz = min(u_xlat10_3.xyz, u_xlat16_9.xyz);
    u_xlat16_9.xyz = min(u_xlat10_2.xyz, u_xlat16_9.xyz);
    u_xlat16_10.xyz = u_xlat16_8.xyz + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_8.xyz = max(u_xlat16_8.xyz, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat16_9.xyz = (-u_xlat16_10.xyz) * vec3(0.5, 0.5, 0.5) + u_xlat0.xyz;
    u_xlat16_8.xyz = u_xlat16_9.xyz / u_xlat16_8.xyz;
    u_xlat16_39 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
    u_xlat16_39 = max(abs(u_xlat16_8.z), u_xlat16_39);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(1.0<u_xlat16_39);
#else
    u_xlatb1 = 1.0<u_xlat16_39;
#endif
    u_xlat16_8.xyz = u_xlat16_9.xyz / vec3(u_xlat16_39);
    u_xlat16_8.xyz = u_xlat16_10.xyz * vec3(0.5, 0.5, 0.5) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = (bool(u_xlatb1)) ? u_xlat16_8.xyz : u_xlat0.xyz;
    u_xlat0.x = u_xlat23 * 6000.0;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * -0.149999976 + 0.949999988;
    u_xlat16_8.xyz = (-u_xlat16_6.xyz) + u_xlat16_8.xyz;
    u_xlat16_6.xyz = u_xlat16_8.xyz * u_xlat0.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = max(u_xlat16_6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.xyz = min(u_xlat16_6.xyz, vec3(64500.0, 64500.0, 64500.0));
    SV_TARGET0.xyz = u_xlat16_6.xyz;
    SV_TARGET0.w = u_xlat10_0.w;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
Keywords { "TAA_ENABLE_ALPHA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "TAA_ENABLE_ALPHA" }
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "TAA_ENABLE_ALPHA" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "TAA_ENABLE_ALPHA" }
""
}
}
}
}
}