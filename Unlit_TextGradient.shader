//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Unlit/TextGradient" {
Properties {

_MainTex ("Alpha (A)", 2D) = "white" { }

_Color1 ("渐变颜色1", Color) = (1,0,0,1)

_Color2 ("渐变颜色2", Color) = (0,0,1,1)

_m_length ("总长度(前端传)", Float) = 1.0

_GradientOffset ("Gradient Offset", Range(0, 1)) = 0.0

_Repeat ("Repeat Count", Range(1, 50)) = 10.0

}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
 Offset -1.0, -1.0
  GpuProgramID 4743
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
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec3 _Color1;
uniform 	mediump vec3 _Color2;
uniform 	mediump float _Repeat;
uniform 	float _m_length;
uniform 	float _GradientOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
void main()
{
    u_xlat0.x = vs_COLOR0.x + (-_GradientOffset);
    u_xlat0.x = u_xlat0.x * _Repeat;
    u_xlat0.x = u_xlat0.x * _m_length;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlat1.xyz = (-_Color1.xyz) + _Color2.xyz;
    u_xlat0.xyz = abs(u_xlat0.xxx) * u_xlat1.xyz + _Color1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat16_0 * vs_COLOR0.w;
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
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec3 _Color1;
uniform 	mediump vec3 _Color2;
uniform 	mediump float _Repeat;
uniform 	float _m_length;
uniform 	float _GradientOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
void main()
{
    u_xlat0.x = vs_COLOR0.x + (-_GradientOffset);
    u_xlat0.x = u_xlat0.x * _Repeat;
    u_xlat0.x = u_xlat0.x * _m_length;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlat1.xyz = (-_Color1.xyz) + _Color2.xyz;
    u_xlat0.xyz = abs(u_xlat0.xxx) * u_xlat1.xyz + _Color1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat16_0 * vs_COLOR0.w;
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
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec3 _Color1;
uniform 	mediump vec3 _Color2;
uniform 	mediump float _Repeat;
uniform 	float _m_length;
uniform 	float _GradientOffset;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
void main()
{
    u_xlat0.x = vs_COLOR0.x + (-_GradientOffset);
    u_xlat0.x = u_xlat0.x * _Repeat;
    u_xlat0.x = u_xlat0.x * _m_length;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlat1.xyz = (-_Color1.xyz) + _Color2.xyz;
    u_xlat0.xyz = abs(u_xlat0.xxx) * u_xlat1.xyz + _Color1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat10_0 * vs_COLOR0.w;
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
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec3 _Color1;
uniform 	mediump vec3 _Color2;
uniform 	mediump float _Repeat;
uniform 	float _m_length;
uniform 	float _GradientOffset;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
void main()
{
    u_xlat0.x = vs_COLOR0.x + (-_GradientOffset);
    u_xlat0.x = u_xlat0.x * _Repeat;
    u_xlat0.x = u_xlat0.x * _m_length;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlat1.xyz = (-_Color1.xyz) + _Color2.xyz;
    u_xlat0.xyz = abs(u_xlat0.xxx) * u_xlat1.xyz + _Color1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat10_0 * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_OUTLINE_NEW" }
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
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3 = in_TEXCOORD3;
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
uniform 	mediump vec3 _Color1;
uniform 	mediump vec3 _Color2;
uniform 	mediump float _Repeat;
uniform 	float _m_length;
uniform 	float _GradientOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec2 u_xlati3;
vec4 u_xlat4;
ivec3 u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
ivec2 u_xlati5;
bvec4 u_xlatb5;
bvec4 u_xlatb6;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat10;
ivec2 u_xlati10;
bvec2 u_xlatb15;
ivec2 u_xlati17;
void main()
{
    u_xlat0.w = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat1.x = vs_COLOR0.x + (-_GradientOffset);
    u_xlat1.x = u_xlat1.x * _Repeat;
    u_xlat1.x = u_xlat1.x * _m_length;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.0 + -1.0;
    u_xlat8.xyz = (-_Color1.xyz) + _Color2.xyz;
    u_xlat0.xyz = abs(u_xlat1.xxx) * u_xlat8.xyz + _Color1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.xy;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlatb15.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat1.xyxy).xy;
    u_xlatb15.x = u_xlatb15.y || u_xlatb15.x;
    u_xlatb1.xy = greaterThanEqual(u_xlat1.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.x || u_xlatb15.x;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_2 = (u_xlatb1.x) ? 0.0 : u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.0<vs_TEXCOORD3.w);
#else
    u_xlatb1.x = 0.0<vs_TEXCOORD3.w;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_2!=1.0);
#else
    u_xlatb8 = u_xlat16_2!=1.0;
#endif
    u_xlatb1.x = u_xlatb8 && u_xlatb1.x;
    if(u_xlatb1.x){
        u_xlat1 = vs_TEXCOORD3.wwww * _MainTex_TexelSize.xyxy;
        u_xlat3 = u_xlat1.zwzw * vec4(-0.707099974, -0.707099974, -0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat3.x = texture(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati5.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb5.w) * 0xffffffffu) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati4.xz = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) | uint(u_xlati5.x), (uint(u_xlatb4.z) * 0xffffffffu) | uint(u_xlati5.y)));
        u_xlati4.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | uint(u_xlati4.x), (uint(u_xlatb4.w) * 0xffffffffu) | uint(u_xlati4.z)));
        u_xlat3.x = (u_xlati4.x != 0) ? 0.0 : u_xlat3.x;
        u_xlat10 = texture(_MainTex, u_xlat3.zw).w;
        u_xlat10 = (u_xlati4.y != 0) ? 0.0 : u_xlat10;
        u_xlat3.x = u_xlat10 + u_xlat3.x;
        u_xlat4 = u_xlat1.zwzw * vec4(0.707099974, -0.707099974, 0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat10 = texture(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati17.xy = ivec2(uvec2((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu), (uint(u_xlatb6.w) * 0xffffffffu) | (uint(u_xlatb6.z) * 0xffffffffu)));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati17.xy = ivec2(uvec2(uint(u_xlati17.x) | (uint(u_xlatb5.x) * 0xffffffffu), uint(u_xlati17.y) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlati17.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | uint(u_xlati17.x), (uint(u_xlatb5.w) * 0xffffffffu) | uint(u_xlati17.y)));
        u_xlat10 = (u_xlati17.x != 0) ? 0.0 : u_xlat10;
        u_xlat3.x = u_xlat10 + u_xlat3.x;
        u_xlat10 = texture(_MainTex, u_xlat4.zw).w;
        u_xlat10 = (u_xlati17.y != 0) ? 0.0 : u_xlat10;
        u_xlat3.x = u_xlat10 + u_xlat3.x;
        u_xlat1 = u_xlat1 * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat1 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat1.x = texture(_MainTex, u_xlat1.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati10.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb5.w) * 0xffffffffu) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati10.xy = ivec2(uvec2(uint(u_xlati10.x) | (uint(u_xlatb4.x) * 0xffffffffu), uint(u_xlati10.y) | (uint(u_xlatb4.z) * 0xffffffffu)));
        u_xlati10.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | uint(u_xlati10.x), (uint(u_xlatb4.w) * 0xffffffffu) | uint(u_xlati10.y)));
        u_xlat1.x = (u_xlati10.x != 0) ? 0.0 : u_xlat1.x;
        u_xlat1.x = u_xlat1.x + u_xlat3.x;
        u_xlat4.yz = vs_TEXCOORD3.ww;
        u_xlat4.x = float(1.0);
        u_xlat4.w = float(0.0);
        u_xlat5 = u_xlat4.yxxy * _MainTex_TexelSize.xyxy;
        u_xlat4 = u_xlat5 * u_xlat4.wzzw + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat8.x = texture(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati3.xy = ivec2(uvec2((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu), (uint(u_xlatb6.w) * 0xffffffffu) | (uint(u_xlatb6.z) * 0xffffffffu)));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati3.xy = ivec2(uvec2(uint(u_xlati3.x) | (uint(u_xlatb5.x) * 0xffffffffu), uint(u_xlati3.y) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlati3.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | uint(u_xlati3.x), (uint(u_xlatb5.w) * 0xffffffffu) | uint(u_xlati3.y)));
        u_xlat8.x = (u_xlati3.x != 0) ? 0.0 : u_xlat8.x;
        u_xlat1.x = u_xlat8.x + u_xlat1.x;
        u_xlat8.x = texture(_MainTex, u_xlat1.zw).w;
        u_xlat8.x = (u_xlati10.y != 0) ? 0.0 : u_xlat8.x;
        u_xlat1.x = u_xlat8.x + u_xlat1.x;
        u_xlat8.x = texture(_MainTex, u_xlat4.zw).w;
        u_xlat8.x = (u_xlati3.y != 0) ? 0.0 : u_xlat8.x;
        u_xlat1.x = u_xlat8.x + u_xlat1.x;
        u_xlat1.x = min(u_xlat1.x, 1.0);
        u_xlat1.x = u_xlat1.x * 0.5;
        u_xlat16_1 = u_xlat1.x;
    } else {
        u_xlat16_1 = vs_TEXCOORD3.w;
    }
    u_xlat16_3.xyz = (-vs_TEXCOORD3.xyz);
    u_xlat16_3.w = (-u_xlat16_1);
    u_xlat16_0 = u_xlat0 + u_xlat16_3;
    SV_Target0.xyz = vec3(u_xlat16_2) * u_xlat16_0.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_0.w + u_xlat16_1;
    SV_Target0.w = u_xlat16_2 * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_OUTLINE_NEW" }
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
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3 = in_TEXCOORD3;
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
uniform 	mediump vec3 _Color1;
uniform 	mediump vec3 _Color2;
uniform 	mediump float _Repeat;
uniform 	float _m_length;
uniform 	float _GradientOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec2 u_xlati3;
vec4 u_xlat4;
ivec3 u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
ivec2 u_xlati5;
bvec4 u_xlatb5;
bvec4 u_xlatb6;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat10;
ivec2 u_xlati10;
bvec2 u_xlatb15;
ivec2 u_xlati17;
void main()
{
    u_xlat0.w = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat1.x = vs_COLOR0.x + (-_GradientOffset);
    u_xlat1.x = u_xlat1.x * _Repeat;
    u_xlat1.x = u_xlat1.x * _m_length;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.0 + -1.0;
    u_xlat8.xyz = (-_Color1.xyz) + _Color2.xyz;
    u_xlat0.xyz = abs(u_xlat1.xxx) * u_xlat8.xyz + _Color1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.xy;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlatb15.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat1.xyxy).xy;
    u_xlatb15.x = u_xlatb15.y || u_xlatb15.x;
    u_xlatb1.xy = greaterThanEqual(u_xlat1.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.x || u_xlatb15.x;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_2 = (u_xlatb1.x) ? 0.0 : u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(0.0<vs_TEXCOORD3.w);
#else
    u_xlatb1.x = 0.0<vs_TEXCOORD3.w;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_2!=1.0);
#else
    u_xlatb8 = u_xlat16_2!=1.0;
#endif
    u_xlatb1.x = u_xlatb8 && u_xlatb1.x;
    if(u_xlatb1.x){
        u_xlat1 = vs_TEXCOORD3.wwww * _MainTex_TexelSize.xyxy;
        u_xlat3 = u_xlat1.zwzw * vec4(-0.707099974, -0.707099974, -0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat3.x = texture(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati5.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb5.w) * 0xffffffffu) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati4.xz = ivec2(uvec2((uint(u_xlatb4.x) * 0xffffffffu) | uint(u_xlati5.x), (uint(u_xlatb4.z) * 0xffffffffu) | uint(u_xlati5.y)));
        u_xlati4.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | uint(u_xlati4.x), (uint(u_xlatb4.w) * 0xffffffffu) | uint(u_xlati4.z)));
        u_xlat3.x = (u_xlati4.x != 0) ? 0.0 : u_xlat3.x;
        u_xlat10 = texture(_MainTex, u_xlat3.zw).w;
        u_xlat10 = (u_xlati4.y != 0) ? 0.0 : u_xlat10;
        u_xlat3.x = u_xlat10 + u_xlat3.x;
        u_xlat4 = u_xlat1.zwzw * vec4(0.707099974, -0.707099974, 0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat10 = texture(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati17.xy = ivec2(uvec2((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu), (uint(u_xlatb6.w) * 0xffffffffu) | (uint(u_xlatb6.z) * 0xffffffffu)));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati17.xy = ivec2(uvec2(uint(u_xlati17.x) | (uint(u_xlatb5.x) * 0xffffffffu), uint(u_xlati17.y) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlati17.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | uint(u_xlati17.x), (uint(u_xlatb5.w) * 0xffffffffu) | uint(u_xlati17.y)));
        u_xlat10 = (u_xlati17.x != 0) ? 0.0 : u_xlat10;
        u_xlat3.x = u_xlat10 + u_xlat3.x;
        u_xlat10 = texture(_MainTex, u_xlat4.zw).w;
        u_xlat10 = (u_xlati17.y != 0) ? 0.0 : u_xlat10;
        u_xlat3.x = u_xlat10 + u_xlat3.x;
        u_xlat1 = u_xlat1 * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat1 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat1.x = texture(_MainTex, u_xlat1.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati10.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | (uint(u_xlatb5.x) * 0xffffffffu), (uint(u_xlatb5.w) * 0xffffffffu) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati10.xy = ivec2(uvec2(uint(u_xlati10.x) | (uint(u_xlatb4.x) * 0xffffffffu), uint(u_xlati10.y) | (uint(u_xlatb4.z) * 0xffffffffu)));
        u_xlati10.xy = ivec2(uvec2((uint(u_xlatb4.y) * 0xffffffffu) | uint(u_xlati10.x), (uint(u_xlatb4.w) * 0xffffffffu) | uint(u_xlati10.y)));
        u_xlat1.x = (u_xlati10.x != 0) ? 0.0 : u_xlat1.x;
        u_xlat1.x = u_xlat1.x + u_xlat3.x;
        u_xlat4.yz = vs_TEXCOORD3.ww;
        u_xlat4.x = float(1.0);
        u_xlat4.w = float(0.0);
        u_xlat5 = u_xlat4.yxxy * _MainTex_TexelSize.xyxy;
        u_xlat4 = u_xlat5 * u_xlat4.wzzw + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat8.x = texture(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati3.xy = ivec2(uvec2((uint(u_xlatb6.y) * 0xffffffffu) | (uint(u_xlatb6.x) * 0xffffffffu), (uint(u_xlatb6.w) * 0xffffffffu) | (uint(u_xlatb6.z) * 0xffffffffu)));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati3.xy = ivec2(uvec2(uint(u_xlati3.x) | (uint(u_xlatb5.x) * 0xffffffffu), uint(u_xlati3.y) | (uint(u_xlatb5.z) * 0xffffffffu)));
        u_xlati3.xy = ivec2(uvec2((uint(u_xlatb5.y) * 0xffffffffu) | uint(u_xlati3.x), (uint(u_xlatb5.w) * 0xffffffffu) | uint(u_xlati3.y)));
        u_xlat8.x = (u_xlati3.x != 0) ? 0.0 : u_xlat8.x;
        u_xlat1.x = u_xlat8.x + u_xlat1.x;
        u_xlat8.x = texture(_MainTex, u_xlat1.zw).w;
        u_xlat8.x = (u_xlati10.y != 0) ? 0.0 : u_xlat8.x;
        u_xlat1.x = u_xlat8.x + u_xlat1.x;
        u_xlat8.x = texture(_MainTex, u_xlat4.zw).w;
        u_xlat8.x = (u_xlati3.y != 0) ? 0.0 : u_xlat8.x;
        u_xlat1.x = u_xlat8.x + u_xlat1.x;
        u_xlat1.x = min(u_xlat1.x, 1.0);
        u_xlat1.x = u_xlat1.x * 0.5;
        u_xlat16_1 = u_xlat1.x;
    } else {
        u_xlat16_1 = vs_TEXCOORD3.w;
    }
    u_xlat16_3.xyz = (-vs_TEXCOORD3.xyz);
    u_xlat16_3.w = (-u_xlat16_1);
    u_xlat16_0 = u_xlat0 + u_xlat16_3;
    SV_Target0.xyz = vec3(u_xlat16_2) * u_xlat16_0.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_0.w + u_xlat16_1;
    SV_Target0.w = u_xlat16_2 * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_OUTLINE_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3 = in_TEXCOORD3;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec3 _Color1;
uniform 	mediump vec3 _Color2;
uniform 	mediump float _Repeat;
uniform 	float _m_length;
uniform 	float _GradientOffset;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec2 u_xlati3;
vec4 u_xlat4;
ivec3 u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
ivec2 u_xlati5;
bvec4 u_xlatb5;
bvec4 u_xlatb6;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat10;
ivec2 u_xlati10;
bvec2 u_xlatb15;
ivec2 u_xlati17;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.w = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat1.x = vs_COLOR0.x + (-_GradientOffset);
    u_xlat1.x = u_xlat1.x * _Repeat;
    u_xlat1.x = u_xlat1.x * _m_length;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.0 + -1.0;
    u_xlat8.xyz = (-_Color1.xyz) + _Color2.xyz;
    u_xlat0.xyz = abs(u_xlat1.xxx) * u_xlat8.xyz + _Color1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.xy;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlatb15.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat1.xyxy).xy;
    u_xlatb15.x = u_xlatb15.y || u_xlatb15.x;
    u_xlatb1.xy = greaterThanEqual(u_xlat1.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.x || u_xlatb15.x;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_2 = (u_xlatb1.x) ? 0.0 : u_xlat0.w;
    u_xlatb1.x = 0.0<vs_TEXCOORD3.w;
    u_xlatb8 = u_xlat16_2!=1.0;
    u_xlatb1.x = u_xlatb8 && u_xlatb1.x;
    if(u_xlatb1.x){
        u_xlat1 = vs_TEXCOORD3.wwww * _MainTex_TexelSize.xyxy;
        u_xlat3 = u_xlat1.zwzw * vec4(-0.707099974, -0.707099974, -0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat3.x = texture2D(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati5.xy = op_or((ivec2(u_xlatb5.yw) * -1), (ivec2(u_xlatb5.xz) * -1));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati4.xz = op_or((ivec2(u_xlatb4.xz) * -1), u_xlati5.xy);
        u_xlati4.xy = op_or((ivec2(u_xlatb4.yw) * -1), u_xlati4.xz);
        u_xlat3.x = (u_xlati4.x != 0) ? 0.0 : u_xlat3.x;
        u_xlat10 = texture2D(_MainTex, u_xlat3.zw).w;
        u_xlat10 = (u_xlati4.y != 0) ? 0.0 : u_xlat10;
        u_xlat3.x = u_xlat10 + u_xlat3.x;
        u_xlat4 = u_xlat1.zwzw * vec4(0.707099974, -0.707099974, 0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat10 = texture2D(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati17.xy = op_or((ivec2(u_xlatb6.yw) * -1), (ivec2(u_xlatb6.xz) * -1));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati17.xy = op_or(u_xlati17.xy, (ivec2(u_xlatb5.xz) * -1));
        u_xlati17.xy = op_or((ivec2(u_xlatb5.yw) * -1), u_xlati17.xy);
        u_xlat10 = (u_xlati17.x != 0) ? 0.0 : u_xlat10;
        u_xlat3.x = u_xlat10 + u_xlat3.x;
        u_xlat10 = texture2D(_MainTex, u_xlat4.zw).w;
        u_xlat10 = (u_xlati17.y != 0) ? 0.0 : u_xlat10;
        u_xlat3.x = u_xlat10 + u_xlat3.x;
        u_xlat1 = u_xlat1 * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat1 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat1.x = texture2D(_MainTex, u_xlat1.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati10.xy = op_or((ivec2(u_xlatb5.yw) * -1), (ivec2(u_xlatb5.xz) * -1));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati10.xy = op_or(u_xlati10.xy, (ivec2(u_xlatb4.xz) * -1));
        u_xlati10.xy = op_or((ivec2(u_xlatb4.yw) * -1), u_xlati10.xy);
        u_xlat1.x = (u_xlati10.x != 0) ? 0.0 : u_xlat1.x;
        u_xlat1.x = u_xlat1.x + u_xlat3.x;
        u_xlat4.yz = vs_TEXCOORD3.ww;
        u_xlat4.x = float(1.0);
        u_xlat4.w = float(0.0);
        u_xlat5 = u_xlat4.yxxy * _MainTex_TexelSize.xyxy;
        u_xlat4 = u_xlat5 * u_xlat4.wzzw + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat8.x = texture2D(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati3.xy = op_or((ivec2(u_xlatb6.yw) * -1), (ivec2(u_xlatb6.xz) * -1));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati3.xy = op_or(u_xlati3.xy, (ivec2(u_xlatb5.xz) * -1));
        u_xlati3.xy = op_or((ivec2(u_xlatb5.yw) * -1), u_xlati3.xy);
        u_xlat8.x = (u_xlati3.x != 0) ? 0.0 : u_xlat8.x;
        u_xlat1.x = u_xlat8.x + u_xlat1.x;
        u_xlat8.x = texture2D(_MainTex, u_xlat1.zw).w;
        u_xlat8.x = (u_xlati10.y != 0) ? 0.0 : u_xlat8.x;
        u_xlat1.x = u_xlat8.x + u_xlat1.x;
        u_xlat8.x = texture2D(_MainTex, u_xlat4.zw).w;
        u_xlat8.x = (u_xlati3.y != 0) ? 0.0 : u_xlat8.x;
        u_xlat1.x = u_xlat8.x + u_xlat1.x;
        u_xlat1.x = min(u_xlat1.x, 1.0);
        u_xlat1.x = u_xlat1.x * 0.5;
        u_xlat16_1 = u_xlat1.x;
    } else {
        u_xlat16_1 = vs_TEXCOORD3.w;
    }
    u_xlat16_3.xyz = (-vs_TEXCOORD3.xyz);
    u_xlat16_3.w = (-u_xlat16_1);
    u_xlat16_0 = u_xlat0 + u_xlat16_3;
    SV_Target0.xyz = vec3(u_xlat16_2) * u_xlat16_0.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_0.w + u_xlat16_1;
    SV_Target0.w = u_xlat16_2 * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_OUTLINE_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_TEXCOORD3;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3 = in_TEXCOORD3;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec3 _Color1;
uniform 	mediump vec3 _Color2;
uniform 	mediump float _Repeat;
uniform 	float _m_length;
uniform 	float _GradientOffset;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec2 u_xlati3;
vec4 u_xlat4;
ivec3 u_xlati4;
bvec4 u_xlatb4;
vec4 u_xlat5;
ivec2 u_xlati5;
bvec4 u_xlatb5;
bvec4 u_xlatb6;
vec3 u_xlat8;
bool u_xlatb8;
float u_xlat10;
ivec2 u_xlati10;
bvec2 u_xlatb15;
ivec2 u_xlati17;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlat0.w = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat1.x = vs_COLOR0.x + (-_GradientOffset);
    u_xlat1.x = u_xlat1.x * _Repeat;
    u_xlat1.x = u_xlat1.x * _m_length;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * 2.0 + -1.0;
    u_xlat8.xyz = (-_Color1.xyz) + _Color2.xyz;
    u_xlat0.xyz = abs(u_xlat1.xxx) * u_xlat8.xyz + _Color1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.xy;
    u_xlat1.xy = u_xlat1.xy * vs_TEXCOORD2.zw;
    u_xlatb15.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat1.xyxy).xy;
    u_xlatb15.x = u_xlatb15.y || u_xlatb15.x;
    u_xlatb1.xy = greaterThanEqual(u_xlat1.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb1.x = u_xlatb1.x || u_xlatb15.x;
    u_xlatb1.x = u_xlatb1.y || u_xlatb1.x;
    u_xlat16_2 = (u_xlatb1.x) ? 0.0 : u_xlat0.w;
    u_xlatb1.x = 0.0<vs_TEXCOORD3.w;
    u_xlatb8 = u_xlat16_2!=1.0;
    u_xlatb1.x = u_xlatb8 && u_xlatb1.x;
    if(u_xlatb1.x){
        u_xlat1 = vs_TEXCOORD3.wwww * _MainTex_TexelSize.xyxy;
        u_xlat3 = u_xlat1.zwzw * vec4(-0.707099974, -0.707099974, -0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat3 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat3.x = texture2D(_MainTex, u_xlat3.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati5.xy = op_or((ivec2(u_xlatb5.yw) * -1), (ivec2(u_xlatb5.xz) * -1));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati4.xz = op_or((ivec2(u_xlatb4.xz) * -1), u_xlati5.xy);
        u_xlati4.xy = op_or((ivec2(u_xlatb4.yw) * -1), u_xlati4.xz);
        u_xlat3.x = (u_xlati4.x != 0) ? 0.0 : u_xlat3.x;
        u_xlat10 = texture2D(_MainTex, u_xlat3.zw).w;
        u_xlat10 = (u_xlati4.y != 0) ? 0.0 : u_xlat10;
        u_xlat3.x = u_xlat10 + u_xlat3.x;
        u_xlat4 = u_xlat1.zwzw * vec4(0.707099974, -0.707099974, 0.707099974, 0.707099974) + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat10 = texture2D(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati17.xy = op_or((ivec2(u_xlatb6.yw) * -1), (ivec2(u_xlatb6.xz) * -1));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati17.xy = op_or(u_xlati17.xy, (ivec2(u_xlatb5.xz) * -1));
        u_xlati17.xy = op_or((ivec2(u_xlatb5.yw) * -1), u_xlati17.xy);
        u_xlat10 = (u_xlati17.x != 0) ? 0.0 : u_xlat10;
        u_xlat3.x = u_xlat10 + u_xlat3.x;
        u_xlat10 = texture2D(_MainTex, u_xlat4.zw).w;
        u_xlat10 = (u_xlati17.y != 0) ? 0.0 : u_xlat10;
        u_xlat3.x = u_xlat10 + u_xlat3.x;
        u_xlat1 = u_xlat1 * vec4(0.0, -1.0, -1.0, 0.0) + vs_TEXCOORD0.xyxy;
        u_xlat4 = u_xlat1 + vs_TEXCOORD2.xyxy;
        u_xlat4 = u_xlat4 * vs_TEXCOORD2.zwzw;
        u_xlat1.x = texture2D(_MainTex, u_xlat1.xy).w;
        u_xlatb5 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat4);
        u_xlati10.xy = op_or((ivec2(u_xlatb5.yw) * -1), (ivec2(u_xlatb5.xz) * -1));
        u_xlatb4 = greaterThanEqual(u_xlat4, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati10.xy = op_or(u_xlati10.xy, (ivec2(u_xlatb4.xz) * -1));
        u_xlati10.xy = op_or((ivec2(u_xlatb4.yw) * -1), u_xlati10.xy);
        u_xlat1.x = (u_xlati10.x != 0) ? 0.0 : u_xlat1.x;
        u_xlat1.x = u_xlat1.x + u_xlat3.x;
        u_xlat4.yz = vs_TEXCOORD3.ww;
        u_xlat4.x = float(1.0);
        u_xlat4.w = float(0.0);
        u_xlat5 = u_xlat4.yxxy * _MainTex_TexelSize.xyxy;
        u_xlat4 = u_xlat5 * u_xlat4.wzzw + vs_TEXCOORD0.xyxy;
        u_xlat5 = u_xlat4 + vs_TEXCOORD2.xyxy;
        u_xlat5 = u_xlat5 * vs_TEXCOORD2.zwzw;
        u_xlat8.x = texture2D(_MainTex, u_xlat4.xy).w;
        u_xlatb6 = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat5);
        u_xlati3.xy = op_or((ivec2(u_xlatb6.yw) * -1), (ivec2(u_xlatb6.xz) * -1));
        u_xlatb5 = greaterThanEqual(u_xlat5, vec4(1.0, 1.0, 1.0, 1.0));
        u_xlati3.xy = op_or(u_xlati3.xy, (ivec2(u_xlatb5.xz) * -1));
        u_xlati3.xy = op_or((ivec2(u_xlatb5.yw) * -1), u_xlati3.xy);
        u_xlat8.x = (u_xlati3.x != 0) ? 0.0 : u_xlat8.x;
        u_xlat1.x = u_xlat8.x + u_xlat1.x;
        u_xlat8.x = texture2D(_MainTex, u_xlat1.zw).w;
        u_xlat8.x = (u_xlati10.y != 0) ? 0.0 : u_xlat8.x;
        u_xlat1.x = u_xlat8.x + u_xlat1.x;
        u_xlat8.x = texture2D(_MainTex, u_xlat4.zw).w;
        u_xlat8.x = (u_xlati3.y != 0) ? 0.0 : u_xlat8.x;
        u_xlat1.x = u_xlat8.x + u_xlat1.x;
        u_xlat1.x = min(u_xlat1.x, 1.0);
        u_xlat1.x = u_xlat1.x * 0.5;
        u_xlat16_1 = u_xlat1.x;
    } else {
        u_xlat16_1 = vs_TEXCOORD3.w;
    }
    u_xlat16_3.xyz = (-vs_TEXCOORD3.xyz);
    u_xlat16_3.w = (-u_xlat16_1);
    u_xlat16_0 = u_xlat0 + u_xlat16_3;
    SV_Target0.xyz = vec3(u_xlat16_2) * u_xlat16_0.xyz + vs_TEXCOORD3.xyz;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_0.w + u_xlat16_1;
    SV_Target0.w = u_xlat16_2 * vs_COLOR0.w;
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
Local Keywords { "_OUTLINE_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_OUTLINE_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_OUTLINE_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_OUTLINE_NEW" }
""
}
}
}
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 91074
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
mediump float u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat16_0;
    SV_Target0.xyz = vs_COLOR0.xyz;
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
mediump float u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat16_0;
    SV_Target0.xyz = vs_COLOR0.xyz;
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
lowp float u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat10_0;
    SV_Target0.xyz = vs_COLOR0.xyz;
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
lowp float u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy).w;
    SV_Target0.w = u_xlat10_0;
    SV_Target0.xyz = vs_COLOR0.xyz;
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