//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/FXAALowPerformanceNPRPost" {
Properties {

_MainTex ("Texture", 2D) = "white" { }

}
SubShader {
 Pass {
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 24192
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
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	float _ContrastThreshold;
uniform 	float _RelativeThreshold;
uniform 	float _BlendingFactor;
uniform 	float _OffsetScale;
uniform 	float _ShowBlendArea;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_5;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
bool u_xlatb8;
mediump float u_xlat16_13;
mediump float u_xlat16_14;
bool u_xlatb16;
vec2 u_xlat17;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_29;
mediump float u_xlat16_30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, -0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = textureLod(_MainTex, u_xlat2.xy, 0.0).xyz;
    u_xlat16_2.xyz = textureLod(_MainTex, u_xlat2.zw, 0.0).xyz;
    u_xlat4.xyz = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_5.x = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_13 = dot(u_xlat16_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_21 = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_29 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_6 = dot(u_xlat4.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_14 = max(u_xlat16_5.x, u_xlat16_13);
    u_xlat16_14 = max(u_xlat16_21, u_xlat16_14);
    u_xlat16_14 = max(u_xlat16_29, u_xlat16_14);
    u_xlat16_22 = min(u_xlat16_5.x, u_xlat16_13);
    u_xlat16_22 = min(u_xlat16_21, u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_29, u_xlat16_22);
    u_xlat16_30 = max(u_xlat16_6, u_xlat16_14);
    u_xlat16_7.x = min(u_xlat16_6, u_xlat16_22);
    u_xlat16_30 = u_xlat16_30 + (-u_xlat16_7.x);
    u_xlat0.x = u_xlat16_14 * _RelativeThreshold;
    u_xlat0.x = max(u_xlat0.x, _ContrastThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowBlendArea));
#else
    u_xlatb8 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowBlendArea);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_30>=u_xlat0.x);
#else
    u_xlatb0 = u_xlat16_30>=u_xlat0.x;
#endif
    if(u_xlatb0){
        u_xlat0.x = u_xlat16_13 + 0.00260416674;
        u_xlat16_13 = u_xlat0.x + u_xlat16_5.x;
        u_xlat16_30 = u_xlat16_29 + u_xlat16_21;
        u_xlat16_13 = u_xlat16_13 + (-u_xlat16_30);
        u_xlat16_7.x = (-u_xlat16_13);
        u_xlat16_13 = (-u_xlat0.x) + u_xlat16_21;
        u_xlat16_5.x = (-u_xlat16_5.x) + u_xlat16_29;
        u_xlat16_7.y = (-u_xlat16_5.x) + u_xlat16_13;
        u_xlat0.x = dot(u_xlat16_7.xy, u_xlat16_7.xy);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat0.xz = u_xlat0.xx * u_xlat16_7.xy;
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy;
        u_xlat17.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale));
        u_xlat2.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1.xy = (-u_xlat1.xy) * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat1.xy);
        u_xlat2 = u_xlat16_2 + u_xlat16_3;
        u_xlat3 = u_xlat2 * vec4(0.5, 0.5, 0.5, 0.5);
        u_xlat0.x = min(abs(u_xlat0.z), abs(u_xlat0.x));
        u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
        u_xlat0.x = u_xlat0.x * 8.0 + 0.00260416674;
        u_xlat0.xz = u_xlat17.xy / u_xlat0.xx;
        u_xlat0.xz = max(u_xlat0.xz, vec2(-2.0, -2.0));
        u_xlat0.xz = min(u_xlat0.xz, vec2(2.0, 2.0));
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
        u_xlat0.xz = (-u_xlat0.xz) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat16_5 = texture(_MainTex, u_xlat0.xz);
        u_xlat1 = u_xlat16_1 + u_xlat16_5;
        u_xlat1 = u_xlat1 * vec4(0.25, 0.25, 0.25, 0.25);
        u_xlat1 = u_xlat2 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat1;
        u_xlat16_30 = dot(u_xlat1.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(u_xlat16_22<u_xlat16_30);
#else
        u_xlatb0 = u_xlat16_22<u_xlat16_30;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb16 = !!(u_xlat16_30<u_xlat16_14);
#else
        u_xlatb16 = u_xlat16_30<u_xlat16_14;
#endif
        u_xlatb0 = u_xlatb16 && u_xlatb0;
        u_xlat1 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat3;
        u_xlat2.xyz = (-u_xlat4.xyz);
        u_xlat2.w = (-u_xlat16_6);
        u_xlat1 = u_xlat1 + u_xlat2;
        u_xlat0.xzw = u_xlat1.xyz * vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor));
        u_xlat2.xyz = vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor)) * u_xlat1.xyz + u_xlat4.xyz;
        u_xlat2.w = _BlendingFactor * u_xlat1.w + u_xlat16_6;
        u_xlat0.xzw = u_xlat0.xzw * vec3(37.0, 37.0, 37.0);
        u_xlat16_6 = dot(u_xlat0.xzw, vec3(0.219999999, 0.707000017, 0.0710000023));
        SV_Target0 = (bool(u_xlatb8)) ? vec4(u_xlat16_6) : u_xlat2;
    } else {
        u_xlat4.w = 1.0;
        SV_Target0 = (bool(u_xlatb8)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat4;
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	float _ContrastThreshold;
uniform 	float _RelativeThreshold;
uniform 	float _BlendingFactor;
uniform 	float _OffsetScale;
uniform 	float _ShowBlendArea;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_5;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
bool u_xlatb8;
mediump float u_xlat16_13;
mediump float u_xlat16_14;
bool u_xlatb16;
vec2 u_xlat17;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_29;
mediump float u_xlat16_30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, -0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = textureLod(_MainTex, u_xlat2.xy, 0.0).xyz;
    u_xlat16_2.xyz = textureLod(_MainTex, u_xlat2.zw, 0.0).xyz;
    u_xlat4.xyz = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_5.x = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_13 = dot(u_xlat16_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_21 = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_29 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_6 = dot(u_xlat4.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_14 = max(u_xlat16_5.x, u_xlat16_13);
    u_xlat16_14 = max(u_xlat16_21, u_xlat16_14);
    u_xlat16_14 = max(u_xlat16_29, u_xlat16_14);
    u_xlat16_22 = min(u_xlat16_5.x, u_xlat16_13);
    u_xlat16_22 = min(u_xlat16_21, u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_29, u_xlat16_22);
    u_xlat16_30 = max(u_xlat16_6, u_xlat16_14);
    u_xlat16_7.x = min(u_xlat16_6, u_xlat16_22);
    u_xlat16_30 = u_xlat16_30 + (-u_xlat16_7.x);
    u_xlat0.x = u_xlat16_14 * _RelativeThreshold;
    u_xlat0.x = max(u_xlat0.x, _ContrastThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowBlendArea));
#else
    u_xlatb8 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowBlendArea);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_30>=u_xlat0.x);
#else
    u_xlatb0 = u_xlat16_30>=u_xlat0.x;
#endif
    if(u_xlatb0){
        u_xlat0.x = u_xlat16_13 + 0.00260416674;
        u_xlat16_13 = u_xlat0.x + u_xlat16_5.x;
        u_xlat16_30 = u_xlat16_29 + u_xlat16_21;
        u_xlat16_13 = u_xlat16_13 + (-u_xlat16_30);
        u_xlat16_7.x = (-u_xlat16_13);
        u_xlat16_13 = (-u_xlat0.x) + u_xlat16_21;
        u_xlat16_5.x = (-u_xlat16_5.x) + u_xlat16_29;
        u_xlat16_7.y = (-u_xlat16_5.x) + u_xlat16_13;
        u_xlat0.x = dot(u_xlat16_7.xy, u_xlat16_7.xy);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat0.xz = u_xlat0.xx * u_xlat16_7.xy;
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy;
        u_xlat17.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale));
        u_xlat2.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1.xy = (-u_xlat1.xy) * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat1.xy);
        u_xlat2 = u_xlat16_2 + u_xlat16_3;
        u_xlat3 = u_xlat2 * vec4(0.5, 0.5, 0.5, 0.5);
        u_xlat0.x = min(abs(u_xlat0.z), abs(u_xlat0.x));
        u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
        u_xlat0.x = u_xlat0.x * 8.0 + 0.00260416674;
        u_xlat0.xz = u_xlat17.xy / u_xlat0.xx;
        u_xlat0.xz = max(u_xlat0.xz, vec2(-2.0, -2.0));
        u_xlat0.xz = min(u_xlat0.xz, vec2(2.0, 2.0));
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
        u_xlat0.xz = (-u_xlat0.xz) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat16_5 = texture(_MainTex, u_xlat0.xz);
        u_xlat1 = u_xlat16_1 + u_xlat16_5;
        u_xlat1 = u_xlat1 * vec4(0.25, 0.25, 0.25, 0.25);
        u_xlat1 = u_xlat2 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat1;
        u_xlat16_30 = dot(u_xlat1.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(u_xlat16_22<u_xlat16_30);
#else
        u_xlatb0 = u_xlat16_22<u_xlat16_30;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb16 = !!(u_xlat16_30<u_xlat16_14);
#else
        u_xlatb16 = u_xlat16_30<u_xlat16_14;
#endif
        u_xlatb0 = u_xlatb16 && u_xlatb0;
        u_xlat1 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat3;
        u_xlat2.xyz = (-u_xlat4.xyz);
        u_xlat2.w = (-u_xlat16_6);
        u_xlat1 = u_xlat1 + u_xlat2;
        u_xlat0.xzw = u_xlat1.xyz * vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor));
        u_xlat2.xyz = vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor)) * u_xlat1.xyz + u_xlat4.xyz;
        u_xlat2.w = _BlendingFactor * u_xlat1.w + u_xlat16_6;
        u_xlat0.xzw = u_xlat0.xzw * vec3(37.0, 37.0, 37.0);
        u_xlat16_6 = dot(u_xlat0.xzw, vec3(0.219999999, 0.707000017, 0.0710000023));
        SV_Target0 = (bool(u_xlatb8)) ? vec4(u_xlat16_6) : u_xlat2;
    } else {
        u_xlat4.w = 1.0;
        SV_Target0 = (bool(u_xlatb8)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat4;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _ContrastThreshold;
uniform 	float _RelativeThreshold;
uniform 	float _BlendingFactor;
uniform 	float _OffsetScale;
uniform 	float _ShowBlendArea;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
bool u_xlatb8;
mediump float u_xlat16_13;
mediump float u_xlat16_14;
bool u_xlatb16;
vec2 u_xlat17;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_29;
mediump float u_xlat16_30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, -0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).xyz;
    u_xlat10_2.xyz = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).xyz;
    u_xlat4.xyz = texture2DLodEXT(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_5 = dot(u_xlat10_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_13 = dot(u_xlat10_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_21 = dot(u_xlat10_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_29 = dot(u_xlat10_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_6 = dot(u_xlat4.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_14 = max(u_xlat16_5, u_xlat16_13);
    u_xlat16_14 = max(u_xlat16_21, u_xlat16_14);
    u_xlat16_14 = max(u_xlat16_29, u_xlat16_14);
    u_xlat16_22 = min(u_xlat16_5, u_xlat16_13);
    u_xlat16_22 = min(u_xlat16_21, u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_29, u_xlat16_22);
    u_xlat16_30 = max(u_xlat16_6, u_xlat16_14);
    u_xlat16_7.x = min(u_xlat16_6, u_xlat16_22);
    u_xlat16_30 = u_xlat16_30 + (-u_xlat16_7.x);
    u_xlat0.x = u_xlat16_14 * _RelativeThreshold;
    u_xlat0.x = max(u_xlat0.x, _ContrastThreshold);
    u_xlatb8 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowBlendArea);
    u_xlatb0 = u_xlat16_30>=u_xlat0.x;
    if(u_xlatb0){
        u_xlat0.x = u_xlat16_13 + 0.00260416674;
        u_xlat16_13 = u_xlat0.x + u_xlat16_5;
        u_xlat16_30 = u_xlat16_29 + u_xlat16_21;
        u_xlat16_13 = u_xlat16_13 + (-u_xlat16_30);
        u_xlat16_7.x = (-u_xlat16_13);
        u_xlat16_13 = (-u_xlat0.x) + u_xlat16_21;
        u_xlat16_5 = (-u_xlat16_5) + u_xlat16_29;
        u_xlat16_7.y = (-u_xlat16_5) + u_xlat16_13;
        u_xlat0.x = dot(u_xlat16_7.xy, u_xlat16_7.xy);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat0.xz = u_xlat0.xx * u_xlat16_7.xy;
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy;
        u_xlat17.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale));
        u_xlat2.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
        u_xlat1.xy = (-u_xlat1.xy) * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat10_3 = texture2D(_MainTex, u_xlat1.xy);
        u_xlat2 = u_xlat10_2 + u_xlat10_3;
        u_xlat3 = u_xlat2 * vec4(0.5, 0.5, 0.5, 0.5);
        u_xlat0.x = min(abs(u_xlat0.z), abs(u_xlat0.x));
        u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
        u_xlat0.x = u_xlat0.x * 8.0 + 0.00260416674;
        u_xlat0.xz = u_xlat17.xy / u_xlat0.xx;
        u_xlat0.xz = max(u_xlat0.xz, vec2(-2.0, -2.0));
        u_xlat0.xz = min(u_xlat0.xz, vec2(2.0, 2.0));
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
        u_xlat0.xz = (-u_xlat0.xz) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat10_5 = texture2D(_MainTex, u_xlat0.xz);
        u_xlat1 = u_xlat10_1 + u_xlat10_5;
        u_xlat1 = u_xlat1 * vec4(0.25, 0.25, 0.25, 0.25);
        u_xlat1 = u_xlat2 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat1;
        u_xlat16_30 = dot(u_xlat1.xyz, vec3(0.298999995, 0.587000012, 0.114));
        u_xlatb0 = u_xlat16_22<u_xlat16_30;
        u_xlatb16 = u_xlat16_30<u_xlat16_14;
        u_xlatb0 = u_xlatb16 && u_xlatb0;
        u_xlat1 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat3;
        u_xlat2.xyz = (-u_xlat4.xyz);
        u_xlat2.w = (-u_xlat16_6);
        u_xlat1 = u_xlat1 + u_xlat2;
        u_xlat0.xzw = u_xlat1.xyz * vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor));
        u_xlat2.xyz = vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor)) * u_xlat1.xyz + u_xlat4.xyz;
        u_xlat2.w = _BlendingFactor * u_xlat1.w + u_xlat16_6;
        u_xlat0.xzw = u_xlat0.xzw * vec3(37.0, 37.0, 37.0);
        u_xlat16_6 = dot(u_xlat0.xzw, vec3(0.219999999, 0.707000017, 0.0710000023));
        SV_Target0 = (bool(u_xlatb8)) ? vec4(u_xlat16_6) : u_xlat2;
    } else {
        u_xlat4.w = 1.0;
        SV_Target0 = (bool(u_xlatb8)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat4;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _ContrastThreshold;
uniform 	float _RelativeThreshold;
uniform 	float _BlendingFactor;
uniform 	float _OffsetScale;
uniform 	float _ShowBlendArea;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
bool u_xlatb8;
mediump float u_xlat16_13;
mediump float u_xlat16_14;
bool u_xlatb16;
vec2 u_xlat17;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_29;
mediump float u_xlat16_30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, -0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).xyz;
    u_xlat10_2.xyz = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).xyz;
    u_xlat4.xyz = texture2DLodEXT(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_5 = dot(u_xlat10_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_13 = dot(u_xlat10_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_21 = dot(u_xlat10_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_29 = dot(u_xlat10_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_6 = dot(u_xlat4.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_14 = max(u_xlat16_5, u_xlat16_13);
    u_xlat16_14 = max(u_xlat16_21, u_xlat16_14);
    u_xlat16_14 = max(u_xlat16_29, u_xlat16_14);
    u_xlat16_22 = min(u_xlat16_5, u_xlat16_13);
    u_xlat16_22 = min(u_xlat16_21, u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_29, u_xlat16_22);
    u_xlat16_30 = max(u_xlat16_6, u_xlat16_14);
    u_xlat16_7.x = min(u_xlat16_6, u_xlat16_22);
    u_xlat16_30 = u_xlat16_30 + (-u_xlat16_7.x);
    u_xlat0.x = u_xlat16_14 * _RelativeThreshold;
    u_xlat0.x = max(u_xlat0.x, _ContrastThreshold);
    u_xlatb8 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowBlendArea);
    u_xlatb0 = u_xlat16_30>=u_xlat0.x;
    if(u_xlatb0){
        u_xlat0.x = u_xlat16_13 + 0.00260416674;
        u_xlat16_13 = u_xlat0.x + u_xlat16_5;
        u_xlat16_30 = u_xlat16_29 + u_xlat16_21;
        u_xlat16_13 = u_xlat16_13 + (-u_xlat16_30);
        u_xlat16_7.x = (-u_xlat16_13);
        u_xlat16_13 = (-u_xlat0.x) + u_xlat16_21;
        u_xlat16_5 = (-u_xlat16_5) + u_xlat16_29;
        u_xlat16_7.y = (-u_xlat16_5) + u_xlat16_13;
        u_xlat0.x = dot(u_xlat16_7.xy, u_xlat16_7.xy);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat0.xz = u_xlat0.xx * u_xlat16_7.xy;
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy;
        u_xlat17.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale));
        u_xlat2.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
        u_xlat1.xy = (-u_xlat1.xy) * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat10_3 = texture2D(_MainTex, u_xlat1.xy);
        u_xlat2 = u_xlat10_2 + u_xlat10_3;
        u_xlat3 = u_xlat2 * vec4(0.5, 0.5, 0.5, 0.5);
        u_xlat0.x = min(abs(u_xlat0.z), abs(u_xlat0.x));
        u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
        u_xlat0.x = u_xlat0.x * 8.0 + 0.00260416674;
        u_xlat0.xz = u_xlat17.xy / u_xlat0.xx;
        u_xlat0.xz = max(u_xlat0.xz, vec2(-2.0, -2.0));
        u_xlat0.xz = min(u_xlat0.xz, vec2(2.0, 2.0));
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
        u_xlat0.xz = (-u_xlat0.xz) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat10_5 = texture2D(_MainTex, u_xlat0.xz);
        u_xlat1 = u_xlat10_1 + u_xlat10_5;
        u_xlat1 = u_xlat1 * vec4(0.25, 0.25, 0.25, 0.25);
        u_xlat1 = u_xlat2 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat1;
        u_xlat16_30 = dot(u_xlat1.xyz, vec3(0.298999995, 0.587000012, 0.114));
        u_xlatb0 = u_xlat16_22<u_xlat16_30;
        u_xlatb16 = u_xlat16_30<u_xlat16_14;
        u_xlatb0 = u_xlatb16 && u_xlatb0;
        u_xlat1 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat3;
        u_xlat2.xyz = (-u_xlat4.xyz);
        u_xlat2.w = (-u_xlat16_6);
        u_xlat1 = u_xlat1 + u_xlat2;
        u_xlat0.xzw = u_xlat1.xyz * vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor));
        u_xlat2.xyz = vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor)) * u_xlat1.xyz + u_xlat4.xyz;
        u_xlat2.w = _BlendingFactor * u_xlat1.w + u_xlat16_6;
        u_xlat0.xzw = u_xlat0.xzw * vec3(37.0, 37.0, 37.0);
        u_xlat16_6 = dot(u_xlat0.xzw, vec3(0.219999999, 0.707000017, 0.0710000023));
        SV_Target0 = (bool(u_xlatb8)) ? vec4(u_xlat16_6) : u_xlat2;
    } else {
        u_xlat4.w = 1.0;
        SV_Target0 = (bool(u_xlatb8)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat4;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "ENABLE_HDR" }
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
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	float _ContrastThreshold;
uniform 	float _RelativeThreshold;
uniform 	float _BlendingFactor;
uniform 	float _OffsetScale;
uniform 	float _ShowBlendArea;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_5;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
bool u_xlatb8;
mediump float u_xlat16_13;
mediump float u_xlat16_14;
bool u_xlatb16;
vec2 u_xlat17;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_29;
mediump float u_xlat16_30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, -0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = textureLod(_MainTex, u_xlat2.xy, 0.0).xyz;
    u_xlat16_2.xyz = textureLod(_MainTex, u_xlat2.zw, 0.0).xyz;
    u_xlat4.xyz = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_5.x = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_13 = dot(u_xlat16_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_21 = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_29 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_6 = dot(u_xlat4.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_14 = max(u_xlat16_5.x, u_xlat16_13);
    u_xlat16_14 = max(u_xlat16_21, u_xlat16_14);
    u_xlat16_14 = max(u_xlat16_29, u_xlat16_14);
    u_xlat16_22 = min(u_xlat16_5.x, u_xlat16_13);
    u_xlat16_22 = min(u_xlat16_21, u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_29, u_xlat16_22);
    u_xlat16_30 = max(u_xlat16_6, u_xlat16_14);
    u_xlat16_7.x = min(u_xlat16_6, u_xlat16_22);
    u_xlat16_30 = u_xlat16_30 + (-u_xlat16_7.x);
    u_xlat0.x = u_xlat16_14 * _RelativeThreshold;
    u_xlat0.x = max(u_xlat0.x, _ContrastThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowBlendArea));
#else
    u_xlatb8 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowBlendArea);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_30>=u_xlat0.x);
#else
    u_xlatb0 = u_xlat16_30>=u_xlat0.x;
#endif
    if(u_xlatb0){
        u_xlat0.x = u_xlat16_13 + 0.00260416674;
        u_xlat16_13 = u_xlat0.x + u_xlat16_5.x;
        u_xlat16_30 = u_xlat16_29 + u_xlat16_21;
        u_xlat16_13 = u_xlat16_13 + (-u_xlat16_30);
        u_xlat16_7.x = (-u_xlat16_13);
        u_xlat16_13 = (-u_xlat0.x) + u_xlat16_21;
        u_xlat16_5.x = (-u_xlat16_5.x) + u_xlat16_29;
        u_xlat16_7.y = (-u_xlat16_5.x) + u_xlat16_13;
        u_xlat0.x = dot(u_xlat16_7.xy, u_xlat16_7.xy);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat0.xz = u_xlat0.xx * u_xlat16_7.xy;
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy;
        u_xlat17.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale));
        u_xlat2.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1.xy = (-u_xlat1.xy) * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat1.xy);
        u_xlat2 = u_xlat16_2 + u_xlat16_3;
        u_xlat3 = u_xlat2 * vec4(0.5, 0.5, 0.5, 0.5);
        u_xlat0.x = min(abs(u_xlat0.z), abs(u_xlat0.x));
        u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
        u_xlat0.x = u_xlat0.x * 8.0 + 0.00260416674;
        u_xlat0.xz = u_xlat17.xy / u_xlat0.xx;
        u_xlat0.xz = max(u_xlat0.xz, vec2(-2.0, -2.0));
        u_xlat0.xz = min(u_xlat0.xz, vec2(2.0, 2.0));
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
        u_xlat0.xz = (-u_xlat0.xz) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat16_5 = texture(_MainTex, u_xlat0.xz);
        u_xlat1 = u_xlat16_1 + u_xlat16_5;
        u_xlat1 = u_xlat1 * vec4(0.25, 0.25, 0.25, 0.25);
        u_xlat1 = u_xlat2 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat1;
        u_xlat16_30 = dot(u_xlat1.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(u_xlat16_22<u_xlat16_30);
#else
        u_xlatb0 = u_xlat16_22<u_xlat16_30;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb16 = !!(u_xlat16_30<u_xlat16_14);
#else
        u_xlatb16 = u_xlat16_30<u_xlat16_14;
#endif
        u_xlatb0 = u_xlatb16 && u_xlatb0;
        u_xlat1 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat3;
        u_xlat2.xyz = (-u_xlat4.xyz);
        u_xlat2.w = (-u_xlat16_6);
        u_xlat1 = u_xlat1 + u_xlat2;
        u_xlat0.xzw = u_xlat1.xyz * vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor));
        u_xlat2.xyz = vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor)) * u_xlat1.xyz + u_xlat4.xyz;
        u_xlat2.w = _BlendingFactor * u_xlat1.w + u_xlat16_6;
        u_xlat0.xzw = u_xlat0.xzw * vec3(37.0, 37.0, 37.0);
        u_xlat16_6 = dot(u_xlat0.xzw, vec3(0.219999999, 0.707000017, 0.0710000023));
        SV_Target0 = (bool(u_xlatb8)) ? vec4(u_xlat16_6) : u_xlat2;
    } else {
        u_xlat4.w = 1.0;
        SV_Target0 = (bool(u_xlatb8)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat4;
    }
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "ENABLE_HDR" }
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
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	float _ContrastThreshold;
uniform 	float _RelativeThreshold;
uniform 	float _BlendingFactor;
uniform 	float _OffsetScale;
uniform 	float _ShowBlendArea;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_5;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
bool u_xlatb8;
mediump float u_xlat16_13;
mediump float u_xlat16_14;
bool u_xlatb16;
vec2 u_xlat17;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_29;
mediump float u_xlat16_30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, -0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_3.xyz = textureLod(_MainTex, u_xlat2.xy, 0.0).xyz;
    u_xlat16_2.xyz = textureLod(_MainTex, u_xlat2.zw, 0.0).xyz;
    u_xlat4.xyz = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_5.x = dot(u_xlat16_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_13 = dot(u_xlat16_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_21 = dot(u_xlat16_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_29 = dot(u_xlat16_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_6 = dot(u_xlat4.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_14 = max(u_xlat16_5.x, u_xlat16_13);
    u_xlat16_14 = max(u_xlat16_21, u_xlat16_14);
    u_xlat16_14 = max(u_xlat16_29, u_xlat16_14);
    u_xlat16_22 = min(u_xlat16_5.x, u_xlat16_13);
    u_xlat16_22 = min(u_xlat16_21, u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_29, u_xlat16_22);
    u_xlat16_30 = max(u_xlat16_6, u_xlat16_14);
    u_xlat16_7.x = min(u_xlat16_6, u_xlat16_22);
    u_xlat16_30 = u_xlat16_30 + (-u_xlat16_7.x);
    u_xlat0.x = u_xlat16_14 * _RelativeThreshold;
    u_xlat0.x = max(u_xlat0.x, _ContrastThreshold);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowBlendArea));
#else
    u_xlatb8 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowBlendArea);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_30>=u_xlat0.x);
#else
    u_xlatb0 = u_xlat16_30>=u_xlat0.x;
#endif
    if(u_xlatb0){
        u_xlat0.x = u_xlat16_13 + 0.00260416674;
        u_xlat16_13 = u_xlat0.x + u_xlat16_5.x;
        u_xlat16_30 = u_xlat16_29 + u_xlat16_21;
        u_xlat16_13 = u_xlat16_13 + (-u_xlat16_30);
        u_xlat16_7.x = (-u_xlat16_13);
        u_xlat16_13 = (-u_xlat0.x) + u_xlat16_21;
        u_xlat16_5.x = (-u_xlat16_5.x) + u_xlat16_29;
        u_xlat16_7.y = (-u_xlat16_5.x) + u_xlat16_13;
        u_xlat0.x = dot(u_xlat16_7.xy, u_xlat16_7.xy);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat0.xz = u_xlat0.xx * u_xlat16_7.xy;
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy;
        u_xlat17.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale));
        u_xlat2.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1.xy = (-u_xlat1.xy) * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat16_3 = texture(_MainTex, u_xlat1.xy);
        u_xlat2 = u_xlat16_2 + u_xlat16_3;
        u_xlat3 = u_xlat2 * vec4(0.5, 0.5, 0.5, 0.5);
        u_xlat0.x = min(abs(u_xlat0.z), abs(u_xlat0.x));
        u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
        u_xlat0.x = u_xlat0.x * 8.0 + 0.00260416674;
        u_xlat0.xz = u_xlat17.xy / u_xlat0.xx;
        u_xlat0.xz = max(u_xlat0.xz, vec2(-2.0, -2.0));
        u_xlat0.xz = min(u_xlat0.xz, vec2(2.0, 2.0));
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
        u_xlat0.xz = (-u_xlat0.xz) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat16_5 = texture(_MainTex, u_xlat0.xz);
        u_xlat1 = u_xlat16_1 + u_xlat16_5;
        u_xlat1 = u_xlat1 * vec4(0.25, 0.25, 0.25, 0.25);
        u_xlat1 = u_xlat2 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat1;
        u_xlat16_30 = dot(u_xlat1.xyz, vec3(0.298999995, 0.587000012, 0.114));
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(u_xlat16_22<u_xlat16_30);
#else
        u_xlatb0 = u_xlat16_22<u_xlat16_30;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb16 = !!(u_xlat16_30<u_xlat16_14);
#else
        u_xlatb16 = u_xlat16_30<u_xlat16_14;
#endif
        u_xlatb0 = u_xlatb16 && u_xlatb0;
        u_xlat1 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat3;
        u_xlat2.xyz = (-u_xlat4.xyz);
        u_xlat2.w = (-u_xlat16_6);
        u_xlat1 = u_xlat1 + u_xlat2;
        u_xlat0.xzw = u_xlat1.xyz * vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor));
        u_xlat2.xyz = vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor)) * u_xlat1.xyz + u_xlat4.xyz;
        u_xlat2.w = _BlendingFactor * u_xlat1.w + u_xlat16_6;
        u_xlat0.xzw = u_xlat0.xzw * vec3(37.0, 37.0, 37.0);
        u_xlat16_6 = dot(u_xlat0.xzw, vec3(0.219999999, 0.707000017, 0.0710000023));
        SV_Target0 = (bool(u_xlatb8)) ? vec4(u_xlat16_6) : u_xlat2;
    } else {
        u_xlat4.w = 1.0;
        SV_Target0 = (bool(u_xlatb8)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat4;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "ENABLE_HDR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _ContrastThreshold;
uniform 	float _RelativeThreshold;
uniform 	float _BlendingFactor;
uniform 	float _OffsetScale;
uniform 	float _ShowBlendArea;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
bool u_xlatb8;
mediump float u_xlat16_13;
mediump float u_xlat16_14;
bool u_xlatb16;
vec2 u_xlat17;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_29;
mediump float u_xlat16_30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, -0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).xyz;
    u_xlat10_2.xyz = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).xyz;
    u_xlat4.xyz = texture2DLodEXT(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_5 = dot(u_xlat10_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_13 = dot(u_xlat10_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_21 = dot(u_xlat10_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_29 = dot(u_xlat10_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_6 = dot(u_xlat4.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_14 = max(u_xlat16_5, u_xlat16_13);
    u_xlat16_14 = max(u_xlat16_21, u_xlat16_14);
    u_xlat16_14 = max(u_xlat16_29, u_xlat16_14);
    u_xlat16_22 = min(u_xlat16_5, u_xlat16_13);
    u_xlat16_22 = min(u_xlat16_21, u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_29, u_xlat16_22);
    u_xlat16_30 = max(u_xlat16_6, u_xlat16_14);
    u_xlat16_7.x = min(u_xlat16_6, u_xlat16_22);
    u_xlat16_30 = u_xlat16_30 + (-u_xlat16_7.x);
    u_xlat0.x = u_xlat16_14 * _RelativeThreshold;
    u_xlat0.x = max(u_xlat0.x, _ContrastThreshold);
    u_xlatb8 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowBlendArea);
    u_xlatb0 = u_xlat16_30>=u_xlat0.x;
    if(u_xlatb0){
        u_xlat0.x = u_xlat16_13 + 0.00260416674;
        u_xlat16_13 = u_xlat0.x + u_xlat16_5;
        u_xlat16_30 = u_xlat16_29 + u_xlat16_21;
        u_xlat16_13 = u_xlat16_13 + (-u_xlat16_30);
        u_xlat16_7.x = (-u_xlat16_13);
        u_xlat16_13 = (-u_xlat0.x) + u_xlat16_21;
        u_xlat16_5 = (-u_xlat16_5) + u_xlat16_29;
        u_xlat16_7.y = (-u_xlat16_5) + u_xlat16_13;
        u_xlat0.x = dot(u_xlat16_7.xy, u_xlat16_7.xy);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat0.xz = u_xlat0.xx * u_xlat16_7.xy;
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy;
        u_xlat17.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale));
        u_xlat2.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
        u_xlat1.xy = (-u_xlat1.xy) * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat10_3 = texture2D(_MainTex, u_xlat1.xy);
        u_xlat2 = u_xlat10_2 + u_xlat10_3;
        u_xlat3 = u_xlat2 * vec4(0.5, 0.5, 0.5, 0.5);
        u_xlat0.x = min(abs(u_xlat0.z), abs(u_xlat0.x));
        u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
        u_xlat0.x = u_xlat0.x * 8.0 + 0.00260416674;
        u_xlat0.xz = u_xlat17.xy / u_xlat0.xx;
        u_xlat0.xz = max(u_xlat0.xz, vec2(-2.0, -2.0));
        u_xlat0.xz = min(u_xlat0.xz, vec2(2.0, 2.0));
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
        u_xlat0.xz = (-u_xlat0.xz) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat10_5 = texture2D(_MainTex, u_xlat0.xz);
        u_xlat1 = u_xlat10_1 + u_xlat10_5;
        u_xlat1 = u_xlat1 * vec4(0.25, 0.25, 0.25, 0.25);
        u_xlat1 = u_xlat2 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat1;
        u_xlat16_30 = dot(u_xlat1.xyz, vec3(0.298999995, 0.587000012, 0.114));
        u_xlatb0 = u_xlat16_22<u_xlat16_30;
        u_xlatb16 = u_xlat16_30<u_xlat16_14;
        u_xlatb0 = u_xlatb16 && u_xlatb0;
        u_xlat1 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat3;
        u_xlat2.xyz = (-u_xlat4.xyz);
        u_xlat2.w = (-u_xlat16_6);
        u_xlat1 = u_xlat1 + u_xlat2;
        u_xlat0.xzw = u_xlat1.xyz * vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor));
        u_xlat2.xyz = vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor)) * u_xlat1.xyz + u_xlat4.xyz;
        u_xlat2.w = _BlendingFactor * u_xlat1.w + u_xlat16_6;
        u_xlat0.xzw = u_xlat0.xzw * vec3(37.0, 37.0, 37.0);
        u_xlat16_6 = dot(u_xlat0.xzw, vec3(0.219999999, 0.707000017, 0.0710000023));
        SV_Target0 = (bool(u_xlatb8)) ? vec4(u_xlat16_6) : u_xlat2;
    } else {
        u_xlat4.w = 1.0;
        SV_Target0 = (bool(u_xlatb8)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat4;
    }
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "ENABLE_HDR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _ContrastThreshold;
uniform 	float _RelativeThreshold;
uniform 	float _BlendingFactor;
uniform 	float _OffsetScale;
uniform 	float _ShowBlendArea;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
lowp vec4 u_xlat10_5;
mediump float u_xlat16_6;
mediump vec2 u_xlat16_7;
bool u_xlatb8;
mediump float u_xlat16_13;
mediump float u_xlat16_14;
bool u_xlatb16;
vec2 u_xlat17;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_29;
mediump float u_xlat16_30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, 0.5, -0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat2 = _MainTex_TexelSize.xyxy * vec4(0.5, 0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_3.xyz = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).xyz;
    u_xlat10_2.xyz = texture2DLodEXT(_MainTex, u_xlat2.zw, 0.0).xyz;
    u_xlat4.xyz = texture2DLodEXT(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_5 = dot(u_xlat10_1.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_13 = dot(u_xlat10_3.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_21 = dot(u_xlat10_0.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_29 = dot(u_xlat10_2.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_6 = dot(u_xlat4.xyz, vec3(0.298999995, 0.587000012, 0.114));
    u_xlat16_14 = max(u_xlat16_5, u_xlat16_13);
    u_xlat16_14 = max(u_xlat16_21, u_xlat16_14);
    u_xlat16_14 = max(u_xlat16_29, u_xlat16_14);
    u_xlat16_22 = min(u_xlat16_5, u_xlat16_13);
    u_xlat16_22 = min(u_xlat16_21, u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_29, u_xlat16_22);
    u_xlat16_30 = max(u_xlat16_6, u_xlat16_14);
    u_xlat16_7.x = min(u_xlat16_6, u_xlat16_22);
    u_xlat16_30 = u_xlat16_30 + (-u_xlat16_7.x);
    u_xlat0.x = u_xlat16_14 * _RelativeThreshold;
    u_xlat0.x = max(u_xlat0.x, _ContrastThreshold);
    u_xlatb8 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_ShowBlendArea);
    u_xlatb0 = u_xlat16_30>=u_xlat0.x;
    if(u_xlatb0){
        u_xlat0.x = u_xlat16_13 + 0.00260416674;
        u_xlat16_13 = u_xlat0.x + u_xlat16_5;
        u_xlat16_30 = u_xlat16_29 + u_xlat16_21;
        u_xlat16_13 = u_xlat16_13 + (-u_xlat16_30);
        u_xlat16_7.x = (-u_xlat16_13);
        u_xlat16_13 = (-u_xlat0.x) + u_xlat16_21;
        u_xlat16_5 = (-u_xlat16_5) + u_xlat16_29;
        u_xlat16_7.y = (-u_xlat16_5) + u_xlat16_13;
        u_xlat0.x = dot(u_xlat16_7.xy, u_xlat16_7.xy);
        u_xlat0.x = inversesqrt(u_xlat0.x);
        u_xlat0.xz = u_xlat0.xx * u_xlat16_7.xy;
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy;
        u_xlat17.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale));
        u_xlat2.xy = u_xlat1.xy * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
        u_xlat1.xy = (-u_xlat1.xy) * vec2(vec2(_OffsetScale, _OffsetScale)) + vs_TEXCOORD0.xy;
        u_xlat10_3 = texture2D(_MainTex, u_xlat1.xy);
        u_xlat2 = u_xlat10_2 + u_xlat10_3;
        u_xlat3 = u_xlat2 * vec4(0.5, 0.5, 0.5, 0.5);
        u_xlat0.x = min(abs(u_xlat0.z), abs(u_xlat0.x));
        u_xlat0.x = max(u_xlat0.x, 9.99999975e-05);
        u_xlat0.x = u_xlat0.x * 8.0 + 0.00260416674;
        u_xlat0.xz = u_xlat17.xy / u_xlat0.xx;
        u_xlat0.xz = max(u_xlat0.xz, vec2(-2.0, -2.0));
        u_xlat0.xz = min(u_xlat0.xz, vec2(2.0, 2.0));
        u_xlat1.xy = u_xlat0.xz * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
        u_xlat0.xz = (-u_xlat0.xz) * _MainTex_TexelSize.xy + vs_TEXCOORD0.xy;
        u_xlat10_5 = texture2D(_MainTex, u_xlat0.xz);
        u_xlat1 = u_xlat10_1 + u_xlat10_5;
        u_xlat1 = u_xlat1 * vec4(0.25, 0.25, 0.25, 0.25);
        u_xlat1 = u_xlat2 * vec4(0.25, 0.25, 0.25, 0.25) + u_xlat1;
        u_xlat16_30 = dot(u_xlat1.xyz, vec3(0.298999995, 0.587000012, 0.114));
        u_xlatb0 = u_xlat16_22<u_xlat16_30;
        u_xlatb16 = u_xlat16_30<u_xlat16_14;
        u_xlatb0 = u_xlatb16 && u_xlatb0;
        u_xlat1 = (bool(u_xlatb0)) ? u_xlat1 : u_xlat3;
        u_xlat2.xyz = (-u_xlat4.xyz);
        u_xlat2.w = (-u_xlat16_6);
        u_xlat1 = u_xlat1 + u_xlat2;
        u_xlat0.xzw = u_xlat1.xyz * vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor));
        u_xlat2.xyz = vec3(vec3(_BlendingFactor, _BlendingFactor, _BlendingFactor)) * u_xlat1.xyz + u_xlat4.xyz;
        u_xlat2.w = _BlendingFactor * u_xlat1.w + u_xlat16_6;
        u_xlat0.xzw = u_xlat0.xzw * vec3(37.0, 37.0, 37.0);
        u_xlat16_6 = dot(u_xlat0.xzw, vec3(0.219999999, 0.707000017, 0.0710000023));
        SV_Target0 = (bool(u_xlatb8)) ? vec4(u_xlat16_6) : u_xlat2;
    } else {
        u_xlat4.w = 1.0;
        SV_Target0 = (bool(u_xlatb8)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat4;
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
Keywords { "ENABLE_HDR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "ENABLE_HDR" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "ENABLE_HDR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "ENABLE_HDR" }
""
}
}
}
}
}