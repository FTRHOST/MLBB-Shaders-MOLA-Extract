//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect/FX_Fresnel_Flu_Show_Modify" {
Properties {

[Enum(UnityEngine.Rendering.BlendMode)] _Src ("Src", Float) = 5.0

[Enum(UnityEngine.Rendering.BlendMode)] _Dst ("Dst", Float) = 10.0

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

[Toggle(_NerverCut)] _NerverCut ("永不裁剪", Float) = 0.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

[Enum(On, 0,Off, 4)] _MLZTest ("总是最前", Float) = 4.0

[Enum(Off, 0, On, 1)] _ZWrite ("ZWrite", Float) = 1.0

}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 19917
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _NerverCut;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_NerverCut==1.0);
#else
    u_xlatb0 = _NerverCut==1.0;
#endif
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
    u_xlat4 = u_xlat1.w * u_xlat1.w;
    u_xlat4 = u_xlat4 * 0.999998987;
    gl_Position.z = (u_xlatb0) ? u_xlat4 : u_xlat1.z;
    gl_Position.xyw = u_xlat1.xyw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Normal_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _BackColor;
uniform 	mediump float _BackPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	float _Flu_LineSpace;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	vec4 _Emissive_ST;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _Emissive;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
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
mediump vec3 u_xlat16_4;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
float u_xlat15;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD2.xyz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_6 = (-u_xlat16_1.x) * _FresnelColor.w + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_3.xyz = u_xlat16_1.xxx * _FresnelColor.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xw);
    u_xlat16_4.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_MainColorPower) + u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Flu_UV==1.0);
#else
    u_xlatb2 = _Flu_UV==1.0;
#endif
    u_xlat0.xw = (bool(u_xlatb2)) ? u_xlat0.xw : vs_TEXCOORD1.xy;
    u_xlat2.x = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat0.w * _Flu_LineSpace + u_xlat2.x;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat0.x;
    u_xlat0.xw = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_0.xw = texture(_Flu_Tex, u_xlat0.xw).xy;
    u_xlat0.xy = u_xlat16_0.yy * u_xlat16_0.xw;
    u_xlat16_4.xyz = u_xlat0.xxx * _Flu_Color.xyz;
    u_xlat16_11 = max(u_xlat0.y, 0.00999999978);
    u_xlat16_11 = u_xlat16_11 + (-_DissolveStep);
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _BackColor.xyz * vec3(_BackPower);
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(u_xlat16_6) + u_xlat16_3.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_0.xyw = texture(_Emissive, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyw * vec3(_EmissivePower) + u_xlat16_3.xyz;
    u_xlat16_6 = u_xlat16_0.x + _MainColor.w;
    u_xlat16_16 = u_xlat16_0.z + _Mask_B_Alpha;
    u_xlat16_16 = u_xlat16_0.z * u_xlat16_16;
    u_xlat16_16 = u_xlat16_2.w * u_xlat16_16;
    u_xlat16_16 = u_xlat16_16 * vs_COLOR0.w;
    u_xlat16_3.w = u_xlat16_16 * _Alpha;
    u_xlat16_0 = _DissolveColor * vec4(_DissolveColorPW) + (-u_xlat16_3);
    u_xlat16_4.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_16 = u_xlat16_4.y * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 / u_xlat16_16;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11 = min(max(u_xlat16_11, 0.0), 1.0);
#else
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.800000012>=u_xlat16_11);
#else
    u_xlatb2 = 0.800000012>=u_xlat16_11;
#endif
    u_xlat16_16 = (u_xlatb2) ? _IS_CUSTOM : 0.0;
    u_xlat16_0 = vec4(u_xlat16_16) * u_xlat16_0 + u_xlat16_3;
    u_xlat16_16 = u_xlat16_11 * u_xlat16_0.w;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_16;
    u_xlat16_11 = u_xlat16_0.w * u_xlat16_11 + (-u_xlat16_6);
    SV_Target0.w = u_xlat16_1.x * u_xlat16_11 + u_xlat16_6;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat16_0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _NerverCut;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_NerverCut==1.0);
#else
    u_xlatb0 = _NerverCut==1.0;
#endif
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
    u_xlat4 = u_xlat1.w * u_xlat1.w;
    u_xlat4 = u_xlat4 * 0.999998987;
    gl_Position.z = (u_xlatb0) ? u_xlat4 : u_xlat1.z;
    gl_Position.xyw = u_xlat1.xyw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Normal_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _BackColor;
uniform 	mediump float _BackPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	float _Flu_LineSpace;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	vec4 _Emissive_ST;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
UNITY_LOCATION(2) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Flu_Tex;
UNITY_LOCATION(4) uniform mediump sampler2D _Emissive;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
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
mediump vec3 u_xlat16_4;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
float u_xlat15;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD2.xyz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_6 = (-u_xlat16_1.x) * _FresnelColor.w + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_3.xyz = u_xlat16_1.xxx * _FresnelColor.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xw);
    u_xlat16_4.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_MainColorPower) + u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Flu_UV==1.0);
#else
    u_xlatb2 = _Flu_UV==1.0;
#endif
    u_xlat0.xw = (bool(u_xlatb2)) ? u_xlat0.xw : vs_TEXCOORD1.xy;
    u_xlat2.x = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat0.w * _Flu_LineSpace + u_xlat2.x;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat0.x;
    u_xlat0.xw = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_0.xw = texture(_Flu_Tex, u_xlat0.xw).xy;
    u_xlat0.xy = u_xlat16_0.yy * u_xlat16_0.xw;
    u_xlat16_4.xyz = u_xlat0.xxx * _Flu_Color.xyz;
    u_xlat16_11 = max(u_xlat0.y, 0.00999999978);
    u_xlat16_11 = u_xlat16_11 + (-_DissolveStep);
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _BackColor.xyz * vec3(_BackPower);
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(u_xlat16_6) + u_xlat16_3.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_0.xyw = texture(_Emissive, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyw * vec3(_EmissivePower) + u_xlat16_3.xyz;
    u_xlat16_6 = u_xlat16_0.x + _MainColor.w;
    u_xlat16_16 = u_xlat16_0.z + _Mask_B_Alpha;
    u_xlat16_16 = u_xlat16_0.z * u_xlat16_16;
    u_xlat16_16 = u_xlat16_2.w * u_xlat16_16;
    u_xlat16_16 = u_xlat16_16 * vs_COLOR0.w;
    u_xlat16_3.w = u_xlat16_16 * _Alpha;
    u_xlat16_0 = _DissolveColor * vec4(_DissolveColorPW) + (-u_xlat16_3);
    u_xlat16_4.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_16 = u_xlat16_4.y * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 / u_xlat16_16;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11 = min(max(u_xlat16_11, 0.0), 1.0);
#else
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.800000012>=u_xlat16_11);
#else
    u_xlatb2 = 0.800000012>=u_xlat16_11;
#endif
    u_xlat16_16 = (u_xlatb2) ? _IS_CUSTOM : 0.0;
    u_xlat16_0 = vec4(u_xlat16_16) * u_xlat16_0 + u_xlat16_3;
    u_xlat16_16 = u_xlat16_11 * u_xlat16_0.w;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_16;
    u_xlat16_11 = u_xlat16_0.w * u_xlat16_11 + (-u_xlat16_6);
    SV_Target0.w = u_xlat16_1.x * u_xlat16_11 + u_xlat16_6;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat16_0.xyz;
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
uniform 	mediump float _NerverCut;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlatb0 = _NerverCut==1.0;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
    u_xlat4 = u_xlat1.w * u_xlat1.w;
    u_xlat4 = u_xlat4 * 0.999998987;
    gl_Position.z = (u_xlatb0) ? u_xlat4 : u_xlat1.z;
    gl_Position.xyw = u_xlat1.xyw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
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
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Normal_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _BackColor;
uniform 	mediump float _BackPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	float _Flu_LineSpace;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	vec4 _Emissive_ST;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _Emissive;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
float u_xlat15;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_0.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD2.xyz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_6 = (-u_xlat16_1.x) * _FresnelColor.w + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_3.xyz = u_xlat16_1.xxx * _FresnelColor.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xw);
    u_xlat16_4.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_MainColorPower) + u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlatb2 = _Flu_UV==1.0;
    u_xlat0.xw = (bool(u_xlatb2)) ? u_xlat0.xw : vs_TEXCOORD1.xy;
    u_xlat2.x = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat0.w * _Flu_LineSpace + u_xlat2.x;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat0.x;
    u_xlat0.xw = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_0.xw = texture2D(_Flu_Tex, u_xlat0.xw).xy;
    u_xlat0.xy = u_xlat10_0.yy * u_xlat10_0.xw;
    u_xlat16_4.xyz = u_xlat0.xxx * _Flu_Color.xyz;
    u_xlat16_11 = max(u_xlat0.y, 0.00999999978);
    u_xlat16_11 = u_xlat16_11 + (-_DissolveStep);
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _BackColor.xyz * vec3(_BackPower);
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(u_xlat16_6) + u_xlat16_3.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_0.xyw = texture2D(_Emissive, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyw * vec3(_EmissivePower) + u_xlat16_3.xyz;
    u_xlat16_6 = u_xlat10_0.x + _MainColor.w;
    u_xlat16_16 = u_xlat10_0.z + _Mask_B_Alpha;
    u_xlat16_16 = u_xlat10_0.z * u_xlat16_16;
    u_xlat16_16 = u_xlat10_2.w * u_xlat16_16;
    u_xlat16_16 = u_xlat16_16 * vs_COLOR0.w;
    u_xlat16_3.w = u_xlat16_16 * _Alpha;
    u_xlat16_0 = _DissolveColor * vec4(_DissolveColorPW) + (-u_xlat16_3);
    u_xlat16_4.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_16 = u_xlat16_4.y * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 / u_xlat16_16;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlatb2 = 0.800000012>=u_xlat16_11;
    u_xlat16_16 = (u_xlatb2) ? _IS_CUSTOM : 0.0;
    u_xlat16_0 = vec4(u_xlat16_16) * u_xlat16_0 + u_xlat16_3;
    u_xlat16_16 = u_xlat16_11 * u_xlat16_0.w;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_16;
    u_xlat16_11 = u_xlat16_0.w * u_xlat16_11 + (-u_xlat16_6);
    SV_Target0.w = u_xlat16_1.x * u_xlat16_11 + u_xlat16_6;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    SV_Target0.xyz = u_xlat16_0.xyz;
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
uniform 	mediump float _NerverCut;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat12;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlatb0 = _NerverCut==1.0;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat2 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat1;
    u_xlat4 = u_xlat1.w * u_xlat1.w;
    u_xlat4 = u_xlat4 * 0.999998987;
    gl_Position.z = (u_xlatb0) ? u_xlat4 : u_xlat1.z;
    gl_Position.xyw = u_xlat1.xyw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
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
uniform 	mediump float _MainColorPower;
uniform 	mediump vec4 _MainColor;
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _Normal_ST;
uniform 	mediump float _FresnelScale;
uniform 	mediump float _FresnelPower;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _Mask_B_Alpha;
uniform 	mediump vec4 _BackColor;
uniform 	mediump float _BackPower;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _Flu_UV;
uniform 	mediump vec4 _Flu_Color;
uniform 	vec4 _Flu_Tex_ST;
uniform 	mediump float _Flu_Speed_U;
uniform 	mediump float _Flu_Speed_V;
uniform 	mediump float _Flu_Power;
uniform 	float _Flu_LineSpace;
uniform 	mediump float _DissolveStep;
uniform 	mediump float _SoftSize;
uniform 	mediump vec4 _DissolveColor;
uniform 	mediump float _DissolveColorPW;
uniform 	mediump float _IS_CUSTOM;
uniform 	vec4 _Emissive_ST;
uniform 	mediump float _EmissivePower;
uniform 	mediump float _Alpha;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Mask;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Flu_Tex;
uniform lowp sampler2D _Emissive;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
float u_xlat15;
mediump float u_xlat16_16;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_0.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * vs_TEXCOORD3.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.zzz * vs_TEXCOORD2.xyz + u_xlat0.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = max(u_xlat16_1.x, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelPower;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x * _FresnelScale;
    u_xlat16_6 = (-u_xlat16_1.x) * _FresnelColor.w + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _FresnelColor.w;
    u_xlat16_3.xyz = u_xlat16_1.xxx * _FresnelColor.xyz;
    u_xlat0.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xxx * u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xw);
    u_xlat16_4.xyz = u_xlat10_2.xyz * vs_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(_MainColorPower) + u_xlat16_3.xyz;
    u_xlat0.xw = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlatb2 = _Flu_UV==1.0;
    u_xlat0.xw = (bool(u_xlatb2)) ? u_xlat0.xw : vs_TEXCOORD1.xy;
    u_xlat2.x = _Time.y * _Flu_Speed_V;
    u_xlat2.y = u_xlat0.w * _Flu_LineSpace + u_xlat2.x;
    u_xlat2.x = _Time.y * _Flu_Speed_U + u_xlat0.x;
    u_xlat0.xw = u_xlat2.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_0.xw = texture2D(_Flu_Tex, u_xlat0.xw).xy;
    u_xlat0.xy = u_xlat10_0.yy * u_xlat10_0.xw;
    u_xlat16_4.xyz = u_xlat0.xxx * _Flu_Color.xyz;
    u_xlat16_11 = max(u_xlat0.y, 0.00999999978);
    u_xlat16_11 = u_xlat16_11 + (-_DissolveStep);
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_3.xyz;
    u_xlat16_4.xyz = _BackColor.xyz * vec3(_BackPower);
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(u_xlat16_6) + u_xlat16_3.xyz;
    u_xlat0.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_0.xyw = texture2D(_Emissive, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyw * vec3(_EmissivePower) + u_xlat16_3.xyz;
    u_xlat16_6 = u_xlat10_0.x + _MainColor.w;
    u_xlat16_16 = u_xlat10_0.z + _Mask_B_Alpha;
    u_xlat16_16 = u_xlat10_0.z * u_xlat16_16;
    u_xlat16_16 = u_xlat10_2.w * u_xlat16_16;
    u_xlat16_16 = u_xlat16_16 * vs_COLOR0.w;
    u_xlat16_3.w = u_xlat16_16 * _Alpha;
    u_xlat16_0 = _DissolveColor * vec4(_DissolveColorPW) + (-u_xlat16_3);
    u_xlat16_4.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_16 = u_xlat16_4.y * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 / u_xlat16_16;
    u_xlat16_11 = clamp(u_xlat16_11, 0.0, 1.0);
    u_xlatb2 = 0.800000012>=u_xlat16_11;
    u_xlat16_16 = (u_xlatb2) ? _IS_CUSTOM : 0.0;
    u_xlat16_0 = vec4(u_xlat16_16) * u_xlat16_0 + u_xlat16_3;
    u_xlat16_16 = u_xlat16_11 * u_xlat16_0.w;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_16;
    u_xlat16_11 = u_xlat16_0.w * u_xlat16_11 + (-u_xlat16_6);
    SV_Target0.w = u_xlat16_1.x * u_xlat16_11 + u_xlat16_6;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
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
}
}
}
}