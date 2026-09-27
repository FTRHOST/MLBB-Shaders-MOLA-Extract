//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/Effect/AS_FX_Fresnel_Flu_Show" {
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
  GpuProgramID 29444
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
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _Flu_UV;
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
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
mediump vec3 u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xy = texture(_Normal, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_2 = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat16_7.xyz = u_xlat0.xxx * _FresnelColor.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_5.xyz = texture(_Mask, u_xlat5.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_Flu_UV==1.0);
#else
    u_xlatb5 = _Flu_UV==1.0;
#endif
    u_xlat1.xy = (bool(u_xlatb5)) ? u_xlat1.xy : vs_TEXCOORD1.xy;
    u_xlat5.x = _Time.y * _Flu_Speed_V;
    u_xlat4.y = u_xlat1.y * _Flu_LineSpace + u_xlat5.x;
    u_xlat4.x = _Time.y * _Flu_Speed_U + u_xlat1.x;
    u_xlat1.xy = u_xlat4.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_1.xy = texture(_Flu_Tex, u_xlat1.xy).xy;
    u_xlat16_3.xy = u_xlat16_5.yy * u_xlat16_1.xy;
    u_xlat1.xyz = u_xlat16_3.xxx * _Flu_Color.xyz;
    u_xlat5.x = max(u_xlat16_3.y, 0.00999999978);
    u_xlat5.x = u_xlat5.x + (-_DissolveStep);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = _BackColor.xyz * vec3(_BackPower);
    u_xlat1.xyz = u_xlat16_7.xyz * vec3(u_xlat16_2) + u_xlat1.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_4.xyz = texture(_Emissive, u_xlat4.xy).xyz;
    u_xlat1.xyz = u_xlat16_4.xyz * vec3(_EmissivePower) + u_xlat1.xyz;
    u_xlat16_2 = u_xlat16_4.x + _MainColor.w;
    u_xlat3.xyz = (-u_xlat1.xyz);
    u_xlat16_7.x = u_xlat16_5.z + _Mask_B_Alpha;
    u_xlat16_7.x = u_xlat16_5.z * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_1.w * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * vs_COLOR0.w;
    u_xlat16_7.x = u_xlat16_7.x * _Alpha;
    u_xlat3.w = (-u_xlat16_7.x);
    u_xlat3 = _DissolveColor * vec4(_DissolveColorPW) + u_xlat3;
    u_xlat16_12.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_12.x = u_xlat16_12.y * u_xlat16_12.x;
    u_xlat5.x = u_xlat5.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.800000012>=u_xlat5.x);
#else
    u_xlatb10 = 0.800000012>=u_xlat5.x;
#endif
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat10 = u_xlat10 * _IS_CUSTOM;
    u_xlat15 = u_xlat10 * u_xlat3.w + u_xlat16_7.x;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat3.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat10 = u_xlat5.x * u_xlat15;
    u_xlat16_2 = u_xlat16_2 * u_xlat10;
    u_xlat16_7.x = u_xlat15 * u_xlat5.x + (-u_xlat16_2);
    SV_Target0.w = u_xlat0.x * u_xlat16_7.x + u_xlat16_2;
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
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _Flu_UV;
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
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
mediump vec3 u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xy = texture(_Normal, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_2 = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat16_7.xyz = u_xlat0.xxx * _FresnelColor.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_5.xyz = texture(_Mask, u_xlat5.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xxx * u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_Flu_UV==1.0);
#else
    u_xlatb5 = _Flu_UV==1.0;
#endif
    u_xlat1.xy = (bool(u_xlatb5)) ? u_xlat1.xy : vs_TEXCOORD1.xy;
    u_xlat5.x = _Time.y * _Flu_Speed_V;
    u_xlat4.y = u_xlat1.y * _Flu_LineSpace + u_xlat5.x;
    u_xlat4.x = _Time.y * _Flu_Speed_U + u_xlat1.x;
    u_xlat1.xy = u_xlat4.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_1.xy = texture(_Flu_Tex, u_xlat1.xy).xy;
    u_xlat16_3.xy = u_xlat16_5.yy * u_xlat16_1.xy;
    u_xlat1.xyz = u_xlat16_3.xxx * _Flu_Color.xyz;
    u_xlat5.x = max(u_xlat16_3.y, 0.00999999978);
    u_xlat5.x = u_xlat5.x + (-_DissolveStep);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = _BackColor.xyz * vec3(_BackPower);
    u_xlat1.xyz = u_xlat16_7.xyz * vec3(u_xlat16_2) + u_xlat1.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_4.xyz = texture(_Emissive, u_xlat4.xy).xyz;
    u_xlat1.xyz = u_xlat16_4.xyz * vec3(_EmissivePower) + u_xlat1.xyz;
    u_xlat16_2 = u_xlat16_4.x + _MainColor.w;
    u_xlat3.xyz = (-u_xlat1.xyz);
    u_xlat16_7.x = u_xlat16_5.z + _Mask_B_Alpha;
    u_xlat16_7.x = u_xlat16_5.z * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_1.w * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * vs_COLOR0.w;
    u_xlat16_7.x = u_xlat16_7.x * _Alpha;
    u_xlat3.w = (-u_xlat16_7.x);
    u_xlat3 = _DissolveColor * vec4(_DissolveColorPW) + u_xlat3;
    u_xlat16_12.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_12.x = u_xlat16_12.y * u_xlat16_12.x;
    u_xlat5.x = u_xlat5.x / u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(0.800000012>=u_xlat5.x);
#else
    u_xlatb10 = 0.800000012>=u_xlat5.x;
#endif
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat10 = u_xlat10 * _IS_CUSTOM;
    u_xlat15 = u_xlat10 * u_xlat3.w + u_xlat16_7.x;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat3.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat10 = u_xlat5.x * u_xlat15;
    u_xlat16_2 = u_xlat16_2 * u_xlat10;
    u_xlat16_7.x = u_xlat15 * u_xlat5.x + (-u_xlat16_2);
    SV_Target0.w = u_xlat0.x * u_xlat16_7.x + u_xlat16_2;
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
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _Flu_UV;
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
vec3 u_xlat0;
lowp vec2 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
mediump vec3 u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_0.xy = texture2D(_Normal, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_2 = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat16_7.xyz = u_xlat0.xxx * _FresnelColor.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_5.xyz = texture2D(_Mask, u_xlat5.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_5.xxx * u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlatb5 = _Flu_UV==1.0;
    u_xlat1.xy = (bool(u_xlatb5)) ? u_xlat1.xy : vs_TEXCOORD1.xy;
    u_xlat5.x = _Time.y * _Flu_Speed_V;
    u_xlat4.y = u_xlat1.y * _Flu_LineSpace + u_xlat5.x;
    u_xlat4.x = _Time.y * _Flu_Speed_U + u_xlat1.x;
    u_xlat1.xy = u_xlat4.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_Flu_Tex, u_xlat1.xy).xy;
    u_xlat16_3.xy = u_xlat10_5.yy * u_xlat10_1.xy;
    u_xlat1.xyz = u_xlat16_3.xxx * _Flu_Color.xyz;
    u_xlat5.x = max(u_xlat16_3.y, 0.00999999978);
    u_xlat5.x = u_xlat5.x + (-_DissolveStep);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = _BackColor.xyz * vec3(_BackPower);
    u_xlat1.xyz = u_xlat16_7.xyz * vec3(u_xlat16_2) + u_xlat1.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_4.xyz = texture2D(_Emissive, u_xlat4.xy).xyz;
    u_xlat1.xyz = u_xlat10_4.xyz * vec3(_EmissivePower) + u_xlat1.xyz;
    u_xlat16_2 = u_xlat10_4.x + _MainColor.w;
    u_xlat3.xyz = (-u_xlat1.xyz);
    u_xlat16_7.x = u_xlat10_5.z + _Mask_B_Alpha;
    u_xlat16_7.x = u_xlat10_5.z * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat10_1.w * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * vs_COLOR0.w;
    u_xlat16_7.x = u_xlat16_7.x * _Alpha;
    u_xlat3.w = (-u_xlat16_7.x);
    u_xlat3 = _DissolveColor * vec4(_DissolveColorPW) + u_xlat3;
    u_xlat16_12.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_12.x = u_xlat16_12.y * u_xlat16_12.x;
    u_xlat5.x = u_xlat5.x / u_xlat16_12.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlatb10 = 0.800000012>=u_xlat5.x;
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat10 = u_xlat10 * _IS_CUSTOM;
    u_xlat15 = u_xlat10 * u_xlat3.w + u_xlat16_7.x;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat3.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat10 = u_xlat5.x * u_xlat15;
    u_xlat16_2 = u_xlat16_2 * u_xlat10;
    u_xlat16_7.x = u_xlat15 * u_xlat5.x + (-u_xlat16_2);
    SV_Target0.w = u_xlat0.x * u_xlat16_7.x + u_xlat16_2;
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
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _Flu_UV;
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
vec3 u_xlat0;
lowp vec2 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
mediump float u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
lowp vec3 u_xlat10_4;
vec2 u_xlat5;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
mediump vec3 u_xlat16_7;
float u_xlat10;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
float u_xlat15;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_0.xy = texture2D(_Normal, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_2 = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat16_7.xyz = u_xlat0.xxx * _FresnelColor.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_5.xyz = texture2D(_Mask, u_xlat5.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_5.xxx * u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat16_3.xyz = u_xlat10_1.xyz * vs_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _MainColor.xyz;
    u_xlat16_7.xyz = u_xlat16_3.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_7.xyz;
    u_xlat1.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlatb5 = _Flu_UV==1.0;
    u_xlat1.xy = (bool(u_xlatb5)) ? u_xlat1.xy : vs_TEXCOORD1.xy;
    u_xlat5.x = _Time.y * _Flu_Speed_V;
    u_xlat4.y = u_xlat1.y * _Flu_LineSpace + u_xlat5.x;
    u_xlat4.x = _Time.y * _Flu_Speed_U + u_xlat1.x;
    u_xlat1.xy = u_xlat4.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_1.xy = texture2D(_Flu_Tex, u_xlat1.xy).xy;
    u_xlat16_3.xy = u_xlat10_5.yy * u_xlat10_1.xy;
    u_xlat1.xyz = u_xlat16_3.xxx * _Flu_Color.xyz;
    u_xlat5.x = max(u_xlat16_3.y, 0.00999999978);
    u_xlat5.x = u_xlat5.x + (-_DissolveStep);
    u_xlat1.xyz = u_xlat1.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_7.xyz;
    u_xlat16_7.xyz = _BackColor.xyz * vec3(_BackPower);
    u_xlat1.xyz = u_xlat16_7.xyz * vec3(u_xlat16_2) + u_xlat1.xyz;
    u_xlat4.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_4.xyz = texture2D(_Emissive, u_xlat4.xy).xyz;
    u_xlat1.xyz = u_xlat10_4.xyz * vec3(_EmissivePower) + u_xlat1.xyz;
    u_xlat16_2 = u_xlat10_4.x + _MainColor.w;
    u_xlat3.xyz = (-u_xlat1.xyz);
    u_xlat16_7.x = u_xlat10_5.z + _Mask_B_Alpha;
    u_xlat16_7.x = u_xlat10_5.z * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat10_1.w * u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * vs_COLOR0.w;
    u_xlat16_7.x = u_xlat16_7.x * _Alpha;
    u_xlat3.w = (-u_xlat16_7.x);
    u_xlat3 = _DissolveColor * vec4(_DissolveColorPW) + u_xlat3;
    u_xlat16_12.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_12.x = u_xlat16_12.y * u_xlat16_12.x;
    u_xlat5.x = u_xlat5.x / u_xlat16_12.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlatb10 = 0.800000012>=u_xlat5.x;
    u_xlat10 = u_xlatb10 ? 1.0 : float(0.0);
    u_xlat10 = u_xlat10 * _IS_CUSTOM;
    u_xlat15 = u_xlat10 * u_xlat3.w + u_xlat16_7.x;
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat3.xyz + u_xlat1.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
    u_xlat10 = u_xlat5.x * u_xlat15;
    u_xlat16_2 = u_xlat16_2 * u_xlat10;
    u_xlat16_7.x = u_xlat15 * u_xlat5.x + (-u_xlat16_2);
    SV_Target0.w = u_xlat0.x * u_xlat16_7.x + u_xlat16_2;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _Flu_UV;
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
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
float u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xy = texture(_Normal, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_2 = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat16_8.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_6.xyz = texture(_Mask, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_6.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyw = u_xlat16_6.xyz * u_xlat1.xyz;
    u_xlat16_3 = u_xlat16_6.z * u_xlat1.z + _Mask_B_Alpha;
    u_xlat16_3 = u_xlat1.w * u_xlat16_3;
    u_xlat16_8.xyz = u_xlat1.xxx * u_xlat16_8.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_4.xyz;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_4.w;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0.w;
    u_xlat16_3 = u_xlat16_3 * _Alpha;
    u_xlat16_9.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_9.xyz = u_xlat6.xyz * u_xlat16_9.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_8.xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Flu_UV==1.0);
#else
    u_xlatb18 = _Flu_UV==1.0;
#endif
    u_xlat6.xy = (bool(u_xlatb18)) ? u_xlat6.xy : vs_TEXCOORD1.xy;
    u_xlat18 = _Time.y * _Flu_Speed_V;
    u_xlat4.y = u_xlat6.y * _Flu_LineSpace + u_xlat18;
    u_xlat4.x = _Time.y * _Flu_Speed_U + u_xlat6.x;
    u_xlat6.xy = u_xlat4.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_6.xy = texture(_Flu_Tex, u_xlat6.xy).xy;
    u_xlat1.xz = u_xlat16_6.xy * vec2(0.305306017, 0.305306017) + vec2(0.682171106, 0.682171106);
    u_xlat1.xz = u_xlat16_6.xy * u_xlat1.xz + vec2(0.0125228781, 0.0125228781);
    u_xlat6.xy = u_xlat16_6.xy * u_xlat1.xz;
    u_xlat16_9.xy = u_xlat1.yy * u_xlat6.xy;
    u_xlat16_5.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat6.xyz = u_xlat16_9.xxx * u_xlat16_5.xyz;
    u_xlat1.x = max(u_xlat16_9.y, 0.00999999978);
    u_xlat1.x = u_xlat1.x + (-_DissolveStep);
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_BackPower);
    u_xlat6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_2) + u_xlat6.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_7.xyz = texture(_Emissive, u_xlat7.xy).xyz;
    u_xlat4.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_7.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat16_7.xyz * u_xlat4.xyz;
    u_xlat16_2 = u_xlat16_7.x * u_xlat4.x + _MainColor.w;
    u_xlat6.xyz = u_xlat10.xyz * vec3(_EmissivePower) + u_xlat6.xyz;
    u_xlat4.xyz = (-u_xlat6.xyz);
    u_xlat16_8.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(_DissolveColorPW);
    u_xlat16_5.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat4.w = (-u_xlat16_3);
    u_xlat4 = u_xlat4 + u_xlat16_5;
    u_xlat16_8.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_8.x = u_xlat16_8.y * u_xlat16_8.x;
    u_xlat1.x = u_xlat1.x / u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.800000012>=u_xlat1.x);
#else
    u_xlatb7 = 0.800000012>=u_xlat1.x;
#endif
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat7.x * _IS_CUSTOM;
    u_xlat13 = u_xlat7.x * u_xlat4.w + u_xlat16_3;
    u_xlat6.xyz = u_xlat7.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat16_8.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat16_8.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat6.x = u_xlat1.x * u_xlat13;
    u_xlat16_2 = u_xlat16_2 * u_xlat6.x;
    u_xlat16_8.x = u_xlat13 * u_xlat1.x + (-u_xlat16_2);
    SV_Target0.w = u_xlat0.x * u_xlat16_8.x + u_xlat16_2;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
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
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _Flu_UV;
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
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump vec3 u_xlat16_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
float u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat16_0.xy = texture(_Normal, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_2 = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat16_8.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_6.xyz = texture(_Mask, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_6.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyw = u_xlat16_6.xyz * u_xlat1.xyz;
    u_xlat16_3 = u_xlat16_6.z * u_xlat1.z + _Mask_B_Alpha;
    u_xlat16_3 = u_xlat1.w * u_xlat16_3;
    u_xlat16_8.xyz = u_xlat1.xxx * u_xlat16_8.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_4 = texture(_MainTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat16_4.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat16_4.xyz;
    u_xlat16_3 = u_xlat16_3 * u_xlat16_4.w;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0.w;
    u_xlat16_3 = u_xlat16_3 * _Alpha;
    u_xlat16_9.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_9.xyz = u_xlat6.xyz * u_xlat16_9.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_8.xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_Flu_UV==1.0);
#else
    u_xlatb18 = _Flu_UV==1.0;
#endif
    u_xlat6.xy = (bool(u_xlatb18)) ? u_xlat6.xy : vs_TEXCOORD1.xy;
    u_xlat18 = _Time.y * _Flu_Speed_V;
    u_xlat4.y = u_xlat6.y * _Flu_LineSpace + u_xlat18;
    u_xlat4.x = _Time.y * _Flu_Speed_U + u_xlat6.x;
    u_xlat6.xy = u_xlat4.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat16_6.xy = texture(_Flu_Tex, u_xlat6.xy).xy;
    u_xlat1.xz = u_xlat16_6.xy * vec2(0.305306017, 0.305306017) + vec2(0.682171106, 0.682171106);
    u_xlat1.xz = u_xlat16_6.xy * u_xlat1.xz + vec2(0.0125228781, 0.0125228781);
    u_xlat6.xy = u_xlat16_6.xy * u_xlat1.xz;
    u_xlat16_9.xy = u_xlat1.yy * u_xlat6.xy;
    u_xlat16_5.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat6.xyz = u_xlat16_9.xxx * u_xlat16_5.xyz;
    u_xlat1.x = max(u_xlat16_9.y, 0.00999999978);
    u_xlat1.x = u_xlat1.x + (-_DissolveStep);
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_BackPower);
    u_xlat6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_2) + u_xlat6.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat16_7.xyz = texture(_Emissive, u_xlat7.xy).xyz;
    u_xlat4.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat16_7.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat16_7.xyz * u_xlat4.xyz;
    u_xlat16_2 = u_xlat16_7.x * u_xlat4.x + _MainColor.w;
    u_xlat6.xyz = u_xlat10.xyz * vec3(_EmissivePower) + u_xlat6.xyz;
    u_xlat4.xyz = (-u_xlat6.xyz);
    u_xlat16_8.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(_DissolveColorPW);
    u_xlat16_5.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat4.w = (-u_xlat16_3);
    u_xlat4 = u_xlat4 + u_xlat16_5;
    u_xlat16_8.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_8.x = u_xlat16_8.y * u_xlat16_8.x;
    u_xlat1.x = u_xlat1.x / u_xlat16_8.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.800000012>=u_xlat1.x);
#else
    u_xlatb7 = 0.800000012>=u_xlat1.x;
#endif
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat7.x * _IS_CUSTOM;
    u_xlat13 = u_xlat7.x * u_xlat4.w + u_xlat16_3;
    u_xlat6.xyz = u_xlat7.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat16_8.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat16_8.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat6.x = u_xlat1.x * u_xlat13;
    u_xlat16_2 = u_xlat16_2 * u_xlat6.x;
    u_xlat16_8.x = u_xlat13 * u_xlat1.x + (-u_xlat16_2);
    SV_Target0.w = u_xlat0.x * u_xlat16_8.x + u_xlat16_2;
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
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _Flu_UV;
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
vec3 u_xlat0;
lowp vec2 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec2 u_xlat7;
lowp vec3 u_xlat10_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
float u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_0.xy = texture2D(_Normal, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_2 = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat16_8.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_6.xyz = texture2D(_Mask, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_6.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyw = u_xlat10_6.xyz * u_xlat1.xyz;
    u_xlat16_3 = u_xlat10_6.z * u_xlat1.z + _Mask_B_Alpha;
    u_xlat16_3 = u_xlat1.w * u_xlat16_3;
    u_xlat16_8.xyz = u_xlat1.xxx * u_xlat16_8.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_4 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat10_4.xyz;
    u_xlat16_3 = u_xlat16_3 * u_xlat10_4.w;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0.w;
    u_xlat16_3 = u_xlat16_3 * _Alpha;
    u_xlat16_9.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_9.xyz = u_xlat6.xyz * u_xlat16_9.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_8.xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlatb18 = _Flu_UV==1.0;
    u_xlat6.xy = (bool(u_xlatb18)) ? u_xlat6.xy : vs_TEXCOORD1.xy;
    u_xlat18 = _Time.y * _Flu_Speed_V;
    u_xlat4.y = u_xlat6.y * _Flu_LineSpace + u_xlat18;
    u_xlat4.x = _Time.y * _Flu_Speed_U + u_xlat6.x;
    u_xlat6.xy = u_xlat4.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_6.xy = texture2D(_Flu_Tex, u_xlat6.xy).xy;
    u_xlat1.xz = u_xlat10_6.xy * vec2(0.305306017, 0.305306017) + vec2(0.682171106, 0.682171106);
    u_xlat1.xz = u_xlat10_6.xy * u_xlat1.xz + vec2(0.0125228781, 0.0125228781);
    u_xlat6.xy = u_xlat10_6.xy * u_xlat1.xz;
    u_xlat16_9.xy = u_xlat1.yy * u_xlat6.xy;
    u_xlat16_5.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat6.xyz = u_xlat16_9.xxx * u_xlat16_5.xyz;
    u_xlat1.x = max(u_xlat16_9.y, 0.00999999978);
    u_xlat1.x = u_xlat1.x + (-_DissolveStep);
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_BackPower);
    u_xlat6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_2) + u_xlat6.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_7.xyz = texture2D(_Emissive, u_xlat7.xy).xyz;
    u_xlat4.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_7.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10_7.xyz * u_xlat4.xyz;
    u_xlat16_2 = u_xlat10_7.x * u_xlat4.x + _MainColor.w;
    u_xlat6.xyz = u_xlat10.xyz * vec3(_EmissivePower) + u_xlat6.xyz;
    u_xlat4.xyz = (-u_xlat6.xyz);
    u_xlat16_8.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(_DissolveColorPW);
    u_xlat16_5.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat4.w = (-u_xlat16_3);
    u_xlat4 = u_xlat4 + u_xlat16_5;
    u_xlat16_8.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_8.x = u_xlat16_8.y * u_xlat16_8.x;
    u_xlat1.x = u_xlat1.x / u_xlat16_8.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlatb7 = 0.800000012>=u_xlat1.x;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat7.x * _IS_CUSTOM;
    u_xlat13 = u_xlat7.x * u_xlat4.w + u_xlat16_3;
    u_xlat6.xyz = u_xlat7.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat16_8.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat16_8.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat6.x = u_xlat1.x * u_xlat13;
    u_xlat16_2 = u_xlat16_2 * u_xlat6.x;
    u_xlat16_8.x = u_xlat13 * u_xlat1.x + (-u_xlat16_2);
    SV_Target0.w = u_xlat0.x * u_xlat16_8.x + u_xlat16_2;
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
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD5 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	float _Flu_UV;
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
vec3 u_xlat0;
lowp vec2 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
vec4 u_xlat4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
vec3 u_xlat6;
lowp vec3 u_xlat10_6;
vec2 u_xlat7;
lowp vec3 u_xlat10_7;
bool u_xlatb7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
float u_xlat13;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_ST.xy + _Normal_ST.zw;
    u_xlat10_0.xy = texture2D(_Normal, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD5.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.00100000005);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelScale;
    u_xlat16_2 = (-u_xlat0.x) * _FresnelColor.w + 1.0;
    u_xlat0.x = u_xlat0.x * _FresnelColor.w;
    u_xlat16_8.xyz = _FresnelColor.xyz * _FresnelColor.xyz;
    u_xlat16_8.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat6.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_6.xyz = texture2D(_Mask, u_xlat6.xy).xyz;
    u_xlat1.xyz = u_xlat10_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_6.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyw = u_xlat10_6.xyz * u_xlat1.xyz;
    u_xlat16_3 = u_xlat10_6.z * u_xlat1.z + _Mask_B_Alpha;
    u_xlat16_3 = u_xlat1.w * u_xlat16_3;
    u_xlat16_8.xyz = u_xlat1.xxx * u_xlat16_8.xyz;
    u_xlat6.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_4 = texture2D(_MainTex, u_xlat6.xy);
    u_xlat6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat6.xyz = u_xlat10_4.xyz * u_xlat6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat10_4.xyz;
    u_xlat16_3 = u_xlat16_3 * u_xlat10_4.w;
    u_xlat16_3 = u_xlat16_3 * vs_COLOR0.w;
    u_xlat16_3 = u_xlat16_3 * _Alpha;
    u_xlat16_9.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_9.xyz = u_xlat6.xyz * u_xlat16_9.xyz;
    u_xlat16_5.xyz = _MainColor.xyz * _MainColor.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_5.xyz;
    u_xlat16_8.xyz = u_xlat16_9.xyz * vec3(vec3(_MainColorPower, _MainColorPower, _MainColorPower)) + u_xlat16_8.xyz;
    u_xlat6.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlatb18 = _Flu_UV==1.0;
    u_xlat6.xy = (bool(u_xlatb18)) ? u_xlat6.xy : vs_TEXCOORD1.xy;
    u_xlat18 = _Time.y * _Flu_Speed_V;
    u_xlat4.y = u_xlat6.y * _Flu_LineSpace + u_xlat18;
    u_xlat4.x = _Time.y * _Flu_Speed_U + u_xlat6.x;
    u_xlat6.xy = u_xlat4.xy * _Flu_Tex_ST.xy + _Flu_Tex_ST.zw;
    u_xlat10_6.xy = texture2D(_Flu_Tex, u_xlat6.xy).xy;
    u_xlat1.xz = u_xlat10_6.xy * vec2(0.305306017, 0.305306017) + vec2(0.682171106, 0.682171106);
    u_xlat1.xz = u_xlat10_6.xy * u_xlat1.xz + vec2(0.0125228781, 0.0125228781);
    u_xlat6.xy = u_xlat10_6.xy * u_xlat1.xz;
    u_xlat16_9.xy = u_xlat1.yy * u_xlat6.xy;
    u_xlat16_5.xyz = _Flu_Color.xyz * _Flu_Color.xyz;
    u_xlat6.xyz = u_xlat16_9.xxx * u_xlat16_5.xyz;
    u_xlat1.x = max(u_xlat16_9.y, 0.00999999978);
    u_xlat1.x = u_xlat1.x + (-_DissolveStep);
    u_xlat6.xyz = u_xlat6.xyz * vec3(vec3(_Flu_Power, _Flu_Power, _Flu_Power)) + u_xlat16_8.xyz;
    u_xlat16_8.xyz = _BackColor.xyz * _BackColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(_BackPower);
    u_xlat6.xyz = u_xlat16_8.xyz * vec3(u_xlat16_2) + u_xlat6.xyz;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Emissive_ST.xy + _Emissive_ST.zw;
    u_xlat10_7.xyz = texture2D(_Emissive, u_xlat7.xy).xyz;
    u_xlat4.xyz = u_xlat10_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat4.xyz = u_xlat10_7.xyz * u_xlat4.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat10.xyz = u_xlat10_7.xyz * u_xlat4.xyz;
    u_xlat16_2 = u_xlat10_7.x * u_xlat4.x + _MainColor.w;
    u_xlat6.xyz = u_xlat10.xyz * vec3(_EmissivePower) + u_xlat6.xyz;
    u_xlat4.xyz = (-u_xlat6.xyz);
    u_xlat16_8.xyz = _DissolveColor.xyz * _DissolveColor.xyz;
    u_xlat16_5.xyz = u_xlat16_8.xyz * vec3(_DissolveColorPW);
    u_xlat16_5.w = _DissolveColor.w * _DissolveColorPW;
    u_xlat4.w = (-u_xlat16_3);
    u_xlat4 = u_xlat4 + u_xlat16_5;
    u_xlat16_8.xy = max(vec2(_SoftSize, _DissolveStep), vec2(0.00999999978, 0.00999999978));
    u_xlat16_8.x = u_xlat16_8.y * u_xlat16_8.x;
    u_xlat1.x = u_xlat1.x / u_xlat16_8.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlatb7 = 0.800000012>=u_xlat1.x;
    u_xlat7.x = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat7.x = u_xlat7.x * _IS_CUSTOM;
    u_xlat13 = u_xlat7.x * u_xlat4.w + u_xlat16_3;
    u_xlat6.xyz = u_xlat7.xxx * u_xlat4.xyz + u_xlat6.xyz;
    u_xlat16_8.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat16_8.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat6.xyz;
    u_xlat6.x = u_xlat1.x * u_xlat13;
    u_xlat16_2 = u_xlat16_2 * u_xlat6.x;
    u_xlat16_8.x = u_xlat13 * u_xlat1.x + (-u_xlat16_2);
    SV_Target0.w = u_xlat0.x * u_xlat16_8.x + u_xlat16_2;
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
CustomEditor "HeroShowRenderingGUI.VFX.ASEffectShaderGUI"
}