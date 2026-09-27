//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Scene/Glass" {
Properties {

_cull ("剔除模式", Float) = 2.0

_zwrite ("__zw", Float) = 0.0

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_MainTex ("MainTex", 2D) = "white" { }

_MainColor ("颜色", Color) = (1,1,1,1)

_EmissiveTex ("自发光帖图", 2D) = "black" { }

_EmissiveColor ("自发光颜色", Color) = (1,1,1,1)

_CubeMap ("反射Cubemap", Cube) = "" { }

_CubeColor ("反射颜色", Color) = (1,1,1,1)

_StencilRef ("StencilRef", Float) = 0.0

_StencilComp ("StencilComp", Float) = 8.0

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 46324
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_11 = dot((-u_xlat16_2.xyz), u_xlat0.xyz);
    u_xlat16_11 = u_xlat16_11 + u_xlat16_11;
    vs_TEXCOORD1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_11)) + (-u_xlat16_2.xyz);
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _EmissiveTex_ST;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _CubeColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissiveTex;
UNITY_LOCATION(2) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
void main()
{
    u_xlat16_0.xyz = texture(_CubeMap, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_1.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz;
    u_xlat16_2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
    u_xlat16_0.xyz = texture(_EmissiveTex, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * _EmissiveColor.www;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _CubeColor.www * _CubeColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_5.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_11 = dot((-u_xlat16_2.xyz), u_xlat0.xyz);
    u_xlat16_11 = u_xlat16_11 + u_xlat16_11;
    vs_TEXCOORD1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_11)) + (-u_xlat16_2.xyz);
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _EmissiveTex_ST;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _CubeColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissiveTex;
UNITY_LOCATION(2) uniform mediump samplerCube _CubeMap;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat15;
void main()
{
    u_xlat16_0.xyz = texture(_CubeMap, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_1.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.zxy * u_xlat16_1.xyz;
    u_xlat16_2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
    u_xlat16_0.xyz = texture(_EmissiveTex, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * _EmissiveColor.zxy;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * _EmissiveColor.www;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _CubeColor.www * _CubeColor.zxy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_5.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_11 = dot((-u_xlat16_2.xyz), u_xlat0.xyz);
    u_xlat16_11 = u_xlat16_11 + u_xlat16_11;
    vs_TEXCOORD1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_11)) + (-u_xlat16_2.xyz);
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _EmissiveTex_ST;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _CubeColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissiveTex;
UNITY_LOCATION(2) uniform mediump samplerCube _CubeMap;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.xyz = texture(_CubeMap, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
    u_xlat16_0.xyz = texture(_EmissiveTex, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * _EmissiveColor.www;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _CubeColor.www * _CubeColor.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_2.xxx;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = max(u_xlat9, 1.17549435e-38);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat16_11 = dot((-u_xlat16_2.xyz), u_xlat0.xyz);
    u_xlat16_11 = u_xlat16_11 + u_xlat16_11;
    vs_TEXCOORD1.xyz = u_xlat0.xyz * (-vec3(u_xlat16_11)) + (-u_xlat16_2.xyz);
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _EmissiveTex_ST;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _CubeColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _EmissiveTex;
UNITY_LOCATION(2) uniform mediump samplerCube _CubeMap;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
void main()
{
    u_xlat16_0.xyz = texture(_CubeMap, vs_TEXCOORD1.xyz).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_0 = texture(_MainTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
    u_xlat16_0.xyz = texture(_EmissiveTex, u_xlat16_3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * _EmissiveColor.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * _EmissiveColor.www;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _CubeColor.www * _CubeColor.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_2.xyz;
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
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_Scene_GlassGUI"
}