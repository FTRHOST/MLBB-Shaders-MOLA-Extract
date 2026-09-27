//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/FX_Show_PBR" {
Properties {

_Intensity ("整体强度", Float) = 1.0

_DirectionalLight_Color ("平行光颜色", Color) = (1,1,1,1)

_Ambient_Color ("环境光颜色", Color) = (0.5,0.5,0.5,1)

_MainTex ("MainTex", 2D) = "white" { }

_Normal ("法线贴图", 2D) = "bump" { }

_Metal_Rough_Skin ("R:金属度 G:粗糙度 B:AO", 2D) = "white" { }

_Metal_Intensity ("金属度强度", Float) = 1.0

_Rough_Intensity ("粗糙度强度", Float) = 1.0

_AO_Intensity ("AO强度", Float) = 1.0

[Space(10)] [Header(CubeMap)] _Cube_Color ("Cube颜色", Color) = (0,0,0,1)

_Cube_Intensity ("Cube强度", Float) = 1.0

[Toggle(_USE_CUBEMAP)] _USE_CUBEMAP ("启用CubeMap", Float) = 0.0

_Cubemap ("Cubemap", Cube) = "_Skybox" { }

[Space(10)] [Header(Sanshe)] [Toggle(_Directional_Sanshe)] _Directional_Sanshe ("补光类型(关闭:边缘光;打开:平行光)", Float) = 0.0

_Sanshe_color ("补光颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe_Fw ("补光范围", Range(0, 10)) = 1.0

_Sanshe_Power ("补光强度", Float) = 0.0

_Sanshe_X ("补光X轴偏移", Range(-1, 1)) = 0.0

_Sanshe_Y ("补光Y轴偏移", Range(-1, 1)) = 0.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "ForwardBase"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
  GpuProgramID 44207
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat16_4.xyz = texture(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat16_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat9 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xyw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = u_xlat17.xxx * u_xlat1.xyw + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat16_4.xyz = texture(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat16_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat9 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xyw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = u_xlat17.xxx * u_xlat1.xyw + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat10_4.xyz = texture2D(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat10_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat26 = (-u_xlat10_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat9 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xyw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = u_xlat17.xxx * u_xlat1.xyw + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat10_4.xyz = texture2D(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat10_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat26 = (-u_xlat10_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat9 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xyw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = u_xlat17.xxx * u_xlat1.xyw + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_USE_CUBEMAP" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
float u_xlat28;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat16_4.xyz = texture(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat16_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xzw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat28 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat9 = u_xlat1.y * 8.0;
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat1.xzw = vec3(u_xlat28) * u_xlat1.xzw + u_xlat5.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat5.xyz, u_xlat9);
    u_xlat9 = u_xlat5.y * 0.200000003 + 0.800000012;
    u_xlat5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_0.www * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_USE_CUBEMAP" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
float u_xlat28;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat16_4.xyz = texture(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat16_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xzw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat28 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat9 = u_xlat1.y * 8.0;
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat1.xzw = vec3(u_xlat28) * u_xlat1.xzw + u_xlat5.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat5.xyz, u_xlat9);
    u_xlat9 = u_xlat5.y * 0.200000003 + 0.800000012;
    u_xlat5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_0.www * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_USE_CUBEMAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
float u_xlat28;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat10_4.xyz = texture2D(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat10_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat26 = (-u_xlat10_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xzw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat28 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat9 = u_xlat1.y * 8.0;
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat1.xzw = vec3(u_xlat28) * u_xlat1.xzw + u_xlat5.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat5.xyz, u_xlat9);
    u_xlat9 = u_xlat5.y * 0.200000003 + 0.800000012;
    u_xlat5.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat10_0.www * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_USE_CUBEMAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
float u_xlat28;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat10_4.xyz = texture2D(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat10_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat26 = (-u_xlat10_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xzw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat28 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat9 = u_xlat1.y * 8.0;
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat1.xzw = vec3(u_xlat28) * u_xlat1.xzw + u_xlat5.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat5.xyz, u_xlat9);
    u_xlat9 = u_xlat5.y * 0.200000003 + 0.800000012;
    u_xlat5.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat10_0.www * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = vs_TEXCOORD7.xy + vec2(_Sanshe_X, _Sanshe_Y);
    u_xlat4.z = vs_TEXCOORD7.z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = (-u_xlat25) + 1.0;
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat16_4.xyz = texture(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat16_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat9 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xyw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = u_xlat17.xxx * u_xlat1.xyw + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6.x = sin(u_xlat4.y);
    u_xlat7.x = cos(u_xlat4.y);
    u_xlat25 = u_xlat4.x + u_xlat7.x;
    u_xlat5.y = u_xlat6.x;
    u_xlat5.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat16_4.xyz = texture(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat16_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat9 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xyw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = u_xlat17.xxx * u_xlat1.xyw + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6.x = sin(u_xlat4.y);
    u_xlat7.x = cos(u_xlat4.y);
    u_xlat25 = u_xlat4.x + u_xlat7.x;
    u_xlat5.y = u_xlat6.x;
    u_xlat5.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat10_4.xyz = texture2D(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat10_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat26 = (-u_xlat10_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat9 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xyw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = u_xlat17.xxx * u_xlat1.xyw + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6.x = sin(u_xlat4.y);
    u_xlat7.x = cos(u_xlat4.y);
    u_xlat25 = u_xlat4.x + u_xlat7.x;
    u_xlat5.y = u_xlat6.x;
    u_xlat5.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat10_4.xyz = texture2D(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat10_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat26 = (-u_xlat10_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat9 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat6.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xyw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = u_xlat17.xxx * u_xlat1.xyw + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6.x = sin(u_xlat4.y);
    u_xlat7.x = cos(u_xlat4.y);
    u_xlat25 = u_xlat4.x + u_xlat7.x;
    u_xlat5.y = u_xlat6.x;
    u_xlat5.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_0.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
Local Keywords { "_USE_CUBEMAP" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
float u_xlat28;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat16_4.xyz = texture(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat16_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xzw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat28 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat9 = u_xlat1.y * 8.0;
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat1.xzw = vec3(u_xlat28) * u_xlat1.xzw + u_xlat5.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat5.xyz, u_xlat9);
    u_xlat9 = u_xlat5.y * 0.200000003 + 0.800000012;
    u_xlat5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_0.www * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6.x = sin(u_xlat4.y);
    u_xlat7.x = cos(u_xlat4.y);
    u_xlat25 = u_xlat4.x + u_xlat7.x;
    u_xlat5.y = u_xlat6.x;
    u_xlat5.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
Local Keywords { "_USE_CUBEMAP" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Metal_Rough_Skin;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump samplerCube _Cubemap;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
float u_xlat28;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat16_4.xyz = texture(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat16_5.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat16_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat16_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat26 = min(max(u_xlat26, 0.0), 1.0);
#else
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
#endif
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat16_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xzw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat28 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat9 = u_xlat1.y * 8.0;
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat1.xzw = vec3(u_xlat28) * u_xlat1.xzw + u_xlat5.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat16_0 = textureLod(_Cubemap, u_xlat5.xyz, u_xlat9);
    u_xlat9 = u_xlat5.y * 0.200000003 + 0.800000012;
    u_xlat5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat16_0.www * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6.x = sin(u_xlat4.y);
    u_xlat7.x = cos(u_xlat4.y);
    u_xlat25 = u_xlat4.x + u_xlat7.x;
    u_xlat5.y = u_xlat6.x;
    u_xlat5.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
Local Keywords { "_USE_CUBEMAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
float u_xlat28;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat10_4.xyz = texture2D(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat10_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat26 = (-u_xlat10_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xzw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat28 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat9 = u_xlat1.y * 8.0;
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat1.xzw = vec3(u_xlat28) * u_xlat1.xzw + u_xlat5.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat5.xyz, u_xlat9);
    u_xlat9 = u_xlat5.y * 0.200000003 + 0.800000012;
    u_xlat5.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat10_0.www * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6.x = sin(u_xlat4.y);
    u_xlat7.x = cos(u_xlat4.y);
    u_xlat25 = u_xlat4.x + u_xlat7.x;
    u_xlat5.y = u_xlat6.x;
    u_xlat5.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
Local Keywords { "_USE_CUBEMAP" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	float _Intensity;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Sanshe_Fw;
uniform 	float _Cube_Intensity;
uniform 	vec4 _Sanshe_color;
uniform 	vec4 _Cube_Color;
uniform 	vec4 _DirectionalLight_Color;
uniform 	float _Sanshe_Power;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Metal_Rough_Skin;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat9;
float u_xlat12;
vec2 u_xlat17;
mediump float u_xlat16_24;
float u_xlat25;
float u_xlat26;
float u_xlat28;
void main()
{
    u_xlat16_0.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_24 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_24 = inversesqrt(u_xlat16_24);
    u_xlat16_0.xyz = vec3(u_xlat16_24) * u_xlat16_0.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = u_xlat16_3.yyy * vs_TEXCOORD5.xyz;
    u_xlat2.xyz = u_xlat16_3.xxx * vs_TEXCOORD4.xyz + u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_3.zzz * vs_TEXCOORD3.xyz + u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat17.x = inversesqrt(u_xlat17.x);
    u_xlat2.xyz = u_xlat17.xxx * u_xlat2.xyz;
    u_xlat17.x = dot(u_xlat2.xyz, u_xlat16_0.xyz);
    u_xlat17.y = dot(u_xlat16_0.xyz, vs_TEXCOORD6.xyz);
    u_xlat17.xy = max(u_xlat17.xy, vec2(0.0, 0.0));
    u_xlat17.xy = u_xlat17.xy * u_xlat17.xy;
    u_xlat25 = max(u_xlat17.y, 0.100000001);
    u_xlat10_4.xyz = texture2D(_Metal_Rough_Skin, u_xlat1.xy).xyz;
    u_xlat10_5.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xy = u_xlat10_4.xy * vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
    u_xlat26 = (-u_xlat10_4.z) + 1.0;
    u_xlat26 = u_xlat26 * _AO_Intensity;
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat26 = (-u_xlat26) + 1.0;
    u_xlat4.x = u_xlat1.y * u_xlat1.y;
    u_xlat4.x = u_xlat1.y * u_xlat4.x;
    u_xlat17.x = u_xlat17.x * u_xlat4.x + (-u_xlat17.x);
    u_xlat17.x = u_xlat17.x + 1.0;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat12 = u_xlat1.y * u_xlat1.y + 0.5;
    u_xlat25 = u_xlat25 * u_xlat12;
    u_xlat17.x = u_xlat25 * u_xlat17.x;
    u_xlat17.x = u_xlat4.x / u_xlat17.x;
    u_xlat17.x = u_xlat17.x * 0.25 + -9.99999975e-06;
    u_xlat17.x = max(u_xlat17.x, 0.0);
    u_xlat17.x = min(u_xlat17.x, 20.0);
    u_xlat4.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_5.xyz * u_xlat4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat10_5.xyz;
    u_xlat5.xyz = u_xlat1.xxx * u_xlat6.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat6.xyz = u_xlat17.xxx * u_xlat5.xyz;
    u_xlat17.x = (-u_xlat1.x) + 1.0;
    u_xlat6.xyz = u_xlat17.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat7.xyz = u_xlat17.xxx * _Ambient_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat7.xyz;
    u_xlat4.xyz = vec3(u_xlat26) * u_xlat4.xyz;
    u_xlat4.xyz = u_xlat6.xyz * _DirectionalLight_Color.xyz + u_xlat4.xyz;
    u_xlat1.x = (-u_xlat1.y) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat1.xzw = (-u_xlat5.xyz) + u_xlat1.xxx;
    u_xlat28 = (-u_xlat1.y) * 0.980000019 + 1.0;
    u_xlat9 = u_xlat1.y * 8.0;
    u_xlat5.xyz = vec3(u_xlat28) * u_xlat5.xyz;
    u_xlat28 = dot(u_xlat2.xyz, vs_TEXCOORD7.xyz);
    u_xlat28 = max(u_xlat28, 0.0);
    u_xlat28 = (-u_xlat28) + 1.0;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat28 = u_xlat28 * u_xlat28;
    u_xlat1.xzw = vec3(u_xlat28) * u_xlat1.xzw + u_xlat5.xyz;
    u_xlat28 = dot((-vs_TEXCOORD7.xyz), u_xlat2.xyz);
    u_xlat28 = u_xlat28 + u_xlat28;
    u_xlat5.xyz = u_xlat2.xyz * (-vec3(u_xlat28)) + (-vs_TEXCOORD7.xyz);
    u_xlat10_0 = textureCubeLodEXT(_Cubemap, u_xlat5.xyz, u_xlat9);
    u_xlat9 = u_xlat5.y * 0.200000003 + 0.800000012;
    u_xlat5.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat10_0.www * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat26) * u_xlat5.xyz;
    u_xlat5.xyz = vec3(u_xlat9) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _Cube_Color.xyz;
    u_xlat1.xyz = u_xlat1.xzw * u_xlat5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity)) + u_xlat4.xyz;
    u_xlat4.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy * vec2(3.1400001, 3.1400001);
    u_xlat5.x = sin(u_xlat4.x);
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat6.x = sin(u_xlat4.y);
    u_xlat7.x = cos(u_xlat4.y);
    u_xlat25 = u_xlat4.x + u_xlat7.x;
    u_xlat5.y = u_xlat6.x;
    u_xlat5.z = u_xlat25 * 0.5;
    u_xlat25 = dot(u_xlat5.xyz, u_xlat2.xyz);
    u_xlat25 = max(u_xlat25, 0.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Fw;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * _Sanshe_Power;
    u_xlat1.xyz = vec3(u_xlat25) * _Sanshe_color.xyz + u_xlat1.xyz;
    u_xlat16_3.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat16_3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat1.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat1.xyz;
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
Keywords { "DIRECTIONAL" }
Local Keywords { "_USE_CUBEMAP" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_USE_CUBEMAP" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_USE_CUBEMAP" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_USE_CUBEMAP" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
Local Keywords { "_USE_CUBEMAP" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
Local Keywords { "_USE_CUBEMAP" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
Local Keywords { "_USE_CUBEMAP" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_Directional_Sanshe" }
Local Keywords { "_USE_CUBEMAP" }
""
}
}
}
}
}