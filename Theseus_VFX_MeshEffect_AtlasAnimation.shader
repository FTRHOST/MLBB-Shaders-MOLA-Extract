//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/VFX/MeshEffect_AtlasAnimation" {
Properties {

[ModuleBegin(1)] _ModuleBegin_MergeStage ("合并阶段设置", Float) = 0.0

[Enum(Add,1,Blend,10)] _DstBlend ("混合模式", Float) = 10.0

[Enum(UnityEngine.Rendering.CullMode)] _CullMode ("剔除模式", Float) = 0.0

[Enum(Off, 0, On, 1)] _ZWrite ("深度写入", Float) = 0.0

[ModuleEnd] [Enum(On, 0, Off, 4)] _ZTest ("总是最前", Float) = 4.0

[ModuleBegin(0)] _ModuleBegin_Stencil ("模板缓存设置", Float) = 0.0

_StencilRef ("模板参考值", Range(0, 255)) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("比较方式", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("通过运算", Float) = 0.0

[ModuleEnd] [Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("失败运算", Float) = 0.0

[ModuleBegin(0)] _ModuleBegin_Main ("主贴图设置", Float) = 0.0

_BaseMap ("主贴图", 2D) = "white" { }

_BaseColor ("整体叠色", Color) = (1,1,1,1)

[ModuleEnd] [Vector4Split(Toggle, Toggle, Range, Hidden)] _BaseUVParams ("主贴图UV参数 ## 开启预乘Alpha(禁动画中K开关) | 去黑底(禁动画中K开关) | 颜色强度(0, 2) | -", Vector) = (0,0,1,0)

[ModuleBegin(0)] _ModuleBegin_AtlasAnim ("序列帧动画设置", Float) = 0.0

[Vector4Split(Float, Float, Float, Float)] _AtlasAnimParams ("序列帧参数 ## X轴帧数 | Y轴帧数 | 播放速度 | 帧偏移", Vector) = (2,3,1,1)

[ModuleEnd] [MaterialToggle] _Once ("单次播放", Float) = 0.0

[ModuleBegin(_FRAME_BLEND_ON, AtlasFrameBlendMode)] _ModuleBegin_FrameBlend ("帧混合", Float) = 0.0

[ModuleEnd] _FrameBlendWeight ("混合强度", Range(0, 1)) = 1.0

[ModuleBegin(_VECTOR_MOTION_ON, AtlasFrameBlendMode)] _ModuleBegin_VectorMotion ("向量运动扭曲", Float) = 0.0

_MotionVectorMap ("运动向量图(RG=UV偏移方向,需与序列帧图同网格对齐)", 2D) = "gray" { }

[ModuleEnd] _MotionStrength ("扭曲强度", Range(0, 2)) = 1.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 47638
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
uniform 	mediump vec4 _AtlasAnimParams;
uniform 	mediump float _Once;
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
flat out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump float u_xlat16_5;
float u_xlat6;
float u_xlat9;
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
    u_xlat16_2.xy = vec2(1.0, 1.0) / _AtlasAnimParams.xy;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * in_TEXCOORD0.xy;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat0.x = u_xlat0.x * _AtlasAnimParams.z + _AtlasAnimParams.w;
    u_xlat3 = floor(u_xlat0.x);
    vs_TEXCOORD1.z = fract(u_xlat0.x);
    u_xlat16_2.x = _AtlasAnimParams.y * _AtlasAnimParams.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat3>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
#endif
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat9 = _AtlasAnimParams.x * _AtlasAnimParams.y + -1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    u_xlat16_5 = (-_Once) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat16_5 + u_xlat0.x;
    u_xlat3 = u_xlat0.x + 1.0;
    vs_TEXCOORD1.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat3>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
#endif
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    vs_TEXCOORD1.y = u_xlat3 * u_xlat16_5 + u_xlat0.x;
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
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _AtlasAnimParams;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
flat in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
bool u_xlatb5;
float u_xlat10;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.x / _AtlasAnimParams.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb5 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat10 = fract(abs(u_xlat0.x));
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _AtlasAnimParams.y;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat5 = (u_xlatb5) ? u_xlat10 : (-u_xlat10);
    u_xlat5 = u_xlat5 * _AtlasAnimParams.x;
    u_xlat1.x = u_xlat5 / _AtlasAnimParams.x;
    u_xlat16_2.x = float(1.0) / _AtlasAnimParams.y;
    u_xlat1.y = u_xlat0.x + (-u_xlat16_2.x);
    u_xlat0.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_BaseUVParams.y);
#else
    u_xlatb0 = 0.5<_BaseUVParams.y;
#endif
    u_xlat16_17 = (u_xlatb0) ? u_xlat16_2.y : u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BaseUVParams.zzz;
    u_xlat16_3 = u_xlat16_17 + -1.0;
    u_xlat16_3 = _BaseUVParams.x * u_xlat16_3 + 1.0;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_0.w = _BaseColor.w;
    u_xlat16_1.w = _BaseColor.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    SV_Target0.w = u_xlat16_17 * u_xlat16_0.w;
    u_xlat4.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat4.xyz;
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
uniform 	mediump vec4 _AtlasAnimParams;
uniform 	mediump float _Once;
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
flat out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump float u_xlat16_5;
float u_xlat6;
float u_xlat9;
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
    u_xlat16_2.xy = vec2(1.0, 1.0) / _AtlasAnimParams.xy;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * in_TEXCOORD0.xy;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat0.x = u_xlat0.x * _AtlasAnimParams.z + _AtlasAnimParams.w;
    u_xlat3 = floor(u_xlat0.x);
    vs_TEXCOORD1.z = fract(u_xlat0.x);
    u_xlat16_2.x = _AtlasAnimParams.y * _AtlasAnimParams.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat3>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
#endif
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat9 = _AtlasAnimParams.x * _AtlasAnimParams.y + -1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    u_xlat16_5 = (-_Once) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat16_5 + u_xlat0.x;
    u_xlat3 = u_xlat0.x + 1.0;
    vs_TEXCOORD1.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat3>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
#endif
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    vs_TEXCOORD1.y = u_xlat3 * u_xlat16_5 + u_xlat0.x;
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
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _AtlasAnimParams;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
flat in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
bool u_xlatb5;
float u_xlat10;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.x / _AtlasAnimParams.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb5 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat10 = fract(abs(u_xlat0.x));
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _AtlasAnimParams.y;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat5 = (u_xlatb5) ? u_xlat10 : (-u_xlat10);
    u_xlat5 = u_xlat5 * _AtlasAnimParams.x;
    u_xlat1.x = u_xlat5 / _AtlasAnimParams.x;
    u_xlat16_2.x = float(1.0) / _AtlasAnimParams.y;
    u_xlat1.y = u_xlat0.x + (-u_xlat16_2.x);
    u_xlat0.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_BaseUVParams.y);
#else
    u_xlatb0 = 0.5<_BaseUVParams.y;
#endif
    u_xlat16_17 = (u_xlatb0) ? u_xlat16_2.y : u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BaseUVParams.zzz;
    u_xlat16_3 = u_xlat16_17 + -1.0;
    u_xlat16_3 = _BaseUVParams.x * u_xlat16_3 + 1.0;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_0.w = _BaseColor.w;
    u_xlat16_1.w = _BaseColor.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    SV_Target0.w = u_xlat16_17 * u_xlat16_0.w;
    u_xlat4.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat4.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _AtlasAnimParams;
uniform 	mediump float _Once;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
flat varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump float u_xlat16_5;
float u_xlat6;
float u_xlat9;
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
    u_xlat16_2.xy = vec2(1.0, 1.0) / _AtlasAnimParams.xy;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * in_TEXCOORD0.xy;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat0.x = u_xlat0.x * _AtlasAnimParams.z + _AtlasAnimParams.w;
    u_xlat3 = floor(u_xlat0.x);
    vs_TEXCOORD1.z = fract(u_xlat0.x);
    u_xlat16_2.x = _AtlasAnimParams.y * _AtlasAnimParams.x;
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat9 = _AtlasAnimParams.x * _AtlasAnimParams.y + -1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    u_xlat16_5 = (-_Once) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat16_5 + u_xlat0.x;
    u_xlat3 = u_xlat0.x + 1.0;
    vs_TEXCOORD1.x = u_xlat0.x;
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    vs_TEXCOORD1.y = u_xlat3 * u_xlat16_5 + u_xlat0.x;
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
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _AtlasAnimParams;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
flat varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
bool u_xlatb5;
float u_xlat10;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.x / _AtlasAnimParams.x;
    u_xlatb5 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat10 = fract(abs(u_xlat0.x));
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _AtlasAnimParams.y;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat5 = (u_xlatb5) ? u_xlat10 : (-u_xlat10);
    u_xlat5 = u_xlat5 * _AtlasAnimParams.x;
    u_xlat1.x = u_xlat5 / _AtlasAnimParams.x;
    u_xlat16_2.x = float(1.0) / _AtlasAnimParams.y;
    u_xlat1.y = u_xlat0.x + (-u_xlat16_2.x);
    u_xlat0.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlatb0 = 0.5<_BaseUVParams.y;
    u_xlat16_17 = (u_xlatb0) ? u_xlat16_2.y : u_xlat10_0.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BaseUVParams.zzz;
    u_xlat16_3 = u_xlat16_17 + -1.0;
    u_xlat16_3 = _BaseUVParams.x * u_xlat16_3 + 1.0;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_0.w = _BaseColor.w;
    u_xlat16_1.w = _BaseColor.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    SV_Target0.w = u_xlat16_17 * u_xlat16_0.w;
    u_xlat4.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _AtlasAnimParams;
uniform 	mediump float _Once;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
flat varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump float u_xlat16_5;
float u_xlat6;
float u_xlat9;
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
    u_xlat16_2.xy = vec2(1.0, 1.0) / _AtlasAnimParams.xy;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * in_TEXCOORD0.xy;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat0.x = u_xlat0.x * _AtlasAnimParams.z + _AtlasAnimParams.w;
    u_xlat3 = floor(u_xlat0.x);
    vs_TEXCOORD1.z = fract(u_xlat0.x);
    u_xlat16_2.x = _AtlasAnimParams.y * _AtlasAnimParams.x;
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat9 = _AtlasAnimParams.x * _AtlasAnimParams.y + -1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    u_xlat16_5 = (-_Once) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat16_5 + u_xlat0.x;
    u_xlat3 = u_xlat0.x + 1.0;
    vs_TEXCOORD1.x = u_xlat0.x;
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    vs_TEXCOORD1.y = u_xlat3 * u_xlat16_5 + u_xlat0.x;
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
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _AtlasAnimParams;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
flat varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
vec3 u_xlat4;
float u_xlat5;
bool u_xlatb5;
float u_xlat10;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.x / _AtlasAnimParams.x;
    u_xlatb5 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat10 = fract(abs(u_xlat0.x));
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _AtlasAnimParams.y;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat5 = (u_xlatb5) ? u_xlat10 : (-u_xlat10);
    u_xlat5 = u_xlat5 * _AtlasAnimParams.x;
    u_xlat1.x = u_xlat5 / _AtlasAnimParams.x;
    u_xlat16_2.x = float(1.0) / _AtlasAnimParams.y;
    u_xlat1.y = u_xlat0.x + (-u_xlat16_2.x);
    u_xlat0.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlatb0 = 0.5<_BaseUVParams.y;
    u_xlat16_17 = (u_xlatb0) ? u_xlat16_2.y : u_xlat10_0.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BaseUVParams.zzz;
    u_xlat16_3 = u_xlat16_17 + -1.0;
    u_xlat16_3 = _BaseUVParams.x * u_xlat16_3 + 1.0;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_0.w = _BaseColor.w;
    u_xlat16_1.w = _BaseColor.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    SV_Target0.w = u_xlat16_17 * u_xlat16_0.w;
    u_xlat4.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat4.xyz;
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
uniform 	mediump vec4 _AtlasAnimParams;
uniform 	mediump float _Once;
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
flat out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump float u_xlat16_5;
float u_xlat6;
float u_xlat9;
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
    u_xlat16_2.xy = vec2(1.0, 1.0) / _AtlasAnimParams.xy;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * in_TEXCOORD0.xy;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat0.x = u_xlat0.x * _AtlasAnimParams.z + _AtlasAnimParams.w;
    u_xlat3 = floor(u_xlat0.x);
    vs_TEXCOORD1.z = fract(u_xlat0.x);
    u_xlat16_2.x = _AtlasAnimParams.y * _AtlasAnimParams.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat3>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
#endif
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat9 = _AtlasAnimParams.x * _AtlasAnimParams.y + -1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    u_xlat16_5 = (-_Once) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat16_5 + u_xlat0.x;
    u_xlat3 = u_xlat0.x + 1.0;
    vs_TEXCOORD1.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat3>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
#endif
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    vs_TEXCOORD1.y = u_xlat3 * u_xlat16_5 + u_xlat0.x;
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
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _AtlasAnimParams;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
flat in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat8;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.x / _AtlasAnimParams.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb4 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat8 = fract(abs(u_xlat0.x));
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _AtlasAnimParams.y;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4 = (u_xlatb4) ? u_xlat8 : (-u_xlat8);
    u_xlat4 = u_xlat4 * _AtlasAnimParams.x;
    u_xlat1.x = u_xlat4 / _AtlasAnimParams.x;
    u_xlat16_2.x = float(1.0) / _AtlasAnimParams.y;
    u_xlat1.y = u_xlat0.x + (-u_xlat16_2.x);
    u_xlat0.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_BaseUVParams.y);
#else
    u_xlatb0 = 0.5<_BaseUVParams.y;
#endif
    u_xlat16_14 = (u_xlatb0) ? u_xlat16_2.y : u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BaseUVParams.zzz;
    u_xlat16_3 = u_xlat16_14 + -1.0;
    u_xlat16_3 = _BaseUVParams.x * u_xlat16_3 + 1.0;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_0.w = _BaseColor.w;
    u_xlat16_1.w = _BaseColor.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    SV_Target0.w = u_xlat16_14 * u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_0.xyz;
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
uniform 	mediump vec4 _AtlasAnimParams;
uniform 	mediump float _Once;
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
flat out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump float u_xlat16_5;
float u_xlat6;
float u_xlat9;
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
    u_xlat16_2.xy = vec2(1.0, 1.0) / _AtlasAnimParams.xy;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * in_TEXCOORD0.xy;
    u_xlat0.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat0.x = u_xlat0.x * _AtlasAnimParams.z + _AtlasAnimParams.w;
    u_xlat3 = floor(u_xlat0.x);
    vs_TEXCOORD1.z = fract(u_xlat0.x);
    u_xlat16_2.x = _AtlasAnimParams.y * _AtlasAnimParams.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat3>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
#endif
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat9 = _AtlasAnimParams.x * _AtlasAnimParams.y + -1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    u_xlat16_5 = (-_Once) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat16_5 + u_xlat0.x;
    u_xlat3 = u_xlat0.x + 1.0;
    vs_TEXCOORD1.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat3>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
#endif
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    vs_TEXCOORD1.y = u_xlat3 * u_xlat16_5 + u_xlat0.x;
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
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _AtlasAnimParams;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseMap;
in highp vec2 vs_TEXCOORD0;
flat in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat8;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.x / _AtlasAnimParams.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb4 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat8 = fract(abs(u_xlat0.x));
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _AtlasAnimParams.y;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4 = (u_xlatb4) ? u_xlat8 : (-u_xlat8);
    u_xlat4 = u_xlat4 * _AtlasAnimParams.x;
    u_xlat1.x = u_xlat4 / _AtlasAnimParams.x;
    u_xlat16_2.x = float(1.0) / _AtlasAnimParams.y;
    u_xlat1.y = u_xlat0.x + (-u_xlat16_2.x);
    u_xlat0.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_BaseMap, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_BaseUVParams.y);
#else
    u_xlatb0 = 0.5<_BaseUVParams.y;
#endif
    u_xlat16_14 = (u_xlatb0) ? u_xlat16_2.y : u_xlat16_0.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BaseUVParams.zzz;
    u_xlat16_3 = u_xlat16_14 + -1.0;
    u_xlat16_3 = _BaseUVParams.x * u_xlat16_3 + 1.0;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_0.w = _BaseColor.w;
    u_xlat16_1.w = _BaseColor.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    SV_Target0.w = u_xlat16_14 * u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _AtlasAnimParams;
uniform 	mediump float _Once;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
flat varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump float u_xlat16_5;
float u_xlat6;
float u_xlat9;
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
    u_xlat16_2.xy = vec2(1.0, 1.0) / _AtlasAnimParams.xy;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * in_TEXCOORD0.xy;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat0.x = u_xlat0.x * _AtlasAnimParams.z + _AtlasAnimParams.w;
    u_xlat3 = floor(u_xlat0.x);
    vs_TEXCOORD1.z = fract(u_xlat0.x);
    u_xlat16_2.x = _AtlasAnimParams.y * _AtlasAnimParams.x;
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat9 = _AtlasAnimParams.x * _AtlasAnimParams.y + -1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    u_xlat16_5 = (-_Once) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat16_5 + u_xlat0.x;
    u_xlat3 = u_xlat0.x + 1.0;
    vs_TEXCOORD1.x = u_xlat0.x;
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    vs_TEXCOORD1.y = u_xlat3 * u_xlat16_5 + u_xlat0.x;
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
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _AtlasAnimParams;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
flat varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat8;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.x / _AtlasAnimParams.x;
    u_xlatb4 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat8 = fract(abs(u_xlat0.x));
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _AtlasAnimParams.y;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4 = (u_xlatb4) ? u_xlat8 : (-u_xlat8);
    u_xlat4 = u_xlat4 * _AtlasAnimParams.x;
    u_xlat1.x = u_xlat4 / _AtlasAnimParams.x;
    u_xlat16_2.x = float(1.0) / _AtlasAnimParams.y;
    u_xlat1.y = u_xlat0.x + (-u_xlat16_2.x);
    u_xlat0.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlatb0 = 0.5<_BaseUVParams.y;
    u_xlat16_14 = (u_xlatb0) ? u_xlat16_2.y : u_xlat10_0.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BaseUVParams.zzz;
    u_xlat16_3 = u_xlat16_14 + -1.0;
    u_xlat16_3 = _BaseUVParams.x * u_xlat16_3 + 1.0;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_0.w = _BaseColor.w;
    u_xlat16_1.w = _BaseColor.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    SV_Target0.w = u_xlat16_14 * u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _AtlasAnimParams;
uniform 	mediump float _Once;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
flat varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_2;
float u_xlat3;
bool u_xlatb3;
mediump float u_xlat16_5;
float u_xlat6;
float u_xlat9;
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
    u_xlat16_2.xy = vec2(1.0, 1.0) / _AtlasAnimParams.xy;
    vs_TEXCOORD0.xy = u_xlat16_2.xy * in_TEXCOORD0.xy;
    u_xlat0.x = _Time.y * 0.000277777785;
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 3600.0;
    u_xlat0.x = u_xlat0.x * _AtlasAnimParams.z + _AtlasAnimParams.w;
    u_xlat3 = floor(u_xlat0.x);
    vs_TEXCOORD1.z = fract(u_xlat0.x);
    u_xlat16_2.x = _AtlasAnimParams.y * _AtlasAnimParams.x;
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat9 = _AtlasAnimParams.x * _AtlasAnimParams.y + -1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    u_xlat16_5 = (-_Once) + 1.0;
    u_xlat0.x = u_xlat3 * u_xlat16_5 + u_xlat0.x;
    u_xlat3 = u_xlat0.x + 1.0;
    vs_TEXCOORD1.x = u_xlat0.x;
    u_xlatb0 = u_xlat3>=u_xlat16_2.x;
    u_xlat6 = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.x = (u_xlatb0) ? 0.0 : 1.0;
    u_xlat6 = u_xlat6 * u_xlat9;
    u_xlat0.x = u_xlat3 * u_xlat0.x + u_xlat6;
    u_xlat0.x = u_xlat0.x * _Once;
    vs_TEXCOORD1.y = u_xlat3 * u_xlat16_5 + u_xlat0.x;
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
uniform 	mediump vec4 _BaseColor;
uniform 	mediump vec4 _BaseUVParams;
uniform 	mediump vec4 _AtlasAnimParams;
uniform lowp sampler2D _BaseMap;
varying highp vec2 vs_TEXCOORD0;
flat varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
float u_xlat8;
mediump float u_xlat16_14;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.x / _AtlasAnimParams.x;
    u_xlatb4 = u_xlat0.x>=(-u_xlat0.x);
    u_xlat8 = fract(abs(u_xlat0.x));
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x / _AtlasAnimParams.y;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat4 = (u_xlatb4) ? u_xlat8 : (-u_xlat8);
    u_xlat4 = u_xlat4 * _AtlasAnimParams.x;
    u_xlat1.x = u_xlat4 / _AtlasAnimParams.x;
    u_xlat16_2.x = float(1.0) / _AtlasAnimParams.y;
    u_xlat1.y = u_xlat0.x + (-u_xlat16_2.x);
    u_xlat0.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_BaseMap, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlatb0 = 0.5<_BaseUVParams.y;
    u_xlat16_14 = (u_xlatb0) ? u_xlat16_2.y : u_xlat10_0.w;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _BaseUVParams.zzz;
    u_xlat16_3 = u_xlat16_14 + -1.0;
    u_xlat16_3 = _BaseUVParams.x * u_xlat16_3 + 1.0;
    u_xlat16_0.xyz = u_xlat16_2.xyz * vec3(u_xlat16_3);
    u_xlat16_1.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_0.w = _BaseColor.w;
    u_xlat16_1.w = _BaseColor.w;
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    SV_Target0.w = u_xlat16_14 * u_xlat16_0.w;
    SV_Target0.xyz = u_xlat16_0.xyz;
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
CustomEditor "TheseusEditor.TheseusModuleShaderGUIBase"
}