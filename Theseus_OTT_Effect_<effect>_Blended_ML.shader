//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/<effect>_Blended_ML" {
Properties {

_Diffuse ("Diffuse", 2D) = "white" { }

_Intensity ("Intensity", Float) = 0.0

_Color ("Color", Color) = (0.5,0.5,0.5,1)

[Toggle(_COLOUR_ON)] _COLOUR_ON ("色彩开关(禁动画中K开关)", Float) = 0.0

_Hue ("色相", Range(-0.5, 0.5)) = 0.0

_Saturation ("饱和度", Range(0, 2)) = 1.0

_Contrast ("对比度", Range(0, 2)) = 1.0

_SaturRightColor ("灰度渐变亮色", Color) = (1,1,1,1)

_SaturLeftColor ("灰度渐变暗色", Color) = (1,1,1,1)

_SaturRightColorWeights ("灰度渐变亮色权重", Range(0.5, 1)) = 1.0

_SaturLeftColorWeights ("灰度渐变暗色权重", Range(0, 0.5)) = 0.0

[Toggle] _Crystal_UseCustomColor ("UseCustomColor", Float) = 0.0

_Crystal_CustomColorHSV ("CustomColorHsv", Vector) = (0,1,1,0)

[Toggle(_HEIGHTGRADIENT_ON)] _HEIGHTGRADIENT_ON ("高度渐变开关(禁动画中K开关)", Float) = 0.0

_Height ("平面高度", Float) = 0.0

_HeightGradient ("高度渐变值", Float) = 0.5

_StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5

[Toggle] _IsGray ("IsGray", Float) = 0.0

_TransparentStrong ("TransparentStrong", Float) = 1.0

_IsInvertGray ("IsInvertGray", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 48664
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
bool u_xlatb20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat16_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat16_0.x = u_xlat16_18 * _TransparentStrong;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb20 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb20){
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!(u_xlat16_6.y>=u_xlat16_6.z);
#else
        u_xlatb20 = u_xlat16_6.y>=u_xlat16_6.z;
#endif
        u_xlat16_19 = (u_xlatb20) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_6.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_19) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_19) * u_xlat16.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_6.x>=u_xlat3.x);
#else
        u_xlatb8 = u_xlat16_6.x>=u_xlat3.x;
#endif
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_6.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat2.xzw = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat8 = u_xlat8 * u_xlat1.w + u_xlat16_6.x;
        u_xlat4.x = min(u_xlat2.z, u_xlat8);
        u_xlat4.x = u_xlat2.x + (-u_xlat4.x);
        u_xlat8 = (-u_xlat2.z) + u_xlat8;
        u_xlat14 = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat8 = u_xlat8 + u_xlat2.w;
        u_xlat14 = u_xlat2.x + 1.00000001e-10;
        u_xlat2.z = u_xlat4.x / u_xlat14;
        u_xlat16_5 = abs(u_xlat8) + _Crystal_CustomColorHSV.x;
        u_xlat16_11.xy = u_xlat2.zx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_5) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_11.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat6.xyz = u_xlat2.xyz * u_xlat16_11.yyy;
        u_xlat16_6.xyz = u_xlat6.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat2.xyz = log2(abs(u_xlat16_6.xyz));
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
bool u_xlatb20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat16_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat16_0.x = u_xlat16_18 * _TransparentStrong;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb20 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb20){
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!(u_xlat16_6.y>=u_xlat16_6.z);
#else
        u_xlatb20 = u_xlat16_6.y>=u_xlat16_6.z;
#endif
        u_xlat16_19 = (u_xlatb20) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_6.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_19) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_19) * u_xlat16.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_6.x>=u_xlat3.x);
#else
        u_xlatb8 = u_xlat16_6.x>=u_xlat3.x;
#endif
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_6.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat2.xzw = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat8 = u_xlat8 * u_xlat1.w + u_xlat16_6.x;
        u_xlat4.x = min(u_xlat2.z, u_xlat8);
        u_xlat4.x = u_xlat2.x + (-u_xlat4.x);
        u_xlat8 = (-u_xlat2.z) + u_xlat8;
        u_xlat14 = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat8 = u_xlat8 + u_xlat2.w;
        u_xlat14 = u_xlat2.x + 1.00000001e-10;
        u_xlat2.z = u_xlat4.x / u_xlat14;
        u_xlat16_5 = abs(u_xlat8) + _Crystal_CustomColorHSV.x;
        u_xlat16_11.xy = u_xlat2.zx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_5) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_11.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat6.xyz = u_xlat2.xyz * u_xlat16_11.yyy;
        u_xlat16_6.xyz = u_xlat6.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat2.xyz = log2(abs(u_xlat16_6.xyz));
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
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
bool u_xlatb20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat10_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat16_0.x = u_xlat16_18 * _TransparentStrong;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlatb20 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb20){
        u_xlatb20 = u_xlat16_6.y>=u_xlat16_6.z;
        u_xlat16_19 = (u_xlatb20) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_6.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_19) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_19) * u_xlat16.xy + vec2(-1.0, 0.666666687);
        u_xlatb8 = u_xlat16_6.x>=u_xlat3.x;
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_6.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat2.xzw = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat8 = u_xlat8 * u_xlat1.w + u_xlat16_6.x;
        u_xlat4.x = min(u_xlat2.z, u_xlat8);
        u_xlat4.x = u_xlat2.x + (-u_xlat4.x);
        u_xlat8 = (-u_xlat2.z) + u_xlat8;
        u_xlat14 = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat8 = u_xlat8 + u_xlat2.w;
        u_xlat14 = u_xlat2.x + 1.00000001e-10;
        u_xlat2.z = u_xlat4.x / u_xlat14;
        u_xlat16_5 = abs(u_xlat8) + _Crystal_CustomColorHSV.x;
        u_xlat16_11.xy = u_xlat2.zx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_5) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_11.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat6.xyz = u_xlat2.xyz * u_xlat16_11.yyy;
        u_xlat16_6.xyz = u_xlat6.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat2.xyz = log2(abs(u_xlat16_6.xyz));
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
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
bool u_xlatb20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat10_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat16_0.x = u_xlat16_18 * _TransparentStrong;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlatb20 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb20){
        u_xlatb20 = u_xlat16_6.y>=u_xlat16_6.z;
        u_xlat16_19 = (u_xlatb20) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_6.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_19) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_19) * u_xlat16.xy + vec2(-1.0, 0.666666687);
        u_xlatb8 = u_xlat16_6.x>=u_xlat3.x;
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_6.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat2.xzw = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat8 = u_xlat8 * u_xlat1.w + u_xlat16_6.x;
        u_xlat4.x = min(u_xlat2.z, u_xlat8);
        u_xlat4.x = u_xlat2.x + (-u_xlat4.x);
        u_xlat8 = (-u_xlat2.z) + u_xlat8;
        u_xlat14 = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat8 = u_xlat8 + u_xlat2.w;
        u_xlat14 = u_xlat2.x + 1.00000001e-10;
        u_xlat2.z = u_xlat4.x / u_xlat14;
        u_xlat16_5 = abs(u_xlat8) + _Crystal_CustomColorHSV.x;
        u_xlat16_11.xy = u_xlat2.zx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_5) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_11.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat6.xyz = u_xlat2.xyz * u_xlat16_11.yyy;
        u_xlat16_6.xyz = u_xlat6.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat2.xyz = log2(abs(u_xlat16_6.xyz));
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
Keywords { "_COLOUR_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_16;
vec2 u_xlat19;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_24 = u_xlat16_3.w * _Color.w;
    u_xlat16_25 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_25) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_24) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat16_0.x = u_xlat16_24 * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb3.x = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_8.x = (u_xlatb3.x) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat6 = u_xlat16_8.xxxx * u_xlat7 + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat5.w>=u_xlat6.x);
#else
    u_xlatb3.x = u_xlat5.w>=u_xlat6.x;
#endif
    u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat6.xyw;
    u_xlat6.xyw = u_xlat5.wyx;
    u_xlat6 = (-u_xlat5) + u_xlat6;
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat3.x = min(u_xlat5.y, u_xlat5.w);
    u_xlat3.x = (-u_xlat3.x) + u_xlat5.x;
    u_xlat11.x = (-u_xlat5.y) + u_xlat5.w;
    u_xlat19.x = u_xlat3.x * 6.0 + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat19.x;
    u_xlat11.x = u_xlat11.x + u_xlat5.z;
    u_xlat19.x = u_xlat5.x + 1.00000001e-10;
    u_xlat3.x = u_xlat3.x / u_xlat19.x;
    u_xlat16_8.x = abs(u_xlat11.x) + _Hue;
    u_xlat16_16.x = u_xlat16_8.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_16.x>=(-u_xlat16_16.x));
#else
    u_xlatb11 = u_xlat16_16.x>=(-u_xlat16_16.x);
#endif
    u_xlat16_16.xy = (bool(u_xlatb11)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_16.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat16_24 = u_xlat3.x * _Saturation;
    u_xlat3.xyz = u_xlat16_16.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_24) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat16_8.xyz = u_xlat3.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_25 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_26 = u_xlat16_4.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_25 = float(1.0) / u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_2.x + _SaturLeftColor.w;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3.x){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
        u_xlatb3.x = u_xlat16_2.y>=u_xlat16_2.z;
#endif
        u_xlat16_25 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_8.yz * u_xlat16_1.yz + (-u_xlat16_2.zy);
        u_xlat19.x = float(1.0);
        u_xlat19.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_25) * u_xlat3.xy;
        u_xlat4.xy = u_xlat16_8.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat4.zw = vec2(u_xlat16_25) * u_xlat19.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_2.x>=u_xlat4.x);
#else
        u_xlatb3.x = u_xlat16_2.x>=u_xlat4.x;
#endif
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat4.xyw);
        u_xlat5.w = (-u_xlat16_2.x);
        u_xlat1.x = u_xlat16_8.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat1.yzw = u_xlat4.yzx + u_xlat5.yzw;
        u_xlat11.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat4.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat1.w + u_xlat16_2.x;
        u_xlat5.x = min(u_xlat11.y, u_xlat3.x);
        u_xlat5.x = u_xlat11.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat11.y) + u_xlat3.x;
        u_xlat19.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat19.x;
        u_xlat3.x = u_xlat3.x + u_xlat11.z;
        u_xlat19.x = u_xlat11.x + 1.00000001e-10;
        u_xlat11.y = u_xlat5.x / u_xlat19.x;
        u_xlat16_8.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_16.xy = u_xlat11.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_16.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat16_16.yyy * u_xlat3.xyz;
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat3.xyz = log2(abs(u_xlat16_2.xyz));
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
Keywords { "_COLOUR_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_16;
vec2 u_xlat19;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_24 = u_xlat16_3.w * _Color.w;
    u_xlat16_25 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_25) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_24) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat16_0.x = u_xlat16_24 * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb3.x = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_8.x = (u_xlatb3.x) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat6 = u_xlat16_8.xxxx * u_xlat7 + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat5.w>=u_xlat6.x);
#else
    u_xlatb3.x = u_xlat5.w>=u_xlat6.x;
#endif
    u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat6.xyw;
    u_xlat6.xyw = u_xlat5.wyx;
    u_xlat6 = (-u_xlat5) + u_xlat6;
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat3.x = min(u_xlat5.y, u_xlat5.w);
    u_xlat3.x = (-u_xlat3.x) + u_xlat5.x;
    u_xlat11.x = (-u_xlat5.y) + u_xlat5.w;
    u_xlat19.x = u_xlat3.x * 6.0 + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat19.x;
    u_xlat11.x = u_xlat11.x + u_xlat5.z;
    u_xlat19.x = u_xlat5.x + 1.00000001e-10;
    u_xlat3.x = u_xlat3.x / u_xlat19.x;
    u_xlat16_8.x = abs(u_xlat11.x) + _Hue;
    u_xlat16_16.x = u_xlat16_8.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_16.x>=(-u_xlat16_16.x));
#else
    u_xlatb11 = u_xlat16_16.x>=(-u_xlat16_16.x);
#endif
    u_xlat16_16.xy = (bool(u_xlatb11)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_16.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat16_24 = u_xlat3.x * _Saturation;
    u_xlat3.xyz = u_xlat16_16.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_24) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat16_8.xyz = u_xlat3.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_25 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_26 = u_xlat16_4.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_25 = float(1.0) / u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_2.x + _SaturLeftColor.w;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3.x){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
        u_xlatb3.x = u_xlat16_2.y>=u_xlat16_2.z;
#endif
        u_xlat16_25 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_8.yz * u_xlat16_1.yz + (-u_xlat16_2.zy);
        u_xlat19.x = float(1.0);
        u_xlat19.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_25) * u_xlat3.xy;
        u_xlat4.xy = u_xlat16_8.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat4.zw = vec2(u_xlat16_25) * u_xlat19.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_2.x>=u_xlat4.x);
#else
        u_xlatb3.x = u_xlat16_2.x>=u_xlat4.x;
#endif
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat4.xyw);
        u_xlat5.w = (-u_xlat16_2.x);
        u_xlat1.x = u_xlat16_8.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat1.yzw = u_xlat4.yzx + u_xlat5.yzw;
        u_xlat11.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat4.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat1.w + u_xlat16_2.x;
        u_xlat5.x = min(u_xlat11.y, u_xlat3.x);
        u_xlat5.x = u_xlat11.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat11.y) + u_xlat3.x;
        u_xlat19.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat19.x;
        u_xlat3.x = u_xlat3.x + u_xlat11.z;
        u_xlat19.x = u_xlat11.x + 1.00000001e-10;
        u_xlat11.y = u_xlat5.x / u_xlat19.x;
        u_xlat16_8.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_16.xy = u_xlat11.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_16.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat16_16.yyy * u_xlat3.xyz;
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat3.xyz = log2(abs(u_xlat16_2.xyz));
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
Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_16;
vec2 u_xlat19;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat10_3 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_24 = u_xlat10_3.w * _Color.w;
    u_xlat16_25 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_25) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_24) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat16_0.x = u_xlat16_24 * _TransparentStrong;
    u_xlatb3.x = u_xlat5.x>=u_xlat5.y;
    u_xlat16_8.x = (u_xlatb3.x) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat6 = u_xlat16_8.xxxx * u_xlat7 + u_xlat6;
    u_xlatb3.x = u_xlat5.w>=u_xlat6.x;
    u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat6.xyw;
    u_xlat6.xyw = u_xlat5.wyx;
    u_xlat6 = (-u_xlat5) + u_xlat6;
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat3.x = min(u_xlat5.y, u_xlat5.w);
    u_xlat3.x = (-u_xlat3.x) + u_xlat5.x;
    u_xlat11.x = (-u_xlat5.y) + u_xlat5.w;
    u_xlat19.x = u_xlat3.x * 6.0 + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat19.x;
    u_xlat11.x = u_xlat11.x + u_xlat5.z;
    u_xlat19.x = u_xlat5.x + 1.00000001e-10;
    u_xlat3.x = u_xlat3.x / u_xlat19.x;
    u_xlat16_8.x = abs(u_xlat11.x) + _Hue;
    u_xlat16_16.x = u_xlat16_8.x * 360.0;
    u_xlatb11 = u_xlat16_16.x>=(-u_xlat16_16.x);
    u_xlat16_16.xy = (bool(u_xlatb11)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_16.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat16_24 = u_xlat3.x * _Saturation;
    u_xlat3.xyz = u_xlat16_16.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_24) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat16_8.xyz = u_xlat3.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_25 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_26 = u_xlat16_4.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_25 = float(1.0) / u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
    u_xlat16_26 = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_2.x + _SaturLeftColor.w;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3.x){
        u_xlatb3.x = u_xlat16_2.y>=u_xlat16_2.z;
        u_xlat16_25 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_8.yz * u_xlat16_1.yz + (-u_xlat16_2.zy);
        u_xlat19.x = float(1.0);
        u_xlat19.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_25) * u_xlat3.xy;
        u_xlat4.xy = u_xlat16_8.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat4.zw = vec2(u_xlat16_25) * u_xlat19.xy + vec2(-1.0, 0.666666687);
        u_xlatb3.x = u_xlat16_2.x>=u_xlat4.x;
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat4.xyw);
        u_xlat5.w = (-u_xlat16_2.x);
        u_xlat1.x = u_xlat16_8.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat1.yzw = u_xlat4.yzx + u_xlat5.yzw;
        u_xlat11.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat4.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat1.w + u_xlat16_2.x;
        u_xlat5.x = min(u_xlat11.y, u_xlat3.x);
        u_xlat5.x = u_xlat11.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat11.y) + u_xlat3.x;
        u_xlat19.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat19.x;
        u_xlat3.x = u_xlat3.x + u_xlat11.z;
        u_xlat19.x = u_xlat11.x + 1.00000001e-10;
        u_xlat11.y = u_xlat5.x / u_xlat19.x;
        u_xlat16_8.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_16.xy = u_xlat11.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_16.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat16_16.yyy * u_xlat3.xyz;
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat3.xyz = log2(abs(u_xlat16_2.xyz));
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
Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_16;
vec2 u_xlat19;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat10_3 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_24 = u_xlat10_3.w * _Color.w;
    u_xlat16_25 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_25) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_24) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat16_0.x = u_xlat16_24 * _TransparentStrong;
    u_xlatb3.x = u_xlat5.x>=u_xlat5.y;
    u_xlat16_8.x = (u_xlatb3.x) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat6 = u_xlat16_8.xxxx * u_xlat7 + u_xlat6;
    u_xlatb3.x = u_xlat5.w>=u_xlat6.x;
    u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat6.xyw;
    u_xlat6.xyw = u_xlat5.wyx;
    u_xlat6 = (-u_xlat5) + u_xlat6;
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat3.x = min(u_xlat5.y, u_xlat5.w);
    u_xlat3.x = (-u_xlat3.x) + u_xlat5.x;
    u_xlat11.x = (-u_xlat5.y) + u_xlat5.w;
    u_xlat19.x = u_xlat3.x * 6.0 + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat19.x;
    u_xlat11.x = u_xlat11.x + u_xlat5.z;
    u_xlat19.x = u_xlat5.x + 1.00000001e-10;
    u_xlat3.x = u_xlat3.x / u_xlat19.x;
    u_xlat16_8.x = abs(u_xlat11.x) + _Hue;
    u_xlat16_16.x = u_xlat16_8.x * 360.0;
    u_xlatb11 = u_xlat16_16.x>=(-u_xlat16_16.x);
    u_xlat16_16.xy = (bool(u_xlatb11)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_16.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat16_24 = u_xlat3.x * _Saturation;
    u_xlat3.xyz = u_xlat16_16.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_24) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat16_8.xyz = u_xlat3.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_25 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_26 = u_xlat16_4.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_25 = float(1.0) / u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
    u_xlat16_26 = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_2.x + _SaturLeftColor.w;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3.x){
        u_xlatb3.x = u_xlat16_2.y>=u_xlat16_2.z;
        u_xlat16_25 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_8.yz * u_xlat16_1.yz + (-u_xlat16_2.zy);
        u_xlat19.x = float(1.0);
        u_xlat19.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_25) * u_xlat3.xy;
        u_xlat4.xy = u_xlat16_8.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat4.zw = vec2(u_xlat16_25) * u_xlat19.xy + vec2(-1.0, 0.666666687);
        u_xlatb3.x = u_xlat16_2.x>=u_xlat4.x;
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat4.xyw);
        u_xlat5.w = (-u_xlat16_2.x);
        u_xlat1.x = u_xlat16_8.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat1.yzw = u_xlat4.yzx + u_xlat5.yzw;
        u_xlat11.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat4.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat1.w + u_xlat16_2.x;
        u_xlat5.x = min(u_xlat11.y, u_xlat3.x);
        u_xlat5.x = u_xlat11.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat11.y) + u_xlat3.x;
        u_xlat19.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat19.x;
        u_xlat3.x = u_xlat3.x + u_xlat11.z;
        u_xlat19.x = u_xlat11.x + 1.00000001e-10;
        u_xlat11.y = u_xlat5.x / u_xlat19.x;
        u_xlat16_8.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_16.xy = u_xlat11.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_16.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat16_16.yyy * u_xlat3.xyz;
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat3.xyz = log2(abs(u_xlat16_2.xyz));
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
Keywords { "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat16_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat20 = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb4 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat20 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = u_xlat20 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = u_xlat16_18 * u_xlat20;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb4 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb4){
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(u_xlat16_0.y>=u_xlat16_0.z);
#else
        u_xlatb4 = u_xlat16_0.y>=u_xlat16_0.z;
#endif
        u_xlat16_18 = (u_xlatb4) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_0.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_18) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat16.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_0.x>=u_xlat3.x);
#else
        u_xlatb8 = u_xlat16_0.x>=u_xlat3.x;
#endif
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_0.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat8 * u_xlat1.w + u_xlat16_0.x;
        u_xlat8 = min(u_xlat4.y, u_xlat2.x);
        u_xlat8 = (-u_xlat8) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8 * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat16_18 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat2.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    SV_Target0.w = u_xlat20 * vs_COLOR0.w;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
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
Keywords { "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat16_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat20 = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb4 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat20 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = u_xlat20 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = u_xlat16_18 * u_xlat20;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb4 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb4){
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(u_xlat16_0.y>=u_xlat16_0.z);
#else
        u_xlatb4 = u_xlat16_0.y>=u_xlat16_0.z;
#endif
        u_xlat16_18 = (u_xlatb4) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_0.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_18) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat16.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_0.x>=u_xlat3.x);
#else
        u_xlatb8 = u_xlat16_0.x>=u_xlat3.x;
#endif
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_0.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat8 * u_xlat1.w + u_xlat16_0.x;
        u_xlat8 = min(u_xlat4.y, u_xlat2.x);
        u_xlat8 = (-u_xlat8) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8 * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat16_18 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat2.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    SV_Target0.w = u_xlat20 * vs_COLOR0.w;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
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
Keywords { "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat10_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat20 = vs_TEXCOORD1.y + (-_Height);
    u_xlatb4 = _Height>=vs_TEXCOORD1.y;
    u_xlat20 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = u_xlat20 / _HeightGradient;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat20 = u_xlat16_18 * u_xlat20;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlatb4 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb4){
        u_xlatb4 = u_xlat16_0.y>=u_xlat16_0.z;
        u_xlat16_18 = (u_xlatb4) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_0.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_18) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat16.xy + vec2(-1.0, 0.666666687);
        u_xlatb8 = u_xlat16_0.x>=u_xlat3.x;
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_0.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat8 * u_xlat1.w + u_xlat16_0.x;
        u_xlat8 = min(u_xlat4.y, u_xlat2.x);
        u_xlat8 = (-u_xlat8) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8 * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat16_18 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat2.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    SV_Target0.w = u_xlat20 * vs_COLOR0.w;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
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
Keywords { "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat10_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat20 = vs_TEXCOORD1.y + (-_Height);
    u_xlatb4 = _Height>=vs_TEXCOORD1.y;
    u_xlat20 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = u_xlat20 / _HeightGradient;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat20 = u_xlat16_18 * u_xlat20;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlatb4 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb4){
        u_xlatb4 = u_xlat16_0.y>=u_xlat16_0.z;
        u_xlat16_18 = (u_xlatb4) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_0.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_18) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat16.xy + vec2(-1.0, 0.666666687);
        u_xlatb8 = u_xlat16_0.x>=u_xlat3.x;
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_0.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat8 * u_xlat1.w + u_xlat16_0.x;
        u_xlat8 = min(u_xlat4.y, u_xlat2.x);
        u_xlat8 = (-u_xlat8) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8 * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat16_18 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat2.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat0.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        u_xlat16_0.xyz = u_xlat0.xyz;
    }
    SV_Target0.w = u_xlat20 * vs_COLOR0.w;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
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
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_10;
vec3 u_xlat12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
vec2 u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_27 = u_xlat16_3.w * _Color.w;
    u_xlat16_28 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_28) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_27) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat3.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb12 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat3.x = (u_xlatb12) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat16_27 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb12 = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_0.x = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat5.w>=u_xlat0.x);
#else
    u_xlatb12 = u_xlat5.w>=u_xlat0.x;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat12.xxxx * u_xlat0 + u_xlat5;
    u_xlat12.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat12.x = u_xlat0.x + (-u_xlat12.x);
    u_xlat21.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat5.x;
    u_xlat21.x = u_xlat0.z + u_xlat21.x;
    u_xlat5.x = u_xlat0.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat5.x;
    u_xlat16_28 = abs(u_xlat21.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_29>=(-u_xlat16_29));
#else
    u_xlatb21 = u_xlat16_29>=(-u_xlat16_29);
#endif
    u_xlat16_13.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_13.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat12.x * _Saturation;
    u_xlat5.xyz = u_xlat16_13.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = vec3(u_xlat16_29) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_13.xyz = u_xlat5.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat16_4.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_29 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29 + _SaturLeftColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat3.x;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3.x){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_4.y>=u_xlat16_4.z);
#else
        u_xlatb3.x = u_xlat16_4.y>=u_xlat16_4.z;
#endif
        u_xlat16_29 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_2.yz * u_xlat16_1.yz + (-u_xlat16_4.zy);
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_29) * u_xlat3.xy;
        u_xlat0.xy = u_xlat16_2.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat0.zw = vec2(u_xlat16_29) * u_xlat21.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_4.x>=u_xlat0.x);
#else
        u_xlatb3.x = u_xlat16_4.x>=u_xlat0.x;
#endif
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat0.xyw);
        u_xlat5.w = (-u_xlat16_4.x);
        u_xlat2.x = u_xlat16_2.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat2.yzw = u_xlat0.yzx + u_xlat5.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat2.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat2.w + u_xlat16_4.x;
        u_xlat5.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat5.x = u_xlat12.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat5.x / u_xlat21.x;
        u_xlat16_1.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_10.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_1.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_10.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat4.xyz = u_xlat16_10.yyy * u_xlat3.xyz;
        u_xlat16_4.xyz = u_xlat4.xyz;
    }
    SV_Target0.w = u_xlat16_28 * vs_COLOR0.w;
    u_xlat3.xyz = log2(abs(u_xlat16_4.xyz));
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
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_10;
vec3 u_xlat12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
vec2 u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_27 = u_xlat16_3.w * _Color.w;
    u_xlat16_28 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_28) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_27) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat3.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb12 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat3.x = (u_xlatb12) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat16_27 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb12 = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_0.x = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat5.w>=u_xlat0.x);
#else
    u_xlatb12 = u_xlat5.w>=u_xlat0.x;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat12.xxxx * u_xlat0 + u_xlat5;
    u_xlat12.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat12.x = u_xlat0.x + (-u_xlat12.x);
    u_xlat21.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat5.x;
    u_xlat21.x = u_xlat0.z + u_xlat21.x;
    u_xlat5.x = u_xlat0.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat5.x;
    u_xlat16_28 = abs(u_xlat21.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_29>=(-u_xlat16_29));
#else
    u_xlatb21 = u_xlat16_29>=(-u_xlat16_29);
#endif
    u_xlat16_13.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_13.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat12.x * _Saturation;
    u_xlat5.xyz = u_xlat16_13.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = vec3(u_xlat16_29) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_13.xyz = u_xlat5.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat16_4.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_29 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29 + _SaturLeftColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat3.x;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3.x){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_4.y>=u_xlat16_4.z);
#else
        u_xlatb3.x = u_xlat16_4.y>=u_xlat16_4.z;
#endif
        u_xlat16_29 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_2.yz * u_xlat16_1.yz + (-u_xlat16_4.zy);
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_29) * u_xlat3.xy;
        u_xlat0.xy = u_xlat16_2.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat0.zw = vec2(u_xlat16_29) * u_xlat21.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_4.x>=u_xlat0.x);
#else
        u_xlatb3.x = u_xlat16_4.x>=u_xlat0.x;
#endif
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat0.xyw);
        u_xlat5.w = (-u_xlat16_4.x);
        u_xlat2.x = u_xlat16_2.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat2.yzw = u_xlat0.yzx + u_xlat5.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat2.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat2.w + u_xlat16_4.x;
        u_xlat5.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat5.x = u_xlat12.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat5.x / u_xlat21.x;
        u_xlat16_1.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_10.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_1.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_10.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat4.xyz = u_xlat16_10.yyy * u_xlat3.xyz;
        u_xlat16_4.xyz = u_xlat4.xyz;
    }
    SV_Target0.w = u_xlat16_28 * vs_COLOR0.w;
    u_xlat3.xyz = log2(abs(u_xlat16_4.xyz));
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
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_10;
vec3 u_xlat12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
vec2 u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat10_3 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_27 = u_xlat10_3.w * _Color.w;
    u_xlat16_28 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_28) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_27) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat3.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb12 = _Height>=vs_TEXCOORD1.y;
    u_xlat3.x = (u_xlatb12) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat3.x = u_xlat16_27 * u_xlat3.x;
    u_xlatb12 = u_xlat5.x>=u_xlat5.y;
    u_xlat16_0.x = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
    u_xlatb12 = u_xlat5.w>=u_xlat0.x;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat12.xxxx * u_xlat0 + u_xlat5;
    u_xlat12.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat12.x = u_xlat0.x + (-u_xlat12.x);
    u_xlat21.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat5.x;
    u_xlat21.x = u_xlat0.z + u_xlat21.x;
    u_xlat5.x = u_xlat0.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat5.x;
    u_xlat16_28 = abs(u_xlat21.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
    u_xlatb21 = u_xlat16_29>=(-u_xlat16_29);
    u_xlat16_13.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_13.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat12.x * _Saturation;
    u_xlat5.xyz = u_xlat16_13.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = vec3(u_xlat16_29) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_13.xyz = u_xlat5.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat16_4.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_29 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29 + _SaturLeftColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat3.x;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3.x){
        u_xlatb3.x = u_xlat16_4.y>=u_xlat16_4.z;
        u_xlat16_29 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_2.yz * u_xlat16_1.yz + (-u_xlat16_4.zy);
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_29) * u_xlat3.xy;
        u_xlat0.xy = u_xlat16_2.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat0.zw = vec2(u_xlat16_29) * u_xlat21.xy + vec2(-1.0, 0.666666687);
        u_xlatb3.x = u_xlat16_4.x>=u_xlat0.x;
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat0.xyw);
        u_xlat5.w = (-u_xlat16_4.x);
        u_xlat2.x = u_xlat16_2.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat2.yzw = u_xlat0.yzx + u_xlat5.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat2.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat2.w + u_xlat16_4.x;
        u_xlat5.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat5.x = u_xlat12.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat5.x / u_xlat21.x;
        u_xlat16_1.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_10.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_1.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_10.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat4.xyz = u_xlat16_10.yyy * u_xlat3.xyz;
        u_xlat16_4.xyz = u_xlat4.xyz;
    }
    SV_Target0.w = u_xlat16_28 * vs_COLOR0.w;
    u_xlat3.xyz = log2(abs(u_xlat16_4.xyz));
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
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_10;
vec3 u_xlat12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
vec2 u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat10_3 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_27 = u_xlat10_3.w * _Color.w;
    u_xlat16_28 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_28) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_27) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat3.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb12 = _Height>=vs_TEXCOORD1.y;
    u_xlat3.x = (u_xlatb12) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat3.x = u_xlat16_27 * u_xlat3.x;
    u_xlatb12 = u_xlat5.x>=u_xlat5.y;
    u_xlat16_0.x = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
    u_xlatb12 = u_xlat5.w>=u_xlat0.x;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat12.xxxx * u_xlat0 + u_xlat5;
    u_xlat12.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat12.x = u_xlat0.x + (-u_xlat12.x);
    u_xlat21.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat5.x;
    u_xlat21.x = u_xlat0.z + u_xlat21.x;
    u_xlat5.x = u_xlat0.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat5.x;
    u_xlat16_28 = abs(u_xlat21.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
    u_xlatb21 = u_xlat16_29>=(-u_xlat16_29);
    u_xlat16_13.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_13.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat12.x * _Saturation;
    u_xlat5.xyz = u_xlat16_13.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = vec3(u_xlat16_29) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_13.xyz = u_xlat5.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat16_4.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_29 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29 + _SaturLeftColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat3.x;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3.x){
        u_xlatb3.x = u_xlat16_4.y>=u_xlat16_4.z;
        u_xlat16_29 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_2.yz * u_xlat16_1.yz + (-u_xlat16_4.zy);
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_29) * u_xlat3.xy;
        u_xlat0.xy = u_xlat16_2.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat0.zw = vec2(u_xlat16_29) * u_xlat21.xy + vec2(-1.0, 0.666666687);
        u_xlatb3.x = u_xlat16_4.x>=u_xlat0.x;
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat0.xyw);
        u_xlat5.w = (-u_xlat16_4.x);
        u_xlat2.x = u_xlat16_2.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat2.yzw = u_xlat0.yzx + u_xlat5.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat2.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat2.w + u_xlat16_4.x;
        u_xlat5.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat5.x = u_xlat12.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat5.x / u_xlat21.x;
        u_xlat16_1.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_10.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_1.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_10.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat4.xyz = u_xlat16_10.yyy * u_xlat3.xyz;
        u_xlat16_4.xyz = u_xlat4.xyz;
    }
    SV_Target0.w = u_xlat16_28 * vs_COLOR0.w;
    u_xlat3.xyz = log2(abs(u_xlat16_4.xyz));
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
bool u_xlatb20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat16_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat16_0.x = u_xlat16_18 * _TransparentStrong;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb20 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb20){
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!(u_xlat16_6.y>=u_xlat16_6.z);
#else
        u_xlatb20 = u_xlat16_6.y>=u_xlat16_6.z;
#endif
        u_xlat16_19 = (u_xlatb20) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_6.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_19) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_19) * u_xlat16.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_6.x>=u_xlat3.x);
#else
        u_xlatb8 = u_xlat16_6.x>=u_xlat3.x;
#endif
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_6.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat2.xzw = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat8 = u_xlat8 * u_xlat1.w + u_xlat16_6.x;
        u_xlat4.x = min(u_xlat2.z, u_xlat8);
        u_xlat4.x = u_xlat2.x + (-u_xlat4.x);
        u_xlat8 = (-u_xlat2.z) + u_xlat8;
        u_xlat14 = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat8 = u_xlat8 + u_xlat2.w;
        u_xlat14 = u_xlat2.x + 1.00000001e-10;
        u_xlat2.z = u_xlat4.x / u_xlat14;
        u_xlat16_5 = abs(u_xlat8) + _Crystal_CustomColorHSV.x;
        u_xlat16_11.xy = u_xlat2.zx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_5) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_11.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_11.yyy;
        SV_Target0.xyz = u_xlat2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_6.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
bool u_xlatb20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat16_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat16_0.x = u_xlat16_18 * _TransparentStrong;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb20 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb20){
#ifdef UNITY_ADRENO_ES3
        u_xlatb20 = !!(u_xlat16_6.y>=u_xlat16_6.z);
#else
        u_xlatb20 = u_xlat16_6.y>=u_xlat16_6.z;
#endif
        u_xlat16_19 = (u_xlatb20) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_6.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_19) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_19) * u_xlat16.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_6.x>=u_xlat3.x);
#else
        u_xlatb8 = u_xlat16_6.x>=u_xlat3.x;
#endif
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_6.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat2.xzw = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat8 = u_xlat8 * u_xlat1.w + u_xlat16_6.x;
        u_xlat4.x = min(u_xlat2.z, u_xlat8);
        u_xlat4.x = u_xlat2.x + (-u_xlat4.x);
        u_xlat8 = (-u_xlat2.z) + u_xlat8;
        u_xlat14 = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat8 = u_xlat8 + u_xlat2.w;
        u_xlat14 = u_xlat2.x + 1.00000001e-10;
        u_xlat2.z = u_xlat4.x / u_xlat14;
        u_xlat16_5 = abs(u_xlat8) + _Crystal_CustomColorHSV.x;
        u_xlat16_11.xy = u_xlat2.zx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_5) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_11.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_11.yyy;
        SV_Target0.xyz = u_xlat2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_6.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
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
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
bool u_xlatb20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat10_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat16_0.x = u_xlat16_18 * _TransparentStrong;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlatb20 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb20){
        u_xlatb20 = u_xlat16_6.y>=u_xlat16_6.z;
        u_xlat16_19 = (u_xlatb20) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_6.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_19) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_19) * u_xlat16.xy + vec2(-1.0, 0.666666687);
        u_xlatb8 = u_xlat16_6.x>=u_xlat3.x;
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_6.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat2.xzw = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat8 = u_xlat8 * u_xlat1.w + u_xlat16_6.x;
        u_xlat4.x = min(u_xlat2.z, u_xlat8);
        u_xlat4.x = u_xlat2.x + (-u_xlat4.x);
        u_xlat8 = (-u_xlat2.z) + u_xlat8;
        u_xlat14 = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat8 = u_xlat8 + u_xlat2.w;
        u_xlat14 = u_xlat2.x + 1.00000001e-10;
        u_xlat2.z = u_xlat4.x / u_xlat14;
        u_xlat16_5 = abs(u_xlat8) + _Crystal_CustomColorHSV.x;
        u_xlat16_11.xy = u_xlat2.zx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_5) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_11.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_11.yyy;
        SV_Target0.xyz = u_xlat2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_6.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
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
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat8;
bool u_xlatb8;
mediump vec2 u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
bool u_xlatb20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat10_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat16_0.x = u_xlat16_18 * _TransparentStrong;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlatb20 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb20){
        u_xlatb20 = u_xlat16_6.y>=u_xlat16_6.z;
        u_xlat16_19 = (u_xlatb20) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_6.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_19) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_19) * u_xlat16.xy + vec2(-1.0, 0.666666687);
        u_xlatb8 = u_xlat16_6.x>=u_xlat3.x;
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_6.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat2.xzw = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat8 = u_xlat8 * u_xlat1.w + u_xlat16_6.x;
        u_xlat4.x = min(u_xlat2.z, u_xlat8);
        u_xlat4.x = u_xlat2.x + (-u_xlat4.x);
        u_xlat8 = (-u_xlat2.z) + u_xlat8;
        u_xlat14 = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat8 = u_xlat8 + u_xlat2.w;
        u_xlat14 = u_xlat2.x + 1.00000001e-10;
        u_xlat2.z = u_xlat4.x / u_xlat14;
        u_xlat16_5 = abs(u_xlat8) + _Crystal_CustomColorHSV.x;
        u_xlat16_11.xy = u_xlat2.zx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_5) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_11.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz * u_xlat16_11.yyy;
        SV_Target0.xyz = u_xlat2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_6.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_16;
vec2 u_xlat19;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_24 = u_xlat16_3.w * _Color.w;
    u_xlat16_25 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_25) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_24) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat16_0.x = u_xlat16_24 * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb3.x = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_8.x = (u_xlatb3.x) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat6 = u_xlat16_8.xxxx * u_xlat7 + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat5.w>=u_xlat6.x);
#else
    u_xlatb3.x = u_xlat5.w>=u_xlat6.x;
#endif
    u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat6.xyw;
    u_xlat6.xyw = u_xlat5.wyx;
    u_xlat6 = (-u_xlat5) + u_xlat6;
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat3.x = min(u_xlat5.y, u_xlat5.w);
    u_xlat3.x = (-u_xlat3.x) + u_xlat5.x;
    u_xlat11.x = (-u_xlat5.y) + u_xlat5.w;
    u_xlat19.x = u_xlat3.x * 6.0 + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat19.x;
    u_xlat11.x = u_xlat11.x + u_xlat5.z;
    u_xlat19.x = u_xlat5.x + 1.00000001e-10;
    u_xlat3.x = u_xlat3.x / u_xlat19.x;
    u_xlat16_8.x = abs(u_xlat11.x) + _Hue;
    u_xlat16_16.x = u_xlat16_8.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_16.x>=(-u_xlat16_16.x));
#else
    u_xlatb11 = u_xlat16_16.x>=(-u_xlat16_16.x);
#endif
    u_xlat16_16.xy = (bool(u_xlatb11)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_16.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat16_24 = u_xlat3.x * _Saturation;
    u_xlat3.xyz = u_xlat16_16.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_24) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat16_8.xyz = u_xlat3.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_25 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_26 = u_xlat16_4.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_25 = float(1.0) / u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_2.x + _SaturLeftColor.w;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3.x){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
        u_xlatb3.x = u_xlat16_2.y>=u_xlat16_2.z;
#endif
        u_xlat16_25 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_8.yz * u_xlat16_1.yz + (-u_xlat16_2.zy);
        u_xlat19.x = float(1.0);
        u_xlat19.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_25) * u_xlat3.xy;
        u_xlat4.xy = u_xlat16_8.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat4.zw = vec2(u_xlat16_25) * u_xlat19.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_2.x>=u_xlat4.x);
#else
        u_xlatb3.x = u_xlat16_2.x>=u_xlat4.x;
#endif
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat4.xyw);
        u_xlat5.w = (-u_xlat16_2.x);
        u_xlat1.x = u_xlat16_8.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat1.yzw = u_xlat4.yzx + u_xlat5.yzw;
        u_xlat11.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat4.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat1.w + u_xlat16_2.x;
        u_xlat5.x = min(u_xlat11.y, u_xlat3.x);
        u_xlat5.x = u_xlat11.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat11.y) + u_xlat3.x;
        u_xlat19.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat19.x;
        u_xlat3.x = u_xlat3.x + u_xlat11.z;
        u_xlat19.x = u_xlat11.x + 1.00000001e-10;
        u_xlat11.y = u_xlat5.x / u_xlat19.x;
        u_xlat16_8.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_16.xy = u_xlat11.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_16.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat3.xyz = u_xlat16_16.yyy * u_xlat3.xyz;
        SV_Target0.xyz = u_xlat3.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_2.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_16;
vec2 u_xlat19;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_24 = u_xlat16_3.w * _Color.w;
    u_xlat16_25 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_25) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_24) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat16_0.x = u_xlat16_24 * _TransparentStrong;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb3.x = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_8.x = (u_xlatb3.x) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat6 = u_xlat16_8.xxxx * u_xlat7 + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat5.w>=u_xlat6.x);
#else
    u_xlatb3.x = u_xlat5.w>=u_xlat6.x;
#endif
    u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat6.xyw;
    u_xlat6.xyw = u_xlat5.wyx;
    u_xlat6 = (-u_xlat5) + u_xlat6;
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat3.x = min(u_xlat5.y, u_xlat5.w);
    u_xlat3.x = (-u_xlat3.x) + u_xlat5.x;
    u_xlat11.x = (-u_xlat5.y) + u_xlat5.w;
    u_xlat19.x = u_xlat3.x * 6.0 + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat19.x;
    u_xlat11.x = u_xlat11.x + u_xlat5.z;
    u_xlat19.x = u_xlat5.x + 1.00000001e-10;
    u_xlat3.x = u_xlat3.x / u_xlat19.x;
    u_xlat16_8.x = abs(u_xlat11.x) + _Hue;
    u_xlat16_16.x = u_xlat16_8.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(u_xlat16_16.x>=(-u_xlat16_16.x));
#else
    u_xlatb11 = u_xlat16_16.x>=(-u_xlat16_16.x);
#endif
    u_xlat16_16.xy = (bool(u_xlatb11)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_16.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat16_24 = u_xlat3.x * _Saturation;
    u_xlat3.xyz = u_xlat16_16.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_24) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat16_8.xyz = u_xlat3.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_25 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_26 = u_xlat16_4.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_25 = float(1.0) / u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_25 = min(max(u_xlat16_25, 0.0), 1.0);
#else
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
#endif
    u_xlat16_26 = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_2.x + _SaturLeftColor.w;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3.x){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
        u_xlatb3.x = u_xlat16_2.y>=u_xlat16_2.z;
#endif
        u_xlat16_25 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_8.yz * u_xlat16_1.yz + (-u_xlat16_2.zy);
        u_xlat19.x = float(1.0);
        u_xlat19.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_25) * u_xlat3.xy;
        u_xlat4.xy = u_xlat16_8.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat4.zw = vec2(u_xlat16_25) * u_xlat19.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_2.x>=u_xlat4.x);
#else
        u_xlatb3.x = u_xlat16_2.x>=u_xlat4.x;
#endif
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat4.xyw);
        u_xlat5.w = (-u_xlat16_2.x);
        u_xlat1.x = u_xlat16_8.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat1.yzw = u_xlat4.yzx + u_xlat5.yzw;
        u_xlat11.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat4.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat1.w + u_xlat16_2.x;
        u_xlat5.x = min(u_xlat11.y, u_xlat3.x);
        u_xlat5.x = u_xlat11.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat11.y) + u_xlat3.x;
        u_xlat19.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat19.x;
        u_xlat3.x = u_xlat3.x + u_xlat11.z;
        u_xlat19.x = u_xlat11.x + 1.00000001e-10;
        u_xlat11.y = u_xlat5.x / u_xlat19.x;
        u_xlat16_8.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_16.xy = u_xlat11.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_16.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat3.xyz = u_xlat16_16.yyy * u_xlat3.xyz;
        SV_Target0.xyz = u_xlat3.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_2.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_16;
vec2 u_xlat19;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat10_3 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_24 = u_xlat10_3.w * _Color.w;
    u_xlat16_25 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_25) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_24) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat16_0.x = u_xlat16_24 * _TransparentStrong;
    u_xlatb3.x = u_xlat5.x>=u_xlat5.y;
    u_xlat16_8.x = (u_xlatb3.x) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat6 = u_xlat16_8.xxxx * u_xlat7 + u_xlat6;
    u_xlatb3.x = u_xlat5.w>=u_xlat6.x;
    u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat6.xyw;
    u_xlat6.xyw = u_xlat5.wyx;
    u_xlat6 = (-u_xlat5) + u_xlat6;
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat3.x = min(u_xlat5.y, u_xlat5.w);
    u_xlat3.x = (-u_xlat3.x) + u_xlat5.x;
    u_xlat11.x = (-u_xlat5.y) + u_xlat5.w;
    u_xlat19.x = u_xlat3.x * 6.0 + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat19.x;
    u_xlat11.x = u_xlat11.x + u_xlat5.z;
    u_xlat19.x = u_xlat5.x + 1.00000001e-10;
    u_xlat3.x = u_xlat3.x / u_xlat19.x;
    u_xlat16_8.x = abs(u_xlat11.x) + _Hue;
    u_xlat16_16.x = u_xlat16_8.x * 360.0;
    u_xlatb11 = u_xlat16_16.x>=(-u_xlat16_16.x);
    u_xlat16_16.xy = (bool(u_xlatb11)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_16.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat16_24 = u_xlat3.x * _Saturation;
    u_xlat3.xyz = u_xlat16_16.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_24) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat16_8.xyz = u_xlat3.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_25 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_26 = u_xlat16_4.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_25 = float(1.0) / u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
    u_xlat16_26 = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_2.x + _SaturLeftColor.w;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3.x){
        u_xlatb3.x = u_xlat16_2.y>=u_xlat16_2.z;
        u_xlat16_25 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_8.yz * u_xlat16_1.yz + (-u_xlat16_2.zy);
        u_xlat19.x = float(1.0);
        u_xlat19.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_25) * u_xlat3.xy;
        u_xlat4.xy = u_xlat16_8.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat4.zw = vec2(u_xlat16_25) * u_xlat19.xy + vec2(-1.0, 0.666666687);
        u_xlatb3.x = u_xlat16_2.x>=u_xlat4.x;
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat4.xyw);
        u_xlat5.w = (-u_xlat16_2.x);
        u_xlat1.x = u_xlat16_8.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat1.yzw = u_xlat4.yzx + u_xlat5.yzw;
        u_xlat11.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat4.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat1.w + u_xlat16_2.x;
        u_xlat5.x = min(u_xlat11.y, u_xlat3.x);
        u_xlat5.x = u_xlat11.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat11.y) + u_xlat3.x;
        u_xlat19.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat19.x;
        u_xlat3.x = u_xlat3.x + u_xlat11.z;
        u_xlat19.x = u_xlat11.x + 1.00000001e-10;
        u_xlat11.y = u_xlat5.x / u_xlat19.x;
        u_xlat16_8.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_16.xy = u_xlat11.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_16.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat3.xyz = u_xlat16_16.yyy * u_xlat3.xyz;
        SV_Target0.xyz = u_xlat3.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_2.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _TransparentStrong;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat11;
bool u_xlatb11;
mediump vec2 u_xlat16_16;
vec2 u_xlat19;
mediump float u_xlat16_24;
mediump float u_xlat16_25;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat10_3 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_24 = u_xlat10_3.w * _Color.w;
    u_xlat16_25 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_25) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_24) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat16_0.x = u_xlat16_24 * _TransparentStrong;
    u_xlatb3.x = u_xlat5.x>=u_xlat5.y;
    u_xlat16_8.x = (u_xlatb3.x) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat6 = u_xlat16_8.xxxx * u_xlat7 + u_xlat6;
    u_xlatb3.x = u_xlat5.w>=u_xlat6.x;
    u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat6.xyw;
    u_xlat6.xyw = u_xlat5.wyx;
    u_xlat6 = (-u_xlat5) + u_xlat6;
    u_xlat5 = u_xlat3.xxxx * u_xlat6 + u_xlat5;
    u_xlat3.x = min(u_xlat5.y, u_xlat5.w);
    u_xlat3.x = (-u_xlat3.x) + u_xlat5.x;
    u_xlat11.x = (-u_xlat5.y) + u_xlat5.w;
    u_xlat19.x = u_xlat3.x * 6.0 + 1.00000001e-10;
    u_xlat11.x = u_xlat11.x / u_xlat19.x;
    u_xlat11.x = u_xlat11.x + u_xlat5.z;
    u_xlat19.x = u_xlat5.x + 1.00000001e-10;
    u_xlat3.x = u_xlat3.x / u_xlat19.x;
    u_xlat16_8.x = abs(u_xlat11.x) + _Hue;
    u_xlat16_16.x = u_xlat16_8.x * 360.0;
    u_xlatb11 = u_xlat16_16.x>=(-u_xlat16_16.x);
    u_xlat16_16.xy = (bool(u_xlatb11)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_16.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat16_24 = u_xlat3.x * _Saturation;
    u_xlat3.xyz = u_xlat16_16.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat3.xyz = fract(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat3.xyz = vec3(u_xlat16_24) * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat3.xyz = u_xlat3.xyz * u_xlat5.xxx;
    u_xlat16_8.xyz = u_xlat3.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_25 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_26 = u_xlat16_4.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_25 = float(1.0) / u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat16_25 = clamp(u_xlat16_25, 0.0, 1.0);
    u_xlat16_26 = u_xlat16_25 * -2.0 + 3.0;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_25;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_26;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_25) * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_25 = u_xlat16_25 * u_xlat16_2.x + _SaturLeftColor.w;
    u_xlat16_0.x = u_xlat16_0.x * u_xlat16_25;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_8.xyz;
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3.x){
        u_xlatb3.x = u_xlat16_2.y>=u_xlat16_2.z;
        u_xlat16_25 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_8.yz * u_xlat16_1.yz + (-u_xlat16_2.zy);
        u_xlat19.x = float(1.0);
        u_xlat19.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_25) * u_xlat3.xy;
        u_xlat4.xy = u_xlat16_8.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat4.zw = vec2(u_xlat16_25) * u_xlat19.xy + vec2(-1.0, 0.666666687);
        u_xlatb3.x = u_xlat16_2.x>=u_xlat4.x;
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat4.xyw);
        u_xlat5.w = (-u_xlat16_2.x);
        u_xlat1.x = u_xlat16_8.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat1.yzw = u_xlat4.yzx + u_xlat5.yzw;
        u_xlat11.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat4.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat1.w + u_xlat16_2.x;
        u_xlat5.x = min(u_xlat11.y, u_xlat3.x);
        u_xlat5.x = u_xlat11.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat11.y) + u_xlat3.x;
        u_xlat19.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat19.x;
        u_xlat3.x = u_xlat3.x + u_xlat11.z;
        u_xlat19.x = u_xlat11.x + 1.00000001e-10;
        u_xlat11.y = u_xlat5.x / u_xlat19.x;
        u_xlat16_8.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_16.xy = u_xlat11.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_16.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat3.xyz = u_xlat16_16.yyy * u_xlat3.xyz;
        SV_Target0.xyz = u_xlat3.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_2.xyz;
    }
    SV_Target0.w = u_xlat16_0.x * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat16_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat20 = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb4 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat20 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = u_xlat20 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = u_xlat16_18 * u_xlat20;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb4 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb4){
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(u_xlat16_0.y>=u_xlat16_0.z);
#else
        u_xlatb4 = u_xlat16_0.y>=u_xlat16_0.z;
#endif
        u_xlat16_18 = (u_xlatb4) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_0.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_18) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat16.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_0.x>=u_xlat3.x);
#else
        u_xlatb8 = u_xlat16_0.x>=u_xlat3.x;
#endif
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_0.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat8 * u_xlat1.w + u_xlat16_0.x;
        u_xlat8 = min(u_xlat4.y, u_xlat2.x);
        u_xlat8 = (-u_xlat8) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8 * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat16_18 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat2.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_0.xyz;
    }
    SV_Target0.w = u_xlat20 * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat16_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat20 = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb4 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat20 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = u_xlat20 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat20 = min(max(u_xlat20, 0.0), 1.0);
#else
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
#endif
    u_xlat20 = u_xlat16_18 * u_xlat20;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb4 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb4){
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(u_xlat16_0.y>=u_xlat16_0.z);
#else
        u_xlatb4 = u_xlat16_0.y>=u_xlat16_0.z;
#endif
        u_xlat16_18 = (u_xlatb4) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_0.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_18) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat16.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_0.x>=u_xlat3.x);
#else
        u_xlatb8 = u_xlat16_0.x>=u_xlat3.x;
#endif
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_0.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat8 * u_xlat1.w + u_xlat16_0.x;
        u_xlat8 = min(u_xlat4.y, u_xlat2.x);
        u_xlat8 = (-u_xlat8) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8 * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat16_18 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat2.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_0.xyz;
    }
    SV_Target0.w = u_xlat20 * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat10_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat20 = vs_TEXCOORD1.y + (-_Height);
    u_xlatb4 = _Height>=vs_TEXCOORD1.y;
    u_xlat20 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = u_xlat20 / _HeightGradient;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat20 = u_xlat16_18 * u_xlat20;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlatb4 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb4){
        u_xlatb4 = u_xlat16_0.y>=u_xlat16_0.z;
        u_xlat16_18 = (u_xlatb4) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_0.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_18) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat16.xy + vec2(-1.0, 0.666666687);
        u_xlatb8 = u_xlat16_0.x>=u_xlat3.x;
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_0.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat8 * u_xlat1.w + u_xlat16_0.x;
        u_xlat8 = min(u_xlat4.y, u_xlat2.x);
        u_xlat8 = (-u_xlat8) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8 * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat16_18 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat2.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_0.xyz;
    }
    SV_Target0.w = u_xlat20 * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
float u_xlat8;
bool u_xlatb8;
mediump float u_xlat16_11;
float u_xlat14;
vec2 u_xlat16;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
float u_xlat20;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_18 = u_xlat10_2.w * _Color.w;
    u_xlat16_19 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xzw = (u_xlatb2.x) ? vec3(u_xlat16_19) : u_xlat16_0.xyz;
    u_xlat4.xyz = (-u_xlat2.xzw) + vec3(1.0, 1.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat16_18) * u_xlat4.xyz;
    u_xlat2.xyz = (u_xlatb2.y) ? u_xlat4.xyz : u_xlat2.xzw;
    u_xlat20 = vs_TEXCOORD1.y + (-_Height);
    u_xlatb4 = _Height>=vs_TEXCOORD1.y;
    u_xlat20 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = u_xlat20 / _HeightGradient;
    u_xlat20 = clamp(u_xlat20, 0.0, 1.0);
    u_xlat20 = u_xlat16_18 * u_xlat20;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlatb4 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb4){
        u_xlatb4 = u_xlat16_0.y>=u_xlat16_0.z;
        u_xlat16_18 = (u_xlatb4) ? 1.0 : 0.0;
        u_xlat4.xy = u_xlat2.yz * u_xlat16_1.yz + (-u_xlat16_0.zy);
        u_xlat16.x = float(1.0);
        u_xlat16.y = float(-1.0);
        u_xlat4.xy = vec2(u_xlat16_18) * u_xlat4.xy;
        u_xlat3.xy = u_xlat2.zy * u_xlat16_1.zy + u_xlat4.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat16.xy + vec2(-1.0, 0.666666687);
        u_xlatb8 = u_xlat16_0.x>=u_xlat3.x;
        u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_0.x);
        u_xlat1.x = u_xlat2.x * u_xlat16_1.x + u_xlat4.x;
        u_xlat1.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = vec3(u_xlat8) * u_xlat1.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat8 * u_xlat1.w + u_xlat16_0.x;
        u_xlat8 = min(u_xlat4.y, u_xlat2.x);
        u_xlat8 = (-u_xlat8) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8 * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8 = u_xlat8 / u_xlat14;
        u_xlat16_18 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat2.xyz = vec3(u_xlat16_18) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_0.xyz;
    }
    SV_Target0.w = u_xlat20 * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_10;
vec3 u_xlat12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
vec2 u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_27 = u_xlat16_3.w * _Color.w;
    u_xlat16_28 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_28) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_27) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat3.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb12 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat3.x = (u_xlatb12) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat16_27 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb12 = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_0.x = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat5.w>=u_xlat0.x);
#else
    u_xlatb12 = u_xlat5.w>=u_xlat0.x;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat12.xxxx * u_xlat0 + u_xlat5;
    u_xlat12.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat12.x = u_xlat0.x + (-u_xlat12.x);
    u_xlat21.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat5.x;
    u_xlat21.x = u_xlat0.z + u_xlat21.x;
    u_xlat5.x = u_xlat0.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat5.x;
    u_xlat16_28 = abs(u_xlat21.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_29>=(-u_xlat16_29));
#else
    u_xlatb21 = u_xlat16_29>=(-u_xlat16_29);
#endif
    u_xlat16_13.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_13.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat12.x * _Saturation;
    u_xlat5.xyz = u_xlat16_13.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = vec3(u_xlat16_29) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_13.xyz = u_xlat5.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat16_4.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_29 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29 + _SaturLeftColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat3.x;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3.x){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_4.y>=u_xlat16_4.z);
#else
        u_xlatb3.x = u_xlat16_4.y>=u_xlat16_4.z;
#endif
        u_xlat16_29 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_2.yz * u_xlat16_1.yz + (-u_xlat16_4.zy);
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_29) * u_xlat3.xy;
        u_xlat0.xy = u_xlat16_2.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat0.zw = vec2(u_xlat16_29) * u_xlat21.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_4.x>=u_xlat0.x);
#else
        u_xlatb3.x = u_xlat16_4.x>=u_xlat0.x;
#endif
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat0.xyw);
        u_xlat5.w = (-u_xlat16_4.x);
        u_xlat2.x = u_xlat16_2.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat2.yzw = u_xlat0.yzx + u_xlat5.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat2.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat2.w + u_xlat16_4.x;
        u_xlat5.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat5.x = u_xlat12.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat5.x / u_xlat21.x;
        u_xlat16_1.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_10.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_1.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_10.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat3.xyz = u_xlat16_10.yyy * u_xlat3.xyz;
        SV_Target0.xyz = u_xlat3.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_4.xyz;
    }
    SV_Target0.w = u_xlat16_28 * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
bvec2 u_xlatb3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_10;
vec3 u_xlat12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
vec2 u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_27 = u_xlat16_3.w * _Color.w;
    u_xlat16_28 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_28) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_27) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat3.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb12 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat3.x = (u_xlatb12) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat16_27 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat5.x>=u_xlat5.y);
#else
    u_xlatb12 = u_xlat5.x>=u_xlat5.y;
#endif
    u_xlat16_0.x = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat5.w>=u_xlat0.x);
#else
    u_xlatb12 = u_xlat5.w>=u_xlat0.x;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat12.xxxx * u_xlat0 + u_xlat5;
    u_xlat12.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat12.x = u_xlat0.x + (-u_xlat12.x);
    u_xlat21.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat5.x;
    u_xlat21.x = u_xlat0.z + u_xlat21.x;
    u_xlat5.x = u_xlat0.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat5.x;
    u_xlat16_28 = abs(u_xlat21.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat16_29>=(-u_xlat16_29));
#else
    u_xlatb21 = u_xlat16_29>=(-u_xlat16_29);
#endif
    u_xlat16_13.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_13.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat12.x * _Saturation;
    u_xlat5.xyz = u_xlat16_13.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = vec3(u_xlat16_29) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_13.xyz = u_xlat5.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat16_4.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_29 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29 + _SaturLeftColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat3.x;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb3.x){
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_4.y>=u_xlat16_4.z);
#else
        u_xlatb3.x = u_xlat16_4.y>=u_xlat16_4.z;
#endif
        u_xlat16_29 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_2.yz * u_xlat16_1.yz + (-u_xlat16_4.zy);
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_29) * u_xlat3.xy;
        u_xlat0.xy = u_xlat16_2.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat0.zw = vec2(u_xlat16_29) * u_xlat21.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(u_xlat16_4.x>=u_xlat0.x);
#else
        u_xlatb3.x = u_xlat16_4.x>=u_xlat0.x;
#endif
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat0.xyw);
        u_xlat5.w = (-u_xlat16_4.x);
        u_xlat2.x = u_xlat16_2.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat2.yzw = u_xlat0.yzx + u_xlat5.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat2.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat2.w + u_xlat16_4.x;
        u_xlat5.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat5.x = u_xlat12.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat5.x / u_xlat21.x;
        u_xlat16_1.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_10.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_1.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_10.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat3.xyz = u_xlat16_10.yyy * u_xlat3.xyz;
        SV_Target0.xyz = u_xlat3.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_4.xyz;
    }
    SV_Target0.w = u_xlat16_28 * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bvec2 u_xlatb3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_10;
vec3 u_xlat12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
vec2 u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat10_3 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_27 = u_xlat10_3.w * _Color.w;
    u_xlat16_28 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_28) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_27) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat3.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb12 = _Height>=vs_TEXCOORD1.y;
    u_xlat3.x = (u_xlatb12) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat3.x = u_xlat16_27 * u_xlat3.x;
    u_xlatb12 = u_xlat5.x>=u_xlat5.y;
    u_xlat16_0.x = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
    u_xlatb12 = u_xlat5.w>=u_xlat0.x;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat12.xxxx * u_xlat0 + u_xlat5;
    u_xlat12.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat12.x = u_xlat0.x + (-u_xlat12.x);
    u_xlat21.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat5.x;
    u_xlat21.x = u_xlat0.z + u_xlat21.x;
    u_xlat5.x = u_xlat0.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat5.x;
    u_xlat16_28 = abs(u_xlat21.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
    u_xlatb21 = u_xlat16_29>=(-u_xlat16_29);
    u_xlat16_13.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_13.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat12.x * _Saturation;
    u_xlat5.xyz = u_xlat16_13.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = vec3(u_xlat16_29) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_13.xyz = u_xlat5.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat16_4.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_29 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29 + _SaturLeftColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat3.x;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3.x){
        u_xlatb3.x = u_xlat16_4.y>=u_xlat16_4.z;
        u_xlat16_29 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_2.yz * u_xlat16_1.yz + (-u_xlat16_4.zy);
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_29) * u_xlat3.xy;
        u_xlat0.xy = u_xlat16_2.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat0.zw = vec2(u_xlat16_29) * u_xlat21.xy + vec2(-1.0, 0.666666687);
        u_xlatb3.x = u_xlat16_4.x>=u_xlat0.x;
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat0.xyw);
        u_xlat5.w = (-u_xlat16_4.x);
        u_xlat2.x = u_xlat16_2.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat2.yzw = u_xlat0.yzx + u_xlat5.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat2.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat2.w + u_xlat16_4.x;
        u_xlat5.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat5.x = u_xlat12.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat5.x / u_xlat21.x;
        u_xlat16_1.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_10.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_1.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_10.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat3.xyz = u_xlat16_10.yyy * u_xlat3.xyz;
        SV_Target0.xyz = u_xlat3.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_4.xyz;
    }
    SV_Target0.w = u_xlat16_28 * vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _IsGray;
uniform 	mediump float _IsInvertGray;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp vec4 u_xlat10_3;
bvec2 u_xlatb3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_10;
vec3 u_xlat12;
bool u_xlatb12;
mediump vec3 u_xlat16_13;
vec2 u_xlat21;
bool u_xlatb21;
mediump float u_xlat16_27;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat10_3 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_3.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_4.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat16_27 = u_xlat10_3.w * _Color.w;
    u_xlat16_28 = dot(u_xlat16_0.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
    u_xlatb3.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat5.xyz = (u_xlatb3.x) ? vec3(u_xlat16_28) : u_xlat16_0.xyz;
    u_xlat6.xyz = (-u_xlat5.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = vec3(u_xlat16_27) * u_xlat6.xyz;
    u_xlat5.xyw = (u_xlatb3.y) ? u_xlat6.yzx : u_xlat5.yzx;
    u_xlat3.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb12 = _Height>=vs_TEXCOORD1.y;
    u_xlat3.x = (u_xlatb12) ? 0.0 : u_xlat3.x;
    u_xlat3.x = u_xlat3.x / _HeightGradient;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat3.x = u_xlat16_27 * u_xlat3.x;
    u_xlatb12 = u_xlat5.x>=u_xlat5.y;
    u_xlat16_0.x = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat6.xy = u_xlat5.yx;
    u_xlat6.z = float(-1.0);
    u_xlat6.w = float(0.666666687);
    u_xlat7.xy = u_xlat5.xy + (-u_xlat6.xy);
    u_xlat7.z = float(1.0);
    u_xlat7.w = float(-1.0);
    u_xlat0 = u_xlat16_0.xxxx * u_xlat7 + u_xlat6;
    u_xlatb12 = u_xlat5.w>=u_xlat0.x;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat5.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat5.wyx;
    u_xlat0 = (-u_xlat5) + u_xlat0;
    u_xlat0 = u_xlat12.xxxx * u_xlat0 + u_xlat5;
    u_xlat12.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat12.x = u_xlat0.x + (-u_xlat12.x);
    u_xlat21.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat12.x * 6.0 + 1.00000001e-10;
    u_xlat21.x = u_xlat21.x / u_xlat5.x;
    u_xlat21.x = u_xlat0.z + u_xlat21.x;
    u_xlat5.x = u_xlat0.x + 1.00000001e-10;
    u_xlat12.x = u_xlat12.x / u_xlat5.x;
    u_xlat16_28 = abs(u_xlat21.x) + _Hue;
    u_xlat16_29 = u_xlat16_28 * 360.0;
    u_xlatb21 = u_xlat16_29>=(-u_xlat16_29);
    u_xlat16_13.xy = (bool(u_xlatb21)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_13.y;
    u_xlat16_28 = fract(u_xlat16_28);
    u_xlat16_29 = u_xlat12.x * _Saturation;
    u_xlat5.xyz = u_xlat16_13.xxx * vec3(u_xlat16_28) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = vec3(u_xlat16_29) * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_13.xyz = u_xlat5.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_28 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_29 = u_xlat16_4.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat16_28 = float(1.0) / u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
    u_xlat16_29 = u_xlat16_28 * -2.0 + 3.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29;
    u_xlat16_8.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_2.xyz);
    u_xlat16_2.xyz = vec3(u_xlat16_28) * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_29 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29 + _SaturLeftColor.w;
    u_xlat16_28 = u_xlat16_28 * u_xlat3.x;
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlatb3.x = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb3.x){
        u_xlatb3.x = u_xlat16_4.y>=u_xlat16_4.z;
        u_xlat16_29 = (u_xlatb3.x) ? 1.0 : 0.0;
        u_xlat3.xy = u_xlat16_2.yz * u_xlat16_1.yz + (-u_xlat16_4.zy);
        u_xlat21.x = float(1.0);
        u_xlat21.y = float(-1.0);
        u_xlat3.xy = vec2(u_xlat16_29) * u_xlat3.xy;
        u_xlat0.xy = u_xlat16_2.zy * u_xlat16_1.zy + u_xlat3.xy;
        u_xlat0.zw = vec2(u_xlat16_29) * u_xlat21.xy + vec2(-1.0, 0.666666687);
        u_xlatb3.x = u_xlat16_4.x>=u_xlat0.x;
        u_xlat3.x = u_xlatb3.x ? 1.0 : float(0.0);
        u_xlat5.xyz = (-u_xlat0.xyw);
        u_xlat5.w = (-u_xlat16_4.x);
        u_xlat2.x = u_xlat16_2.x * u_xlat16_1.x + u_xlat5.x;
        u_xlat2.yzw = u_xlat0.yzx + u_xlat5.yzw;
        u_xlat12.xyz = u_xlat3.xxx * u_xlat2.xyz + u_xlat0.xyw;
        u_xlat3.x = u_xlat3.x * u_xlat2.w + u_xlat16_4.x;
        u_xlat5.x = min(u_xlat12.y, u_xlat3.x);
        u_xlat5.x = u_xlat12.x + (-u_xlat5.x);
        u_xlat3.x = (-u_xlat12.y) + u_xlat3.x;
        u_xlat21.x = u_xlat5.x * 6.0 + 1.00000001e-10;
        u_xlat3.x = u_xlat3.x / u_xlat21.x;
        u_xlat3.x = u_xlat3.x + u_xlat12.z;
        u_xlat21.x = u_xlat12.x + 1.00000001e-10;
        u_xlat12.y = u_xlat5.x / u_xlat21.x;
        u_xlat16_1.x = abs(u_xlat3.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_10.xy = u_xlat12.yx * _Crystal_CustomColorHSV.yz;
        u_xlat3.xyz = u_xlat16_1.xxx + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat3.xyz = fract(u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat3.xyz = abs(u_xlat3.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
        u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat3.xyz = u_xlat16_10.xxx * u_xlat3.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat3.xyz = u_xlat16_10.yyy * u_xlat3.xyz;
        SV_Target0.xyz = u_xlat3.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_4.xyz;
    }
    SV_Target0.w = u_xlat16_28 * vs_COLOR0.w;
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
Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
}
}
}
}