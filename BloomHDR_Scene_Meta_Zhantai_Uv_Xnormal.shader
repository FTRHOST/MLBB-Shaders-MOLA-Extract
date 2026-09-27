//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "BloomHDR/Scene/Meta_Zhantai_Uv_Xnormal" {
Properties {

_Usage ("仅能用于25年上半年SPD新皮肤", Float) = 1.0

_Diff ("Diff", 2D) = "white" { }

_light_PW ("light_PW", Float) = 5.0

_Light ("Light", 2D) = "white" { }

_Light_C ("Light_C", Color) = (0.5,0.5,0.5,1)

[Toggle(_FOG_ON)] _FOG_ON ("雾开关", Float) = 0.0

[Enum(Off,0,ON,1)] _CameraON ("CameraON", Float) = 0.0

_FogColor ("FogColor", Color) = (1,1,1,1)

_FogHigh ("FogHigh", Float) = 0.0

_FogHightStart ("FogHightStart", Float) = 0.0

_FogHightEnd ("FogHightEnd", Float) = 0.0

_FogLinearStart ("FogLinearStart", Float) = 0.0

_FogLinearEnd ("FogLinearEnd", Float) = 0.0

_FogGradient ("FogGradient", 2D) = "white" { }

_FogPosition ("FogPosition", Vector) = (0,0,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "ForwardBase"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 50405
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
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
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_2.xyz = texture(_Diff, u_xlat2.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat0.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_1.xyz : u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_2.xyz = texture(_Diff, u_xlat2.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat0.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_1.xyz : u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Light;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff, u_xlat2.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_2.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat0.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_1.xyz : u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Light;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff, u_xlat2.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_2.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat0.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_1.xyz : u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_2.xyz = texture(_Diff, u_xlat2.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat0.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_1.xyz : u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_0.xyz = texture(_Light, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_2.xyz = texture(_Diff, u_xlat2.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = log2(u_xlat0.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_1.xyz : u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Light;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff, u_xlat2.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_2.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat0.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_1.xyz : u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Light;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_0.xyz = texture2D(_Light, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(_light_PW);
    u_xlat0.xyz = u_xlat0.xyz * _Light_C.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_2.xyz = texture2D(_Diff, u_xlat2.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_2.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    u_xlat16_1.xyz = log2(u_xlat0.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_1.xyz = exp2(u_xlat16_1.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_3.xyz = max(u_xlat16_1.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_1.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_3.xyz = u_xlat16_4.xyz / u_xlat16_3.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_1.xyz : u_xlat16_3.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_FOG_ON" }
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
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
UNITY_LOCATION(2) uniform mediump sampler2D _FogGradient;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat12;
void main()
{
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat6.x = -abs(u_xlat6.x) + _FogHightEnd;
    u_xlat12 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.y = u_xlat6.x / u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.y = min(max(u_xlat0.y, 0.0), 1.0);
#else
    u_xlat0.y = clamp(u_xlat0.y, 0.0, 1.0);
#endif
    u_xlat0.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
    u_xlat6.x = (-u_xlat0.y) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.y = 0.5;
    u_xlat16_6.xyz = texture(_FogGradient, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_1.xyz = texture(_Light, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_3.xyz = texture(_Diff, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = _FogColor.xyz * u_xlat16_6.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_4.xyz = u_xlat16_5.xyz / u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_FOG_ON" }
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
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
UNITY_LOCATION(2) uniform mediump sampler2D _FogGradient;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat12;
void main()
{
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat6.x = -abs(u_xlat6.x) + _FogHightEnd;
    u_xlat12 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.y = u_xlat6.x / u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.y = min(max(u_xlat0.y, 0.0), 1.0);
#else
    u_xlat0.y = clamp(u_xlat0.y, 0.0, 1.0);
#endif
    u_xlat0.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
    u_xlat6.x = (-u_xlat0.y) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.y = 0.5;
    u_xlat16_6.xyz = texture(_FogGradient, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_1.xyz = texture(_Light, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_3.xyz = texture(_Diff, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = _FogColor.xyz * u_xlat16_6.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_4.xyz = u_xlat16_5.xyz / u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_FOG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
float u_xlat12;
void main()
{
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat6.x = -abs(u_xlat6.x) + _FogHightEnd;
    u_xlat12 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.y = u_xlat6.x / u_xlat12;
    u_xlat0.y = clamp(u_xlat0.y, 0.0, 1.0);
    u_xlat0.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
    u_xlat6.x = (-u_xlat0.y) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.y = 0.5;
    u_xlat10_6.xyz = texture2D(_FogGradient, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_1.xyz = texture2D(_Light, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_3.xyz = texture2D(_Diff, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat6.xyz = _FogColor.xyz * u_xlat10_6.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_4.xyz = u_xlat16_5.xyz / u_xlat16_4.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_FOG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
float u_xlat12;
void main()
{
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat6.x = -abs(u_xlat6.x) + _FogHightEnd;
    u_xlat12 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.y = u_xlat6.x / u_xlat12;
    u_xlat0.y = clamp(u_xlat0.y, 0.0, 1.0);
    u_xlat0.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
    u_xlat6.x = (-u_xlat0.y) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.y = 0.5;
    u_xlat10_6.xyz = texture2D(_FogGradient, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_1.xyz = texture2D(_Light, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_3.xyz = texture2D(_Diff, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat6.xyz = _FogColor.xyz * u_xlat10_6.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_4.xyz = u_xlat16_5.xyz / u_xlat16_4.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_FOG_ON" }
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
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
UNITY_LOCATION(2) uniform mediump sampler2D _FogGradient;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat12;
void main()
{
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat6.x = -abs(u_xlat6.x) + _FogHightEnd;
    u_xlat12 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.y = u_xlat6.x / u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.y = min(max(u_xlat0.y, 0.0), 1.0);
#else
    u_xlat0.y = clamp(u_xlat0.y, 0.0, 1.0);
#endif
    u_xlat0.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
    u_xlat6.x = (-u_xlat0.y) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.y = 0.5;
    u_xlat16_6.xyz = texture(_FogGradient, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_1.xyz = texture(_Light, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_3.xyz = texture(_Diff, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = _FogColor.xyz * u_xlat16_6.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_4.xyz = u_xlat16_5.xyz / u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_FOG_ON" }
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
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
UNITY_LOCATION(0) uniform mediump sampler2D _Diff;
UNITY_LOCATION(1) uniform mediump sampler2D _Light;
UNITY_LOCATION(2) uniform mediump sampler2D _FogGradient;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat12;
void main()
{
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat6.x = -abs(u_xlat6.x) + _FogHightEnd;
    u_xlat12 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.y = u_xlat6.x / u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.y = min(max(u_xlat0.y, 0.0), 1.0);
#else
    u_xlat0.y = clamp(u_xlat0.y, 0.0, 1.0);
#endif
    u_xlat0.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
    u_xlat6.x = (-u_xlat0.y) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.y = 0.5;
    u_xlat16_6.xyz = texture(_FogGradient, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat16_1.xyz = texture(_Light, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat16_3.xyz = texture(_Diff, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat6.xyz = _FogColor.xyz * u_xlat16_6.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_4.xyz = u_xlat16_5.xyz / u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb0 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_FOG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
float u_xlat12;
void main()
{
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat6.x = -abs(u_xlat6.x) + _FogHightEnd;
    u_xlat12 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.y = u_xlat6.x / u_xlat12;
    u_xlat0.y = clamp(u_xlat0.y, 0.0, 1.0);
    u_xlat0.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
    u_xlat6.x = (-u_xlat0.y) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.y = 0.5;
    u_xlat10_6.xyz = texture2D(_FogGradient, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_1.xyz = texture2D(_Light, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_3.xyz = texture2D(_Diff, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat6.xyz = _FogColor.xyz * u_xlat10_6.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_4.xyz = u_xlat16_5.xyz / u_xlat16_4.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_FOG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
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
uniform 	mediump float _COLOR_MODE;
uniform 	vec4 _Diff_ST;
uniform 	vec4 _Light_ST;
uniform 	float _light_PW;
uniform 	vec4 _Light_C;
uniform 	vec4 _FogColor;
uniform 	float _FogHightEnd;
uniform 	float _FogHigh;
uniform 	float _FogHightStart;
uniform 	float _FogLinearEnd;
uniform 	vec3 _FogPosition;
uniform 	float _FogLinearStart;
uniform 	float _CameraON;
uniform lowp sampler2D _Diff;
uniform lowp sampler2D _Light;
uniform lowp sampler2D _FogGradient;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
float u_xlat12;
void main()
{
    u_xlat0.xyz = _WorldSpaceCameraPos.xyz + (-_FogPosition.xyz);
    u_xlat0.xyz = vec3(_CameraON) * u_xlat0.xyz + _FogPosition.xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) + vs_TEXCOORD2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + _FogLinearEnd;
    u_xlat6.x = _FogLinearEnd + (-_FogLinearStart);
    u_xlat0.x = u_xlat0.x / u_xlat6.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = (-vs_TEXCOORD2.y) + _FogHigh;
    u_xlat6.x = -abs(u_xlat6.x) + _FogHightEnd;
    u_xlat12 = (-_FogHightStart) + _FogHightEnd;
    u_xlat0.y = u_xlat6.x / u_xlat12;
    u_xlat0.y = clamp(u_xlat0.y, 0.0, 1.0);
    u_xlat0.xy = (-u_xlat0.xy) + vec2(1.0, 1.0);
    u_xlat6.x = (-u_xlat0.y) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.y = 0.5;
    u_xlat10_6.xyz = texture2D(_FogGradient, u_xlat0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD1.xy * _Light_ST.xy + _Light_ST.zw;
    u_xlat10_1.xyz = texture2D(_Light, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(_light_PW);
    u_xlat1.xyz = u_xlat1.xyz * _Light_C.xyz;
    u_xlat3.xy = vs_TEXCOORD0.xy * _Diff_ST.xy + _Diff_ST.zw;
    u_xlat10_3.xyz = texture2D(_Diff, u_xlat3.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_3.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat10_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xyz;
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat6.xyz = _FogColor.xyz * u_xlat10_6.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat16_2.xyz = log2(abs(u_xlat0.xyz));
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
    u_xlat16_4.xyz = max(u_xlat16_2.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_5.xyz = u_xlat16_4.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_4.xyz = u_xlat16_5.xyz / u_xlat16_4.xyz;
    u_xlatb0 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_4.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_FOG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_FOG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_FOG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_FOG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_FOG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_FOG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_FOG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_FOG_ON" }
""
}
}
}
}
CustomEditor "Prometheus.PrometheusShaderGUI_ShowTemp"
}