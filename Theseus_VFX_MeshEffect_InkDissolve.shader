//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/VFX/MeshEffect_InkDissolve" {
Properties {

_DstBlend ("混合模式", Float) = 10.0

_CullMode ("Cull", Float) = 0.0

_ZWrite ("ZWrite", Float) = 0.0

_ZTest ("总是最前", Float) = 4.0

_StencilComp ("StencilComp", Float) = 8.0

_StencilPass ("StencilPass", Float) = 0.0

_StencilFail ("StencilFail", Float) = 0.0

_StencilZFail ("StencilZFail", Float) = 0.0

_StencilRef ("StencilRef", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Toggle] _UnMult ("UnMult去黑", Float) = 0.0

_BaseColor ("TintColor", Color) = (0,0,0,1)

_FrontIntensity ("FrontIntensity", Range(0, 2)) = 1.0

[Toggle] _REQUIRE_CUSTOMDATA ("开启CustomData", Float) = 0.0

_UVBase ("UV基础形状", 2D) = "white" { }

_FlowMap ("UV最终形状", 2D) = "white" { }

_Noise ("Noise", 2D) = "white" { }

_DissolveProgress ("溶解进度", Range(0, 2)) = 0.0

_InsideWidth ("内部水墨宽度", Range(0.01, 1)) = 0.20000000298023224

_InsidePow ("内部水墨强度", Range(0.01, 4)) = 0.20000000298023224

_OutsideWidth ("外部水墨宽度", Range(0.01, 1)) = 0.20000000298023224

_OutsidePow ("外部水墨强度", Range(0.01, 4)) = 0.20000000298023224

_DistortMap ("UV扭曲", 2D) = "white" { }

_DistortStrength ("扭曲强度", Range(0, 1)) = 0.20000000298023224

_InkShapeSize ("墨水尺寸", Range(0.01, 2)) = 1.0

_InkShapeEdge ("墨水边缘", Range(0, 1)) = 0.4000000059604645

_InkShapeSmooth ("墨水平滑", Range(-1, 1)) = 0.20000000298023224

_MinUV ("最小UV", Range(-0.5, 0.49)) = 0.0

_InkOffset ("墨水偏移", Float) = 1.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 3407
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
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
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _DissolveProgress;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsideWidth;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSize;
uniform 	mediump float _InkShapeEdge;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(1) uniform mediump sampler2D _UVBase;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Noise;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat7;
mediump float u_xlat16_10;
vec2 u_xlat11;
mediump vec2 u_xlat16_11;
mediump float u_xlat16_15;
mediump float u_xlat16_16;
void main()
{
    u_xlat16_0.x = _DissolveProgress * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_InkShapeSize, _InkShapeSize)) + vec2(0.5, 0.5);
    u_xlat16_1.xy = texture(_UVBase, u_xlat16_5.xy).xy;
    u_xlat11.xy = u_xlat16_5.xy + (-u_xlat16_1.xy);
    u_xlat1.xy = u_xlat16_0.xx * u_xlat11.xy + u_xlat16_1.xy;
    u_xlat16_11.xy = texture(_FlowMap, u_xlat16_5.xy).xy;
    u_xlat2.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat11.xy = u_xlat16_11.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat11.xy = u_xlat11.xy / u_xlat16_0.xx;
    u_xlat7.xy = (-u_xlat1.xy) + u_xlat11.xy;
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat16_0.x = _DissolveProgress + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat1.xy = u_xlat16_0.xx * u_xlat7.xy + u_xlat1.xy;
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat16_16 = texture(_DistortMap, u_xlat16_0.xy).x;
    u_xlat1.xy = vec2(u_xlat16_16) * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_1.x = texture(_Noise, u_xlat1.xy).x;
    u_xlat16_0.x = u_xlat16_1.x * u_xlat2.x + _InsideWidth;
    u_xlat16_5.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_0.z = u_xlat16_1.x * u_xlat2.x + (-_OutsideWidth);
    u_xlat16_0.xz = u_xlat16_0.xz + (-vec2(_DissolveProgress));
    u_xlat16_15 = (-_InsideWidth) + _DissolveProgress;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x>=u_xlat16_15);
#else
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
#endif
    u_xlat16_15 = (u_xlatb1) ? 1.0 : 0.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x>=_DissolveProgress);
#else
    u_xlatb1 = u_xlat16_5.x>=_DissolveProgress;
#endif
    u_xlat16_3.x = (u_xlatb1) ? -1.0 : -0.0;
    u_xlat16_15 = u_xlat16_15 + u_xlat16_3.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_15;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_15 = _OutsideWidth + _DissolveProgress;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x>=u_xlat16_15);
#else
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
#endif
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_5.x = u_xlat16_3.x + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_0.z * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x / _OutsideWidth;
    u_xlat16_5.x = log2(abs(u_xlat16_5.x));
    u_xlat16_5.x = u_xlat16_5.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_5.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_InkShapeEdge>=u_xlat11.x);
#else
    u_xlatb1 = _InkShapeEdge>=u_xlat11.x;
#endif
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_10 = _InkShapeEdge + (-_InkShapeSmooth);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_10>=u_xlat11.x);
#else
    u_xlatb1 = u_xlat16_10>=u_xlat11.x;
#endif
    u_xlat16_10 = u_xlat11.x + (-_InkShapeEdge);
    u_xlat16_10 = u_xlat16_10 + _InkShapeSmooth;
    u_xlat16_10 = u_xlat16_10 / _InkShapeSmooth;
    u_xlat16_10 = (-u_xlat16_10) + 1.0;
    u_xlat16_3.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_3.y;
    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_4.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(_FrontIntensity);
    u_xlat16_10 = vs_TEXCOORD3.w;
    u_xlat16_15 = _BaseColor.w * u_xlat16_10 + -1.0;
    u_xlat16_1.w = u_xlat16_10 * _BaseColor.w;
    u_xlat16_10 = _UnMult * u_xlat16_15 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_10) * u_xlat16_1;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_5.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    u_xlat2.xyz = log2(abs(u_xlat16_1.xyz));
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
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
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _DissolveProgress;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsideWidth;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSize;
uniform 	mediump float _InkShapeEdge;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(1) uniform mediump sampler2D _UVBase;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Noise;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat7;
mediump float u_xlat16_10;
vec2 u_xlat11;
mediump vec2 u_xlat16_11;
mediump float u_xlat16_15;
mediump float u_xlat16_16;
void main()
{
    u_xlat16_0.x = _DissolveProgress * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_InkShapeSize, _InkShapeSize)) + vec2(0.5, 0.5);
    u_xlat16_1.xy = texture(_UVBase, u_xlat16_5.xy).xy;
    u_xlat11.xy = u_xlat16_5.xy + (-u_xlat16_1.xy);
    u_xlat1.xy = u_xlat16_0.xx * u_xlat11.xy + u_xlat16_1.xy;
    u_xlat16_11.xy = texture(_FlowMap, u_xlat16_5.xy).xy;
    u_xlat2.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat11.xy = u_xlat16_11.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat11.xy = u_xlat11.xy / u_xlat16_0.xx;
    u_xlat7.xy = (-u_xlat1.xy) + u_xlat11.xy;
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat16_0.x = _DissolveProgress + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat1.xy = u_xlat16_0.xx * u_xlat7.xy + u_xlat1.xy;
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat16_16 = texture(_DistortMap, u_xlat16_0.xy).x;
    u_xlat1.xy = vec2(u_xlat16_16) * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_1.x = texture(_Noise, u_xlat1.xy).x;
    u_xlat16_0.x = u_xlat16_1.x * u_xlat2.x + _InsideWidth;
    u_xlat16_5.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_0.z = u_xlat16_1.x * u_xlat2.x + (-_OutsideWidth);
    u_xlat16_0.xz = u_xlat16_0.xz + (-vec2(_DissolveProgress));
    u_xlat16_15 = (-_InsideWidth) + _DissolveProgress;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x>=u_xlat16_15);
#else
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
#endif
    u_xlat16_15 = (u_xlatb1) ? 1.0 : 0.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x>=_DissolveProgress);
#else
    u_xlatb1 = u_xlat16_5.x>=_DissolveProgress;
#endif
    u_xlat16_3.x = (u_xlatb1) ? -1.0 : -0.0;
    u_xlat16_15 = u_xlat16_15 + u_xlat16_3.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_15;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_15 = _OutsideWidth + _DissolveProgress;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x>=u_xlat16_15);
#else
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
#endif
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_5.x = u_xlat16_3.x + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_0.z * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x / _OutsideWidth;
    u_xlat16_5.x = log2(abs(u_xlat16_5.x));
    u_xlat16_5.x = u_xlat16_5.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_5.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_InkShapeEdge>=u_xlat11.x);
#else
    u_xlatb1 = _InkShapeEdge>=u_xlat11.x;
#endif
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_10 = _InkShapeEdge + (-_InkShapeSmooth);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_10>=u_xlat11.x);
#else
    u_xlatb1 = u_xlat16_10>=u_xlat11.x;
#endif
    u_xlat16_10 = u_xlat11.x + (-_InkShapeEdge);
    u_xlat16_10 = u_xlat16_10 + _InkShapeSmooth;
    u_xlat16_10 = u_xlat16_10 / _InkShapeSmooth;
    u_xlat16_10 = (-u_xlat16_10) + 1.0;
    u_xlat16_3.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_3.y;
    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_4.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(_FrontIntensity);
    u_xlat16_10 = vs_TEXCOORD3.w;
    u_xlat16_15 = _BaseColor.w * u_xlat16_10 + -1.0;
    u_xlat16_1.w = u_xlat16_10 * _BaseColor.w;
    u_xlat16_10 = _UnMult * u_xlat16_15 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_10) * u_xlat16_1;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_5.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    u_xlat2.xyz = log2(abs(u_xlat16_1.xyz));
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
attribute mediump vec4 in_COLOR0;
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
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _DissolveProgress;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsideWidth;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSize;
uniform 	mediump float _InkShapeEdge;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _UVBase;
uniform lowp sampler2D _DistortMap;
uniform lowp sampler2D _Noise;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec2 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat7;
mediump float u_xlat16_10;
vec2 u_xlat11;
lowp vec2 u_xlat10_11;
mediump float u_xlat16_15;
lowp float u_xlat10_16;
void main()
{
    u_xlat16_0.x = _DissolveProgress * 0.5;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_5.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_InkShapeSize, _InkShapeSize)) + vec2(0.5, 0.5);
    u_xlat10_1.xy = texture2D(_UVBase, u_xlat16_5.xy).xy;
    u_xlat11.xy = u_xlat16_5.xy + (-u_xlat10_1.xy);
    u_xlat1.xy = u_xlat16_0.xx * u_xlat11.xy + u_xlat10_1.xy;
    u_xlat10_11.xy = texture2D(_FlowMap, u_xlat16_5.xy).xy;
    u_xlat2.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat11.xy = u_xlat10_11.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat11.xy = u_xlat11.xy / u_xlat16_0.xx;
    u_xlat7.xy = (-u_xlat1.xy) + u_xlat11.xy;
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat16_0.x = _DissolveProgress + -0.5;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat1.xy = u_xlat16_0.xx * u_xlat7.xy + u_xlat1.xy;
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat10_16 = texture2D(_DistortMap, u_xlat16_0.xy).x;
    u_xlat1.xy = vec2(u_xlat10_16) * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_1.x = texture2D(_Noise, u_xlat1.xy).x;
    u_xlat16_0.x = u_xlat10_1.x * u_xlat2.x + _InsideWidth;
    u_xlat16_5.x = u_xlat2.x * u_xlat10_1.x;
    u_xlat16_0.z = u_xlat10_1.x * u_xlat2.x + (-_OutsideWidth);
    u_xlat16_0.xz = u_xlat16_0.xz + (-vec2(_DissolveProgress));
    u_xlat16_15 = (-_InsideWidth) + _DissolveProgress;
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
    u_xlat16_15 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlatb1 = u_xlat16_5.x>=_DissolveProgress;
    u_xlat16_3.x = (u_xlatb1) ? -1.0 : -0.0;
    u_xlat16_15 = u_xlat16_15 + u_xlat16_3.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_15;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_15 = _OutsideWidth + _DissolveProgress;
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_5.x = u_xlat16_3.x + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_0.z * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x / _OutsideWidth;
    u_xlat16_5.x = log2(abs(u_xlat16_5.x));
    u_xlat16_5.x = u_xlat16_5.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_5.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlatb1 = _InkShapeEdge>=u_xlat11.x;
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_10 = _InkShapeEdge + (-_InkShapeSmooth);
    u_xlatb1 = u_xlat16_10>=u_xlat11.x;
    u_xlat16_10 = u_xlat11.x + (-_InkShapeEdge);
    u_xlat16_10 = u_xlat16_10 + _InkShapeSmooth;
    u_xlat16_10 = u_xlat16_10 / _InkShapeSmooth;
    u_xlat16_10 = (-u_xlat16_10) + 1.0;
    u_xlat16_3.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_3.y;
    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_3.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_4.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(_FrontIntensity);
    u_xlat16_10 = vs_TEXCOORD3.w;
    u_xlat16_15 = _BaseColor.w * u_xlat16_10 + -1.0;
    u_xlat16_1.w = u_xlat16_10 * _BaseColor.w;
    u_xlat16_10 = _UnMult * u_xlat16_15 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_10) * u_xlat16_1;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_5.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    u_xlat2.xyz = log2(abs(u_xlat16_1.xyz));
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
attribute mediump vec4 in_COLOR0;
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
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _DissolveProgress;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsideWidth;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSize;
uniform 	mediump float _InkShapeEdge;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _UVBase;
uniform lowp sampler2D _DistortMap;
uniform lowp sampler2D _Noise;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec2 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat7;
mediump float u_xlat16_10;
vec2 u_xlat11;
lowp vec2 u_xlat10_11;
mediump float u_xlat16_15;
lowp float u_xlat10_16;
void main()
{
    u_xlat16_0.x = _DissolveProgress * 0.5;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_5.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_InkShapeSize, _InkShapeSize)) + vec2(0.5, 0.5);
    u_xlat10_1.xy = texture2D(_UVBase, u_xlat16_5.xy).xy;
    u_xlat11.xy = u_xlat16_5.xy + (-u_xlat10_1.xy);
    u_xlat1.xy = u_xlat16_0.xx * u_xlat11.xy + u_xlat10_1.xy;
    u_xlat10_11.xy = texture2D(_FlowMap, u_xlat16_5.xy).xy;
    u_xlat2.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat11.xy = u_xlat10_11.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat11.xy = u_xlat11.xy / u_xlat16_0.xx;
    u_xlat7.xy = (-u_xlat1.xy) + u_xlat11.xy;
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat16_0.x = _DissolveProgress + -0.5;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat1.xy = u_xlat16_0.xx * u_xlat7.xy + u_xlat1.xy;
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat10_16 = texture2D(_DistortMap, u_xlat16_0.xy).x;
    u_xlat1.xy = vec2(u_xlat10_16) * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_1.x = texture2D(_Noise, u_xlat1.xy).x;
    u_xlat16_0.x = u_xlat10_1.x * u_xlat2.x + _InsideWidth;
    u_xlat16_5.x = u_xlat2.x * u_xlat10_1.x;
    u_xlat16_0.z = u_xlat10_1.x * u_xlat2.x + (-_OutsideWidth);
    u_xlat16_0.xz = u_xlat16_0.xz + (-vec2(_DissolveProgress));
    u_xlat16_15 = (-_InsideWidth) + _DissolveProgress;
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
    u_xlat16_15 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlatb1 = u_xlat16_5.x>=_DissolveProgress;
    u_xlat16_3.x = (u_xlatb1) ? -1.0 : -0.0;
    u_xlat16_15 = u_xlat16_15 + u_xlat16_3.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_15;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_15 = _OutsideWidth + _DissolveProgress;
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_5.x = u_xlat16_3.x + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_0.z * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x / _OutsideWidth;
    u_xlat16_5.x = log2(abs(u_xlat16_5.x));
    u_xlat16_5.x = u_xlat16_5.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_5.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlatb1 = _InkShapeEdge>=u_xlat11.x;
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_10 = _InkShapeEdge + (-_InkShapeSmooth);
    u_xlatb1 = u_xlat16_10>=u_xlat11.x;
    u_xlat16_10 = u_xlat11.x + (-_InkShapeEdge);
    u_xlat16_10 = u_xlat16_10 + _InkShapeSmooth;
    u_xlat16_10 = u_xlat16_10 / _InkShapeSmooth;
    u_xlat16_10 = (-u_xlat16_10) + 1.0;
    u_xlat16_3.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_3.y;
    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_3.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_4.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(_FrontIntensity);
    u_xlat16_10 = vs_TEXCOORD3.w;
    u_xlat16_15 = _BaseColor.w * u_xlat16_10 + -1.0;
    u_xlat16_1.w = u_xlat16_10 * _BaseColor.w;
    u_xlat16_10 = _UnMult * u_xlat16_15 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_10) * u_xlat16_1;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_5.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    u_xlat2.xyz = log2(abs(u_xlat16_1.xyz));
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
Local Keywords { "_REQUIRE_CUSTOMDATA" }
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
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
in mediump vec4 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.zw;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(1) uniform mediump sampler2D _UVBase;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Noise;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec2 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec2 u_xlat16_7;
mediump float u_xlat16_12;
bool u_xlatb13;
mediump vec2 u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat16_1.x = texture(_DistortMap, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat16_6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(vs_TEXCOORD1.xy, vec2(0.00999999978, 0.0));
    u_xlat16_6.xy = u_xlat16_6.xy * u_xlat16_2.xx + vec2(0.5, 0.5);
    u_xlat16_7.xy = texture(_FlowMap, u_xlat16_6.xy).xy;
    u_xlat7.xy = u_xlat16_7.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat7.xy = u_xlat7.xy / u_xlat16_0.xx;
    u_xlat16_3.xy = texture(_UVBase, u_xlat16_6.xy).xy;
    u_xlat15.xy = u_xlat16_6.xy + (-u_xlat16_3.xy);
    u_xlat4.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat7.z = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat16_0.xy = max(vs_TEXCOORD0.zw, vec2(0.0, 0.00999999978));
    u_xlat16_12 = u_xlat16_0.x * 0.5;
    u_xlat16_12 = min(u_xlat16_12, 1.0);
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat16_3.xy;
    u_xlat15.xy = u_xlat7.xy + (-u_xlat3.xy);
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.xz = sqrt(u_xlat7.xz);
    u_xlat16_12 = u_xlat16_0.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12 = min(max(u_xlat16_12, 0.0), 1.0);
#else
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
#endif
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat3.xy;
    u_xlat1.xz = u_xlat16_1.xx * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat3.xy;
    u_xlat1.xz = u_xlat1.xz * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_1.x = texture(_Noise, u_xlat1.xz).x;
    u_xlat16_12 = u_xlat7.z * u_xlat16_1.x;
    u_xlat16_18 = u_xlat16_0.y + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat16_12>=u_xlat16_18);
#else
    u_xlatb13 = u_xlat16_12>=u_xlat16_18;
#endif
    u_xlat16_18 = (u_xlatb13) ? 1.0 : 0.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat16_12>=u_xlat16_0.x);
#else
    u_xlatb13 = u_xlat16_12>=u_xlat16_0.x;
#endif
    u_xlat16_2.x = (u_xlatb13) ? -1.0 : -0.0;
    u_xlat16_18 = u_xlat16_18 + u_xlat16_2.x;
    u_xlat16_14.x = u_xlat16_1.x * u_xlat7.z + (-u_xlat16_0.y);
    u_xlat16_14.y = u_xlat16_1.x * u_xlat7.z + _InsideWidth;
    u_xlat16_14.xy = (-u_xlat16_0.xx) + u_xlat16_14.xy;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_14.x;
    u_xlat16_6.x = u_xlat16_18 / u_xlat16_0.y;
    u_xlat16_0.x = u_xlat16_0.x + (-_InsideWidth);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_12>=u_xlat16_0.x);
#else
    u_xlatb1 = u_xlat16_12>=u_xlat16_0.x;
#endif
    u_xlat16_0.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_0.x = u_xlat16_2.x + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_14.y * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_6.x = log2(abs(u_xlat16_6.x));
    u_xlat16_6.x = u_xlat16_6.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_6.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_2.y>=u_xlat7.x);
#else
    u_xlatb1 = u_xlat16_2.y>=u_xlat7.x;
#endif
    u_xlat16_6.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_12 = u_xlat16_2.y + (-_InkShapeSmooth);
    u_xlat16_18 = (-u_xlat16_2.y) + u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_12>=u_xlat7.x);
#else
    u_xlatb1 = u_xlat16_12>=u_xlat7.x;
#endif
    u_xlat16_2.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_12 = u_xlat16_18 + _InkShapeSmooth;
    u_xlat16_12 = u_xlat16_12 / _InkShapeSmooth;
    u_xlat16_12 = (-u_xlat16_12) + 1.0;
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_2.y;
    u_xlat16_6.x = u_xlat16_12 * u_xlat16_6.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(_FrontIntensity);
    u_xlat16_12 = vs_TEXCOORD3.w;
    u_xlat16_18 = _BaseColor.w * u_xlat16_12 + -1.0;
    u_xlat16_1.w = u_xlat16_12 * _BaseColor.w;
    u_xlat16_12 = _UnMult * u_xlat16_18 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_12) * u_xlat16_1;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_6.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    u_xlat3.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat3.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_REQUIRE_CUSTOMDATA" }
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
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
in mediump vec4 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.zw;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(1) uniform mediump sampler2D _UVBase;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Noise;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec2 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec2 u_xlat16_7;
mediump float u_xlat16_12;
bool u_xlatb13;
mediump vec2 u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat16_1.x = texture(_DistortMap, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat16_6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(vs_TEXCOORD1.xy, vec2(0.00999999978, 0.0));
    u_xlat16_6.xy = u_xlat16_6.xy * u_xlat16_2.xx + vec2(0.5, 0.5);
    u_xlat16_7.xy = texture(_FlowMap, u_xlat16_6.xy).xy;
    u_xlat7.xy = u_xlat16_7.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat7.xy = u_xlat7.xy / u_xlat16_0.xx;
    u_xlat16_3.xy = texture(_UVBase, u_xlat16_6.xy).xy;
    u_xlat15.xy = u_xlat16_6.xy + (-u_xlat16_3.xy);
    u_xlat4.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat7.z = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat16_0.xy = max(vs_TEXCOORD0.zw, vec2(0.0, 0.00999999978));
    u_xlat16_12 = u_xlat16_0.x * 0.5;
    u_xlat16_12 = min(u_xlat16_12, 1.0);
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat16_3.xy;
    u_xlat15.xy = u_xlat7.xy + (-u_xlat3.xy);
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.xz = sqrt(u_xlat7.xz);
    u_xlat16_12 = u_xlat16_0.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12 = min(max(u_xlat16_12, 0.0), 1.0);
#else
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
#endif
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat3.xy;
    u_xlat1.xz = u_xlat16_1.xx * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat3.xy;
    u_xlat1.xz = u_xlat1.xz * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_1.x = texture(_Noise, u_xlat1.xz).x;
    u_xlat16_12 = u_xlat7.z * u_xlat16_1.x;
    u_xlat16_18 = u_xlat16_0.y + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat16_12>=u_xlat16_18);
#else
    u_xlatb13 = u_xlat16_12>=u_xlat16_18;
#endif
    u_xlat16_18 = (u_xlatb13) ? 1.0 : 0.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat16_12>=u_xlat16_0.x);
#else
    u_xlatb13 = u_xlat16_12>=u_xlat16_0.x;
#endif
    u_xlat16_2.x = (u_xlatb13) ? -1.0 : -0.0;
    u_xlat16_18 = u_xlat16_18 + u_xlat16_2.x;
    u_xlat16_14.x = u_xlat16_1.x * u_xlat7.z + (-u_xlat16_0.y);
    u_xlat16_14.y = u_xlat16_1.x * u_xlat7.z + _InsideWidth;
    u_xlat16_14.xy = (-u_xlat16_0.xx) + u_xlat16_14.xy;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_14.x;
    u_xlat16_6.x = u_xlat16_18 / u_xlat16_0.y;
    u_xlat16_0.x = u_xlat16_0.x + (-_InsideWidth);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_12>=u_xlat16_0.x);
#else
    u_xlatb1 = u_xlat16_12>=u_xlat16_0.x;
#endif
    u_xlat16_0.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_0.x = u_xlat16_2.x + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_14.y * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_6.x = log2(abs(u_xlat16_6.x));
    u_xlat16_6.x = u_xlat16_6.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_6.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_2.y>=u_xlat7.x);
#else
    u_xlatb1 = u_xlat16_2.y>=u_xlat7.x;
#endif
    u_xlat16_6.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_12 = u_xlat16_2.y + (-_InkShapeSmooth);
    u_xlat16_18 = (-u_xlat16_2.y) + u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_12>=u_xlat7.x);
#else
    u_xlatb1 = u_xlat16_12>=u_xlat7.x;
#endif
    u_xlat16_2.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_12 = u_xlat16_18 + _InkShapeSmooth;
    u_xlat16_12 = u_xlat16_12 / _InkShapeSmooth;
    u_xlat16_12 = (-u_xlat16_12) + 1.0;
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_2.y;
    u_xlat16_6.x = u_xlat16_12 * u_xlat16_6.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(_FrontIntensity);
    u_xlat16_12 = vs_TEXCOORD3.w;
    u_xlat16_18 = _BaseColor.w * u_xlat16_12 + -1.0;
    u_xlat16_1.w = u_xlat16_12 * _BaseColor.w;
    u_xlat16_12 = _UnMult * u_xlat16_18 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_12) * u_xlat16_1;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_6.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    u_xlat3.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat3.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_REQUIRE_CUSTOMDATA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec4 in_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.zw;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _UVBase;
uniform lowp sampler2D _DistortMap;
uniform lowp sampler2D _Noise;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec2 u_xlat10_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
lowp vec2 u_xlat10_7;
mediump float u_xlat16_12;
bool u_xlatb13;
mediump vec2 u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat10_1 = texture2D(_DistortMap, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat16_6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(vs_TEXCOORD1.xy, vec2(0.00999999978, 0.0));
    u_xlat16_6.xy = u_xlat16_6.xy * u_xlat16_2.xx + vec2(0.5, 0.5);
    u_xlat10_7.xy = texture2D(_FlowMap, u_xlat16_6.xy).xy;
    u_xlat7.xy = u_xlat10_7.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat7.xy = u_xlat7.xy / u_xlat16_0.xx;
    u_xlat10_3.xy = texture2D(_UVBase, u_xlat16_6.xy).xy;
    u_xlat15.xy = u_xlat16_6.xy + (-u_xlat10_3.xy);
    u_xlat4.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat7.z = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat16_0.xy = max(vs_TEXCOORD0.zw, vec2(0.0, 0.00999999978));
    u_xlat16_12 = u_xlat16_0.x * 0.5;
    u_xlat16_12 = min(u_xlat16_12, 1.0);
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat10_3.xy;
    u_xlat15.xy = u_xlat7.xy + (-u_xlat3.xy);
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.xz = sqrt(u_xlat7.xz);
    u_xlat16_12 = u_xlat16_0.x + -0.5;
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat3.xy;
    u_xlat1.xz = vec2(u_xlat10_1) * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat3.xy;
    u_xlat1.xz = u_xlat1.xz * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_1 = texture2D(_Noise, u_xlat1.xz).x;
    u_xlat16_12 = u_xlat7.z * u_xlat10_1;
    u_xlat16_18 = u_xlat16_0.y + u_xlat16_0.x;
    u_xlatb13 = u_xlat16_12>=u_xlat16_18;
    u_xlat16_18 = (u_xlatb13) ? 1.0 : 0.0;
    u_xlatb13 = u_xlat16_12>=u_xlat16_0.x;
    u_xlat16_2.x = (u_xlatb13) ? -1.0 : -0.0;
    u_xlat16_18 = u_xlat16_18 + u_xlat16_2.x;
    u_xlat16_14.x = u_xlat10_1 * u_xlat7.z + (-u_xlat16_0.y);
    u_xlat16_14.y = u_xlat10_1 * u_xlat7.z + _InsideWidth;
    u_xlat16_14.xy = (-u_xlat16_0.xx) + u_xlat16_14.xy;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_14.x;
    u_xlat16_6.x = u_xlat16_18 / u_xlat16_0.y;
    u_xlat16_0.x = u_xlat16_0.x + (-_InsideWidth);
    u_xlatb1 = u_xlat16_12>=u_xlat16_0.x;
    u_xlat16_0.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_0.x = u_xlat16_2.x + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_14.y * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_6.x = log2(abs(u_xlat16_6.x));
    u_xlat16_6.x = u_xlat16_6.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_6.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlatb1 = u_xlat16_2.y>=u_xlat7.x;
    u_xlat16_6.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_12 = u_xlat16_2.y + (-_InkShapeSmooth);
    u_xlat16_18 = (-u_xlat16_2.y) + u_xlat7.x;
    u_xlatb1 = u_xlat16_12>=u_xlat7.x;
    u_xlat16_2.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_12 = u_xlat16_18 + _InkShapeSmooth;
    u_xlat16_12 = u_xlat16_12 / _InkShapeSmooth;
    u_xlat16_12 = (-u_xlat16_12) + 1.0;
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_2.y;
    u_xlat16_6.x = u_xlat16_12 * u_xlat16_6.x + u_xlat16_2.x;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(_FrontIntensity);
    u_xlat16_12 = vs_TEXCOORD3.w;
    u_xlat16_18 = _BaseColor.w * u_xlat16_12 + -1.0;
    u_xlat16_1.w = u_xlat16_12 * _BaseColor.w;
    u_xlat16_12 = _UnMult * u_xlat16_18 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_12) * u_xlat16_1;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_6.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    u_xlat3.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat3.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_REQUIRE_CUSTOMDATA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec4 in_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.zw;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _UVBase;
uniform lowp sampler2D _DistortMap;
uniform lowp sampler2D _Noise;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec2 u_xlat10_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
lowp vec2 u_xlat10_7;
mediump float u_xlat16_12;
bool u_xlatb13;
mediump vec2 u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat10_1 = texture2D(_DistortMap, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat16_6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(vs_TEXCOORD1.xy, vec2(0.00999999978, 0.0));
    u_xlat16_6.xy = u_xlat16_6.xy * u_xlat16_2.xx + vec2(0.5, 0.5);
    u_xlat10_7.xy = texture2D(_FlowMap, u_xlat16_6.xy).xy;
    u_xlat7.xy = u_xlat10_7.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat7.xy = u_xlat7.xy / u_xlat16_0.xx;
    u_xlat10_3.xy = texture2D(_UVBase, u_xlat16_6.xy).xy;
    u_xlat15.xy = u_xlat16_6.xy + (-u_xlat10_3.xy);
    u_xlat4.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat7.z = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat16_0.xy = max(vs_TEXCOORD0.zw, vec2(0.0, 0.00999999978));
    u_xlat16_12 = u_xlat16_0.x * 0.5;
    u_xlat16_12 = min(u_xlat16_12, 1.0);
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat10_3.xy;
    u_xlat15.xy = u_xlat7.xy + (-u_xlat3.xy);
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.xz = sqrt(u_xlat7.xz);
    u_xlat16_12 = u_xlat16_0.x + -0.5;
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat3.xy;
    u_xlat1.xz = vec2(u_xlat10_1) * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat3.xy;
    u_xlat1.xz = u_xlat1.xz * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_1 = texture2D(_Noise, u_xlat1.xz).x;
    u_xlat16_12 = u_xlat7.z * u_xlat10_1;
    u_xlat16_18 = u_xlat16_0.y + u_xlat16_0.x;
    u_xlatb13 = u_xlat16_12>=u_xlat16_18;
    u_xlat16_18 = (u_xlatb13) ? 1.0 : 0.0;
    u_xlatb13 = u_xlat16_12>=u_xlat16_0.x;
    u_xlat16_2.x = (u_xlatb13) ? -1.0 : -0.0;
    u_xlat16_18 = u_xlat16_18 + u_xlat16_2.x;
    u_xlat16_14.x = u_xlat10_1 * u_xlat7.z + (-u_xlat16_0.y);
    u_xlat16_14.y = u_xlat10_1 * u_xlat7.z + _InsideWidth;
    u_xlat16_14.xy = (-u_xlat16_0.xx) + u_xlat16_14.xy;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_14.x;
    u_xlat16_6.x = u_xlat16_18 / u_xlat16_0.y;
    u_xlat16_0.x = u_xlat16_0.x + (-_InsideWidth);
    u_xlatb1 = u_xlat16_12>=u_xlat16_0.x;
    u_xlat16_0.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_0.x = u_xlat16_2.x + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_14.y * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_6.x = log2(abs(u_xlat16_6.x));
    u_xlat16_6.x = u_xlat16_6.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_6.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlatb1 = u_xlat16_2.y>=u_xlat7.x;
    u_xlat16_6.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_12 = u_xlat16_2.y + (-_InkShapeSmooth);
    u_xlat16_18 = (-u_xlat16_2.y) + u_xlat7.x;
    u_xlatb1 = u_xlat16_12>=u_xlat7.x;
    u_xlat16_2.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_12 = u_xlat16_18 + _InkShapeSmooth;
    u_xlat16_12 = u_xlat16_12 / _InkShapeSmooth;
    u_xlat16_12 = (-u_xlat16_12) + 1.0;
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_2.y;
    u_xlat16_6.x = u_xlat16_12 * u_xlat16_6.x + u_xlat16_2.x;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(_FrontIntensity);
    u_xlat16_12 = vs_TEXCOORD3.w;
    u_xlat16_18 = _BaseColor.w * u_xlat16_12 + -1.0;
    u_xlat16_1.w = u_xlat16_12 * _BaseColor.w;
    u_xlat16_12 = _UnMult * u_xlat16_18 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_12) * u_xlat16_1;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_6.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    u_xlat3.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat3.xyz = u_xlat3.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat3.xyz;
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
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
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _DissolveProgress;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsideWidth;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSize;
uniform 	mediump float _InkShapeEdge;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(1) uniform mediump sampler2D _UVBase;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Noise;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat7;
mediump float u_xlat16_10;
vec2 u_xlat11;
mediump vec2 u_xlat16_11;
mediump float u_xlat16_15;
mediump float u_xlat16_16;
void main()
{
    u_xlat16_0.x = _DissolveProgress * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_InkShapeSize, _InkShapeSize)) + vec2(0.5, 0.5);
    u_xlat16_1.xy = texture(_UVBase, u_xlat16_5.xy).xy;
    u_xlat11.xy = u_xlat16_5.xy + (-u_xlat16_1.xy);
    u_xlat1.xy = u_xlat16_0.xx * u_xlat11.xy + u_xlat16_1.xy;
    u_xlat16_11.xy = texture(_FlowMap, u_xlat16_5.xy).xy;
    u_xlat2.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat11.xy = u_xlat16_11.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat11.xy = u_xlat11.xy / u_xlat16_0.xx;
    u_xlat7.xy = (-u_xlat1.xy) + u_xlat11.xy;
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat16_0.x = _DissolveProgress + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat1.xy = u_xlat16_0.xx * u_xlat7.xy + u_xlat1.xy;
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat16_16 = texture(_DistortMap, u_xlat16_0.xy).x;
    u_xlat1.xy = vec2(u_xlat16_16) * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_1.x = texture(_Noise, u_xlat1.xy).x;
    u_xlat16_0.x = u_xlat16_1.x * u_xlat2.x + _InsideWidth;
    u_xlat16_5.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_0.z = u_xlat16_1.x * u_xlat2.x + (-_OutsideWidth);
    u_xlat16_0.xz = u_xlat16_0.xz + (-vec2(_DissolveProgress));
    u_xlat16_15 = (-_InsideWidth) + _DissolveProgress;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x>=u_xlat16_15);
#else
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
#endif
    u_xlat16_15 = (u_xlatb1) ? 1.0 : 0.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x>=_DissolveProgress);
#else
    u_xlatb1 = u_xlat16_5.x>=_DissolveProgress;
#endif
    u_xlat16_3.x = (u_xlatb1) ? -1.0 : -0.0;
    u_xlat16_15 = u_xlat16_15 + u_xlat16_3.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_15;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_15 = _OutsideWidth + _DissolveProgress;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x>=u_xlat16_15);
#else
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
#endif
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_5.x = u_xlat16_3.x + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_0.z * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x / _OutsideWidth;
    u_xlat16_5.x = log2(abs(u_xlat16_5.x));
    u_xlat16_5.x = u_xlat16_5.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_5.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_InkShapeEdge>=u_xlat11.x);
#else
    u_xlatb1 = _InkShapeEdge>=u_xlat11.x;
#endif
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_10 = _InkShapeEdge + (-_InkShapeSmooth);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_10>=u_xlat11.x);
#else
    u_xlatb1 = u_xlat16_10>=u_xlat11.x;
#endif
    u_xlat16_10 = u_xlat11.x + (-_InkShapeEdge);
    u_xlat16_10 = u_xlat16_10 + _InkShapeSmooth;
    u_xlat16_10 = u_xlat16_10 / _InkShapeSmooth;
    u_xlat16_10 = (-u_xlat16_10) + 1.0;
    u_xlat16_3.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_3.y;
    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_4.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(_FrontIntensity);
    u_xlat16_10 = vs_TEXCOORD3.w;
    u_xlat16_15 = _BaseColor.w * u_xlat16_10 + -1.0;
    u_xlat16_1.w = u_xlat16_10 * _BaseColor.w;
    u_xlat16_10 = _UnMult * u_xlat16_15 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_10) * u_xlat16_1;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_5.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
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
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _DissolveProgress;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsideWidth;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSize;
uniform 	mediump float _InkShapeEdge;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(1) uniform mediump sampler2D _UVBase;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Noise;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat7;
mediump float u_xlat16_10;
vec2 u_xlat11;
mediump vec2 u_xlat16_11;
mediump float u_xlat16_15;
mediump float u_xlat16_16;
void main()
{
    u_xlat16_0.x = _DissolveProgress * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_InkShapeSize, _InkShapeSize)) + vec2(0.5, 0.5);
    u_xlat16_1.xy = texture(_UVBase, u_xlat16_5.xy).xy;
    u_xlat11.xy = u_xlat16_5.xy + (-u_xlat16_1.xy);
    u_xlat1.xy = u_xlat16_0.xx * u_xlat11.xy + u_xlat16_1.xy;
    u_xlat16_11.xy = texture(_FlowMap, u_xlat16_5.xy).xy;
    u_xlat2.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat11.xy = u_xlat16_11.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat11.xy = u_xlat11.xy / u_xlat16_0.xx;
    u_xlat7.xy = (-u_xlat1.xy) + u_xlat11.xy;
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat16_0.x = _DissolveProgress + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat1.xy = u_xlat16_0.xx * u_xlat7.xy + u_xlat1.xy;
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat16_16 = texture(_DistortMap, u_xlat16_0.xy).x;
    u_xlat1.xy = vec2(u_xlat16_16) * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_1.x = texture(_Noise, u_xlat1.xy).x;
    u_xlat16_0.x = u_xlat16_1.x * u_xlat2.x + _InsideWidth;
    u_xlat16_5.x = u_xlat2.x * u_xlat16_1.x;
    u_xlat16_0.z = u_xlat16_1.x * u_xlat2.x + (-_OutsideWidth);
    u_xlat16_0.xz = u_xlat16_0.xz + (-vec2(_DissolveProgress));
    u_xlat16_15 = (-_InsideWidth) + _DissolveProgress;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x>=u_xlat16_15);
#else
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
#endif
    u_xlat16_15 = (u_xlatb1) ? 1.0 : 0.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x>=_DissolveProgress);
#else
    u_xlatb1 = u_xlat16_5.x>=_DissolveProgress;
#endif
    u_xlat16_3.x = (u_xlatb1) ? -1.0 : -0.0;
    u_xlat16_15 = u_xlat16_15 + u_xlat16_3.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_15;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_15 = _OutsideWidth + _DissolveProgress;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_5.x>=u_xlat16_15);
#else
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
#endif
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_5.x = u_xlat16_3.x + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_0.z * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x / _OutsideWidth;
    u_xlat16_5.x = log2(abs(u_xlat16_5.x));
    u_xlat16_5.x = u_xlat16_5.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_5.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_InkShapeEdge>=u_xlat11.x);
#else
    u_xlatb1 = _InkShapeEdge>=u_xlat11.x;
#endif
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_10 = _InkShapeEdge + (-_InkShapeSmooth);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_10>=u_xlat11.x);
#else
    u_xlatb1 = u_xlat16_10>=u_xlat11.x;
#endif
    u_xlat16_10 = u_xlat11.x + (-_InkShapeEdge);
    u_xlat16_10 = u_xlat16_10 + _InkShapeSmooth;
    u_xlat16_10 = u_xlat16_10 / _InkShapeSmooth;
    u_xlat16_10 = (-u_xlat16_10) + 1.0;
    u_xlat16_3.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_3.y;
    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_4.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(_FrontIntensity);
    u_xlat16_10 = vs_TEXCOORD3.w;
    u_xlat16_15 = _BaseColor.w * u_xlat16_10 + -1.0;
    u_xlat16_1.w = u_xlat16_10 * _BaseColor.w;
    u_xlat16_10 = _UnMult * u_xlat16_15 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_10) * u_xlat16_1;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_5.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
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
attribute mediump vec4 in_COLOR0;
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
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _DissolveProgress;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsideWidth;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSize;
uniform 	mediump float _InkShapeEdge;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _UVBase;
uniform lowp sampler2D _DistortMap;
uniform lowp sampler2D _Noise;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec2 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat7;
mediump float u_xlat16_10;
vec2 u_xlat11;
lowp vec2 u_xlat10_11;
mediump float u_xlat16_15;
lowp float u_xlat10_16;
void main()
{
    u_xlat16_0.x = _DissolveProgress * 0.5;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_5.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_InkShapeSize, _InkShapeSize)) + vec2(0.5, 0.5);
    u_xlat10_1.xy = texture2D(_UVBase, u_xlat16_5.xy).xy;
    u_xlat11.xy = u_xlat16_5.xy + (-u_xlat10_1.xy);
    u_xlat1.xy = u_xlat16_0.xx * u_xlat11.xy + u_xlat10_1.xy;
    u_xlat10_11.xy = texture2D(_FlowMap, u_xlat16_5.xy).xy;
    u_xlat2.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat11.xy = u_xlat10_11.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat11.xy = u_xlat11.xy / u_xlat16_0.xx;
    u_xlat7.xy = (-u_xlat1.xy) + u_xlat11.xy;
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat16_0.x = _DissolveProgress + -0.5;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat1.xy = u_xlat16_0.xx * u_xlat7.xy + u_xlat1.xy;
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat10_16 = texture2D(_DistortMap, u_xlat16_0.xy).x;
    u_xlat1.xy = vec2(u_xlat10_16) * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_1.x = texture2D(_Noise, u_xlat1.xy).x;
    u_xlat16_0.x = u_xlat10_1.x * u_xlat2.x + _InsideWidth;
    u_xlat16_5.x = u_xlat2.x * u_xlat10_1.x;
    u_xlat16_0.z = u_xlat10_1.x * u_xlat2.x + (-_OutsideWidth);
    u_xlat16_0.xz = u_xlat16_0.xz + (-vec2(_DissolveProgress));
    u_xlat16_15 = (-_InsideWidth) + _DissolveProgress;
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
    u_xlat16_15 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlatb1 = u_xlat16_5.x>=_DissolveProgress;
    u_xlat16_3.x = (u_xlatb1) ? -1.0 : -0.0;
    u_xlat16_15 = u_xlat16_15 + u_xlat16_3.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_15;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_15 = _OutsideWidth + _DissolveProgress;
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_5.x = u_xlat16_3.x + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_0.z * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x / _OutsideWidth;
    u_xlat16_5.x = log2(abs(u_xlat16_5.x));
    u_xlat16_5.x = u_xlat16_5.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_5.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlatb1 = _InkShapeEdge>=u_xlat11.x;
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_10 = _InkShapeEdge + (-_InkShapeSmooth);
    u_xlatb1 = u_xlat16_10>=u_xlat11.x;
    u_xlat16_10 = u_xlat11.x + (-_InkShapeEdge);
    u_xlat16_10 = u_xlat16_10 + _InkShapeSmooth;
    u_xlat16_10 = u_xlat16_10 / _InkShapeSmooth;
    u_xlat16_10 = (-u_xlat16_10) + 1.0;
    u_xlat16_3.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_3.y;
    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_3.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_4.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(_FrontIntensity);
    u_xlat16_10 = vs_TEXCOORD3.w;
    u_xlat16_15 = _BaseColor.w * u_xlat16_10 + -1.0;
    u_xlat16_1.w = u_xlat16_10 * _BaseColor.w;
    u_xlat16_10 = _UnMult * u_xlat16_15 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_10) * u_xlat16_1;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_5.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
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
attribute mediump vec4 in_COLOR0;
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
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _DissolveProgress;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsideWidth;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSize;
uniform 	mediump float _InkShapeEdge;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _UVBase;
uniform lowp sampler2D _DistortMap;
uniform lowp sampler2D _Noise;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
lowp vec2 u_xlat10_1;
bool u_xlatb1;
vec2 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat7;
mediump float u_xlat16_10;
vec2 u_xlat11;
lowp vec2 u_xlat10_11;
mediump float u_xlat16_15;
lowp float u_xlat10_16;
void main()
{
    u_xlat16_0.x = _DissolveProgress * 0.5;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_5.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy * vec2(vec2(_InkShapeSize, _InkShapeSize)) + vec2(0.5, 0.5);
    u_xlat10_1.xy = texture2D(_UVBase, u_xlat16_5.xy).xy;
    u_xlat11.xy = u_xlat16_5.xy + (-u_xlat10_1.xy);
    u_xlat1.xy = u_xlat16_0.xx * u_xlat11.xy + u_xlat10_1.xy;
    u_xlat10_11.xy = texture2D(_FlowMap, u_xlat16_5.xy).xy;
    u_xlat2.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat11.xy = u_xlat10_11.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat11.xy = u_xlat11.xy / u_xlat16_0.xx;
    u_xlat7.xy = (-u_xlat1.xy) + u_xlat11.xy;
    u_xlat11.xy = u_xlat11.xy + vec2(-0.5, -0.5);
    u_xlat11.x = dot(u_xlat11.xy, u_xlat11.xy);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat16_0.x = _DissolveProgress + -0.5;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat1.xy = u_xlat16_0.xx * u_xlat7.xy + u_xlat1.xy;
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat10_16 = texture2D(_DistortMap, u_xlat16_0.xy).x;
    u_xlat1.xy = vec2(u_xlat10_16) * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat1.xy;
    u_xlat1.xy = u_xlat1.xy * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_1.x = texture2D(_Noise, u_xlat1.xy).x;
    u_xlat16_0.x = u_xlat10_1.x * u_xlat2.x + _InsideWidth;
    u_xlat16_5.x = u_xlat2.x * u_xlat10_1.x;
    u_xlat16_0.z = u_xlat10_1.x * u_xlat2.x + (-_OutsideWidth);
    u_xlat16_0.xz = u_xlat16_0.xz + (-vec2(_DissolveProgress));
    u_xlat16_15 = (-_InsideWidth) + _DissolveProgress;
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
    u_xlat16_15 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlatb1 = u_xlat16_5.x>=_DissolveProgress;
    u_xlat16_3.x = (u_xlatb1) ? -1.0 : -0.0;
    u_xlat16_15 = u_xlat16_15 + u_xlat16_3.x;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_15;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_15 = _OutsideWidth + _DissolveProgress;
    u_xlatb1 = u_xlat16_5.x>=u_xlat16_15;
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_5.x = u_xlat16_3.x + u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_0.z * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x / _OutsideWidth;
    u_xlat16_5.x = log2(abs(u_xlat16_5.x));
    u_xlat16_5.x = u_xlat16_5.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_5.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlatb1 = _InkShapeEdge>=u_xlat11.x;
    u_xlat16_5.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_10 = _InkShapeEdge + (-_InkShapeSmooth);
    u_xlatb1 = u_xlat16_10>=u_xlat11.x;
    u_xlat16_10 = u_xlat11.x + (-_InkShapeEdge);
    u_xlat16_10 = u_xlat16_10 + _InkShapeSmooth;
    u_xlat16_10 = u_xlat16_10 / _InkShapeSmooth;
    u_xlat16_10 = (-u_xlat16_10) + 1.0;
    u_xlat16_3.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_3.y;
    u_xlat16_5.x = u_xlat16_10 * u_xlat16_5.x + u_xlat16_3.x;
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_4.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(_FrontIntensity);
    u_xlat16_10 = vs_TEXCOORD3.w;
    u_xlat16_15 = _BaseColor.w * u_xlat16_10 + -1.0;
    u_xlat16_1.w = u_xlat16_10 * _BaseColor.w;
    u_xlat16_10 = _UnMult * u_xlat16_15 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_10) * u_xlat16_1;
    u_xlat16_5.x = u_xlat16_5.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_5.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
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
in mediump vec4 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.zw;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(1) uniform mediump sampler2D _UVBase;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Noise;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec2 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec2 u_xlat16_7;
mediump float u_xlat16_12;
bool u_xlatb13;
mediump vec2 u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat16_1.x = texture(_DistortMap, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat16_6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(vs_TEXCOORD1.xy, vec2(0.00999999978, 0.0));
    u_xlat16_6.xy = u_xlat16_6.xy * u_xlat16_2.xx + vec2(0.5, 0.5);
    u_xlat16_7.xy = texture(_FlowMap, u_xlat16_6.xy).xy;
    u_xlat7.xy = u_xlat16_7.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat7.xy = u_xlat7.xy / u_xlat16_0.xx;
    u_xlat16_3.xy = texture(_UVBase, u_xlat16_6.xy).xy;
    u_xlat15.xy = u_xlat16_6.xy + (-u_xlat16_3.xy);
    u_xlat4.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat7.z = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat16_0.xy = max(vs_TEXCOORD0.zw, vec2(0.0, 0.00999999978));
    u_xlat16_12 = u_xlat16_0.x * 0.5;
    u_xlat16_12 = min(u_xlat16_12, 1.0);
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat16_3.xy;
    u_xlat15.xy = u_xlat7.xy + (-u_xlat3.xy);
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.xz = sqrt(u_xlat7.xz);
    u_xlat16_12 = u_xlat16_0.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12 = min(max(u_xlat16_12, 0.0), 1.0);
#else
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
#endif
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat3.xy;
    u_xlat1.xz = u_xlat16_1.xx * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat3.xy;
    u_xlat1.xz = u_xlat1.xz * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_1.x = texture(_Noise, u_xlat1.xz).x;
    u_xlat16_12 = u_xlat7.z * u_xlat16_1.x;
    u_xlat16_18 = u_xlat16_0.y + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat16_12>=u_xlat16_18);
#else
    u_xlatb13 = u_xlat16_12>=u_xlat16_18;
#endif
    u_xlat16_18 = (u_xlatb13) ? 1.0 : 0.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat16_12>=u_xlat16_0.x);
#else
    u_xlatb13 = u_xlat16_12>=u_xlat16_0.x;
#endif
    u_xlat16_2.x = (u_xlatb13) ? -1.0 : -0.0;
    u_xlat16_18 = u_xlat16_18 + u_xlat16_2.x;
    u_xlat16_14.x = u_xlat16_1.x * u_xlat7.z + (-u_xlat16_0.y);
    u_xlat16_14.y = u_xlat16_1.x * u_xlat7.z + _InsideWidth;
    u_xlat16_14.xy = (-u_xlat16_0.xx) + u_xlat16_14.xy;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_14.x;
    u_xlat16_6.x = u_xlat16_18 / u_xlat16_0.y;
    u_xlat16_0.x = u_xlat16_0.x + (-_InsideWidth);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_12>=u_xlat16_0.x);
#else
    u_xlatb1 = u_xlat16_12>=u_xlat16_0.x;
#endif
    u_xlat16_0.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_0.x = u_xlat16_2.x + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_14.y * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_6.x = log2(abs(u_xlat16_6.x));
    u_xlat16_6.x = u_xlat16_6.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_6.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_2.y>=u_xlat7.x);
#else
    u_xlatb1 = u_xlat16_2.y>=u_xlat7.x;
#endif
    u_xlat16_6.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_12 = u_xlat16_2.y + (-_InkShapeSmooth);
    u_xlat16_18 = (-u_xlat16_2.y) + u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_12>=u_xlat7.x);
#else
    u_xlatb1 = u_xlat16_12>=u_xlat7.x;
#endif
    u_xlat16_2.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_12 = u_xlat16_18 + _InkShapeSmooth;
    u_xlat16_12 = u_xlat16_12 / _InkShapeSmooth;
    u_xlat16_12 = (-u_xlat16_12) + 1.0;
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_2.y;
    u_xlat16_6.x = u_xlat16_12 * u_xlat16_6.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(_FrontIntensity);
    u_xlat16_12 = vs_TEXCOORD3.w;
    u_xlat16_18 = _BaseColor.w * u_xlat16_12 + -1.0;
    u_xlat16_1.w = u_xlat16_12 * _BaseColor.w;
    u_xlat16_12 = _UnMult * u_xlat16_18 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_12) * u_xlat16_1;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_6.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
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
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
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
in mediump vec4 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.zw;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _FlowMap;
UNITY_LOCATION(1) uniform mediump sampler2D _UVBase;
UNITY_LOCATION(2) uniform mediump sampler2D _DistortMap;
UNITY_LOCATION(3) uniform mediump sampler2D _Noise;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec2 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
mediump vec2 u_xlat16_7;
mediump float u_xlat16_12;
bool u_xlatb13;
mediump vec2 u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat16_1.x = texture(_DistortMap, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat16_6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(vs_TEXCOORD1.xy, vec2(0.00999999978, 0.0));
    u_xlat16_6.xy = u_xlat16_6.xy * u_xlat16_2.xx + vec2(0.5, 0.5);
    u_xlat16_7.xy = texture(_FlowMap, u_xlat16_6.xy).xy;
    u_xlat7.xy = u_xlat16_7.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat7.xy = u_xlat7.xy / u_xlat16_0.xx;
    u_xlat16_3.xy = texture(_UVBase, u_xlat16_6.xy).xy;
    u_xlat15.xy = u_xlat16_6.xy + (-u_xlat16_3.xy);
    u_xlat4.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat7.z = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat16_0.xy = max(vs_TEXCOORD0.zw, vec2(0.0, 0.00999999978));
    u_xlat16_12 = u_xlat16_0.x * 0.5;
    u_xlat16_12 = min(u_xlat16_12, 1.0);
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat16_3.xy;
    u_xlat15.xy = u_xlat7.xy + (-u_xlat3.xy);
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.xz = sqrt(u_xlat7.xz);
    u_xlat16_12 = u_xlat16_0.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12 = min(max(u_xlat16_12, 0.0), 1.0);
#else
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
#endif
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat3.xy;
    u_xlat1.xz = u_xlat16_1.xx * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat3.xy;
    u_xlat1.xz = u_xlat1.xz * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat16_1.x = texture(_Noise, u_xlat1.xz).x;
    u_xlat16_12 = u_xlat7.z * u_xlat16_1.x;
    u_xlat16_18 = u_xlat16_0.y + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat16_12>=u_xlat16_18);
#else
    u_xlatb13 = u_xlat16_12>=u_xlat16_18;
#endif
    u_xlat16_18 = (u_xlatb13) ? 1.0 : 0.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat16_12>=u_xlat16_0.x);
#else
    u_xlatb13 = u_xlat16_12>=u_xlat16_0.x;
#endif
    u_xlat16_2.x = (u_xlatb13) ? -1.0 : -0.0;
    u_xlat16_18 = u_xlat16_18 + u_xlat16_2.x;
    u_xlat16_14.x = u_xlat16_1.x * u_xlat7.z + (-u_xlat16_0.y);
    u_xlat16_14.y = u_xlat16_1.x * u_xlat7.z + _InsideWidth;
    u_xlat16_14.xy = (-u_xlat16_0.xx) + u_xlat16_14.xy;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_14.x;
    u_xlat16_6.x = u_xlat16_18 / u_xlat16_0.y;
    u_xlat16_0.x = u_xlat16_0.x + (-_InsideWidth);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_12>=u_xlat16_0.x);
#else
    u_xlatb1 = u_xlat16_12>=u_xlat16_0.x;
#endif
    u_xlat16_0.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_0.x = u_xlat16_2.x + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_14.y * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_6.x = log2(abs(u_xlat16_6.x));
    u_xlat16_6.x = u_xlat16_6.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_6.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_2.y>=u_xlat7.x);
#else
    u_xlatb1 = u_xlat16_2.y>=u_xlat7.x;
#endif
    u_xlat16_6.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_12 = u_xlat16_2.y + (-_InkShapeSmooth);
    u_xlat16_18 = (-u_xlat16_2.y) + u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat16_12>=u_xlat7.x);
#else
    u_xlatb1 = u_xlat16_12>=u_xlat7.x;
#endif
    u_xlat16_2.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_12 = u_xlat16_18 + _InkShapeSmooth;
    u_xlat16_12 = u_xlat16_12 / _InkShapeSmooth;
    u_xlat16_12 = (-u_xlat16_12) + 1.0;
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_2.y;
    u_xlat16_6.x = u_xlat16_12 * u_xlat16_6.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(_FrontIntensity);
    u_xlat16_12 = vs_TEXCOORD3.w;
    u_xlat16_18 = _BaseColor.w * u_xlat16_12 + -1.0;
    u_xlat16_1.w = u_xlat16_12 * _BaseColor.w;
    u_xlat16_12 = _UnMult * u_xlat16_18 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_12) * u_xlat16_1;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_6.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec4 in_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.zw;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _UVBase;
uniform lowp sampler2D _DistortMap;
uniform lowp sampler2D _Noise;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
lowp vec2 u_xlat10_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
lowp vec2 u_xlat10_7;
mediump float u_xlat16_12;
bool u_xlatb13;
mediump vec2 u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat10_1 = texture2D(_DistortMap, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat16_6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(vs_TEXCOORD1.xy, vec2(0.00999999978, 0.0));
    u_xlat16_6.xy = u_xlat16_6.xy * u_xlat16_2.xx + vec2(0.5, 0.5);
    u_xlat10_7.xy = texture2D(_FlowMap, u_xlat16_6.xy).xy;
    u_xlat7.xy = u_xlat10_7.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat7.xy = u_xlat7.xy / u_xlat16_0.xx;
    u_xlat10_3.xy = texture2D(_UVBase, u_xlat16_6.xy).xy;
    u_xlat15.xy = u_xlat16_6.xy + (-u_xlat10_3.xy);
    u_xlat4.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat7.z = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat16_0.xy = max(vs_TEXCOORD0.zw, vec2(0.0, 0.00999999978));
    u_xlat16_12 = u_xlat16_0.x * 0.5;
    u_xlat16_12 = min(u_xlat16_12, 1.0);
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat10_3.xy;
    u_xlat15.xy = u_xlat7.xy + (-u_xlat3.xy);
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.xz = sqrt(u_xlat7.xz);
    u_xlat16_12 = u_xlat16_0.x + -0.5;
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat3.xy;
    u_xlat1.xz = vec2(u_xlat10_1) * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat3.xy;
    u_xlat1.xz = u_xlat1.xz * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_1 = texture2D(_Noise, u_xlat1.xz).x;
    u_xlat16_12 = u_xlat7.z * u_xlat10_1;
    u_xlat16_18 = u_xlat16_0.y + u_xlat16_0.x;
    u_xlatb13 = u_xlat16_12>=u_xlat16_18;
    u_xlat16_18 = (u_xlatb13) ? 1.0 : 0.0;
    u_xlatb13 = u_xlat16_12>=u_xlat16_0.x;
    u_xlat16_2.x = (u_xlatb13) ? -1.0 : -0.0;
    u_xlat16_18 = u_xlat16_18 + u_xlat16_2.x;
    u_xlat16_14.x = u_xlat10_1 * u_xlat7.z + (-u_xlat16_0.y);
    u_xlat16_14.y = u_xlat10_1 * u_xlat7.z + _InsideWidth;
    u_xlat16_14.xy = (-u_xlat16_0.xx) + u_xlat16_14.xy;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_14.x;
    u_xlat16_6.x = u_xlat16_18 / u_xlat16_0.y;
    u_xlat16_0.x = u_xlat16_0.x + (-_InsideWidth);
    u_xlatb1 = u_xlat16_12>=u_xlat16_0.x;
    u_xlat16_0.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_0.x = u_xlat16_2.x + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_14.y * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_6.x = log2(abs(u_xlat16_6.x));
    u_xlat16_6.x = u_xlat16_6.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_6.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlatb1 = u_xlat16_2.y>=u_xlat7.x;
    u_xlat16_6.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_12 = u_xlat16_2.y + (-_InkShapeSmooth);
    u_xlat16_18 = (-u_xlat16_2.y) + u_xlat7.x;
    u_xlatb1 = u_xlat16_12>=u_xlat7.x;
    u_xlat16_2.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_12 = u_xlat16_18 + _InkShapeSmooth;
    u_xlat16_12 = u_xlat16_12 / _InkShapeSmooth;
    u_xlat16_12 = (-u_xlat16_12) + 1.0;
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_2.y;
    u_xlat16_6.x = u_xlat16_12 * u_xlat16_6.x + u_xlat16_2.x;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(_FrontIntensity);
    u_xlat16_12 = vs_TEXCOORD3.w;
    u_xlat16_18 = _BaseColor.w * u_xlat16_12 + -1.0;
    u_xlat16_1.w = u_xlat16_12 * _BaseColor.w;
    u_xlat16_12 = _UnMult * u_xlat16_18 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_12) * u_xlat16_1;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_6.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec4 in_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
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
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.zw;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_COLOR0;
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
uniform 	mediump float _FrontIntensity;
uniform 	mediump float _UnMult;
uniform 	mediump vec4 _Noise_ST;
uniform 	mediump vec4 _DistortMap_ST;
uniform 	mediump float _InsideWidth;
uniform 	mediump float _InsidePow;
uniform 	mediump float _OutsidePow;
uniform 	mediump float _DistortStrength;
uniform 	mediump float _InkShapeSmooth;
uniform 	mediump float _MinUV;
uniform 	mediump float _InkOffset;
uniform lowp sampler2D _FlowMap;
uniform lowp sampler2D _UVBase;
uniform lowp sampler2D _DistortMap;
uniform lowp sampler2D _Noise;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
mediump vec2 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
lowp float u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
lowp vec2 u_xlat10_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec2 u_xlat16_6;
vec3 u_xlat7;
lowp vec2 u_xlat10_7;
mediump float u_xlat16_12;
bool u_xlatb13;
mediump vec2 u_xlat16_14;
vec2 u_xlat15;
mediump float u_xlat16_18;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _DistortMap_ST.xy + _DistortMap_ST.zw;
    u_xlat10_1 = texture2D(_DistortMap, u_xlat16_0.xy).x;
    u_xlat16_0.x = (-_MinUV) * 2.0 + 1.0;
    u_xlat16_6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = max(vs_TEXCOORD1.xy, vec2(0.00999999978, 0.0));
    u_xlat16_6.xy = u_xlat16_6.xy * u_xlat16_2.xx + vec2(0.5, 0.5);
    u_xlat10_7.xy = texture2D(_FlowMap, u_xlat16_6.xy).xy;
    u_xlat7.xy = u_xlat10_7.xy * vec2(vec2(_InkOffset, _InkOffset)) + (-vec2(vec2(_MinUV, _MinUV)));
    u_xlat7.xy = u_xlat7.xy / u_xlat16_0.xx;
    u_xlat10_3.xy = texture2D(_UVBase, u_xlat16_6.xy).xy;
    u_xlat15.xy = u_xlat16_6.xy + (-u_xlat10_3.xy);
    u_xlat4.xy = u_xlat16_6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat7.z = dot(u_xlat4.xy, u_xlat4.xy);
    u_xlat16_0.xy = max(vs_TEXCOORD0.zw, vec2(0.0, 0.00999999978));
    u_xlat16_12 = u_xlat16_0.x * 0.5;
    u_xlat16_12 = min(u_xlat16_12, 1.0);
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat10_3.xy;
    u_xlat15.xy = u_xlat7.xy + (-u_xlat3.xy);
    u_xlat7.xy = u_xlat7.xy + vec2(-0.5, -0.5);
    u_xlat7.x = dot(u_xlat7.xy, u_xlat7.xy);
    u_xlat7.xz = sqrt(u_xlat7.xz);
    u_xlat16_12 = u_xlat16_0.x + -0.5;
    u_xlat16_12 = clamp(u_xlat16_12, 0.0, 1.0);
    u_xlat3.xy = vec2(u_xlat16_12) * u_xlat15.xy + u_xlat3.xy;
    u_xlat1.xz = vec2(u_xlat10_1) * vec2(vec2(_DistortStrength, _DistortStrength)) + u_xlat3.xy;
    u_xlat1.xz = u_xlat1.xz * _Noise_ST.xy + _Noise_ST.zw;
    u_xlat10_1 = texture2D(_Noise, u_xlat1.xz).x;
    u_xlat16_12 = u_xlat7.z * u_xlat10_1;
    u_xlat16_18 = u_xlat16_0.y + u_xlat16_0.x;
    u_xlatb13 = u_xlat16_12>=u_xlat16_18;
    u_xlat16_18 = (u_xlatb13) ? 1.0 : 0.0;
    u_xlatb13 = u_xlat16_12>=u_xlat16_0.x;
    u_xlat16_2.x = (u_xlatb13) ? -1.0 : -0.0;
    u_xlat16_18 = u_xlat16_18 + u_xlat16_2.x;
    u_xlat16_14.x = u_xlat10_1 * u_xlat7.z + (-u_xlat16_0.y);
    u_xlat16_14.y = u_xlat10_1 * u_xlat7.z + _InsideWidth;
    u_xlat16_14.xy = (-u_xlat16_0.xx) + u_xlat16_14.xy;
    u_xlat16_18 = u_xlat16_18 * u_xlat16_14.x;
    u_xlat16_6.x = u_xlat16_18 / u_xlat16_0.y;
    u_xlat16_0.x = u_xlat16_0.x + (-_InsideWidth);
    u_xlatb1 = u_xlat16_12>=u_xlat16_0.x;
    u_xlat16_0.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_0.x = u_xlat16_2.x + u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_14.y * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x / _InsideWidth;
    u_xlat16_0.x = log2(abs(u_xlat16_0.x));
    u_xlat16_0.x = u_xlat16_0.x * abs(_InsidePow);
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_6.x = log2(abs(u_xlat16_6.x));
    u_xlat16_6.x = u_xlat16_6.x * abs(_OutsidePow);
    u_xlat16_0.y = exp2(u_xlat16_6.x);
    u_xlat16_0.xy = min(u_xlat16_0.xy, vec2(1.0, 1.0));
    u_xlat16_0.x = u_xlat16_0.y + u_xlat16_0.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlatb1 = u_xlat16_2.y>=u_xlat7.x;
    u_xlat16_6.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_12 = u_xlat16_2.y + (-_InkShapeSmooth);
    u_xlat16_18 = (-u_xlat16_2.y) + u_xlat7.x;
    u_xlatb1 = u_xlat16_12>=u_xlat7.x;
    u_xlat16_2.xy = (bool(u_xlatb1)) ? vec2(1.0, -1.0) : vec2(0.0, -0.0);
    u_xlat16_12 = u_xlat16_18 + _InkShapeSmooth;
    u_xlat16_12 = u_xlat16_12 / _InkShapeSmooth;
    u_xlat16_12 = (-u_xlat16_12) + 1.0;
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_2.y;
    u_xlat16_6.x = u_xlat16_12 * u_xlat16_6.x + u_xlat16_2.x;
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
    u_xlat16_2.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_5.xyz = vs_TEXCOORD3.xyz * vs_TEXCOORD3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(_FrontIntensity);
    u_xlat16_12 = vs_TEXCOORD3.w;
    u_xlat16_18 = _BaseColor.w * u_xlat16_12 + -1.0;
    u_xlat16_1.w = u_xlat16_12 * _BaseColor.w;
    u_xlat16_12 = _UnMult * u_xlat16_18 + 1.0;
    u_xlat16_1 = vec4(u_xlat16_12) * u_xlat16_1;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_1.w;
    u_xlat16_0.x = u_xlat16_6.x * u_xlat16_0.x;
    SV_Target0.w = u_xlat16_0.x * u_xlat16_1.w;
    SV_Target0.xyz = u_xlat16_1.xyz;
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
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_REQUIRE_CUSTOMDATA" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_MeshEffect_InkDissolveGUI"
}