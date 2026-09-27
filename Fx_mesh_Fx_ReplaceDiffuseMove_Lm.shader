//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Fx_mesh/Fx_ReplaceDiffuseMove_Lm" {
Properties {

_MainTex_B ("MainTex_B", 2D) = "white" { }

_MainTex_A ("MainTex_A", 2D) = "white" { }

_MainPw ("MainPw", Float) = 1.0

_Cut_tex ("Cut_tex (R,G)", 2D) = "white" { }

_Cutoff ("R_Cutoff", Range(0, 2)) = 0.0

_G_Cutoff ("G_Cutoff", Range(0, 2)) = 0.0

_Edge_color ("Edge_color", Color) = (0.5,0.5,0.5,1)

_Edge_Pw ("Edge_Pw", Float) = 1.0

_Cutoff_Width ("Cutoff_Width", Range(0, 1)) = 0.0

_WindEdgeFlutterFactor ("顶点扰动波幅", Float) = 0.5

_WindEdgeFlutterFrequence ("顶点扰动波频", Float) = 0.5

_WindEdgeFlutterSpeed ("顶点扰动速度", Float) = 0.5

_WindParams ("顶点扰动方向", Vector) = (1,1,1,1)

_Lightmap ("Lightmap", 2D) = "grey" { }

_LM_Intensity ("LM_Intensity", Float) = 1.0

_Light_Color ("lightmap附加颜色", Color) = (0.5,0.5,0.5,1)

[Header(Fog)] [MaterialToggle] _EnableCustomFog ("打开雾效", Float) = 0.0

_FogColor ("雾效颜色", Color) = (1,1,1,1)

_FogDistance ("雾效距离", Float) = 1000.0

_FogFade ("雾效衰减", Float) = 1.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
 ZWrite Off
  GpuProgramID 28024
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
uniform 	float _WindEdgeFlutterFrequence;
uniform 	float _WindEdgeFlutterFactor;
uniform 	float _WindEdgeFlutterSpeed;
uniform 	vec4 _WindParams;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _WindEdgeFlutterFrequence;
    u_xlat2.x = _Time.x * _WindEdgeFlutterSpeed;
    u_xlat0.x = u_xlat2.x * 10.0 + u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlat2.x = abs(u_xlat0.x) * abs(u_xlat0.x);
    u_xlat0.x = -abs(u_xlat0.x) * 2.0 + 3.0;
    u_xlat0.x = dot(u_xlat2.xx, u_xlat0.xx);
    u_xlat0.x = u_xlat0.x * _WindEdgeFlutterFactor;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * _WindParams.yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _MainTex_B_ST;
uniform 	vec4 _MainTex_A_ST;
uniform 	float _MainPw;
uniform 	vec4 _Cut_tex_ST;
uniform 	float _Cutoff;
uniform 	float _G_Cutoff;
uniform 	vec4 _Edge_color;
uniform 	float _Edge_Pw;
uniform 	float _Cutoff_Width;
uniform 	vec4 _Lightmap_ST;
uniform 	float _LM_Intensity;
uniform 	vec4 _Light_Color;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
UNITY_LOCATION(0) uniform mediump sampler2D _Cut_tex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex_B;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex_A;
UNITY_LOCATION(3) uniform mediump sampler2D _Lightmap;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec2 u_xlat16_6;
vec2 u_xlat12;
float u_xlat18;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _FogDistance;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat6.x = max(_FogFade, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat6.xy = vs_TEXCOORD0.zw * _Cut_tex_ST.xy + _Cut_tex_ST.zw;
    u_xlat16_6.xy = texture(_Cut_tex, u_xlat6.xy).xy;
    u_xlat6.xy = u_xlat16_6.xy + vec2(1.0, 1.0);
    u_xlat6.xy = u_xlat6.xy + (-vec2(_Cutoff, _G_Cutoff));
    u_xlat18 = (-_Cutoff_Width) * 49.0 + 50.0;
    u_xlat6.xy = vec2(u_xlat18) * u_xlat6.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xy = min(max(u_xlat6.xy, 0.0), 1.0);
#else
    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
#endif
    u_xlat6.x = min(u_xlat6.y, u_xlat6.x);
    u_xlat12.xy = vs_TEXCOORD0.xy * _MainTex_B_ST.xy + _MainTex_B_ST.zw;
    u_xlat16_1 = texture(_MainTex_B, u_xlat12.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat12.xy = vs_TEXCOORD0.xy * _MainTex_A_ST.xy + _MainTex_A_ST.zw;
    u_xlat16_3 = texture(_MainTex_A, u_xlat12.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat6.xxx * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat12.x = u_xlat16_1.w + (-u_xlat16_3.w);
    SV_Target0.w = u_xlat6.x * u_xlat12.x + u_xlat16_3.w;
    u_xlat6.x = u_xlat6.x * (-u_xlat6.x) + u_xlat6.x;
    u_xlat2.xyz = _Edge_color.xyz * vec3(_Edge_Pw);
    u_xlat6.xyz = u_xlat2.xyz * u_xlat6.xxx + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(_MainPw);
    u_xlat1.xy = vs_TEXCOORD1.xy * _Lightmap_ST.xy + _Lightmap_ST.zw;
    u_xlat16_1.xyz = texture(_Lightmap, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _Light_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_LM_Intensity);
    u_xlat2.xyz = (-u_xlat6.xyz) * u_xlat1.xyz + _FogColor.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat1.xyz + u_xlat6.xyz;
    u_xlat16_5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	float _WindEdgeFlutterFrequence;
uniform 	float _WindEdgeFlutterFactor;
uniform 	float _WindEdgeFlutterSpeed;
uniform 	vec4 _WindParams;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _WindEdgeFlutterFrequence;
    u_xlat2.x = _Time.x * _WindEdgeFlutterSpeed;
    u_xlat0.x = u_xlat2.x * 10.0 + u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlat2.x = abs(u_xlat0.x) * abs(u_xlat0.x);
    u_xlat0.x = -abs(u_xlat0.x) * 2.0 + 3.0;
    u_xlat0.x = dot(u_xlat2.xx, u_xlat0.xx);
    u_xlat0.x = u_xlat0.x * _WindEdgeFlutterFactor;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * _WindParams.yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _MainTex_B_ST;
uniform 	vec4 _MainTex_A_ST;
uniform 	float _MainPw;
uniform 	vec4 _Cut_tex_ST;
uniform 	float _Cutoff;
uniform 	float _G_Cutoff;
uniform 	vec4 _Edge_color;
uniform 	float _Edge_Pw;
uniform 	float _Cutoff_Width;
uniform 	vec4 _Lightmap_ST;
uniform 	float _LM_Intensity;
uniform 	vec4 _Light_Color;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
UNITY_LOCATION(0) uniform mediump sampler2D _Cut_tex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex_B;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex_A;
UNITY_LOCATION(3) uniform mediump sampler2D _Lightmap;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec2 u_xlat16_6;
vec2 u_xlat12;
float u_xlat18;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _FogDistance;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat6.x = max(_FogFade, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat6.xy = vs_TEXCOORD0.zw * _Cut_tex_ST.xy + _Cut_tex_ST.zw;
    u_xlat16_6.xy = texture(_Cut_tex, u_xlat6.xy).xy;
    u_xlat6.xy = u_xlat16_6.xy + vec2(1.0, 1.0);
    u_xlat6.xy = u_xlat6.xy + (-vec2(_Cutoff, _G_Cutoff));
    u_xlat18 = (-_Cutoff_Width) * 49.0 + 50.0;
    u_xlat6.xy = vec2(u_xlat18) * u_xlat6.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xy = min(max(u_xlat6.xy, 0.0), 1.0);
#else
    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
#endif
    u_xlat6.x = min(u_xlat6.y, u_xlat6.x);
    u_xlat12.xy = vs_TEXCOORD0.xy * _MainTex_B_ST.xy + _MainTex_B_ST.zw;
    u_xlat16_1 = texture(_MainTex_B, u_xlat12.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat12.xy = vs_TEXCOORD0.xy * _MainTex_A_ST.xy + _MainTex_A_ST.zw;
    u_xlat16_3 = texture(_MainTex_A, u_xlat12.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat16_3.xyz * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat6.xxx * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat12.x = u_xlat16_1.w + (-u_xlat16_3.w);
    SV_Target0.w = u_xlat6.x * u_xlat12.x + u_xlat16_3.w;
    u_xlat6.x = u_xlat6.x * (-u_xlat6.x) + u_xlat6.x;
    u_xlat2.xyz = _Edge_color.xyz * vec3(_Edge_Pw);
    u_xlat6.xyz = u_xlat2.xyz * u_xlat6.xxx + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(_MainPw);
    u_xlat1.xy = vs_TEXCOORD1.xy * _Lightmap_ST.xy + _Lightmap_ST.zw;
    u_xlat16_1.xyz = texture(_Lightmap, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _Light_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_LM_Intensity);
    u_xlat2.xyz = (-u_xlat6.xyz) * u_xlat1.xyz + _FogColor.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat1.xyz + u_xlat6.xyz;
    u_xlat16_5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	float _WindEdgeFlutterFrequence;
uniform 	float _WindEdgeFlutterFactor;
uniform 	float _WindEdgeFlutterSpeed;
uniform 	vec4 _WindParams;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _WindEdgeFlutterFrequence;
    u_xlat2.x = _Time.x * _WindEdgeFlutterSpeed;
    u_xlat0.x = u_xlat2.x * 10.0 + u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlat2.x = abs(u_xlat0.x) * abs(u_xlat0.x);
    u_xlat0.x = -abs(u_xlat0.x) * 2.0 + 3.0;
    u_xlat0.x = dot(u_xlat2.xx, u_xlat0.xx);
    u_xlat0.x = u_xlat0.x * _WindEdgeFlutterFactor;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * _WindParams.yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _MainTex_B_ST;
uniform 	vec4 _MainTex_A_ST;
uniform 	float _MainPw;
uniform 	vec4 _Cut_tex_ST;
uniform 	float _Cutoff;
uniform 	float _G_Cutoff;
uniform 	vec4 _Edge_color;
uniform 	float _Edge_Pw;
uniform 	float _Cutoff_Width;
uniform 	vec4 _Lightmap_ST;
uniform 	float _LM_Intensity;
uniform 	vec4 _Light_Color;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform lowp sampler2D _Cut_tex;
uniform lowp sampler2D _MainTex_B;
uniform lowp sampler2D _MainTex_A;
uniform lowp sampler2D _Lightmap;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp vec2 u_xlat10_6;
vec2 u_xlat12;
float u_xlat18;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _FogDistance;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat6.x = max(_FogFade, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat6.xy = vs_TEXCOORD0.zw * _Cut_tex_ST.xy + _Cut_tex_ST.zw;
    u_xlat10_6.xy = texture2D(_Cut_tex, u_xlat6.xy).xy;
    u_xlat6.xy = u_xlat10_6.xy + vec2(1.0, 1.0);
    u_xlat6.xy = u_xlat6.xy + (-vec2(_Cutoff, _G_Cutoff));
    u_xlat18 = (-_Cutoff_Width) * 49.0 + 50.0;
    u_xlat6.xy = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
    u_xlat6.x = min(u_xlat6.y, u_xlat6.x);
    u_xlat12.xy = vs_TEXCOORD0.xy * _MainTex_B_ST.xy + _MainTex_B_ST.zw;
    u_xlat10_1 = texture2D(_MainTex_B, u_xlat12.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat10_1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat12.xy = vs_TEXCOORD0.xy * _MainTex_A_ST.xy + _MainTex_A_ST.zw;
    u_xlat10_3 = texture2D(_MainTex_A, u_xlat12.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_3.xyz * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat6.xxx * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat12.x = u_xlat10_1.w + (-u_xlat10_3.w);
    SV_Target0.w = u_xlat6.x * u_xlat12.x + u_xlat10_3.w;
    u_xlat6.x = u_xlat6.x * (-u_xlat6.x) + u_xlat6.x;
    u_xlat2.xyz = _Edge_color.xyz * vec3(_Edge_Pw);
    u_xlat6.xyz = u_xlat2.xyz * u_xlat6.xxx + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(_MainPw);
    u_xlat1.xy = vs_TEXCOORD1.xy * _Lightmap_ST.xy + _Lightmap_ST.zw;
    u_xlat10_1.xyz = texture2D(_Lightmap, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _Light_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_LM_Intensity);
    u_xlat2.xyz = (-u_xlat6.xyz) * u_xlat1.xyz + _FogColor.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat1.xyz + u_xlat6.xyz;
    u_xlat16_5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	float _WindEdgeFlutterFrequence;
uniform 	float _WindEdgeFlutterFactor;
uniform 	float _WindEdgeFlutterSpeed;
uniform 	vec4 _WindParams;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
void main()
{
    u_xlat0.x = dot(in_POSITION0.xyz, in_POSITION0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _WindEdgeFlutterFrequence;
    u_xlat2.x = _Time.x * _WindEdgeFlutterSpeed;
    u_xlat0.x = u_xlat2.x * 10.0 + u_xlat0.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlat2.x = abs(u_xlat0.x) * abs(u_xlat0.x);
    u_xlat0.x = -abs(u_xlat0.x) * 2.0 + 3.0;
    u_xlat0.x = dot(u_xlat2.xx, u_xlat0.xx);
    u_xlat0.x = u_xlat0.x * _WindEdgeFlutterFactor;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * _WindParams.yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WindParams.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WindParams.zzz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _MainTex_B_ST;
uniform 	vec4 _MainTex_A_ST;
uniform 	float _MainPw;
uniform 	vec4 _Cut_tex_ST;
uniform 	float _Cutoff;
uniform 	float _G_Cutoff;
uniform 	vec4 _Edge_color;
uniform 	float _Edge_Pw;
uniform 	float _Cutoff_Width;
uniform 	vec4 _Lightmap_ST;
uniform 	float _LM_Intensity;
uniform 	vec4 _Light_Color;
uniform 	mediump float _EnableCustomFog;
uniform 	vec4 _FogColor;
uniform 	float _FogDistance;
uniform 	float _FogFade;
uniform lowp sampler2D _Cut_tex;
uniform lowp sampler2D _MainTex_B;
uniform lowp sampler2D _MainTex_A;
uniform lowp sampler2D _Lightmap;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
lowp vec2 u_xlat10_6;
vec2 u_xlat12;
float u_xlat18;
void main()
{
    u_xlat0.xyz = vs_TEXCOORD2.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _FogDistance;
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat6.x = max(_FogFade, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat6.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat6.xy = vs_TEXCOORD0.zw * _Cut_tex_ST.xy + _Cut_tex_ST.zw;
    u_xlat10_6.xy = texture2D(_Cut_tex, u_xlat6.xy).xy;
    u_xlat6.xy = u_xlat10_6.xy + vec2(1.0, 1.0);
    u_xlat6.xy = u_xlat6.xy + (-vec2(_Cutoff, _G_Cutoff));
    u_xlat18 = (-_Cutoff_Width) * 49.0 + 50.0;
    u_xlat6.xy = vec2(u_xlat18) * u_xlat6.xy;
    u_xlat6.xy = clamp(u_xlat6.xy, 0.0, 1.0);
    u_xlat6.x = min(u_xlat6.y, u_xlat6.x);
    u_xlat12.xy = vs_TEXCOORD0.xy * _MainTex_B_ST.xy + _MainTex_B_ST.zw;
    u_xlat10_1 = texture2D(_MainTex_B, u_xlat12.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat10_1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat12.xy = vs_TEXCOORD0.xy * _MainTex_A_ST.xy + _MainTex_A_ST.zw;
    u_xlat10_3 = texture2D(_MainTex_A, u_xlat12.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_3.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat3.xyz = u_xlat10_3.xyz * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat6.xxx * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat12.x = u_xlat10_1.w + (-u_xlat10_3.w);
    SV_Target0.w = u_xlat6.x * u_xlat12.x + u_xlat10_3.w;
    u_xlat6.x = u_xlat6.x * (-u_xlat6.x) + u_xlat6.x;
    u_xlat2.xyz = _Edge_color.xyz * vec3(_Edge_Pw);
    u_xlat6.xyz = u_xlat2.xyz * u_xlat6.xxx + u_xlat1.xyz;
    u_xlat6.xyz = u_xlat6.xyz * vec3(_MainPw);
    u_xlat1.xy = vs_TEXCOORD1.xy * _Lightmap_ST.xy + _Lightmap_ST.zw;
    u_xlat10_1.xyz = texture2D(_Lightmap, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _Light_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_LM_Intensity);
    u_xlat2.xyz = (-u_xlat6.xyz) * u_xlat1.xyz + _FogColor.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat0.xyz = vec3(_EnableCustomFog) * u_xlat1.xyz + u_xlat6.xyz;
    u_xlat16_5.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
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