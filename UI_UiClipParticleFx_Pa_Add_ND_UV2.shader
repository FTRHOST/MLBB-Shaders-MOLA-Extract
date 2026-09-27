//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/UiClipParticleFx_Pa_Add_ND_UV2" {
Properties {

[Toggle(_CUSTOM_ON)] _CUSTOM_ON ("开启Custom", Float) = 1.0

_Diffuse ("Diffuse", 2D) = "white" { }

_DiffuseScale ("Diffuse缩放", Range(0, 10)) = 1.0

_DiffuseColor ("DiffuseColor", Color) = (1,1,1,1)

_DiffusePower ("DiffusePower", Float) = 1.0

_FrontIntensity ("FrontIntensity", Float) = 1.0

_DiffAngle ("Diff旋转", Float) = 0.0

[Toggle(_DISS2U_ON)] _DISS2U_ON ("Use UV2 for Dissolve Tex", Float) = 0.0

_DissolveTex ("DissolveTex", 2D) = "white" { }

_SoftSize ("SoftSize", Range(0, 2)) = 0.0

_DissolveStep ("DissolveStep", Range(0, 1)) = 0.0

_DissolveColor ("DissolveColor", Color) = (1,1,1,1)

_DissolveColorPW ("DissolveColorPW", Float) = 1.0

_NoiseXStreng ("扰动X强度", Range(-10, 10)) = 0.0

_NoiseYStreng ("扰动Y强度", Range(-10, 10)) = 0.0

_GChannel ("G通xy控Tiling zw控速度", Vector) = (1,1,0,0)

[Toggle(_MASK2U_ON)] _MASK2U_ON ("Use UV2 for Mask Tex", Float) = 0.0

_Mask ("Mask", 2D) = "white" { }

_MaskScale ("Mask缩放", Range(0, 10)) = 1.0

_MaskAngle ("Mask旋转", Float) = 0.0

_BackIntensity ("BackIntensity", Float) = 1.0

_BackColor ("BackColor", Color) = (1,1,1,1)

[Toggle] _COLOUR_ON ("色彩开关", Float) = 0.0

_Hue ("色相", Range(-0.5, 0.5)) = 0.0

_Saturation ("饱和度", Range(0, 2)) = 1.0

_Contrast ("对比度", Range(0, 2)) = 1.0

_SaturRightColor ("灰度渐变亮色", Color) = (1,1,1,1)

_SaturLeftColor ("灰度渐变暗色", Color) = (1,1,1,1)

_SaturRightColorWeights ("灰度渐变亮色权重", Range(0.5, 1)) = 1.0

_SaturLeftColorWeights ("灰度渐变暗色权重", Range(0, 0.5)) = 0.0

[Toggle] _HEIGHTGRADIENT_ON ("高度渐变开关", Float) = 0.0

_Height ("平面高度", Float) = 0.0

_HeightGradient ("高度渐变值", Float) = 0.5

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _MLZWrite ("ZWrite", Float) = 0.0

[Enum(On, 0,Off, 4)] _MLZTest ("总是最前", Float) = 4.0

_StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

_PanelRect ("PanelRect支持NGUI裁切", Vector) = (0,0,0,0)

_PanelClipInfo ("ClipInfo支持NGUI裁切", Vector) = (0,0,0,0)

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 18329
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat16_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = texture(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat16_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat16_2.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat18);
#else
    u_xlatb8 = 0.800000012>=u_xlat18;
#endif
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_18 = texture(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat1.x);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat16_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = texture(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat16_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat16_2.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat18);
#else
    u_xlatb8 = 0.800000012>=u_xlat18;
#endif
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_18 = texture(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat1.x);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat10_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat10_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat10_2.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat18;
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_18 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat10_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat10_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat10_2.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat18;
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_18 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat16_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = texture(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat16_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat16_2.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat18);
#else
    u_xlatb8 = 0.800000012>=u_xlat18;
#endif
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_18 = texture(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat1.x);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat16_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = texture(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat16_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat16_2.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat18);
#else
    u_xlatb8 = 0.800000012>=u_xlat18;
#endif
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_18 = texture(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat1.x);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat10_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat10_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat10_2.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat18;
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_18 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat10_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat10_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat10_2.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat18;
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_18 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat16_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = texture(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat16_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat16_2.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat18);
#else
    u_xlatb8 = 0.800000012>=u_xlat18;
#endif
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_18 = texture(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat1.x);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat16_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = texture(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat16_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat16_2.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat18);
#else
    u_xlatb8 = 0.800000012>=u_xlat18;
#endif
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_18 = texture(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat1.x);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat10_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat10_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat10_2.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat18;
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_18 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat10_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat10_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat10_2.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat18;
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_18 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat16_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = texture(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat16_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat16_2.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat18);
#else
    u_xlatb8 = 0.800000012>=u_xlat18;
#endif
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_18 = texture(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat1.x);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
mediump float u_xlat16_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_18 = texture(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat16_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = texture(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat16_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat16_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat16_2.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat18);
#else
    u_xlatb8 = 0.800000012>=u_xlat18;
#endif
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_18 = texture(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat1.x);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13.x>=(-u_xlat13.x));
#else
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
#endif
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat10_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat10_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat10_2.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat18;
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_18 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
bool u_xlatb13;
float u_xlat14;
float u_xlat18;
lowp float u_xlat10_18;
bool u_xlatb18;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_18) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat13.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat1.xy = u_xlat1.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_18 = texture2D(_DissolveTex, u_xlat1.xy).x;
    u_xlat18 = max(u_xlat10_18, 0.00100000005);
    u_xlat18 = u_xlat18 + (-_DissolveStep);
    u_xlat1.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat1.x);
    u_xlat3.x = cos(u_xlat1.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat13.xy);
    u_xlat2.xy = sin((-u_xlat1.xy));
    u_xlat4.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat13.xy);
    u_xlat4.y = u_xlat2.y;
    u_xlat7.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat7.xy = u_xlat7.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat7.xy);
    u_xlat7.xyz = u_xlat10_2.xyz * vec3(_DiffusePower);
    u_xlat7.xyz = u_xlat10_2.www * u_xlat7.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat7.xyz;
    u_xlat7.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat10_2.www + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat10_2.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat18 = u_xlat18 / u_xlat8;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat18;
    u_xlat14 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat7.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat4.z = u_xlat1.x;
    u_xlat1.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat3.y = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat3.x = dot(u_xlat4.xy, u_xlat1.xy);
    u_xlat1.xy = u_xlat3.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_18 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_18) * u_xlat0.xyz;
    u_xlat18 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb1 = _Height>=vs_TEXCOORD3.y;
    u_xlat18 = (u_xlatb1) ? 0.0 : u_xlat18;
    u_xlat18 = u_xlat18 / _HeightGradient;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlatb18 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_5.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat1.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat1.xy);
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat1 = u_xlat16_5.xxxx * u_xlat3.xywz + u_xlat1.xywz;
    u_xlatb18 = u_xlat0.x>=u_xlat1.x;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat1.w;
    u_xlat1.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat1.wyx;
    u_xlat3 = (-u_xlat1) + u_xlat3;
    u_xlat1 = vec4(u_xlat18) * u_xlat3 + u_xlat1;
    u_xlat18 = min(u_xlat1.y, u_xlat1.w);
    u_xlat18 = (-u_xlat18) + u_xlat1.x;
    u_xlat14 = u_xlat18 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat7.x = u_xlat7.x / u_xlat14;
    u_xlat7.x = u_xlat7.x + u_xlat1.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat13.x = u_xlat7.x * 360.0;
    u_xlatb13 = u_xlat13.x>=(-u_xlat13.x);
    u_xlat13.xy = (bool(u_xlatb13)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat13.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat13.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat14 = u_xlat1.x + 1.00000001e-10;
    u_xlat18 = u_xlat18 / u_xlat14;
    u_xlat18 = u_xlat18 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat18) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat18 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat2.x;
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
    u_xlat1.x = u_xlat18 * -2.0 + 3.0;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat1.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz + _SaturLeftColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlatb18 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb18)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_5.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_21 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat16_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat16_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat16_1.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat21);
#else
    u_xlatb8 = 0.800000012>=u_xlat21;
#endif
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_21 = texture(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.x>=u_xlat2.x);
#else
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_21 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat16_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat16_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat16_1.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat21);
#else
    u_xlatb8 = 0.800000012>=u_xlat21;
#endif
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_21 = texture(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.x>=u_xlat2.x);
#else
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat10_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat10_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat10_1.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat21;
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_21 = texture2D(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat10_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat10_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat10_1.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat21;
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_21 = texture2D(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_21 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat16_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat16_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat16_1.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat21);
#else
    u_xlatb8 = 0.800000012>=u_xlat21;
#endif
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_21 = texture(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.x>=u_xlat2.x);
#else
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_21 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat16_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat16_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat16_1.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat21);
#else
    u_xlatb8 = 0.800000012>=u_xlat21;
#endif
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_21 = texture(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.x>=u_xlat2.x);
#else
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat10_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat10_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat10_1.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat21;
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_21 = texture2D(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat10_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat10_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat10_1.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat21;
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_21 = texture2D(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_21 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat16_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat16_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat16_1.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat21);
#else
    u_xlatb8 = 0.800000012>=u_xlat21;
#endif
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_21 = texture(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.x>=u_xlat2.x);
#else
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_21 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat16_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat16_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat16_1.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat21);
#else
    u_xlatb8 = 0.800000012>=u_xlat21;
#endif
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_21 = texture(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.x>=u_xlat2.x);
#else
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat10_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat10_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat10_1.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat21;
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_21 = texture2D(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat10_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat10_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat10_1.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat21;
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_21 = texture2D(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_21 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat16_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat16_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat16_1.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat21);
#else
    u_xlatb8 = 0.800000012>=u_xlat21;
#endif
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_21 = texture(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.x>=u_xlat2.x);
#else
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat16_21 = texture(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat16_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_21 = texture(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat16_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_1 = texture(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat16_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat16_1.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.800000012>=u_xlat21);
#else
    u_xlatb8 = 0.800000012>=u_xlat21;
#endif
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_21 = texture(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.y>=u_xlat0.z);
#else
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
#endif
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat0.x>=u_xlat2.x);
#else
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat10_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat10_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat10_1.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat21;
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_21 = texture2D(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
vec3 u_xlat9;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat0.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _GChannel.zw;
    u_xlat1.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat1.xy;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat1.xy).y;
    u_xlat1.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD0.xy;
    u_xlat15.xy = vec2(u_xlat10_21) * vec2(_NoiseXStreng, _NoiseYStreng) + vs_TEXCOORD1.xy;
    u_xlat15.xy = u_xlat15.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_21 = texture2D(_DissolveTex, u_xlat15.xy).x;
    u_xlat21 = max(u_xlat10_21, 0.00100000005);
    u_xlat21 = u_xlat21 + (-_DissolveStep);
    u_xlat1.xy = u_xlat1.xy + vec2(-0.5, -0.5);
    u_xlat15.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat2.x = sin(u_xlat15.x);
    u_xlat3.x = cos(u_xlat15.x);
    u_xlat2.w = u_xlat2.x;
    u_xlat2.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat2.wz, u_xlat1.xy);
    u_xlat2.xy = sin((-u_xlat15.xy));
    u_xlat4 = sin(u_xlat15.y);
    u_xlat5.x = cos(u_xlat15.y);
    u_xlat3.x = dot(u_xlat2.zx, u_xlat1.xy);
    u_xlat5.y = u_xlat2.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_1 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(_DiffusePower);
    u_xlat2.xyz = u_xlat10_1.www * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xyz;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat10_1.www + (-u_xlat0.xyz);
    u_xlat1.x = u_xlat10_1.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat8 = _DissolveStep * _SoftSize;
    u_xlat21 = u_xlat21 / u_xlat8;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlatb8 = 0.800000012>=u_xlat21;
    u_xlat15.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat15.xxx * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat5.z = u_xlat4;
    u_xlat15.xy = vs_TEXCOORD1.xy + vec2(-0.5, -0.5);
    u_xlat2.y = dot(u_xlat5.zx, u_xlat15.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat15.xy);
    u_xlat15.xy = u_xlat2.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat15.xy = u_xlat15.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_21 = texture2D(_Mask, u_xlat15.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_21) * u_xlat0.xyz;
    u_xlat21 = vs_TEXCOORD3.y + (-_Height);
    u_xlatb15 = _Height>=vs_TEXCOORD3.y;
    u_xlat21 = (u_xlatb15) ? 0.0 : u_xlat21;
    u_xlat21 = u_xlat21 / _HeightGradient;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlatb21 = u_xlat0.y>=u_xlat0.z;
    u_xlat16_6.x = (u_xlatb21) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.zy;
    u_xlat3.xy = u_xlat0.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb21 = u_xlat0.x>=u_xlat2.x;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat0.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = vec4(u_xlat21) * u_xlat3 + u_xlat2;
    u_xlat21 = min(u_xlat2.y, u_xlat2.w);
    u_xlat21 = (-u_xlat21) + u_xlat2.x;
    u_xlat15.x = u_xlat21 * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat15.x = u_xlat22 / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + u_xlat2.z;
    u_xlat15.x = abs(u_xlat15.x) + _Hue;
    u_xlat22 = u_xlat15.x * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat15.x = u_xlat15.x * u_xlat9.y;
    u_xlat15.x = fract(u_xlat15.x);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat15.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15.x = u_xlat2.x + 1.00000001e-10;
    u_xlat21 = u_xlat21 / u_xlat15.x;
    u_xlat21 = u_xlat21 * _Saturation;
    u_xlat9.xyz = vec3(u_xlat21) * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat21 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat1.x = u_xlat21 * -2.0 + 3.0;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat1.xzw = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat1.xzw = vec3(u_xlat21) * u_xlat1.xzw + _SaturLeftColor.xyz;
    u_xlat1.xzw = u_xlat1.xzw * u_xlat16_6.xyz;
    u_xlat1.xyz = (bool(u_xlatb8)) ? u_xlat0.xyz : u_xlat1.xzw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat1.xyz : u_xlat0.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.xy * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.xy + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0.xyxy + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD4.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelRect.zw;
    u_xlat16_6.xy = u_xlat16_6.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Time;
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _DissolveTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD4;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump float u_xlat16_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_7 = texture(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat16_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(0.800000012>=u_xlat7.x);
#else
    u_xlatb14 = 0.800000012>=u_xlat7.x;
#endif
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat16_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_3 = texture(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat16_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat16_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0 = texture(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat16_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_Height>=vs_TEXCOORD3.y);
#else
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
#endif
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat2.x);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=(-u_xlat22));
#else
    u_xlatb22 = u_xlat22>=(-u_xlat22);
#endif
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON));
#else
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
#endif
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1 = in_TEXCOORD1;
    vs_TEXCOORD2 = in_TEXCOORD2;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
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
uniform 	vec4 _Diffuse_ST;
uniform 	vec4 _DiffuseColor;
uniform 	vec4 _Mask_ST;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DiffusePower;
uniform 	float _DissolveStep;
uniform 	float _SoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	vec4 _BackColor;
uniform 	vec4 _GChannel;
uniform 	float _DiffAngle;
uniform 	float _MaskAngle;
uniform 	float _NoiseXStreng;
uniform 	float _NoiseYStreng;
uniform 	float _MaskScale;
uniform 	float _DiffuseScale;
uniform 	float _BackIntensity;
uniform 	float _FrontIntensity;
uniform 	mediump float _HEIGHTGRADIENT_ON;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _COLOUR_ON;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _DissolveTex;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
lowp float u_xlat10_7;
vec3 u_xlat9;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
void main()
{
    u_xlat0.xy = _Time.yy * _GChannel.zw;
    u_xlat0.xy = vs_TEXCOORD0.zw * _GChannel.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_DissolveTex, u_xlat0.xy).y;
    u_xlat7.xy = vs_TEXCOORD0.zw + vs_TEXCOORD2.zw;
    u_xlat7.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat7.xy;
    u_xlat7.xy = u_xlat7.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_7 = texture2D(_DissolveTex, u_xlat7.xy).x;
    u_xlat7.x = max(u_xlat10_7, 0.00100000005);
    u_xlat14.xy = max(vs_TEXCOORD2.xy, vec2(0.0, 0.0));
    u_xlat14.xy = u_xlat14.xy + vec2(_SoftSize, _DissolveStep);
    u_xlat7.x = (-u_xlat14.y) + u_xlat7.x;
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat7.x = u_xlat7.x / u_xlat14.x;
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
    u_xlatb14 = 0.800000012>=u_xlat7.x;
    u_xlat21 = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat1 = vs_TEXCOORD0 + vs_TEXCOORD1;
    u_xlat1.xy = vec2(u_xlat10_0) * vec2(_NoiseXStreng, _NoiseYStreng) + u_xlat1.xy;
    u_xlat1 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2.xy = vec2(_DiffAngle, _MaskAngle) * vec2(0.0174532924, 0.0174532924);
    u_xlat0.x = sin(u_xlat2.x);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat4.w = u_xlat0.x;
    u_xlat4.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat4.wz, u_xlat1.xy);
    u_xlat4.xy = sin((-u_xlat2.xy));
    u_xlat0.x = sin(u_xlat2.y);
    u_xlat2.x = cos(u_xlat2.y);
    u_xlat3.x = dot(u_xlat4.zx, u_xlat1.xy);
    u_xlat2.y = u_xlat4.y;
    u_xlat1.xy = u_xlat3.xy * vec2(vec2(_DiffuseScale, _DiffuseScale)) + vec2(0.5, 0.5);
    u_xlat1.xy = u_xlat1.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_3 = texture2D(_Diffuse, u_xlat1.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * vec3(_DiffusePower);
    u_xlat4.xyz = u_xlat10_3.www * u_xlat4.xyz;
    u_xlat5.xyz = _BackColor.xyz * vec3(vec3(_BackIntensity, _BackIntensity, _BackIntensity));
    u_xlat5.xyz = (int((gl_FrontFacing ? 1 : 0)) != 0) ? vec3(vec4(_FrontIntensity, _FrontIntensity, _FrontIntensity, _FrontIntensity)) : u_xlat5.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat5.xyz;
    u_xlat5.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat10_3.www + (-u_xlat4.xyz);
    u_xlat4.xyz = vec3(u_xlat21) * u_xlat5.xyz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat7.xxx * u_xlat4.xyz;
    u_xlat7.x = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat2.z = u_xlat0.x;
    u_xlat1.y = dot(u_xlat2.zx, u_xlat1.zw);
    u_xlat1.x = dot(u_xlat2.xy, u_xlat1.zw);
    u_xlat0.xw = u_xlat1.xy * vec2(_MaskScale) + vec2(0.5, 0.5);
    u_xlat0.xw = u_xlat0.xw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0 = texture2D(_Mask, u_xlat0.xw).x;
    u_xlat1.xyz = vec3(u_xlat10_0) * u_xlat4.xyz;
    u_xlat0.x = vs_TEXCOORD3.y + (-_Height);
    u_xlatb21 = _Height>=vs_TEXCOORD3.y;
    u_xlat0.x = (u_xlatb21) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_HEIGHTGRADIENT_ON);
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat1.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_6.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb0 = u_xlat1.x>=u_xlat2.x;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat2.w;
    u_xlat2.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.xxxx * u_xlat3 + u_xlat2;
    u_xlat0.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat0.x = (-u_xlat0.x) + u_xlat2.x;
    u_xlat21 = u_xlat0.x * 6.0 + 1.00000001e-10;
    u_xlat22 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat21 = u_xlat22 / u_xlat21;
    u_xlat21 = u_xlat21 + u_xlat2.z;
    u_xlat21 = abs(u_xlat21) + _Hue;
    u_xlat22 = u_xlat21 * 360.0;
    u_xlatb22 = u_xlat22>=(-u_xlat22);
    u_xlat9.xy = (bool(u_xlatb22)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat21 = u_xlat21 * u_xlat9.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat9.xyz = u_xlat9.xxx * vec3(u_xlat21) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat9.xyz = fract(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat9.xyz = abs(u_xlat9.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
    u_xlat9.xyz = u_xlat9.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = u_xlat2.x + 1.00000001e-10;
    u_xlat0.x = u_xlat0.x / u_xlat21;
    u_xlat0.x = u_xlat0.x * _Saturation;
    u_xlat9.xyz = u_xlat0.xxx * u_xlat9.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat9.xyz * u_xlat2.xxx;
    u_xlat16_6.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat2.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat2.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat16_6.xyz;
    u_xlat0.xyz = (bool(u_xlatb14)) ? u_xlat1.xyz : u_xlat0.xyw;
    u_xlatb21 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_COLOUR_ON);
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = vs_COLOR0.www * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _DiffuseColor.www;
    u_xlat16_6.xy = vs_TEXCOORD4.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_OFF" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_OFF" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_OFF" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_CUSTOM_ON" "_DISS2U_ON" "_MASK2U_ON" "_PANEL_CLIP_NEW" }
""
}
}
}
}
}