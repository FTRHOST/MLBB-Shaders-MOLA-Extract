//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/StarrySkyHeightGradient" {
Properties {

[Enum(UnityEngine.Rendering.BlendMode)] _Src ("Src", Float) = 5.0

[Enum(UnityEngine.Rendering.BlendMode)] _Dst ("Dst", Float) = 1.0

[Header(public)] _U ("U", Float) = 8.0

_V ("V", Float) = 8.0

_Amount ("Amount", Range(0, 1)) = 1.0

_MinSize ("MinSize", Float) = 0.0

_MaxSize ("MaxSize", Float) = 1.0

_USpeed ("USpeed", Float) = 0.20000000298023224

_VSpeed ("VSpeed", Float) = 0.20000000298023224

_Noise ("Noise", 2D) = "white" { }

[Header(Stars)] [Toggle] _StarsToggle ("StarsToggle", Float) = 1.0

_StarsColor ("StarsColor", Color) = (0.985294,0.985294,0.985294,1)

_StarSize ("StarSize", Float) = 1.0

_StarsEmission ("StarsEmission", Float) = 1.0

_StarsPow ("StarsPow", Float) = 1.0

[Header(Golw)] [Toggle] _GlowToggle ("GlowToggle", Float) = 0.0

_GolwColor ("GolwColor", Color) = (1,1,1,1)

_GolwSize ("GolwSize", Float) = 1.0

_GolwEmission ("GolwEmission", Float) = 1.0

_GolwPow ("GolwPow", Float) = 1.0

[Header(Mask)] _Mask ("Mask", 2D) = "white" { }

_MaskEmission ("MaskEmission", Float) = 1.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull2 ("Cull", Float) = 0.0

[Enum(Off,0,On,1)] _ZWrite ("ZWrite", Float) = 0.0

[Enum(On,0,Off,4)] _ZTest2 ("总是在前", Float) = 4.0

_StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

[Toggle] _HEIGHTGRADIENT_ON ("高度渐变开关(禁动画中K开关)", Float) = 0.0

_Height ("平面高度", Float) = 0.0

_HeightGradient ("高度渐变值", Float) = 0.5

}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "Unlit"
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 24237
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _GolwColor;
uniform 	mediump vec4 _StarsColor;
uniform 	mediump float _GolwEmission;
uniform 	mediump float _U;
uniform 	mediump float _V;
uniform 	mediump float _USpeed;
uniform 	mediump float _VSpeed;
uniform 	mediump float _MinSize;
uniform 	mediump float _MaxSize;
uniform 	mediump float _GolwSize;
uniform 	mediump float _Amount;
uniform 	mediump float _GolwPow;
uniform 	mediump float _MaskEmission;
uniform 	mediump float _GlowToggle;
uniform 	mediump float _StarsEmission;
uniform 	mediump float _StarSize;
uniform 	mediump float _StarsPow;
uniform 	mediump float _StarsToggle;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _HEIGHTGRADIENT_ON;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in mediump vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat16_5;
bool u_xlatb6;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * vec2(_U, _V);
    u_xlat16_10.xy = trunc(u_xlat16_0.xy);
    u_xlat16_0.xy = fract(u_xlat16_0.xy);
    u_xlat16_10.xy = u_xlat16_10.xy / vec2(_U, _V);
    u_xlat1.x = _Time.y * 0.00100000005;
    u_xlat16_2.x = u_xlat1.x * _USpeed;
    u_xlat16_2.y = u_xlat1.x * _VSpeed;
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_2.xy;
    u_xlat16_1 = texture(_Noise, u_xlat16_10.xy).x;
    u_xlat16_10.x = u_xlat16_1 * u_xlat16_1;
    u_xlat16_15 = u_xlat16_10.x * 1.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Amount>=u_xlat16_10.x);
#else
    u_xlatb1 = _Amount>=u_xlat16_10.x;
#endif
    u_xlat16_10.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-_MinSize) + _MaxSize;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_2.x + _MinSize;
    u_xlat16_15 = (-u_xlat16_15) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat16_0.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = abs(u_xlat1.xy) + abs(u_xlat1.xy);
    u_xlat1.xy = sqrt(u_xlat1.xy);
    u_xlat16_0.x = u_xlat1.y + u_xlat1.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + (-u_xlat16_15);
    u_xlat16_0.x = u_xlat16_0.x + 1.0;
    u_xlat16_5 = dot(u_xlat16_2.xy, u_xlat16_2.xy);
    u_xlat16_5 = sqrt(u_xlat16_5);
    u_xlat16_5 = (-u_xlat16_5) + 1.0;
    u_xlat16_5 = (-u_xlat16_15) + u_xlat16_5;
    u_xlat16_15 = (-_GolwSize) + 1.0;
    u_xlat16_5 = (-u_xlat16_15) + u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 * _GolwEmission;
    u_xlat16_5 = u_xlat16_10.x * u_xlat16_5;
    u_xlat16_5 = u_xlat16_5 * _GolwColor.w;
    u_xlat16_5 = u_xlat16_5 * vs_COLOR0.w;
    u_xlat16_5 = log2(u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 * _GolwPow;
    u_xlat16_5 = exp2(u_xlat16_5);
    u_xlat16_2.xyz = vec3(u_xlat16_5) + _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_1 = texture(_Mask, u_xlat16_3.xy).x;
    u_xlat16_2.xyz = vec3(u_xlat16_1) * u_xlat16_2.xyz;
    u_xlat16_5 = u_xlat16_5 * u_xlat16_1;
    u_xlat16_2.w = u_xlat16_5 * _MaskEmission;
    u_xlat16_2 = u_xlat16_2 * vec4(vec4(_GlowToggle, _GlowToggle, _GlowToggle, _GlowToggle));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_5 = (-_StarSize) + 1.0;
    u_xlat16_0.x = (-u_xlat16_5) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_0.x * _StarsEmission;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _StarsPow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_5 = u_xlat16_10.x * u_xlat16_0.x;
    u_xlat16_0.xzw = u_xlat16_0.xxx * _StarsColor.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xzw * vs_COLOR0.xyz;
    u_xlat16_0.x = u_xlat16_5 * _StarsColor.w;
    u_xlat16_0.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_0.x = u_xlat16_1 * u_xlat16_0.x;
    u_xlat16_3.w = u_xlat16_0.x * _MaskEmission;
    u_xlat16_0 = u_xlat16_3 * vec4(vec4(_StarsToggle, _StarsToggle, _StarsToggle, _StarsToggle));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat1.x = vs_TEXCOORD2.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(_Height>=vs_TEXCOORD2.y);
#else
    u_xlatb6 = _Height>=vs_TEXCOORD2.y;
#endif
    u_xlat1.x = (u_xlatb6) ? 0.0 : u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat16_0.w * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_HEIGHTGRADIENT_ON);
#else
    u_xlatb6 = 0.5<_HEIGHTGRADIENT_ON;
#endif
    u_xlat1.w = (u_xlatb6) ? u_xlat1.x : u_xlat16_0.w;
    u_xlat4.xyz = log2(u_xlat16_0.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat1.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    SV_Target0 = u_xlat1;
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
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _GolwColor;
uniform 	mediump vec4 _StarsColor;
uniform 	mediump float _GolwEmission;
uniform 	mediump float _U;
uniform 	mediump float _V;
uniform 	mediump float _USpeed;
uniform 	mediump float _VSpeed;
uniform 	mediump float _MinSize;
uniform 	mediump float _MaxSize;
uniform 	mediump float _GolwSize;
uniform 	mediump float _Amount;
uniform 	mediump float _GolwPow;
uniform 	mediump float _MaskEmission;
uniform 	mediump float _GlowToggle;
uniform 	mediump float _StarsEmission;
uniform 	mediump float _StarSize;
uniform 	mediump float _StarsPow;
uniform 	mediump float _StarsToggle;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _HEIGHTGRADIENT_ON;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in mediump vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat16_5;
bool u_xlatb6;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * vec2(_U, _V);
    u_xlat16_10.xy = trunc(u_xlat16_0.xy);
    u_xlat16_0.xy = fract(u_xlat16_0.xy);
    u_xlat16_10.xy = u_xlat16_10.xy / vec2(_U, _V);
    u_xlat1.x = _Time.y * 0.00100000005;
    u_xlat16_2.x = u_xlat1.x * _USpeed;
    u_xlat16_2.y = u_xlat1.x * _VSpeed;
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_2.xy;
    u_xlat16_1 = texture(_Noise, u_xlat16_10.xy).x;
    u_xlat16_10.x = u_xlat16_1 * u_xlat16_1;
    u_xlat16_15 = u_xlat16_10.x * 1.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Amount>=u_xlat16_10.x);
#else
    u_xlatb1 = _Amount>=u_xlat16_10.x;
#endif
    u_xlat16_10.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-_MinSize) + _MaxSize;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_2.x + _MinSize;
    u_xlat16_15 = (-u_xlat16_15) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat16_0.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = abs(u_xlat1.xy) + abs(u_xlat1.xy);
    u_xlat1.xy = sqrt(u_xlat1.xy);
    u_xlat16_0.x = u_xlat1.y + u_xlat1.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + (-u_xlat16_15);
    u_xlat16_0.x = u_xlat16_0.x + 1.0;
    u_xlat16_5 = dot(u_xlat16_2.xy, u_xlat16_2.xy);
    u_xlat16_5 = sqrt(u_xlat16_5);
    u_xlat16_5 = (-u_xlat16_5) + 1.0;
    u_xlat16_5 = (-u_xlat16_15) + u_xlat16_5;
    u_xlat16_15 = (-_GolwSize) + 1.0;
    u_xlat16_5 = (-u_xlat16_15) + u_xlat16_5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 * _GolwEmission;
    u_xlat16_5 = u_xlat16_10.x * u_xlat16_5;
    u_xlat16_5 = u_xlat16_5 * _GolwColor.w;
    u_xlat16_5 = u_xlat16_5 * vs_COLOR0.w;
    u_xlat16_5 = log2(u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 * _GolwPow;
    u_xlat16_5 = exp2(u_xlat16_5);
    u_xlat16_2.xyz = vec3(u_xlat16_5) + _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_1 = texture(_Mask, u_xlat16_3.xy).x;
    u_xlat16_2.xyz = vec3(u_xlat16_1) * u_xlat16_2.xyz;
    u_xlat16_5 = u_xlat16_5 * u_xlat16_1;
    u_xlat16_2.w = u_xlat16_5 * _MaskEmission;
    u_xlat16_2 = u_xlat16_2 * vec4(vec4(_GlowToggle, _GlowToggle, _GlowToggle, _GlowToggle));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_5 = (-_StarSize) + 1.0;
    u_xlat16_0.x = (-u_xlat16_5) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_0.x * _StarsEmission;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _StarsPow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_5 = u_xlat16_10.x * u_xlat16_0.x;
    u_xlat16_0.xzw = u_xlat16_0.xxx * _StarsColor.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xzw * vs_COLOR0.xyz;
    u_xlat16_0.x = u_xlat16_5 * _StarsColor.w;
    u_xlat16_0.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_0.x = u_xlat16_1 * u_xlat16_0.x;
    u_xlat16_3.w = u_xlat16_0.x * _MaskEmission;
    u_xlat16_0 = u_xlat16_3 * vec4(vec4(_StarsToggle, _StarsToggle, _StarsToggle, _StarsToggle));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0 = min(max(u_xlat16_0, 0.0), 1.0);
#else
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
#endif
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat1.x = vs_TEXCOORD2.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(_Height>=vs_TEXCOORD2.y);
#else
    u_xlatb6 = _Height>=vs_TEXCOORD2.y;
#endif
    u_xlat1.x = (u_xlatb6) ? 0.0 : u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat16_0.w * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.5<_HEIGHTGRADIENT_ON);
#else
    u_xlatb6 = 0.5<_HEIGHTGRADIENT_ON;
#endif
    u_xlat1.w = (u_xlatb6) ? u_xlat1.x : u_xlat16_0.w;
    u_xlat4.xyz = log2(u_xlat16_0.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat1.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    SV_Target0 = u_xlat1;
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
attribute mediump vec4 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _GolwColor;
uniform 	mediump vec4 _StarsColor;
uniform 	mediump float _GolwEmission;
uniform 	mediump float _U;
uniform 	mediump float _V;
uniform 	mediump float _USpeed;
uniform 	mediump float _VSpeed;
uniform 	mediump float _MinSize;
uniform 	mediump float _MaxSize;
uniform 	mediump float _GolwSize;
uniform 	mediump float _Amount;
uniform 	mediump float _GolwPow;
uniform 	mediump float _MaskEmission;
uniform 	mediump float _GlowToggle;
uniform 	mediump float _StarsEmission;
uniform 	mediump float _StarSize;
uniform 	mediump float _StarsPow;
uniform 	mediump float _StarsToggle;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Mask;
varying mediump vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat16_5;
bool u_xlatb6;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_15;
float trunc(float x) { return sign(x)*floor(abs(x)); }
vec2 trunc(vec2 x) { return sign(x)*floor(abs(x)); }
vec3 trunc(vec3 x) { return sign(x)*floor(abs(x)); }
vec4 trunc(vec4 x) { return sign(x)*floor(abs(x)); }

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * vec2(_U, _V);
    u_xlat16_10.xy = trunc(u_xlat16_0.xy);
    u_xlat16_0.xy = fract(u_xlat16_0.xy);
    u_xlat16_10.xy = u_xlat16_10.xy / vec2(_U, _V);
    u_xlat1.x = _Time.y * 0.00100000005;
    u_xlat16_2.x = u_xlat1.x * _USpeed;
    u_xlat16_2.y = u_xlat1.x * _VSpeed;
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_2.xy;
    u_xlat10_1 = texture2D(_Noise, u_xlat16_10.xy).x;
    u_xlat16_10.x = u_xlat10_1 * u_xlat10_1;
    u_xlat16_15 = u_xlat16_10.x * 1.5;
    u_xlatb1 = _Amount>=u_xlat16_10.x;
    u_xlat16_10.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-_MinSize) + _MaxSize;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_2.x + _MinSize;
    u_xlat16_15 = (-u_xlat16_15) + 1.0;
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat16_0.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = abs(u_xlat1.xy) + abs(u_xlat1.xy);
    u_xlat1.xy = sqrt(u_xlat1.xy);
    u_xlat16_0.x = u_xlat1.y + u_xlat1.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + (-u_xlat16_15);
    u_xlat16_0.x = u_xlat16_0.x + 1.0;
    u_xlat16_5 = dot(u_xlat16_2.xy, u_xlat16_2.xy);
    u_xlat16_5 = sqrt(u_xlat16_5);
    u_xlat16_5 = (-u_xlat16_5) + 1.0;
    u_xlat16_5 = (-u_xlat16_15) + u_xlat16_5;
    u_xlat16_15 = (-_GolwSize) + 1.0;
    u_xlat16_5 = (-u_xlat16_15) + u_xlat16_5;
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
    u_xlat16_5 = u_xlat16_5 * _GolwEmission;
    u_xlat16_5 = u_xlat16_10.x * u_xlat16_5;
    u_xlat16_5 = u_xlat16_5 * _GolwColor.w;
    u_xlat16_5 = u_xlat16_5 * vs_COLOR0.w;
    u_xlat16_5 = log2(u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 * _GolwPow;
    u_xlat16_5 = exp2(u_xlat16_5);
    u_xlat16_2.xyz = vec3(u_xlat16_5) + _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_1 = texture2D(_Mask, u_xlat16_3.xy).x;
    u_xlat16_2.xyz = vec3(u_xlat10_1) * u_xlat16_2.xyz;
    u_xlat16_5 = u_xlat16_5 * u_xlat10_1;
    u_xlat16_2.w = u_xlat16_5 * _MaskEmission;
    u_xlat16_2 = u_xlat16_2 * vec4(vec4(_GlowToggle, _GlowToggle, _GlowToggle, _GlowToggle));
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_5 = (-_StarSize) + 1.0;
    u_xlat16_0.x = (-u_xlat16_5) + u_xlat16_0.x;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_0.x = u_xlat16_0.x * _StarsEmission;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _StarsPow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_5 = u_xlat16_10.x * u_xlat16_0.x;
    u_xlat16_0.xzw = u_xlat16_0.xxx * _StarsColor.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xzw * vs_COLOR0.xyz;
    u_xlat16_0.x = u_xlat16_5 * _StarsColor.w;
    u_xlat16_0.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_0.x = u_xlat10_1 * u_xlat16_0.x;
    u_xlat16_3.w = u_xlat16_0.x * _MaskEmission;
    u_xlat16_0 = u_xlat16_3 * vec4(vec4(_StarsToggle, _StarsToggle, _StarsToggle, _StarsToggle));
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat1.x = vs_TEXCOORD2.y + (-_Height);
    u_xlatb6 = _Height>=vs_TEXCOORD2.y;
    u_xlat1.x = (u_xlatb6) ? 0.0 : u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _HeightGradient;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat16_0.w * u_xlat1.x;
    u_xlatb6 = 0.5<_HEIGHTGRADIENT_ON;
    u_xlat1.w = (u_xlatb6) ? u_xlat1.x : u_xlat16_0.w;
    u_xlat4.xyz = log2(u_xlat16_0.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat1.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    SV_Target0 = u_xlat1;
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
attribute mediump vec4 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _GolwColor;
uniform 	mediump vec4 _StarsColor;
uniform 	mediump float _GolwEmission;
uniform 	mediump float _U;
uniform 	mediump float _V;
uniform 	mediump float _USpeed;
uniform 	mediump float _VSpeed;
uniform 	mediump float _MinSize;
uniform 	mediump float _MaxSize;
uniform 	mediump float _GolwSize;
uniform 	mediump float _Amount;
uniform 	mediump float _GolwPow;
uniform 	mediump float _MaskEmission;
uniform 	mediump float _GlowToggle;
uniform 	mediump float _StarsEmission;
uniform 	mediump float _StarSize;
uniform 	mediump float _StarsPow;
uniform 	mediump float _StarsToggle;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Mask;
varying mediump vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump float u_xlat16_5;
bool u_xlatb6;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_15;
float trunc(float x) { return sign(x)*floor(abs(x)); }
vec2 trunc(vec2 x) { return sign(x)*floor(abs(x)); }
vec3 trunc(vec3 x) { return sign(x)*floor(abs(x)); }
vec4 trunc(vec4 x) { return sign(x)*floor(abs(x)); }

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * vec2(_U, _V);
    u_xlat16_10.xy = trunc(u_xlat16_0.xy);
    u_xlat16_0.xy = fract(u_xlat16_0.xy);
    u_xlat16_10.xy = u_xlat16_10.xy / vec2(_U, _V);
    u_xlat1.x = _Time.y * 0.00100000005;
    u_xlat16_2.x = u_xlat1.x * _USpeed;
    u_xlat16_2.y = u_xlat1.x * _VSpeed;
    u_xlat16_10.xy = u_xlat16_10.xy + u_xlat16_2.xy;
    u_xlat10_1 = texture2D(_Noise, u_xlat16_10.xy).x;
    u_xlat16_10.x = u_xlat10_1 * u_xlat10_1;
    u_xlat16_15 = u_xlat16_10.x * 1.5;
    u_xlatb1 = _Amount>=u_xlat16_10.x;
    u_xlat16_10.x = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-_MinSize) + _MaxSize;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_2.x + _MinSize;
    u_xlat16_15 = (-u_xlat16_15) + 1.0;
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat16_0.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = abs(u_xlat1.xy) + abs(u_xlat1.xy);
    u_xlat1.xy = sqrt(u_xlat1.xy);
    u_xlat16_0.x = u_xlat1.y + u_xlat1.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + (-u_xlat16_15);
    u_xlat16_0.x = u_xlat16_0.x + 1.0;
    u_xlat16_5 = dot(u_xlat16_2.xy, u_xlat16_2.xy);
    u_xlat16_5 = sqrt(u_xlat16_5);
    u_xlat16_5 = (-u_xlat16_5) + 1.0;
    u_xlat16_5 = (-u_xlat16_15) + u_xlat16_5;
    u_xlat16_15 = (-_GolwSize) + 1.0;
    u_xlat16_5 = (-u_xlat16_15) + u_xlat16_5;
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
    u_xlat16_5 = u_xlat16_5 * _GolwEmission;
    u_xlat16_5 = u_xlat16_10.x * u_xlat16_5;
    u_xlat16_5 = u_xlat16_5 * _GolwColor.w;
    u_xlat16_5 = u_xlat16_5 * vs_COLOR0.w;
    u_xlat16_5 = log2(u_xlat16_5);
    u_xlat16_5 = u_xlat16_5 * _GolwPow;
    u_xlat16_5 = exp2(u_xlat16_5);
    u_xlat16_2.xyz = vec3(u_xlat16_5) + _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_1 = texture2D(_Mask, u_xlat16_3.xy).x;
    u_xlat16_2.xyz = vec3(u_xlat10_1) * u_xlat16_2.xyz;
    u_xlat16_5 = u_xlat16_5 * u_xlat10_1;
    u_xlat16_2.w = u_xlat16_5 * _MaskEmission;
    u_xlat16_2 = u_xlat16_2 * vec4(vec4(_GlowToggle, _GlowToggle, _GlowToggle, _GlowToggle));
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_5 = (-_StarSize) + 1.0;
    u_xlat16_0.x = (-u_xlat16_5) + u_xlat16_0.x;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_0.x = u_xlat16_0.x * _StarsEmission;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _StarsPow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_5 = u_xlat16_10.x * u_xlat16_0.x;
    u_xlat16_0.xzw = u_xlat16_0.xxx * _StarsColor.xyz;
    u_xlat16_3.xyz = u_xlat16_0.xzw * vs_COLOR0.xyz;
    u_xlat16_0.x = u_xlat16_5 * _StarsColor.w;
    u_xlat16_0.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat16_0.x = u_xlat10_1 * u_xlat16_0.x;
    u_xlat16_3.w = u_xlat16_0.x * _MaskEmission;
    u_xlat16_0 = u_xlat16_3 * vec4(vec4(_StarsToggle, _StarsToggle, _StarsToggle, _StarsToggle));
    u_xlat16_0 = clamp(u_xlat16_0, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat1.x = vs_TEXCOORD2.y + (-_Height);
    u_xlatb6 = _Height>=vs_TEXCOORD2.y;
    u_xlat1.x = (u_xlatb6) ? 0.0 : u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _HeightGradient;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat16_0.w * u_xlat1.x;
    u_xlatb6 = 0.5<_HEIGHTGRADIENT_ON;
    u_xlat1.w = (u_xlatb6) ? u_xlat1.x : u_xlat16_0.w;
    u_xlat4.xyz = log2(u_xlat16_0.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat1.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    SV_Target0 = u_xlat1;
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