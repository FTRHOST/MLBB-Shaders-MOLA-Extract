//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/VFX/ParticleEffect_Simple" {
Properties {

[Enum(Add,1,Blend,10)] _DstBlend ("混合模式", Float) = 10.0

[Header(TODO__custom_data_rules)] [Toggle(_REQUIRE_CUSTOMDATA)] _RequireCustomData ("开启CustomData", Float) = 0.0

[Space(5)] _BaseMap ("主贴图", 2D) = "white" { }

[Toggle(UnMult)] _UnMult ("UnMult去黑", Float) = 0.0

_BaseColor ("TintColor", Color) = (1,1,1,1)

_FrontIntensity ("FrontIntensity", Range(0, 2)) = 1.0

_BaseUVParams ("BaseUVParams", Vector) = (0,0,1,0)

[Space(10)] [Enum(UnityEngine.Rendering.CullMode)] _CullMode ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Float) = 0.0

[Enum(On, 0,Off, 4)] _ZTest ("总是最前", Float) = 4.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

_StencilRef ("StencilRef", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 29460
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
bool u_xlatb16;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_0.x);
    u_xlat2.x = cos(u_xlat16_0.x);
    u_xlat16_0.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat1.y = u_xlat16_0.x * u_xlat2.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat2.xy);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat2.xy);
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat11.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb16 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb16) ? u_xlat11.x : (-u_xlat11.x);
    u_xlat11.x = u_xlat11.x * 3600.0;
    u_xlat11.xy = u_xlat11.xx * _BaseUVParams.xy;
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat1.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_19 = u_xlat16_0.w + -1.0;
    u_xlat16_0.w = u_xlat16_0.w * _BaseColor.w;
    u_xlat16_19 = _UnMult * u_xlat16_19 + 1.0;
    u_xlat16_0.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(_FrontIntensity);
    u_xlat16_1.w = _BaseColor.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat2.xyz;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
bool u_xlatb16;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_0.x);
    u_xlat2.x = cos(u_xlat16_0.x);
    u_xlat16_0.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat1.y = u_xlat16_0.x * u_xlat2.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat2.xy);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat2.xy);
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat11.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb16 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb16) ? u_xlat11.x : (-u_xlat11.x);
    u_xlat11.x = u_xlat11.x * 3600.0;
    u_xlat11.xy = u_xlat11.xx * _BaseUVParams.xy;
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat1.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_19 = u_xlat16_0.w + -1.0;
    u_xlat16_0.w = u_xlat16_0.w * _BaseColor.w;
    u_xlat16_19 = _UnMult * u_xlat16_19 + 1.0;
    u_xlat16_0.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(_FrontIntensity);
    u_xlat16_1.w = _BaseColor.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat2.xyz;
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
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform lowp sampler2D _BaseMap;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
bool u_xlatb16;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_0.x);
    u_xlat2.x = cos(u_xlat16_0.x);
    u_xlat16_0.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat1.y = u_xlat16_0.x * u_xlat2.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat2.xy);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat2.xy);
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat11.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat11.x>=(-u_xlat11.x);
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb16) ? u_xlat11.x : (-u_xlat11.x);
    u_xlat11.x = u_xlat11.x * 3600.0;
    u_xlat11.xy = u_xlat11.xx * _BaseUVParams.xy;
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat1.xy);
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz;
    u_xlat16_19 = u_xlat10_0.w + -1.0;
    u_xlat16_0.w = u_xlat10_0.w * _BaseColor.w;
    u_xlat16_19 = _UnMult * u_xlat16_19 + 1.0;
    u_xlat16_0.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(_FrontIntensity);
    u_xlat16_1.w = _BaseColor.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat2.xyz;
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
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform lowp sampler2D _BaseMap;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
bool u_xlatb16;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_0.x);
    u_xlat2.x = cos(u_xlat16_0.x);
    u_xlat16_0.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat1.y = u_xlat16_0.x * u_xlat2.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat2.xy);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat2.xy);
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat11.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat11.x>=(-u_xlat11.x);
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb16) ? u_xlat11.x : (-u_xlat11.x);
    u_xlat11.x = u_xlat11.x * 3600.0;
    u_xlat11.xy = u_xlat11.xx * _BaseUVParams.xy;
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat1.xy);
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz;
    u_xlat16_19 = u_xlat10_0.w + -1.0;
    u_xlat16_0.w = u_xlat10_0.w * _BaseColor.w;
    u_xlat16_19 = _UnMult * u_xlat16_19 + 1.0;
    u_xlat16_0.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(_FrontIntensity);
    u_xlat16_1.w = _BaseColor.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    SV_Target0.w = u_xlat16_0.w;
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat2.xyz;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
bool u_xlatb16;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_0.x);
    u_xlat2.x = cos(u_xlat16_0.x);
    u_xlat16_0.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat1.y = u_xlat16_0.x * u_xlat2.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat2.xy);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat2.xy);
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat11.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb16 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb16) ? u_xlat11.x : (-u_xlat11.x);
    u_xlat11.x = u_xlat11.x * 3600.0;
    u_xlat11.xy = u_xlat11.xx * _BaseUVParams.xy;
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat1.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_19 = u_xlat16_0.w + -1.0;
    u_xlat16_0.w = u_xlat16_0.w * _BaseColor.w;
    u_xlat16_19 = _UnMult * u_xlat16_19 + 1.0;
    u_xlat16_0.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(_FrontIntensity);
    u_xlat16_1.w = _BaseColor.w;
    SV_Target0 = u_xlat16_0 * u_xlat16_1;
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
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
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
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
bool u_xlatb16;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_0.x);
    u_xlat2.x = cos(u_xlat16_0.x);
    u_xlat16_0.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat1.y = u_xlat16_0.x * u_xlat2.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat2.xy);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat2.xy);
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat11.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat11.x>=(-u_xlat11.x));
#else
    u_xlatb16 = u_xlat11.x>=(-u_xlat11.x);
#endif
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb16) ? u_xlat11.x : (-u_xlat11.x);
    u_xlat11.x = u_xlat11.x * 3600.0;
    u_xlat11.xy = u_xlat11.xx * _BaseUVParams.xy;
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat1.xy);
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_19 = u_xlat16_0.w + -1.0;
    u_xlat16_0.w = u_xlat16_0.w * _BaseColor.w;
    u_xlat16_19 = _UnMult * u_xlat16_19 + 1.0;
    u_xlat16_0.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(_FrontIntensity);
    u_xlat16_1.w = _BaseColor.w;
    SV_Target0 = u_xlat16_0 * u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform lowp sampler2D _BaseMap;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
bool u_xlatb16;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_0.x);
    u_xlat2.x = cos(u_xlat16_0.x);
    u_xlat16_0.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat1.y = u_xlat16_0.x * u_xlat2.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat2.xy);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat2.xy);
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat11.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat11.x>=(-u_xlat11.x);
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb16) ? u_xlat11.x : (-u_xlat11.x);
    u_xlat11.x = u_xlat11.x * 3600.0;
    u_xlat11.xy = u_xlat11.xx * _BaseUVParams.xy;
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat1.xy);
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz;
    u_xlat16_19 = u_xlat10_0.w + -1.0;
    u_xlat16_0.w = u_xlat10_0.w * _BaseColor.w;
    u_xlat16_19 = _UnMult * u_xlat16_19 + 1.0;
    u_xlat16_0.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(_FrontIntensity);
    u_xlat16_1.w = _BaseColor.w;
    SV_Target0 = u_xlat16_0 * u_xlat16_1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = vec4(0.0, 0.0, 0.0, 0.0);
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _BaseMap_ST;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform lowp sampler2D _BaseMap;
varying mediump vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec2 u_xlat2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
bool u_xlatb16;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.x = _BaseUVParams.w * 0.0174532924;
    u_xlat1.x = sin(u_xlat16_0.x);
    u_xlat2.x = cos(u_xlat16_0.x);
    u_xlat16_0.x = float(1.0) / _BaseUVParams.z;
    u_xlat1.x = u_xlat16_0.x * u_xlat1.x;
    u_xlat1.y = u_xlat16_0.x * u_xlat2.x;
    u_xlat1.z = (-u_xlat1.x);
    u_xlat2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = dot(u_xlat1.yz, u_xlat2.xy);
    u_xlat3.y = dot(u_xlat1.xy, u_xlat2.xy);
    u_xlat1.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
    u_xlat11.x = _Time.y * 0.000277777785;
    u_xlatb16 = u_xlat11.x>=(-u_xlat11.x);
    u_xlat11.x = fract(abs(u_xlat11.x));
    u_xlat11.x = (u_xlatb16) ? u_xlat11.x : (-u_xlat11.x);
    u_xlat11.x = u_xlat11.x * 3600.0;
    u_xlat11.xy = u_xlat11.xx * _BaseUVParams.xy;
    u_xlat11.xy = fract(u_xlat11.xy);
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat1.xy);
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_0.xyz * u_xlat16_4.xyz;
    u_xlat16_19 = u_xlat10_0.w + -1.0;
    u_xlat16_0.w = u_xlat10_0.w * _BaseColor.w;
    u_xlat16_19 = _UnMult * u_xlat16_19 + 1.0;
    u_xlat16_0.xyz = vec3(u_xlat16_19) * u_xlat16_4.xyz;
    u_xlat16_4.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(_FrontIntensity);
    u_xlat16_1.w = _BaseColor.w;
    SV_Target0 = u_xlat16_0 * u_xlat16_1;
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
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
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
}
}
}
CustomEditor "HeroShowRenderingGUI.VFX.SimpleEffectShaderGUI"
}