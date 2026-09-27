//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/FX_Fresnel_Flu_Show" {
Properties {

_Usage ("仅能用于Theseus工艺的皮肤特效", Float) = 1.0

_MainColorPower ("MainColorPower", Float) = 1.0

_MainColor ("MainColor", Color) = (1,1,1,1)

_MainTex ("MainTex", 2D) = "white" { }

_BackPower ("BackPower", Float) = 2.0

_BackColor ("BackColor", Color) = (0,0,0,0)

_Normal ("Normal", 2D) = "bump" { }

_FresnelPower ("FresnelPower", Float) = 0.10000000149011612

_FresnelScale ("FresnelScale", Float) = 1.0

_FresnelColor ("FresnelColor", Color) = (0,0,0,1)

_Mask ("Mask(R:菲涅尔)(G:流光)(B:透明区域)", 2D) = "white" { }

_Mask_B_Alpha ("Mask_B_Alpha", Range(0, 1)) = 1.0

_Alpha ("Alpha", Range(0, 1)) = 1.0

[Enum(2U,0,ScreenUV,1)] _Flu_UV ("Flu_UV", Float) = 0.0

_Flu_Tex ("Flu_Tex(R:流光)(G:溶解)", 2D) = "black" { }

_Flu_Color ("Flu_Color", Color) = (1,1,1,1)

_Flu_Speed_U ("Flu_Speed_U", Float) = 0.0

_Flu_Speed_V ("Flu_Speed_V", Float) = 0.0

_Flu_Power ("Flu_Power", Float) = 1.0

_Flu_LineSpace ("Flu_LineSpace", Range(1, 10)) = 10.0

_SoftSize ("SoftSize", Range(0, 2)) = 0.0

_DissolveStep ("DissolveStep", Range(0, 1)) = 0.0

[Toggle(_IS_CUSTOM)] _IS_CUSTOM ("自定义颜色(禁动画中K开关)", Float) = 0.0

_DissolveColor ("DissolveColor", Color) = (1,1,1,1)

_DissolveColorPW ("DissolveColorPW", Float) = 1.0

_Emissive ("Emissive", 2D) = "black" { }

_EmissivePower ("EmissivePower", Float) = 1.0

}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 5095
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xy = in_TEXCOORD0.xy;
    u_xlat2.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD0 = u_xlat2;
    vs_TEXCOORD2.w = u_xlat0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat8 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat8 = max(u_xlat8, 1.17549435e-38);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat0.x;
    vs_TEXCOORD4.w = u_xlat0.y;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Normal_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Emissive_ST;
uniform 	mediump vec4 _BackColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _MainColorPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump float _BackPower;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Flu_LineSpace;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _Emissive;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD6;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat16_1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_3.y = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_3.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_8.x = (-u_xlat16_1.x) * _FresnelColor.w + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_3.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0.xyz = texture(_Mask, u_xlat16_15.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat16_15.xy);
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_MainColorPower) + u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Flu_UV==1.0);
#else
    u_xlatb2 = _Flu_UV==1.0;
#endif
    u_xlat0.xw = (bool(u_xlatb2)) ? u_xlat0.xw : vs_TEXCOORD0.zw;
    u_xlat2.x = _Flu_Speed_V * _Time.y;
    u_xlat2.y = u_xlat0.w * _Flu_LineSpace + u_xlat2.x;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat0.x;
    u_xlat0.xw = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_0.xw = texture(_Flu_Tex, u_xlat0.xw).xy;
    u_xlat16_15.xy = u_xlat16_0.xw * vec2(0.305306017, 0.305306017) + vec2(0.682171106, 0.682171106);
    u_xlat16_15.xy = u_xlat16_0.xw * u_xlat16_15.xy + vec2(0.0125228781, 0.0125228781);
    u_xlat16_15.xy = u_xlat16_0.xw * u_xlat16_15.xy;
    u_xlat16_15.xy = u_xlat16_0.yy * u_xlat16_15.xy;
    u_xlat0.x = u_xlat16_15.x * _Flu_Power;
    u_xlat7.x = max(u_xlat16_15.y, 0.00999999978);
    u_xlat7.x = u_xlat7.x + (-_DissolveStep);
    u_xlat16_4.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * u_xlat0.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    u_xlat2.xyz = u_xlat16_3.xyz * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat16_8.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_6.xyz = texture(_Emissive, u_xlat16_8.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat16_6.xyz;
    u_xlat16_8.x = u_xlat16_6.x * u_xlat16_8.x + _MainColor.w;
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(vec3(_EmissivePower, _EmissivePower, _EmissivePower)) + u_xlat2.xyz;
    u_xlat16_3.xyz = (-u_xlat2.xyz);
    u_xlat16_4.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_DissolveColorPW);
    u_xlat16_4.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat16_15.x = u_xlat16_0.z + _Mask_B_Alpha;
    u_xlat16_15.x = u_xlat16_0.z * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_2.w * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_15.x * vs_COLOR0.w;
    u_xlat16_15.x = u_xlat16_15.x * _Alpha;
    u_xlat16_3.w = (-u_xlat16_15.x);
    u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
    u_xlat16_4.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_22 = u_xlat16_4.y * u_xlat16_4.x;
    u_xlat0.x = u_xlat7.x / u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.800000012>=u_xlat0.x);
#else
    u_xlatb7 = 0.800000012>=u_xlat0.x;
#endif
    u_xlat16_22 = (u_xlatb7) ? _IS_CUSTOM : 0.0;
    u_xlat16_15.x = u_xlat16_22 * u_xlat16_3.w + u_xlat16_15.x;
    u_xlat16_3.xyz = vec3(u_xlat16_22) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat7.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat7.xyz;
    u_xlat16_22 = u_xlat0.x * u_xlat16_15.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_22;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat0.x + (-u_xlat16_8.x);
    SV_Target0.w = u_xlat16_1.x * u_xlat16_15.x + u_xlat16_8.x;
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xy = in_TEXCOORD0.xy;
    u_xlat2.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD0 = u_xlat2;
    vs_TEXCOORD2.w = u_xlat0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat8 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat8 = max(u_xlat8, 1.17549435e-38);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat0.x;
    vs_TEXCOORD4.w = u_xlat0.y;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Normal_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Emissive_ST;
uniform 	mediump vec4 _BackColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _MainColorPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump float _BackPower;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Flu_LineSpace;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _Emissive;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD6;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat16_1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_3.y = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_3.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_8.x = (-u_xlat16_1.x) * _FresnelColor.w + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_3.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0.xyz = texture(_Mask, u_xlat16_15.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat16_15.xy);
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_MainColorPower) + u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Flu_UV==1.0);
#else
    u_xlatb2 = _Flu_UV==1.0;
#endif
    u_xlat0.xw = (bool(u_xlatb2)) ? u_xlat0.xw : vs_TEXCOORD0.zw;
    u_xlat2.x = _Flu_Speed_V * _Time.y;
    u_xlat2.y = u_xlat0.w * _Flu_LineSpace + u_xlat2.x;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat0.x;
    u_xlat0.xw = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_0.xw = texture(_Flu_Tex, u_xlat0.xw).xy;
    u_xlat16_15.xy = u_xlat16_0.xw * vec2(0.305306017, 0.305306017) + vec2(0.682171106, 0.682171106);
    u_xlat16_15.xy = u_xlat16_0.xw * u_xlat16_15.xy + vec2(0.0125228781, 0.0125228781);
    u_xlat16_15.xy = u_xlat16_0.xw * u_xlat16_15.xy;
    u_xlat16_15.xy = u_xlat16_0.yy * u_xlat16_15.xy;
    u_xlat0.x = u_xlat16_15.x * _Flu_Power;
    u_xlat7.x = max(u_xlat16_15.y, 0.00999999978);
    u_xlat7.x = u_xlat7.x + (-_DissolveStep);
    u_xlat16_4.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * u_xlat0.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    u_xlat2.xyz = u_xlat16_3.xyz * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat16_8.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_6.xyz = texture(_Emissive, u_xlat16_8.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat16_6.xyz;
    u_xlat16_8.x = u_xlat16_6.x * u_xlat16_8.x + _MainColor.w;
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(vec3(_EmissivePower, _EmissivePower, _EmissivePower)) + u_xlat2.xyz;
    u_xlat16_3.xyz = (-u_xlat2.xyz);
    u_xlat16_4.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_DissolveColorPW);
    u_xlat16_4.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat16_15.x = u_xlat16_0.z + _Mask_B_Alpha;
    u_xlat16_15.x = u_xlat16_0.z * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_2.w * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_15.x * vs_COLOR0.w;
    u_xlat16_15.x = u_xlat16_15.x * _Alpha;
    u_xlat16_3.w = (-u_xlat16_15.x);
    u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
    u_xlat16_4.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_22 = u_xlat16_4.y * u_xlat16_4.x;
    u_xlat0.x = u_xlat7.x / u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.800000012>=u_xlat0.x);
#else
    u_xlatb7 = 0.800000012>=u_xlat0.x;
#endif
    u_xlat16_22 = (u_xlatb7) ? _IS_CUSTOM : 0.0;
    u_xlat16_15.x = u_xlat16_22 * u_xlat16_3.w + u_xlat16_15.x;
    u_xlat16_3.xyz = vec3(u_xlat16_22) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat7.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat7.xyz;
    u_xlat16_22 = u_xlat0.x * u_xlat16_15.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_22;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat0.x + (-u_xlat16_8.x);
    SV_Target0.w = u_xlat16_1.x * u_xlat16_15.x + u_xlat16_8.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xy = in_TEXCOORD0.xy;
    u_xlat2.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD0 = u_xlat2;
    vs_TEXCOORD2.w = u_xlat0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat8 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat8 = max(u_xlat8, 1.17549435e-38);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat0.x;
    vs_TEXCOORD4.w = u_xlat0.y;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Normal_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Emissive_ST;
uniform 	mediump vec4 _BackColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _MainColorPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump float _BackPower;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Flu_LineSpace;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _Emissive;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat16_1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_3.y = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_3.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_8.x = (-u_xlat16_1.x) * _FresnelColor.w + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_3.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat16_15.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat16_15.xy);
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_MainColorPower) + u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlatb2 = _Flu_UV==1.0;
    u_xlat0.xw = (bool(u_xlatb2)) ? u_xlat0.xw : vs_TEXCOORD0.zw;
    u_xlat2.x = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat0.w * _Flu_LineSpace + u_xlat2.x;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat0.x;
    u_xlat0.xw = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_0.xw = texture2D(_Flu_Tex, u_xlat0.xw).xy;
    u_xlat16_15.xy = u_xlat10_0.xw * vec2(0.305306017, 0.305306017) + vec2(0.682171106, 0.682171106);
    u_xlat16_15.xy = u_xlat10_0.xw * u_xlat16_15.xy + vec2(0.0125228781, 0.0125228781);
    u_xlat16_15.xy = u_xlat10_0.xw * u_xlat16_15.xy;
    u_xlat16_15.xy = u_xlat10_0.yy * u_xlat16_15.xy;
    u_xlat0.x = u_xlat16_15.x * _Flu_Power;
    u_xlat7.x = max(u_xlat16_15.y, 0.00999999978);
    u_xlat7.x = u_xlat7.x + (-_DissolveStep);
    u_xlat16_4.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * u_xlat0.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    u_xlat2.xyz = u_xlat16_3.xyz * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat16_8.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_6.xyz = texture2D(_Emissive, u_xlat16_8.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat10_6.xyz;
    u_xlat16_8.x = u_xlat10_6.x * u_xlat16_8.x + _MainColor.w;
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(vec3(_EmissivePower, _EmissivePower, _EmissivePower)) + u_xlat2.xyz;
    u_xlat16_3.xyz = (-u_xlat2.xyz);
    u_xlat16_4.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_DissolveColorPW);
    u_xlat16_4.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat16_15.x = u_xlat10_0.z + _Mask_B_Alpha;
    u_xlat16_15.x = u_xlat10_0.z * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat10_2.w * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_15.x * vs_COLOR0.w;
    u_xlat16_15.x = u_xlat16_15.x * _Alpha;
    u_xlat16_3.w = (-u_xlat16_15.x);
    u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
    u_xlat16_4.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_22 = u_xlat16_4.y * u_xlat16_4.x;
    u_xlat0.x = u_xlat7.x / u_xlat16_22;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlatb7 = 0.800000012>=u_xlat0.x;
    u_xlat16_22 = (u_xlatb7) ? _IS_CUSTOM : 0.0;
    u_xlat16_15.x = u_xlat16_22 * u_xlat16_3.w + u_xlat16_15.x;
    u_xlat16_3.xyz = vec3(u_xlat16_22) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat7.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat7.xyz;
    u_xlat16_22 = u_xlat0.x * u_xlat16_15.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_22;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat0.x + (-u_xlat16_8.x);
    SV_Target0.w = u_xlat16_1.x * u_xlat16_15.x + u_xlat16_8.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xy = in_TEXCOORD0.xy;
    u_xlat2.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD0 = u_xlat2;
    vs_TEXCOORD2.w = u_xlat0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat8 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat8 = max(u_xlat8, 1.17549435e-38);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat0.x;
    vs_TEXCOORD4.w = u_xlat0.y;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Normal_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Emissive_ST;
uniform 	mediump vec4 _BackColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _MainColorPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump float _BackPower;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Flu_LineSpace;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _Emissive;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat16_1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_3.y = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_3.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_8.x = (-u_xlat16_1.x) * _FresnelColor.w + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_3.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat16_15.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat16_15.xy);
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_MainColorPower) + u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlatb2 = _Flu_UV==1.0;
    u_xlat0.xw = (bool(u_xlatb2)) ? u_xlat0.xw : vs_TEXCOORD0.zw;
    u_xlat2.x = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat0.w * _Flu_LineSpace + u_xlat2.x;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat0.x;
    u_xlat0.xw = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_0.xw = texture2D(_Flu_Tex, u_xlat0.xw).xy;
    u_xlat16_15.xy = u_xlat10_0.xw * vec2(0.305306017, 0.305306017) + vec2(0.682171106, 0.682171106);
    u_xlat16_15.xy = u_xlat10_0.xw * u_xlat16_15.xy + vec2(0.0125228781, 0.0125228781);
    u_xlat16_15.xy = u_xlat10_0.xw * u_xlat16_15.xy;
    u_xlat16_15.xy = u_xlat10_0.yy * u_xlat16_15.xy;
    u_xlat0.x = u_xlat16_15.x * _Flu_Power;
    u_xlat7.x = max(u_xlat16_15.y, 0.00999999978);
    u_xlat7.x = u_xlat7.x + (-_DissolveStep);
    u_xlat16_4.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * u_xlat0.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    u_xlat2.xyz = u_xlat16_3.xyz * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat16_8.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_6.xyz = texture2D(_Emissive, u_xlat16_8.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat10_6.xyz;
    u_xlat16_8.x = u_xlat10_6.x * u_xlat16_8.x + _MainColor.w;
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(vec3(_EmissivePower, _EmissivePower, _EmissivePower)) + u_xlat2.xyz;
    u_xlat16_3.xyz = (-u_xlat2.xyz);
    u_xlat16_4.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_DissolveColorPW);
    u_xlat16_4.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat16_15.x = u_xlat10_0.z + _Mask_B_Alpha;
    u_xlat16_15.x = u_xlat10_0.z * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat10_2.w * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_15.x * vs_COLOR0.w;
    u_xlat16_15.x = u_xlat16_15.x * _Alpha;
    u_xlat16_3.w = (-u_xlat16_15.x);
    u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
    u_xlat16_4.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_22 = u_xlat16_4.y * u_xlat16_4.x;
    u_xlat0.x = u_xlat7.x / u_xlat16_22;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlatb7 = 0.800000012>=u_xlat0.x;
    u_xlat16_22 = (u_xlatb7) ? _IS_CUSTOM : 0.0;
    u_xlat16_15.x = u_xlat16_22 * u_xlat16_3.w + u_xlat16_15.x;
    u_xlat16_3.xyz = vec3(u_xlat16_22) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat7.xyz = log2(abs(u_xlat16_3.xyz));
    u_xlat7.xyz = u_xlat7.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat7.xyz = exp2(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat7.xyz;
    u_xlat16_22 = u_xlat0.x * u_xlat16_15.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_22;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat0.x + (-u_xlat16_8.x);
    SV_Target0.w = u_xlat16_1.x * u_xlat16_15.x + u_xlat16_8.x;
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xy = in_TEXCOORD0.xy;
    u_xlat2.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD0 = u_xlat2;
    vs_TEXCOORD2.w = u_xlat0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat8 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat8 = max(u_xlat8, 1.17549435e-38);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat0.x;
    vs_TEXCOORD4.w = u_xlat0.y;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Normal_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Emissive_ST;
uniform 	mediump vec4 _BackColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _MainColorPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump float _BackPower;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Flu_LineSpace;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _Emissive;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD6;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat16_1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_3.y = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_3.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_8.x = (-u_xlat16_1.x) * _FresnelColor.w + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_3.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0.xyz = texture(_Mask, u_xlat16_15.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat16_15.xy);
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_MainColorPower) + u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Flu_UV==1.0);
#else
    u_xlatb2 = _Flu_UV==1.0;
#endif
    u_xlat0.xw = (bool(u_xlatb2)) ? u_xlat0.xw : vs_TEXCOORD0.zw;
    u_xlat2.x = _Flu_Speed_V * _Time.y;
    u_xlat2.y = u_xlat0.w * _Flu_LineSpace + u_xlat2.x;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat0.x;
    u_xlat0.xw = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_0.xw = texture(_Flu_Tex, u_xlat0.xw).xy;
    u_xlat16_15.xy = u_xlat16_0.xw * vec2(0.305306017, 0.305306017) + vec2(0.682171106, 0.682171106);
    u_xlat16_15.xy = u_xlat16_0.xw * u_xlat16_15.xy + vec2(0.0125228781, 0.0125228781);
    u_xlat16_15.xy = u_xlat16_0.xw * u_xlat16_15.xy;
    u_xlat16_15.xy = u_xlat16_0.yy * u_xlat16_15.xy;
    u_xlat0.x = u_xlat16_15.x * _Flu_Power;
    u_xlat7 = max(u_xlat16_15.y, 0.00999999978);
    u_xlat7 = u_xlat7 + (-_DissolveStep);
    u_xlat16_4.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * u_xlat0.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    u_xlat2.xyz = u_xlat16_3.xyz * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat16_8.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_6.xyz = texture(_Emissive, u_xlat16_8.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat16_6.xyz;
    u_xlat16_8.x = u_xlat16_6.x * u_xlat16_8.x + _MainColor.w;
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(vec3(_EmissivePower, _EmissivePower, _EmissivePower)) + u_xlat2.xyz;
    u_xlat16_3.xyz = (-u_xlat2.xyz);
    u_xlat16_4.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_DissolveColorPW);
    u_xlat16_4.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat16_15.x = u_xlat16_0.z + _Mask_B_Alpha;
    u_xlat16_15.x = u_xlat16_0.z * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_2.w * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_15.x * vs_COLOR0.w;
    u_xlat16_15.x = u_xlat16_15.x * _Alpha;
    u_xlat16_3.w = (-u_xlat16_15.x);
    u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
    u_xlat16_4.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_22 = u_xlat16_4.y * u_xlat16_4.x;
    u_xlat0.x = u_xlat7 / u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.800000012>=u_xlat0.x);
#else
    u_xlatb7 = 0.800000012>=u_xlat0.x;
#endif
    u_xlat16_22 = (u_xlatb7) ? _IS_CUSTOM : 0.0;
    u_xlat16_15.x = u_xlat16_22 * u_xlat16_3.w + u_xlat16_15.x;
    SV_Target0.xyz = vec3(u_xlat16_22) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat16_22 = u_xlat0.x * u_xlat16_15.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_22;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat0.x + (-u_xlat16_8.x);
    SV_Target0.w = u_xlat16_1.x * u_xlat16_15.x + u_xlat16_8.x;
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xy = in_TEXCOORD0.xy;
    u_xlat2.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD0 = u_xlat2;
    vs_TEXCOORD2.w = u_xlat0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat8 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat8 = max(u_xlat8, 1.17549435e-38);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat0.x;
    vs_TEXCOORD4.w = u_xlat0.y;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Normal_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Emissive_ST;
uniform 	mediump vec4 _BackColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _MainColorPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump float _BackPower;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Flu_LineSpace;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
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
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _Emissive;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD6;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_2.xyz = texture(_Normal, u_xlat16_1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_3.y = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_3.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_8.x = (-u_xlat16_1.x) * _FresnelColor.w + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_3.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0.xyz = texture(_Mask, u_xlat16_15.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat16_15.xy);
    u_xlat16_4.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_MainColorPower) + u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Flu_UV==1.0);
#else
    u_xlatb2 = _Flu_UV==1.0;
#endif
    u_xlat0.xw = (bool(u_xlatb2)) ? u_xlat0.xw : vs_TEXCOORD0.zw;
    u_xlat2.x = _Flu_Speed_V * _Time.y;
    u_xlat2.y = u_xlat0.w * _Flu_LineSpace + u_xlat2.x;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat0.x;
    u_xlat0.xw = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_0.xw = texture(_Flu_Tex, u_xlat0.xw).xy;
    u_xlat16_15.xy = u_xlat16_0.xw * vec2(0.305306017, 0.305306017) + vec2(0.682171106, 0.682171106);
    u_xlat16_15.xy = u_xlat16_0.xw * u_xlat16_15.xy + vec2(0.0125228781, 0.0125228781);
    u_xlat16_15.xy = u_xlat16_0.xw * u_xlat16_15.xy;
    u_xlat16_15.xy = u_xlat16_0.yy * u_xlat16_15.xy;
    u_xlat0.x = u_xlat16_15.x * _Flu_Power;
    u_xlat7 = max(u_xlat16_15.y, 0.00999999978);
    u_xlat7 = u_xlat7 + (-_DissolveStep);
    u_xlat16_4.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * u_xlat0.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    u_xlat2.xyz = u_xlat16_3.xyz * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat16_8.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_6.xyz = texture(_Emissive, u_xlat16_8.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat16_6.xyz;
    u_xlat16_8.x = u_xlat16_6.x * u_xlat16_8.x + _MainColor.w;
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(vec3(_EmissivePower, _EmissivePower, _EmissivePower)) + u_xlat2.xyz;
    u_xlat16_3.xyz = (-u_xlat2.xyz);
    u_xlat16_4.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_DissolveColorPW);
    u_xlat16_4.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat16_15.x = u_xlat16_0.z + _Mask_B_Alpha;
    u_xlat16_15.x = u_xlat16_0.z * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_2.w * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_15.x * vs_COLOR0.w;
    u_xlat16_15.x = u_xlat16_15.x * _Alpha;
    u_xlat16_3.w = (-u_xlat16_15.x);
    u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
    u_xlat16_4.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_22 = u_xlat16_4.y * u_xlat16_4.x;
    u_xlat0.x = u_xlat7 / u_xlat16_22;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.800000012>=u_xlat0.x);
#else
    u_xlatb7 = 0.800000012>=u_xlat0.x;
#endif
    u_xlat16_22 = (u_xlatb7) ? _IS_CUSTOM : 0.0;
    u_xlat16_15.x = u_xlat16_22 * u_xlat16_3.w + u_xlat16_15.x;
    SV_Target0.xyz = vec3(u_xlat16_22) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat16_22 = u_xlat0.x * u_xlat16_15.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_22;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat0.x + (-u_xlat16_8.x);
    SV_Target0.w = u_xlat16_1.x * u_xlat16_15.x + u_xlat16_8.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xy = in_TEXCOORD0.xy;
    u_xlat2.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD0 = u_xlat2;
    vs_TEXCOORD2.w = u_xlat0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat8 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat8 = max(u_xlat8, 1.17549435e-38);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat0.x;
    vs_TEXCOORD4.w = u_xlat0.y;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Normal_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Emissive_ST;
uniform 	mediump vec4 _BackColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _MainColorPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump float _BackPower;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Flu_LineSpace;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _Emissive;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_6;
float u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat16_1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_3.y = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_3.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_8.x = (-u_xlat16_1.x) * _FresnelColor.w + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_3.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat16_15.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat16_15.xy);
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_MainColorPower) + u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlatb2 = _Flu_UV==1.0;
    u_xlat0.xw = (bool(u_xlatb2)) ? u_xlat0.xw : vs_TEXCOORD0.zw;
    u_xlat2.x = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat0.w * _Flu_LineSpace + u_xlat2.x;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat0.x;
    u_xlat0.xw = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_0.xw = texture2D(_Flu_Tex, u_xlat0.xw).xy;
    u_xlat16_15.xy = u_xlat10_0.xw * vec2(0.305306017, 0.305306017) + vec2(0.682171106, 0.682171106);
    u_xlat16_15.xy = u_xlat10_0.xw * u_xlat16_15.xy + vec2(0.0125228781, 0.0125228781);
    u_xlat16_15.xy = u_xlat10_0.xw * u_xlat16_15.xy;
    u_xlat16_15.xy = u_xlat10_0.yy * u_xlat16_15.xy;
    u_xlat0.x = u_xlat16_15.x * _Flu_Power;
    u_xlat7 = max(u_xlat16_15.y, 0.00999999978);
    u_xlat7 = u_xlat7 + (-_DissolveStep);
    u_xlat16_4.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * u_xlat0.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    u_xlat2.xyz = u_xlat16_3.xyz * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat16_8.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_6.xyz = texture2D(_Emissive, u_xlat16_8.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat10_6.xyz;
    u_xlat16_8.x = u_xlat10_6.x * u_xlat16_8.x + _MainColor.w;
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(vec3(_EmissivePower, _EmissivePower, _EmissivePower)) + u_xlat2.xyz;
    u_xlat16_3.xyz = (-u_xlat2.xyz);
    u_xlat16_4.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_DissolveColorPW);
    u_xlat16_4.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat16_15.x = u_xlat10_0.z + _Mask_B_Alpha;
    u_xlat16_15.x = u_xlat10_0.z * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat10_2.w * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_15.x * vs_COLOR0.w;
    u_xlat16_15.x = u_xlat16_15.x * _Alpha;
    u_xlat16_3.w = (-u_xlat16_15.x);
    u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
    u_xlat16_4.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_22 = u_xlat16_4.y * u_xlat16_4.x;
    u_xlat0.x = u_xlat7 / u_xlat16_22;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlatb7 = 0.800000012>=u_xlat0.x;
    u_xlat16_22 = (u_xlatb7) ? _IS_CUSTOM : 0.0;
    u_xlat16_15.x = u_xlat16_22 * u_xlat16_3.w + u_xlat16_15.x;
    SV_Target0.xyz = vec3(u_xlat16_22) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat16_22 = u_xlat0.x * u_xlat16_15.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_22;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat0.x + (-u_xlat16_8.x);
    SV_Target0.w = u_xlat16_1.x * u_xlat16_15.x + u_xlat16_8.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    u_xlat2.xy = in_TEXCOORD0.xy;
    u_xlat2.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD0 = u_xlat2;
    vs_TEXCOORD2.w = u_xlat0.z;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat8 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat8 = max(u_xlat8, 1.17549435e-38);
    u_xlat8 = inversesqrt(u_xlat8);
    u_xlat2.xyz = vec3(u_xlat8) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    vs_TEXCOORD3.w = u_xlat0.x;
    vs_TEXCOORD4.w = u_xlat0.y;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Normal_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump vec4 _Flu_Tex_ST;
uniform 	mediump vec4 _Emissive_ST;
uniform 	mediump vec4 _BackColor;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump vec4 _Flu_Color;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _MainColorPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump float _BackPower;
uniform 	mediump float _Flu_UV;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	mediump float _Flu_LineSpace;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _Emissive;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
lowp vec3 u_xlat10_6;
float u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec2 u_xlat16_15;
float u_xlat21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_2.xyz = texture2D(_Normal, u_xlat16_1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_3.y = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_3.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_8.x = (-u_xlat16_1.x) * _FresnelColor.w + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_3.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.zw * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat16_15.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat16_3.xyz;
    u_xlat16_15.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat16_15.xy);
    u_xlat16_4.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat16_4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_4.xyz = u_xlat10_2.xyz * u_xlat16_4.xyz;
    u_xlat16_5.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_MainColorPower) + u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlatb2 = _Flu_UV==1.0;
    u_xlat0.xw = (bool(u_xlatb2)) ? u_xlat0.xw : vs_TEXCOORD0.zw;
    u_xlat2.x = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat0.w * _Flu_LineSpace + u_xlat2.x;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat0.x;
    u_xlat0.xw = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_0.xw = texture2D(_Flu_Tex, u_xlat0.xw).xy;
    u_xlat16_15.xy = u_xlat10_0.xw * vec2(0.305306017, 0.305306017) + vec2(0.682171106, 0.682171106);
    u_xlat16_15.xy = u_xlat10_0.xw * u_xlat16_15.xy + vec2(0.0125228781, 0.0125228781);
    u_xlat16_15.xy = u_xlat10_0.xw * u_xlat16_15.xy;
    u_xlat16_15.xy = u_xlat10_0.yy * u_xlat16_15.xy;
    u_xlat0.x = u_xlat16_15.x * _Flu_Power;
    u_xlat7 = max(u_xlat16_15.y, 0.00999999978);
    u_xlat7 = u_xlat7 + (-_DissolveStep);
    u_xlat16_4.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * u_xlat0.xxx + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_BackPower);
    u_xlat2.xyz = u_xlat16_3.xyz * u_xlat16_8.xxx + u_xlat2.xyz;
    u_xlat16_8.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_6.xyz = texture2D(_Emissive, u_xlat16_8.xy).xyz;
    u_xlat16_8.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat10_6.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_8.xyz * u_xlat10_6.xyz;
    u_xlat16_8.x = u_xlat10_6.x * u_xlat16_8.x + _MainColor.w;
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(vec3(_EmissivePower, _EmissivePower, _EmissivePower)) + u_xlat2.xyz;
    u_xlat16_3.xyz = (-u_xlat2.xyz);
    u_xlat16_4.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(_DissolveColorPW);
    u_xlat16_4.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat16_15.x = u_xlat10_0.z + _Mask_B_Alpha;
    u_xlat16_15.x = u_xlat10_0.z * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat10_2.w * u_xlat16_15.x;
    u_xlat16_15.x = u_xlat16_15.x * vs_COLOR0.w;
    u_xlat16_15.x = u_xlat16_15.x * _Alpha;
    u_xlat16_3.w = (-u_xlat16_15.x);
    u_xlat16_3 = u_xlat16_3 + u_xlat16_4;
    u_xlat16_4.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_22 = u_xlat16_4.y * u_xlat16_4.x;
    u_xlat0.x = u_xlat7 / u_xlat16_22;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlatb7 = 0.800000012>=u_xlat0.x;
    u_xlat16_22 = (u_xlatb7) ? _IS_CUSTOM : 0.0;
    u_xlat16_15.x = u_xlat16_22 * u_xlat16_3.w + u_xlat16_15.x;
    SV_Target0.xyz = vec3(u_xlat16_22) * u_xlat16_3.xyz + u_xlat2.xyz;
    u_xlat16_22 = u_xlat0.x * u_xlat16_15.x;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_22;
    u_xlat16_15.x = u_xlat16_15.x * u_xlat0.x + (-u_xlat16_8.x);
    SV_Target0.w = u_xlat16_1.x * u_xlat16_15.x + u_xlat16_8.x;
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
}