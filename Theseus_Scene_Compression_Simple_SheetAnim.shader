//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Scene/Compression_Simple_SheetAnim" {
Properties {

_cull ("剔除模式", Float) = 2.0

_renderingMode ("渲染模式", Float) = 0.0

_srcblend ("源混合", Float) = 1.0

_dstblend ("目标混合", Float) = 0.0

_srcblendalpha ("源透明", Float) = 1.0

_dstblendalpha ("目标混合", Float) = 0.0

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_MainTex ("MainTex", 2D) = "white" { }

_SheetVector ("SheetVector", Vector) = (1,1,0.5,0)

_MainColor ("颜色", Color) = (1,1,1,1)

_HDR_Intensity ("HDR强度限制", Range(0, 3)) = 1.0

_AlphaClip ("AlphaClip", Range(0, 1)) = 0.0

_LMisCompressed ("_IsCompressed", Float) = 0.0

_LightMap ("LightMap", 2D) = "white" { }

_LightMapColor ("颜色", Color) = (1,1,1,1)

_FogColor ("雾效颜色", Color) = (1,1,1,1)

_FogVector ("FogVector", Vector) = (9999,1,0,0)

_StencilRef ("StencilRef", Float) = 0.0

_StencilComp ("StencilComp", Float) = 8.0

_cull ("__cull", Float) = 2.0

_srcblend ("__src", Float) = 1.0

_dstblend ("__dst", Float) = 0.0

_srcblendalpha ("__srcA", Float) = 1.0

_dstblendalpha ("__dstA", Float) = 0.0

_zwrite ("__zw", Float) = 1.0

}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 ZWrite Off
 Cull Off
  GpuProgramID 18486
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec3 _SheetVector;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
float u_xlat11;
float u_xlat16;
void main()
{
    u_xlat16_0.x = _SheetVector.y * _SheetVector.x;
    u_xlat16_0.x = u_xlat16_0.x * _SheetVector.z;
    u_xlat1.x = _Time.y / u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb6 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb6) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat16_0.x = max(_SheetVector.z, 0.100000001);
    u_xlat1.x = u_xlat1.x / u_xlat16_0.x;
    u_xlat16_0.x = vs_COLOR0.x * _SheetVector.x;
    u_xlat1.x = u_xlat16_0.x * _SheetVector.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat6 = u_xlat1.x * _SheetVector.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=(-u_xlat6));
#else
    u_xlatb6 = u_xlat6>=(-u_xlat6);
#endif
    u_xlat6 = (u_xlatb6) ? _SheetVector.x : (-_SheetVector.x);
    u_xlat11 = float(1.0) / u_xlat6;
    u_xlat11 = u_xlat11 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _SheetVector.x;
    u_xlati1 = int(u_xlat1.x);
    u_xlati1 = u_xlati1 + int(0xFFFFFFFFu);
    u_xlat2.y = float(u_xlati1);
    u_xlat1.x = fract(u_xlat11);
    u_xlat1.x = u_xlat1.x * u_xlat6;
    u_xlat2.x = trunc(u_xlat1.x);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat2.xy + u_xlat16_0.xy;
    u_xlat1.xy = u_xlat1.xy / _SheetVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w;
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat16 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat16);
    u_xlat0.x = u_xlat16 * 0.0625 + u_xlat0.y;
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_6.xyz) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec3 _SheetVector;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
mediump vec3 u_xlat16_6;
bool u_xlatb6;
float u_xlat11;
float u_xlat16;
void main()
{
    u_xlat16_0.x = _SheetVector.y * _SheetVector.x;
    u_xlat16_0.x = u_xlat16_0.x * _SheetVector.z;
    u_xlat1.x = _Time.y / u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb6 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb6) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat16_0.x = max(_SheetVector.z, 0.100000001);
    u_xlat1.x = u_xlat1.x / u_xlat16_0.x;
    u_xlat16_0.x = vs_COLOR0.x * _SheetVector.x;
    u_xlat1.x = u_xlat16_0.x * _SheetVector.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat6 = u_xlat1.x * _SheetVector.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=(-u_xlat6));
#else
    u_xlatb6 = u_xlat6>=(-u_xlat6);
#endif
    u_xlat6 = (u_xlatb6) ? _SheetVector.x : (-_SheetVector.x);
    u_xlat11 = float(1.0) / u_xlat6;
    u_xlat11 = u_xlat11 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _SheetVector.x;
    u_xlati1 = int(u_xlat1.x);
    u_xlati1 = u_xlati1 + int(0xFFFFFFFFu);
    u_xlat2.y = float(u_xlati1);
    u_xlat1.x = fract(u_xlat11);
    u_xlat1.x = u_xlat1.x * u_xlat6;
    u_xlat2.x = trunc(u_xlat1.x);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat2.xy + u_xlat16_0.xy;
    u_xlat1.xy = u_xlat1.xy / _SheetVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w;
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat16 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat16);
    u_xlat0.x = u_xlat16 * 0.0625 + u_xlat0.y;
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_6.xyz) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3 = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3 = min(max(vs_TEXCOORD3, 0.0), 1.0);
#else
    vs_TEXCOORD3 = clamp(vs_TEXCOORD3, 0.0, 1.0);
#endif
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec3 _SheetVector;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
float u_xlat13;
float u_xlat19;
void main()
{
    u_xlat16_0.x = _SheetVector.y * _SheetVector.x;
    u_xlat16_0.x = u_xlat16_0.x * _SheetVector.z;
    u_xlat1.x = _Time.y / u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat16_0.x = max(_SheetVector.z, 0.100000001);
    u_xlat1.x = u_xlat1.x / u_xlat16_0.x;
    u_xlat16_0.x = vs_COLOR0.x * _SheetVector.x;
    u_xlat1.x = u_xlat16_0.x * _SheetVector.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat7 = u_xlat1.x * _SheetVector.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7>=(-u_xlat7));
#else
    u_xlatb7 = u_xlat7>=(-u_xlat7);
#endif
    u_xlat7 = (u_xlatb7) ? _SheetVector.x : (-_SheetVector.x);
    u_xlat13 = float(1.0) / u_xlat7;
    u_xlat13 = u_xlat13 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _SheetVector.x;
    u_xlati1 = int(u_xlat1.x);
    u_xlati1 = u_xlati1 + int(0xFFFFFFFFu);
    u_xlat2.y = float(u_xlati1);
    u_xlat1.x = fract(u_xlat13);
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat2.x = trunc(u_xlat1.x);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat2.xy + u_xlat16_0.xy;
    u_xlat1.xy = u_xlat1.xy / _SheetVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_LMisCompressed);
#else
    u_xlatb1 = 0.5<_LMisCompressed;
#endif
    u_xlat16_7.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_7.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_7.zxy * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_7.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_7.zxy / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.zxy;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat1.xyz = (-u_xlat16_3.xyz) + _FogColor.zxy;
    u_xlat1.xyz = vec3(vs_TEXCOORD3) * u_xlat1.xyz + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat19 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat19);
    u_xlat0.x = u_xlat19 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_7.xyz) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3 = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3 = min(max(vs_TEXCOORD3, 0.0), 1.0);
#else
    vs_TEXCOORD3 = clamp(vs_TEXCOORD3, 0.0, 1.0);
#endif
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec3 _SheetVector;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
float u_xlat13;
float u_xlat19;
void main()
{
    u_xlat16_0.x = _SheetVector.y * _SheetVector.x;
    u_xlat16_0.x = u_xlat16_0.x * _SheetVector.z;
    u_xlat1.x = _Time.y / u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat16_0.x = max(_SheetVector.z, 0.100000001);
    u_xlat1.x = u_xlat1.x / u_xlat16_0.x;
    u_xlat16_0.x = vs_COLOR0.x * _SheetVector.x;
    u_xlat1.x = u_xlat16_0.x * _SheetVector.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat7 = u_xlat1.x * _SheetVector.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7>=(-u_xlat7));
#else
    u_xlatb7 = u_xlat7>=(-u_xlat7);
#endif
    u_xlat7 = (u_xlatb7) ? _SheetVector.x : (-_SheetVector.x);
    u_xlat13 = float(1.0) / u_xlat7;
    u_xlat13 = u_xlat13 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _SheetVector.x;
    u_xlati1 = int(u_xlat1.x);
    u_xlati1 = u_xlati1 + int(0xFFFFFFFFu);
    u_xlat2.y = float(u_xlati1);
    u_xlat1.x = fract(u_xlat13);
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat2.x = trunc(u_xlat1.x);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat2.xy + u_xlat16_0.xy;
    u_xlat1.xy = u_xlat1.xy / _SheetVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_LMisCompressed);
#else
    u_xlatb1 = 0.5<_LMisCompressed;
#endif
    u_xlat16_7.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_7.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_7.zxy * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_7.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_7.zxy / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.zxy;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat1.xyz = (-u_xlat16_3.xyz) + _FogColor.zxy;
    u_xlat1.xyz = vec3(vs_TEXCOORD3) * u_xlat1.xyz + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat19 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat19);
    u_xlat0.x = u_xlat19 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_7.xyz) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ALPHA_CLIP" "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3 = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3 = min(max(vs_TEXCOORD3, 0.0), 1.0);
#else
    vs_TEXCOORD3 = clamp(vs_TEXCOORD3, 0.0, 1.0);
#endif
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec3 _SheetVector;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
float u_xlat13;
float u_xlat19;
void main()
{
    u_xlat16_0.x = _SheetVector.y * _SheetVector.x;
    u_xlat16_0.x = u_xlat16_0.x * _SheetVector.z;
    u_xlat1.x = _Time.y / u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat16_0.x = max(_SheetVector.z, 0.100000001);
    u_xlat1.x = u_xlat1.x / u_xlat16_0.x;
    u_xlat16_0.x = vs_COLOR0.x * _SheetVector.x;
    u_xlat1.x = u_xlat16_0.x * _SheetVector.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat7 = u_xlat1.x * _SheetVector.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7>=(-u_xlat7));
#else
    u_xlatb7 = u_xlat7>=(-u_xlat7);
#endif
    u_xlat7 = (u_xlatb7) ? _SheetVector.x : (-_SheetVector.x);
    u_xlat13 = float(1.0) / u_xlat7;
    u_xlat13 = u_xlat13 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _SheetVector.x;
    u_xlati1 = int(u_xlat1.x);
    u_xlati1 = u_xlati1 + int(0xFFFFFFFFu);
    u_xlat2.y = float(u_xlati1);
    u_xlat1.x = fract(u_xlat13);
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat2.x = trunc(u_xlat1.x);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat2.xy + u_xlat16_0.xy;
    u_xlat1.xy = u_xlat1.xy / _SheetVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.x = u_xlat16_0.w + (-_AlphaClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb1 = u_xlat16_3.x<0.0;
#endif
    if(u_xlatb1){discard;}
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_LMisCompressed);
#else
    u_xlatb1 = 0.5<_LMisCompressed;
#endif
    u_xlat16_7.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_7.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_7.zxy * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_7.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_7.zxy / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.zxy;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat1.xyz = (-u_xlat16_3.xyz) + _FogColor.zxy;
    u_xlat1.xyz = vec3(vs_TEXCOORD3) * u_xlat1.xyz + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat19 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat19);
    u_xlat0.x = u_xlat19 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_7.xyz) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ALPHA_CLIP" "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3 = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3 = min(max(vs_TEXCOORD3, 0.0), 1.0);
#else
    vs_TEXCOORD3 = clamp(vs_TEXCOORD3, 0.0, 1.0);
#endif
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec3 _SheetVector;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in mediump vec4 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
float u_xlat13;
float u_xlat19;
void main()
{
    u_xlat16_0.x = _SheetVector.y * _SheetVector.x;
    u_xlat16_0.x = u_xlat16_0.x * _SheetVector.z;
    u_xlat1.x = _Time.y / u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat16_0.x = max(_SheetVector.z, 0.100000001);
    u_xlat1.x = u_xlat1.x / u_xlat16_0.x;
    u_xlat16_0.x = vs_COLOR0.x * _SheetVector.x;
    u_xlat1.x = u_xlat16_0.x * _SheetVector.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat7 = u_xlat1.x * _SheetVector.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7>=(-u_xlat7));
#else
    u_xlatb7 = u_xlat7>=(-u_xlat7);
#endif
    u_xlat7 = (u_xlatb7) ? _SheetVector.x : (-_SheetVector.x);
    u_xlat13 = float(1.0) / u_xlat7;
    u_xlat13 = u_xlat13 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _SheetVector.x;
    u_xlati1 = int(u_xlat1.x);
    u_xlati1 = u_xlati1 + int(0xFFFFFFFFu);
    u_xlat2.y = float(u_xlati1);
    u_xlat1.x = fract(u_xlat13);
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat2.x = trunc(u_xlat1.x);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat2.xy + u_xlat16_0.xy;
    u_xlat1.xy = u_xlat1.xy / _SheetVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.x = u_xlat16_0.w + (-_AlphaClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb1 = u_xlat16_3.x<0.0;
#endif
    if(u_xlatb1){discard;}
    u_xlat16_3.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.zxy / u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_LMisCompressed);
#else
    u_xlatb1 = 0.5<_LMisCompressed;
#endif
    u_xlat16_7.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_7.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_7.zxy * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_7.zxy * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_7.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_7.zxy / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.zxy;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat1.xyz = (-u_xlat16_3.xyz) + _FogColor.zxy;
    u_xlat1.xyz = vec3(vs_TEXCOORD3) * u_xlat1.xyz + u_xlat16_3.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat19 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat19);
    u_xlat0.x = u_xlat19 * 0.0625 + u_xlat0.y;
    u_xlat16_7.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_7.xyz) + u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_7.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec3 _SheetVector;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
int u_xlati1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
bool u_xlatb6;
float u_xlat11;
void main()
{
    u_xlat16_0.x = _SheetVector.y * _SheetVector.x;
    u_xlat16_0.x = u_xlat16_0.x * _SheetVector.z;
    u_xlat1.x = _Time.y / u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb6 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb6) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat16_0.x = max(_SheetVector.z, 0.100000001);
    u_xlat1.x = u_xlat1.x / u_xlat16_0.x;
    u_xlat16_0.x = vs_COLOR0.x * _SheetVector.x;
    u_xlat1.x = u_xlat16_0.x * _SheetVector.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat6 = u_xlat1.x * _SheetVector.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=(-u_xlat6));
#else
    u_xlatb6 = u_xlat6>=(-u_xlat6);
#endif
    u_xlat6 = (u_xlatb6) ? _SheetVector.x : (-_SheetVector.x);
    u_xlat11 = float(1.0) / u_xlat6;
    u_xlat11 = u_xlat11 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _SheetVector.x;
    u_xlati1 = int(u_xlat1.x);
    u_xlati1 = u_xlati1 + int(0xFFFFFFFFu);
    u_xlat2.y = float(u_xlati1);
    u_xlat1.x = fract(u_xlat11);
    u_xlat1.x = u_xlat1.x * u_xlat6;
    u_xlat2.x = trunc(u_xlat1.x);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat2.xy + u_xlat16_0.xy;
    u_xlat1.xy = u_xlat1.xy / _SheetVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w;
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_4.xyz;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec3 _SheetVector;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
int u_xlati1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat6;
bool u_xlatb6;
float u_xlat11;
void main()
{
    u_xlat16_0.x = _SheetVector.y * _SheetVector.x;
    u_xlat16_0.x = u_xlat16_0.x * _SheetVector.z;
    u_xlat1.x = _Time.y / u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb6 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb6) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat16_0.x = max(_SheetVector.z, 0.100000001);
    u_xlat1.x = u_xlat1.x / u_xlat16_0.x;
    u_xlat16_0.x = vs_COLOR0.x * _SheetVector.x;
    u_xlat1.x = u_xlat16_0.x * _SheetVector.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat6 = u_xlat1.x * _SheetVector.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat6>=(-u_xlat6));
#else
    u_xlatb6 = u_xlat6>=(-u_xlat6);
#endif
    u_xlat6 = (u_xlatb6) ? _SheetVector.x : (-_SheetVector.x);
    u_xlat11 = float(1.0) / u_xlat6;
    u_xlat11 = u_xlat11 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _SheetVector.x;
    u_xlati1 = int(u_xlat1.x);
    u_xlati1 = u_xlati1 + int(0xFFFFFFFFu);
    u_xlat2.y = float(u_xlati1);
    u_xlat1.x = fract(u_xlat11);
    u_xlat1.x = u_xlat1.x * u_xlat6;
    u_xlat2.x = trunc(u_xlat1.x);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat2.xy + u_xlat16_0.xy;
    u_xlat1.xy = u_xlat1.xy / _SheetVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w;
    u_xlat16_4.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.xyz = u_xlat16_4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_4.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3 = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3 = min(max(vs_TEXCOORD3, 0.0), 1.0);
#else
    vs_TEXCOORD3 = clamp(vs_TEXCOORD3, 0.0, 1.0);
#endif
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec3 _SheetVector;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
in mediump vec4 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
float u_xlat13;
void main()
{
    u_xlat16_0.x = _SheetVector.y * _SheetVector.x;
    u_xlat16_0.x = u_xlat16_0.x * _SheetVector.z;
    u_xlat1.x = _Time.y / u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat16_0.x = max(_SheetVector.z, 0.100000001);
    u_xlat1.x = u_xlat1.x / u_xlat16_0.x;
    u_xlat16_0.x = vs_COLOR0.x * _SheetVector.x;
    u_xlat1.x = u_xlat16_0.x * _SheetVector.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat7 = u_xlat1.x * _SheetVector.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7>=(-u_xlat7));
#else
    u_xlatb7 = u_xlat7>=(-u_xlat7);
#endif
    u_xlat7 = (u_xlatb7) ? _SheetVector.x : (-_SheetVector.x);
    u_xlat13 = float(1.0) / u_xlat7;
    u_xlat13 = u_xlat13 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _SheetVector.x;
    u_xlati1 = int(u_xlat1.x);
    u_xlati1 = u_xlati1 + int(0xFFFFFFFFu);
    u_xlat2.y = float(u_xlati1);
    u_xlat1.x = fract(u_xlat13);
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat2.x = trunc(u_xlat1.x);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat2.xy + u_xlat16_0.xy;
    u_xlat1.xy = u_xlat1.xy / _SheetVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_LMisCompressed);
#else
    u_xlatb1 = 0.5<_LMisCompressed;
#endif
    u_xlat16_7.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_7.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_7.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_7.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_7.xyz / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat1.xyz = (-u_xlat16_3.xyz) + _FogColor.xyz;
    u_xlat1.xyz = vec3(vs_TEXCOORD3) * u_xlat1.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3 = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3 = min(max(vs_TEXCOORD3, 0.0), 1.0);
#else
    vs_TEXCOORD3 = clamp(vs_TEXCOORD3, 0.0, 1.0);
#endif
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec3 _SheetVector;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
in mediump vec4 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
float u_xlat13;
void main()
{
    u_xlat16_0.x = _SheetVector.y * _SheetVector.x;
    u_xlat16_0.x = u_xlat16_0.x * _SheetVector.z;
    u_xlat1.x = _Time.y / u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat16_0.x = max(_SheetVector.z, 0.100000001);
    u_xlat1.x = u_xlat1.x / u_xlat16_0.x;
    u_xlat16_0.x = vs_COLOR0.x * _SheetVector.x;
    u_xlat1.x = u_xlat16_0.x * _SheetVector.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat7 = u_xlat1.x * _SheetVector.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7>=(-u_xlat7));
#else
    u_xlatb7 = u_xlat7>=(-u_xlat7);
#endif
    u_xlat7 = (u_xlatb7) ? _SheetVector.x : (-_SheetVector.x);
    u_xlat13 = float(1.0) / u_xlat7;
    u_xlat13 = u_xlat13 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _SheetVector.x;
    u_xlati1 = int(u_xlat1.x);
    u_xlati1 = u_xlati1 + int(0xFFFFFFFFu);
    u_xlat2.y = float(u_xlati1);
    u_xlat1.x = fract(u_xlat13);
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat2.x = trunc(u_xlat1.x);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat2.xy + u_xlat16_0.xy;
    u_xlat1.xy = u_xlat1.xy / _SheetVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_LMisCompressed);
#else
    u_xlatb1 = 0.5<_LMisCompressed;
#endif
    u_xlat16_7.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_7.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_7.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_7.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_7.xyz / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat1.xyz = (-u_xlat16_3.xyz) + _FogColor.xyz;
    u_xlat1.xyz = vec3(vs_TEXCOORD3) * u_xlat1.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3 = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3 = min(max(vs_TEXCOORD3, 0.0), 1.0);
#else
    vs_TEXCOORD3 = clamp(vs_TEXCOORD3, 0.0, 1.0);
#endif
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec3 _SheetVector;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
in mediump vec4 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
float u_xlat13;
void main()
{
    u_xlat16_0.x = _SheetVector.y * _SheetVector.x;
    u_xlat16_0.x = u_xlat16_0.x * _SheetVector.z;
    u_xlat1.x = _Time.y / u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat16_0.x = max(_SheetVector.z, 0.100000001);
    u_xlat1.x = u_xlat1.x / u_xlat16_0.x;
    u_xlat16_0.x = vs_COLOR0.x * _SheetVector.x;
    u_xlat1.x = u_xlat16_0.x * _SheetVector.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat7 = u_xlat1.x * _SheetVector.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7>=(-u_xlat7));
#else
    u_xlatb7 = u_xlat7>=(-u_xlat7);
#endif
    u_xlat7 = (u_xlatb7) ? _SheetVector.x : (-_SheetVector.x);
    u_xlat13 = float(1.0) / u_xlat7;
    u_xlat13 = u_xlat13 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _SheetVector.x;
    u_xlati1 = int(u_xlat1.x);
    u_xlati1 = u_xlati1 + int(0xFFFFFFFFu);
    u_xlat2.y = float(u_xlati1);
    u_xlat1.x = fract(u_xlat13);
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat2.x = trunc(u_xlat1.x);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat2.xy + u_xlat16_0.xy;
    u_xlat1.xy = u_xlat1.xy / _SheetVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.x = u_xlat16_0.w + (-_AlphaClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb1 = u_xlat16_3.x<0.0;
#endif
    if(u_xlatb1){discard;}
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_LMisCompressed);
#else
    u_xlatb1 = 0.5<_LMisCompressed;
#endif
    u_xlat16_7.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_7.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_7.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_7.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_7.xyz / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat1.xyz = (-u_xlat16_3.xyz) + _FogColor.xyz;
    u_xlat1.xyz = vec3(vs_TEXCOORD3) * u_xlat1.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp float vs_TEXCOORD3;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_2 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD3 = u_xlat0.x / u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD3 = min(max(vs_TEXCOORD3, 0.0), 1.0);
#else
    vs_TEXCOORD3 = clamp(vs_TEXCOORD3, 0.0, 1.0);
#endif
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec3 _SheetVector;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump float _LMisCompressed;
uniform 	mediump vec4 _LightMapColor;
uniform 	mediump vec3 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMap;
in mediump vec4 vs_TEXCOORD0;
in highp float vs_TEXCOORD3;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
int u_xlati1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
float u_xlat13;
void main()
{
    u_xlat16_0.x = _SheetVector.y * _SheetVector.x;
    u_xlat16_0.x = u_xlat16_0.x * _SheetVector.z;
    u_xlat1.x = _Time.y / u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb7 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb7) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat16_0.x = max(_SheetVector.z, 0.100000001);
    u_xlat1.x = u_xlat1.x / u_xlat16_0.x;
    u_xlat16_0.x = vs_COLOR0.x * _SheetVector.x;
    u_xlat1.x = u_xlat16_0.x * _SheetVector.y + u_xlat1.x;
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat7 = u_xlat1.x * _SheetVector.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7>=(-u_xlat7));
#else
    u_xlatb7 = u_xlat7>=(-u_xlat7);
#endif
    u_xlat7 = (u_xlatb7) ? _SheetVector.x : (-_SheetVector.x);
    u_xlat13 = float(1.0) / u_xlat7;
    u_xlat13 = u_xlat13 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _SheetVector.x;
    u_xlati1 = int(u_xlat1.x);
    u_xlati1 = u_xlati1 + int(0xFFFFFFFFu);
    u_xlat2.y = float(u_xlati1);
    u_xlat1.x = fract(u_xlat13);
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat2.x = trunc(u_xlat1.x);
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.xy = u_xlat2.xy + u_xlat16_0.xy;
    u_xlat1.xy = u_xlat1.xy / _SheetVector.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.x = u_xlat16_0.w + (-_AlphaClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_3.x<0.0);
#else
    u_xlatb1 = u_xlat16_3.x<0.0;
#endif
    if(u_xlatb1){discard;}
    u_xlat16_3.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_3.xyz = u_xlat16_0.xyz / u_xlat16_3.xyz;
    SV_Target0.w = u_xlat16_0.w * _MainColor.w;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_LMisCompressed);
#else
    u_xlatb1 = 0.5<_LMisCompressed;
#endif
    u_xlat16_7.xyz = texture(_LightMap, vs_TEXCOORD0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_7.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_7.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = (-u_xlat16_7.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_5.xyz = u_xlat16_7.xyz / u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_4.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_4.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _LightMapColor.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_5.xyz;
    u_xlat1.xyz = (-u_xlat16_3.xyz) + _FogColor.xyz;
    u_xlat1.xyz = vec3(vs_TEXCOORD3) * u_xlat1.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
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
Local Keywords { "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ALPHA_CLIP" "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ALPHA_CLIP" "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
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
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ALPHA_CLIP" "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ALPHA_CLIP" "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_FOG_ON" "_ISCOMPRESSED" "_LM_ON" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_Scene_Compression_Simple_SheetAnimGUI"
}