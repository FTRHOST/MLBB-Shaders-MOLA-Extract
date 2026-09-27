//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "NPR/Hero_Npr_Hair" {
Properties {

[Header(BaseTexture)] [Space(10)] _MainTex ("Albedo", 2D) = "white" { }

_LightMapTex ("R:固定高光范围,G:外描边宽度,B:发束形体细节", 2D) = "white" { }

_RampTex ("RampTex", 2D) = "white" { }

_RampRowsCount ("Ramp行数,需要设置正确", Range(3, 16)) = 5.0

_RampDifLerpValue ("Ramp纹理叠加主纹理强弱", Range(0, 1)) = 0.10000000149011612

[Header(Gradation)] [Space(10)] _ShadowThreshold ("阴影偏移阈值,默认是0一般不用动", Range(-1, 1)) = 0.0

_ShadowFeather ("阴影边缘的平滑", Range(0.01, 2.99)) = 0.009999999776482582

_LightAreaColor ("受光面灯光颜色", Color) = (1,1,1,1)

_DarkColor ("背光面灯光颜色", Color) = (0.5,0.5,0.5,1)

[Header(Hair Specular)] [Space(10)] _SpeColor ("高光颜色", Color) = (1,1,1,1)

_SpePow ("高光范围", Range(0, 32)) = 1.0

_HairSelfShadowLerp ("头发动态自阴影强弱(LightMap纹理g通道)", Range(0, 1)) = 0.0

_HairSelfShadowPow ("头发动态自阴影范围", Range(0, 24)) = 3.0

[Header(Rim)] [Space(10)] _RimWidth ("边缘光粗细", Float) = 1.0

_RimCol ("边缘光颜色", Color) = (1,1,1,1)

_depthSubThreshold ("DepthSubThreshold", Float) = 0.5

_ColorScaleByLightDir ("边缘光颜色受灯光亮暗强弱影响", Range(0.001, 5)) = 1.0

_WidthEffectByLightDir ("边缘光粗细受灯光亮暗强弱影响", Range(0, 1)) = 0.0

[Header(InsideLine)] _InSideLine ("InSideOnline", 2D) = "white" { }

_InSideLine_Width ("InSideOnline_Width", Float) = 0.10000000149011612

[Header(Outline)] [Space(10)] _Outline_Width ("Outline_Width", Float) = 0.019999999552965164

_Outline_Color ("Outline_Color", Color) = (0.5,0.5,0.5,1)

_Outline_Offset_X ("Outline_Offset_X", Float) = 0.0

_Outline_Offset_Y ("Outline_Offset_Y", Float) = 0.0

[Header(LiuGuang___________________________________________________________________________________________________________________________)] [Space(20)] [Toggle(_LG_ON)] _LG_ON ("流光开关(UV3)", Float) = 0.0

[Toggle] _useUv3 ("使用UV3作为流光UV,关闭则为UV1", Float) = 1.0

_LG_Tex ("流光纹理", 2D) = "black" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Intensity ("流光强度", Float) = 1.0

_U_LG ("U向流动速度", Float) = 0.0

_V_LG ("V向流动速度", Float) = 0.0

}
SubShader {
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" }
  GpuProgramID 64512
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
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump float _InSideLine_Width;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _SpePow;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(4) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump float u_xlat16_10;
mediump float u_xlat16_14;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat16;
mediump vec2 u_xlat16_17;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.x = 1.5 / _RampRowsCount;
    u_xlat16_0.y = (-u_xlat16_0.x) + 1.0;
    u_xlat16_14 = _ShadowThreshold + 0.5;
    u_xlat16_21 = u_xlat16_14 + _ShadowFeather;
    u_xlat16_14 = u_xlat16_14 + (-_ShadowFeather);
    u_xlat16_21 = (-u_xlat16_14) + u_xlat16_21;
    u_xlat16_21 = float(1.0) / u_xlat16_21;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat22 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * _WorldSpaceLightPos0.xyz;
    u_xlat16_3.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_10 = log2(u_xlat16_4.w);
    u_xlat16_10 = u_xlat16_10 * _HairSelfShadowPow;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_10 = (-u_xlat16_3.x) + u_xlat16_10;
    u_xlat16_3.x = _HairSelfShadowLerp * u_xlat16_10 + u_xlat16_3.x;
    u_xlat16_14 = (-u_xlat16_14) + u_xlat16_3.x;
    u_xlat16_14 = u_xlat16_21 * u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_14 * -2.0 + 3.0;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_21;
    u_xlat16_14 = min(u_xlat16_14, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0350000001<u_xlat16_4.w);
#else
    u_xlatb22 = 0.0350000001<u_xlat16_4.w;
#endif
    u_xlat16_0.x = (u_xlatb22) ? u_xlat16_14 : 0.0;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat16_0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = vec3(_InSideLine_Width) * u_xlat16_6.xyz + u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + (-u_xlat16_3.xyz);
    u_xlat16_7.xyz = vec3(_RampDifLerpValue) * u_xlat16_7.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * _LightAreaColor.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz * _DarkColor.xyz;
    u_xlat16_3.w = u_xlat16_4.w * _LightAreaColor.w;
    u_xlat16_5.w = u_xlat16_4.w * _DarkColor.w;
    u_xlat16_3 = u_xlat16_3 + (-u_xlat16_5);
    u_xlat16_0 = u_xlat16_0.xxxx * u_xlat16_3 + u_xlat16_5;
    u_xlat4.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat22) + u_xlat2.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat16_3.x = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat16_3.x = log2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * _SpePow;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z);
    u_xlat16_22 = texture(_LightMapTex, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_22) + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat9.xz = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat9.xz;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat2.xy;
    u_xlat8.xz = u_xlat1.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat1.xx + u_xlat8.xz;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat1.zz + u_xlat1.xy;
    u_xlat16_3.xy = (-u_xlat1.xy) + u_xlat2.xy;
    u_xlat16_3.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_3.xy + u_xlat1.xy;
    u_xlat16_21 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xy = vec2(u_xlat16_21) * u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(_RimWidth);
    u_xlat15.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat16 = float(1.0) / vs_TEXCOORD7.w;
    u_xlat15.xy = u_xlat16_3.xy * vec2(u_xlat16) + u_xlat15.xy;
    u_xlat15.x = texture(_CameraDepthTexture, u_xlat15.xy).x;
    u_xlat15.x = _ZBufferParams.z * u_xlat15.x + _ZBufferParams.w;
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15.x>=_depthSubThreshold);
#else
    u_xlatb15 = u_xlat15.x>=_depthSubThreshold;
#endif
    u_xlat15.x = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat4.xyz = u_xlat15.xxx * _RimCol.xyz;
    u_xlat16_21 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xy = vec2(u_xlat16_21) * u_xlat1.xy;
    u_xlat16_21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_17.xy = vec2(u_xlat16_21) * u_xlat2.xy;
    u_xlat16_21 = dot(u_xlat16_3.xy, u_xlat16_17.xy);
    u_xlat16_21 = u_xlat16_21 * 0.5 + 0.5;
    u_xlat16_21 = log2(u_xlat16_21);
    u_xlat16_21 = u_xlat16_21 * _ColorScaleByLightDir;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_21 = min(u_xlat16_21, 1.0);
    u_xlat16_0.xyz = u_xlat4.xyz * vec3(u_xlat16_21) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
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
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump float _InSideLine_Width;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _SpePow;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(4) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump float u_xlat16_10;
mediump float u_xlat16_14;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat16;
mediump vec2 u_xlat16_17;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.x = 1.5 / _RampRowsCount;
    u_xlat16_0.y = (-u_xlat16_0.x) + 1.0;
    u_xlat16_14 = _ShadowThreshold + 0.5;
    u_xlat16_21 = u_xlat16_14 + _ShadowFeather;
    u_xlat16_14 = u_xlat16_14 + (-_ShadowFeather);
    u_xlat16_21 = (-u_xlat16_14) + u_xlat16_21;
    u_xlat16_21 = float(1.0) / u_xlat16_21;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat22 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * _WorldSpaceLightPos0.xyz;
    u_xlat16_3.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat16_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_10 = log2(u_xlat16_4.w);
    u_xlat16_10 = u_xlat16_10 * _HairSelfShadowPow;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_10 = (-u_xlat16_3.x) + u_xlat16_10;
    u_xlat16_3.x = _HairSelfShadowLerp * u_xlat16_10 + u_xlat16_3.x;
    u_xlat16_14 = (-u_xlat16_14) + u_xlat16_3.x;
    u_xlat16_14 = u_xlat16_21 * u_xlat16_14;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14 = min(max(u_xlat16_14, 0.0), 1.0);
#else
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_14 * -2.0 + 3.0;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_21;
    u_xlat16_14 = min(u_xlat16_14, 1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0350000001<u_xlat16_4.w);
#else
    u_xlatb22 = 0.0350000001<u_xlat16_4.w;
#endif
    u_xlat16_0.x = (u_xlatb22) ? u_xlat16_14 : 0.0;
    u_xlat16_5.xyz = texture(_RampTex, u_xlat16_0.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_5.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_4.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = vec3(_InSideLine_Width) * u_xlat16_6.xyz + u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + (-u_xlat16_3.xyz);
    u_xlat16_7.xyz = vec3(_RampDifLerpValue) * u_xlat16_7.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * _LightAreaColor.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz * _DarkColor.xyz;
    u_xlat16_3.w = u_xlat16_4.w * _LightAreaColor.w;
    u_xlat16_5.w = u_xlat16_4.w * _DarkColor.w;
    u_xlat16_3 = u_xlat16_3 + (-u_xlat16_5);
    u_xlat16_0 = u_xlat16_0.xxxx * u_xlat16_3 + u_xlat16_5;
    u_xlat4.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat22) + u_xlat2.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat16_3.x = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat16_3.x = log2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * _SpePow;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z);
    u_xlat16_22 = texture(_LightMapTex, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_22) + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat9.xz = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat9.xz;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat2.xy;
    u_xlat8.xz = u_xlat1.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat1.xx + u_xlat8.xz;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat1.zz + u_xlat1.xy;
    u_xlat16_3.xy = (-u_xlat1.xy) + u_xlat2.xy;
    u_xlat16_3.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_3.xy + u_xlat1.xy;
    u_xlat16_21 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xy = vec2(u_xlat16_21) * u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(_RimWidth);
    u_xlat15.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat16 = float(1.0) / vs_TEXCOORD7.w;
    u_xlat15.xy = u_xlat16_3.xy * vec2(u_xlat16) + u_xlat15.xy;
    u_xlat15.x = texture(_CameraDepthTexture, u_xlat15.xy).x;
    u_xlat15.x = _ZBufferParams.z * u_xlat15.x + _ZBufferParams.w;
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat15.x>=_depthSubThreshold);
#else
    u_xlatb15 = u_xlat15.x>=_depthSubThreshold;
#endif
    u_xlat15.x = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat4.xyz = u_xlat15.xxx * _RimCol.xyz;
    u_xlat16_21 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xy = vec2(u_xlat16_21) * u_xlat1.xy;
    u_xlat16_21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_17.xy = vec2(u_xlat16_21) * u_xlat2.xy;
    u_xlat16_21 = dot(u_xlat16_3.xy, u_xlat16_17.xy);
    u_xlat16_21 = u_xlat16_21 * 0.5 + 0.5;
    u_xlat16_21 = log2(u_xlat16_21);
    u_xlat16_21 = u_xlat16_21 * _ColorScaleByLightDir;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_21 = min(u_xlat16_21, 1.0);
    u_xlat16_0.xyz = u_xlat4.xyz * vec3(u_xlat16_21) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
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
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump float _InSideLine_Width;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _SpePow;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _RampTex;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump float u_xlat16_10;
mediump float u_xlat16_14;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat16;
mediump vec2 u_xlat16_17;
mediump float u_xlat16_21;
float u_xlat22;
lowp float u_xlat10_22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.x = 1.5 / _RampRowsCount;
    u_xlat16_0.y = (-u_xlat16_0.x) + 1.0;
    u_xlat16_14 = _ShadowThreshold + 0.5;
    u_xlat16_21 = u_xlat16_14 + _ShadowFeather;
    u_xlat16_14 = u_xlat16_14 + (-_ShadowFeather);
    u_xlat16_21 = (-u_xlat16_14) + u_xlat16_21;
    u_xlat16_21 = float(1.0) / u_xlat16_21;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat22 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * _WorldSpaceLightPos0.xyz;
    u_xlat16_3.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_10 = log2(u_xlat10_4.w);
    u_xlat16_10 = u_xlat16_10 * _HairSelfShadowPow;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_10 = (-u_xlat16_3.x) + u_xlat16_10;
    u_xlat16_3.x = _HairSelfShadowLerp * u_xlat16_10 + u_xlat16_3.x;
    u_xlat16_14 = (-u_xlat16_14) + u_xlat16_3.x;
    u_xlat16_14 = u_xlat16_21 * u_xlat16_14;
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_21 = u_xlat16_14 * -2.0 + 3.0;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_21;
    u_xlat16_14 = min(u_xlat16_14, 1.0);
    u_xlatb22 = 0.0350000001<u_xlat10_4.w;
    u_xlat16_0.x = (u_xlatb22) ? u_xlat16_14 : 0.0;
    u_xlat10_5.xyz = texture2D(_RampTex, u_xlat16_0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat10_5.xyz;
    u_xlat16_3.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_4.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_4.xyz;
    u_xlat10_4.xyz = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = vec3(_InSideLine_Width) * u_xlat16_6.xyz + u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + (-u_xlat16_3.xyz);
    u_xlat16_7.xyz = vec3(_RampDifLerpValue) * u_xlat16_7.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * _LightAreaColor.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz * _DarkColor.xyz;
    u_xlat16_3.w = u_xlat10_4.w * _LightAreaColor.w;
    u_xlat16_5.w = u_xlat10_4.w * _DarkColor.w;
    u_xlat16_3 = u_xlat16_3 + (-u_xlat16_5);
    u_xlat16_0 = u_xlat16_0.xxxx * u_xlat16_3 + u_xlat16_5;
    u_xlat4.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat22) + u_xlat2.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat16_3.x = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat16_3.x = log2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * _SpePow;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z);
    u_xlat10_22 = texture2D(_LightMapTex, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(u_xlat10_22) + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat9.xz = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat9.xz;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat2.xy;
    u_xlat8.xz = u_xlat1.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat1.xx + u_xlat8.xz;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat1.zz + u_xlat1.xy;
    u_xlat16_3.xy = (-u_xlat1.xy) + u_xlat2.xy;
    u_xlat16_3.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_3.xy + u_xlat1.xy;
    u_xlat16_21 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xy = vec2(u_xlat16_21) * u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(_RimWidth);
    u_xlat15.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat16 = float(1.0) / vs_TEXCOORD7.w;
    u_xlat15.xy = u_xlat16_3.xy * vec2(u_xlat16) + u_xlat15.xy;
    u_xlat15.x = texture2D(_CameraDepthTexture, u_xlat15.xy).x;
    u_xlat15.x = _ZBufferParams.z * u_xlat15.x + _ZBufferParams.w;
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + (-vs_TEXCOORD2.w);
    u_xlatb15 = u_xlat15.x>=_depthSubThreshold;
    u_xlat15.x = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat4.xyz = u_xlat15.xxx * _RimCol.xyz;
    u_xlat16_21 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xy = vec2(u_xlat16_21) * u_xlat1.xy;
    u_xlat16_21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_17.xy = vec2(u_xlat16_21) * u_xlat2.xy;
    u_xlat16_21 = dot(u_xlat16_3.xy, u_xlat16_17.xy);
    u_xlat16_21 = u_xlat16_21 * 0.5 + 0.5;
    u_xlat16_21 = log2(u_xlat16_21);
    u_xlat16_21 = u_xlat16_21 * _ColorScaleByLightDir;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_21 = min(u_xlat16_21, 1.0);
    u_xlat16_0.xyz = u_xlat4.xyz * vec3(u_xlat16_21) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
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
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump float _InSideLine_Width;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _SpePow;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _RampTex;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
lowp vec4 u_xlat10_4;
mediump vec4 u_xlat16_5;
lowp vec3 u_xlat10_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump float u_xlat16_10;
mediump float u_xlat16_14;
vec2 u_xlat15;
bool u_xlatb15;
float u_xlat16;
mediump vec2 u_xlat16_17;
mediump float u_xlat16_21;
float u_xlat22;
lowp float u_xlat10_22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.x = 1.5 / _RampRowsCount;
    u_xlat16_0.y = (-u_xlat16_0.x) + 1.0;
    u_xlat16_14 = _ShadowThreshold + 0.5;
    u_xlat16_21 = u_xlat16_14 + _ShadowFeather;
    u_xlat16_14 = u_xlat16_14 + (-_ShadowFeather);
    u_xlat16_21 = (-u_xlat16_14) + u_xlat16_21;
    u_xlat16_21 = float(1.0) / u_xlat16_21;
    u_xlat1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD3.xyz;
    u_xlat22 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * _WorldSpaceLightPos0.xyz;
    u_xlat16_3.x = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat10_4 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_10 = log2(u_xlat10_4.w);
    u_xlat16_10 = u_xlat16_10 * _HairSelfShadowPow;
    u_xlat16_10 = exp2(u_xlat16_10);
    u_xlat16_10 = (-u_xlat16_3.x) + u_xlat16_10;
    u_xlat16_3.x = _HairSelfShadowLerp * u_xlat16_10 + u_xlat16_3.x;
    u_xlat16_14 = (-u_xlat16_14) + u_xlat16_3.x;
    u_xlat16_14 = u_xlat16_21 * u_xlat16_14;
    u_xlat16_14 = clamp(u_xlat16_14, 0.0, 1.0);
    u_xlat16_21 = u_xlat16_14 * -2.0 + 3.0;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_14;
    u_xlat16_14 = u_xlat16_14 * u_xlat16_21;
    u_xlat16_14 = min(u_xlat16_14, 1.0);
    u_xlatb22 = 0.0350000001<u_xlat10_4.w;
    u_xlat16_0.x = (u_xlatb22) ? u_xlat16_14 : 0.0;
    u_xlat10_5.xyz = texture2D(_RampTex, u_xlat16_0.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat10_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat10_5.xyz;
    u_xlat16_3.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_4.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat10_4.xyz;
    u_xlat10_4.xyz = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).xyz;
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_3.xyz * u_xlat16_6.xyz + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = vec3(_InSideLine_Width) * u_xlat16_6.xyz + u_xlat16_3.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz + (-u_xlat16_3.xyz);
    u_xlat16_7.xyz = vec3(_RampDifLerpValue) * u_xlat16_7.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_7.xyz * _LightAreaColor.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz * _DarkColor.xyz;
    u_xlat16_3.w = u_xlat10_4.w * _LightAreaColor.w;
    u_xlat16_5.w = u_xlat10_4.w * _DarkColor.w;
    u_xlat16_3 = u_xlat16_3 + (-u_xlat16_5);
    u_xlat16_0 = u_xlat16_0.xxxx * u_xlat16_3 + u_xlat16_5;
    u_xlat4.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat22) + u_xlat2.xyz;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat16_3.x = dot(u_xlat1.xyz, u_xlat4.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 0.5 + 0.5;
    u_xlat16_3.x = log2(u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_3.x * _SpePow;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z);
    u_xlat10_22 = texture2D(_LightMapTex, vs_TEXCOORD0.xy).x;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(u_xlat10_22) + u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    u_xlat9.xz = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat9.xz;
    u_xlat2.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat2.xy;
    u_xlat8.xz = u_xlat1.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat1.xx + u_xlat8.xz;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat1.zz + u_xlat1.xy;
    u_xlat16_3.xy = (-u_xlat1.xy) + u_xlat2.xy;
    u_xlat16_3.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_3.xy + u_xlat1.xy;
    u_xlat16_21 = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xy = vec2(u_xlat16_21) * u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(_RimWidth);
    u_xlat15.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat16 = float(1.0) / vs_TEXCOORD7.w;
    u_xlat15.xy = u_xlat16_3.xy * vec2(u_xlat16) + u_xlat15.xy;
    u_xlat15.x = texture2D(_CameraDepthTexture, u_xlat15.xy).x;
    u_xlat15.x = _ZBufferParams.z * u_xlat15.x + _ZBufferParams.w;
    u_xlat15.x = float(1.0) / u_xlat15.x;
    u_xlat15.x = u_xlat15.x + (-vs_TEXCOORD2.w);
    u_xlatb15 = u_xlat15.x>=_depthSubThreshold;
    u_xlat15.x = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat4.xyz = u_xlat15.xxx * _RimCol.xyz;
    u_xlat16_21 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xy = vec2(u_xlat16_21) * u_xlat1.xy;
    u_xlat16_21 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_17.xy = vec2(u_xlat16_21) * u_xlat2.xy;
    u_xlat16_21 = dot(u_xlat16_3.xy, u_xlat16_17.xy);
    u_xlat16_21 = u_xlat16_21 * 0.5 + 0.5;
    u_xlat16_21 = log2(u_xlat16_21);
    u_xlat16_21 = u_xlat16_21 * _ColorScaleByLightDir;
    u_xlat16_21 = exp2(u_xlat16_21);
    u_xlat16_21 = min(u_xlat16_21, 1.0);
    u_xlat16_0.xyz = u_xlat4.xyz * vec3(u_xlat16_21) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_0.xyz = log2(u_xlat16_0.xyz);
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_0.xyz = exp2(u_xlat16_0.xyz);
    SV_Target0.xyz = u_xlat16_0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_LG_ON" }
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
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_VAR_LIUUV0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_VAR_LIUUV0.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump float _InSideLine_Width;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _SpePow;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform 	mediump float _useUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_Tex2;
UNITY_LOCATION(6) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_VAR_LIUUV0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
vec2 u_xlat17;
mediump vec2 u_xlat16_22;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat25;
mediump float u_xlat16_25;
bool u_xlatb26;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat25 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * _WorldSpaceLightPos0.xyz;
    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(_InSideLine_Width) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_25 = texture(_LightMapTex, vs_TEXCOORD0.xy).x;
    u_xlat16_29 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat16_29 = u_xlat16_29 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.0350000001<u_xlat16_3.w);
#else
    u_xlatb26 = 0.0350000001<u_xlat16_3.w;
#endif
    u_xlat16_6.x = log2(u_xlat16_3.w);
    u_xlat16_6.x = u_xlat16_6.x * _HairSelfShadowPow;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_29) + u_xlat16_6.x;
    u_xlat16_29 = _HairSelfShadowLerp * u_xlat16_6.x + u_xlat16_29;
    u_xlat16_6.x = _ShadowThreshold + 0.5;
    u_xlat16_14.x = u_xlat16_6.x + (-_ShadowFeather);
    u_xlat16_6.x = u_xlat16_6.x + _ShadowFeather;
    u_xlat16_6.x = (-u_xlat16_14.x) + u_xlat16_6.x;
    u_xlat16_29 = u_xlat16_29 + (-u_xlat16_14.x);
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_29 * -2.0 + 3.0;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_29;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_6.x;
    u_xlat16_29 = min(u_xlat16_29, 1.0);
    u_xlat16_6.x = (u_xlatb26) ? u_xlat16_29 : 0.0;
    u_xlat16_29 = 1.5 / _RampRowsCount;
    u_xlat16_6.y = (-u_xlat16_29) + 1.0;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat16_6.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(_RampDifLerpValue) * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _DarkColor.xyz;
    u_xlat16_4.w = u_xlat16_3.w * _DarkColor.w;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightAreaColor.xyz;
    u_xlat16_5.w = u_xlat16_3.w * _LightAreaColor.w;
    u_xlat16_3 = (-u_xlat16_4) + u_xlat16_5;
    u_xlat16_3 = u_xlat16_6.xxxx * u_xlat16_3 + u_xlat16_4;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat24) + u_xlat2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _SpePow;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_5.xxx * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_25) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
#endif
    u_xlat1.xy = (bool(u_xlatb24)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat17.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat17.xy = u_xlat17.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_7.xyz = texture(_LG_Tex, u_xlat17.xy).xyz;
    u_xlat16_24 = texture(_LG_Tex, u_xlat1.xy).w;
    u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(_LG_Intensity);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
#endif
    if(u_xlatb24){
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32));
#else
        u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
#endif
        u_xlat1.xy = (bool(u_xlatb24)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat17.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat1.xy;
        u_xlat17.xy = u_xlat17.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat16_7.xyz = texture(_LG_Tex2, u_xlat17.xy).xyz;
        u_xlat16_24 = texture(_LG_Tex2, u_xlat1.xy).w;
        u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(_LG_Intensity2);
        u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz;
        u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_5.xyz;
    }
    u_xlat8.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat8.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat1.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat1.xy;
    u_xlat16_29 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_6.xy = u_xlat0.xy * vec2(u_xlat16_29);
    u_xlat16_29 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_22.xy = u_xlat1.xy * vec2(u_xlat16_29);
    u_xlat16_29 = dot(u_xlat16_6.xy, u_xlat16_22.xy);
    u_xlat16_29 = u_xlat16_29 * 0.5 + 0.5;
    u_xlat16_29 = log2(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * _ColorScaleByLightDir;
    u_xlat16_29 = exp2(u_xlat16_29);
    u_xlat16_29 = min(u_xlat16_29, 1.0);
    u_xlat16_6.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat16_6.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_6.xy + u_xlat0.xy;
    u_xlat16_22.x = dot(u_xlat16_6.xy, u_xlat16_6.xy);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_6.xy = u_xlat16_22.xx * u_xlat16_6.xy;
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_6.xy * u_xlat0.xx + u_xlat16.xy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=_depthSubThreshold);
#else
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(u_xlat16_29) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    SV_Target0.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.w = u_xlat16_3.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_LG_ON" }
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
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_VAR_INSIDELINE0;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD6;
out highp vec4 vs_TEXCOORD7;
out highp vec2 vs_VAR_LIUUV0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_VAR_LIUUV0.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump float _InSideLine_Width;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _SpePow;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform 	mediump float _useUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _InSideLine;
UNITY_LOCATION(2) uniform mediump sampler2D _LightMapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _RampTex;
UNITY_LOCATION(4) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_Tex2;
UNITY_LOCATION(6) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_VAR_INSIDELINE0;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD6;
in highp vec4 vs_TEXCOORD7;
in highp vec2 vs_VAR_LIUUV0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
vec2 u_xlat17;
mediump vec2 u_xlat16_22;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat25;
mediump float u_xlat16_25;
bool u_xlatb26;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat25 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * _WorldSpaceLightPos0.xyz;
    u_xlat16_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_4.xyz = texture(_InSideLine, vs_VAR_INSIDELINE0.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(_InSideLine_Width) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_25 = texture(_LightMapTex, vs_TEXCOORD0.xy).x;
    u_xlat16_29 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat16_29 = u_xlat16_29 * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(0.0350000001<u_xlat16_3.w);
#else
    u_xlatb26 = 0.0350000001<u_xlat16_3.w;
#endif
    u_xlat16_6.x = log2(u_xlat16_3.w);
    u_xlat16_6.x = u_xlat16_6.x * _HairSelfShadowPow;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_29) + u_xlat16_6.x;
    u_xlat16_29 = _HairSelfShadowLerp * u_xlat16_6.x + u_xlat16_29;
    u_xlat16_6.x = _ShadowThreshold + 0.5;
    u_xlat16_14.x = u_xlat16_6.x + (-_ShadowFeather);
    u_xlat16_6.x = u_xlat16_6.x + _ShadowFeather;
    u_xlat16_6.x = (-u_xlat16_14.x) + u_xlat16_6.x;
    u_xlat16_29 = u_xlat16_29 + (-u_xlat16_14.x);
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_29 * -2.0 + 3.0;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_29;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_6.x;
    u_xlat16_29 = min(u_xlat16_29, 1.0);
    u_xlat16_6.x = (u_xlatb26) ? u_xlat16_29 : 0.0;
    u_xlat16_29 = 1.5 / _RampRowsCount;
    u_xlat16_6.y = (-u_xlat16_29) + 1.0;
    u_xlat16_3.xyz = texture(_RampTex, u_xlat16_6.xy).xyz;
    u_xlat16_14.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_3.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(_RampDifLerpValue) * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _DarkColor.xyz;
    u_xlat16_4.w = u_xlat16_3.w * _DarkColor.w;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightAreaColor.xyz;
    u_xlat16_5.w = u_xlat16_3.w * _LightAreaColor.w;
    u_xlat16_3 = (-u_xlat16_4) + u_xlat16_5;
    u_xlat16_3 = u_xlat16_6.xxxx * u_xlat16_3 + u_xlat16_4;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat24) + u_xlat2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _SpePow;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_5.xxx * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_25) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
#endif
    u_xlat1.xy = (bool(u_xlatb24)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat17.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat17.xy = u_xlat17.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_7.xyz = texture(_LG_Tex, u_xlat17.xy).xyz;
    u_xlat16_24 = texture(_LG_Tex, u_xlat1.xy).w;
    u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(_LG_Intensity);
    u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2));
#else
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
#endif
    if(u_xlatb24){
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32));
#else
        u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
#endif
        u_xlat1.xy = (bool(u_xlatb24)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat17.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat1.xy;
        u_xlat17.xy = u_xlat17.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat16_7.xyz = texture(_LG_Tex2, u_xlat17.xy).xyz;
        u_xlat16_24 = texture(_LG_Tex2, u_xlat1.xy).w;
        u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(_LG_Intensity2);
        u_xlat16_6.xyz = vec3(u_xlat16_24) * u_xlat16_6.xyz;
        u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_5.xyz;
    }
    u_xlat8.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat8.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat1.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat1.xy;
    u_xlat16_29 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_6.xy = u_xlat0.xy * vec2(u_xlat16_29);
    u_xlat16_29 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_22.xy = u_xlat1.xy * vec2(u_xlat16_29);
    u_xlat16_29 = dot(u_xlat16_6.xy, u_xlat16_22.xy);
    u_xlat16_29 = u_xlat16_29 * 0.5 + 0.5;
    u_xlat16_29 = log2(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * _ColorScaleByLightDir;
    u_xlat16_29 = exp2(u_xlat16_29);
    u_xlat16_29 = min(u_xlat16_29, 1.0);
    u_xlat16_6.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat16_6.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_6.xy + u_xlat0.xy;
    u_xlat16_22.x = dot(u_xlat16_6.xy, u_xlat16_6.xy);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_6.xy = u_xlat16_22.xx * u_xlat16_6.xy;
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_6.xy * u_xlat0.xx + u_xlat16.xy;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=_depthSubThreshold);
#else
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(u_xlat16_29) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    SV_Target0.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.w = u_xlat16_3.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_VAR_LIUUV0.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump float _InSideLine_Width;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _SpePow;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform 	mediump float _useUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Tex2;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
vec2 u_xlat17;
mediump vec2 u_xlat16_22;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat25;
lowp float u_xlat10_25;
bool u_xlatb26;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat25 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * _WorldSpaceLightPos0.xyz;
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_4.xyz = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(_InSideLine_Width) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat10_25 = texture2D(_LightMapTex, vs_TEXCOORD0.xy).x;
    u_xlat16_29 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat16_29 = u_xlat16_29 * 0.5 + 0.5;
    u_xlatb26 = 0.0350000001<u_xlat10_3.w;
    u_xlat16_6.x = log2(u_xlat10_3.w);
    u_xlat16_6.x = u_xlat16_6.x * _HairSelfShadowPow;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_29) + u_xlat16_6.x;
    u_xlat16_29 = _HairSelfShadowLerp * u_xlat16_6.x + u_xlat16_29;
    u_xlat16_6.x = _ShadowThreshold + 0.5;
    u_xlat16_14.x = u_xlat16_6.x + (-_ShadowFeather);
    u_xlat16_6.x = u_xlat16_6.x + _ShadowFeather;
    u_xlat16_6.x = (-u_xlat16_14.x) + u_xlat16_6.x;
    u_xlat16_29 = u_xlat16_29 + (-u_xlat16_14.x);
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_6.x;
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_29 * -2.0 + 3.0;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_29;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_6.x;
    u_xlat16_29 = min(u_xlat16_29, 1.0);
    u_xlat16_6.x = (u_xlatb26) ? u_xlat16_29 : 0.0;
    u_xlat16_29 = 1.5 / _RampRowsCount;
    u_xlat16_6.y = (-u_xlat16_29) + 1.0;
    u_xlat10_3.xyz = texture2D(_RampTex, u_xlat16_6.xy).xyz;
    u_xlat16_14.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat10_3.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat10_3.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(_RampDifLerpValue) * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _DarkColor.xyz;
    u_xlat16_4.w = u_xlat10_3.w * _DarkColor.w;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightAreaColor.xyz;
    u_xlat16_5.w = u_xlat10_3.w * _LightAreaColor.w;
    u_xlat16_3 = (-u_xlat16_4) + u_xlat16_5;
    u_xlat16_3 = u_xlat16_6.xxxx * u_xlat16_3 + u_xlat16_4;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat24) + u_xlat2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _SpePow;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_5.xxx * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat10_25) + u_xlat16_3.xyz;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
    u_xlat1.xy = (bool(u_xlatb24)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat17.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat17.xy = u_xlat17.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_7.xyz = texture2D(_LG_Tex, u_xlat17.xy).xyz;
    u_xlat10_24 = texture2D(_LG_Tex, u_xlat1.xy).w;
    u_xlat16_6.xyz = u_xlat10_7.xyz * vec3(_LG_Intensity);
    u_xlat16_6.xyz = vec3(u_xlat10_24) * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat16_5.xyz;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
    if(u_xlatb24){
        u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
        u_xlat1.xy = (bool(u_xlatb24)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat17.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat1.xy;
        u_xlat17.xy = u_xlat17.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat10_7.xyz = texture2D(_LG_Tex2, u_xlat17.xy).xyz;
        u_xlat10_24 = texture2D(_LG_Tex2, u_xlat1.xy).w;
        u_xlat16_6.xyz = u_xlat10_7.xyz * vec3(_LG_Intensity2);
        u_xlat16_6.xyz = vec3(u_xlat10_24) * u_xlat16_6.xyz;
        u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_5.xyz;
    }
    u_xlat8.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat8.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat1.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat1.xy;
    u_xlat16_29 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_6.xy = u_xlat0.xy * vec2(u_xlat16_29);
    u_xlat16_29 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_22.xy = u_xlat1.xy * vec2(u_xlat16_29);
    u_xlat16_29 = dot(u_xlat16_6.xy, u_xlat16_22.xy);
    u_xlat16_29 = u_xlat16_29 * 0.5 + 0.5;
    u_xlat16_29 = log2(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * _ColorScaleByLightDir;
    u_xlat16_29 = exp2(u_xlat16_29);
    u_xlat16_29 = min(u_xlat16_29, 1.0);
    u_xlat16_6.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat16_6.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_6.xy + u_xlat0.xy;
    u_xlat16_22.x = dot(u_xlat16_6.xy, u_xlat16_6.xy);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_6.xy = u_xlat16_22.xx * u_xlat16_6.xy;
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_6.xy * u_xlat0.xx + u_xlat16.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(u_xlat16_29) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    SV_Target0.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.w = u_xlat16_3.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD6.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_VAR_INSIDELINE0.xy = in_TEXCOORD1.xy;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD7 = u_xlat0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD3.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_VAR_LIUUV0.xy = in_TEXCOORD2.xy;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump float _RampDifLerpValue;
uniform 	mediump float _ShadowThreshold;
uniform 	mediump float _ShadowFeather;
uniform 	mediump vec4 _LightAreaColor;
uniform 	mediump vec4 _DarkColor;
uniform 	mediump float _RimWidth;
uniform 	mediump vec4 _RimCol;
uniform 	mediump float _depthSubThreshold;
uniform 	mediump float _ColorScaleByLightDir;
uniform 	mediump float _WidthEffectByLightDir;
uniform 	mediump float _InSideLine_Width;
uniform 	mediump float _RampRowsCount;
uniform 	mediump vec3 _SpeColor;
uniform 	mediump float _SpePow;
uniform 	mediump float _HairSelfShadowLerp;
uniform 	mediump float _HairSelfShadowPow;
uniform 	mediump float _useUv3;
uniform 	float _U_LG;
uniform 	float _V_LG;
uniform 	mediump float _LG_Intensity;
uniform 	mediump vec3 _LG_Color;
uniform 	mediump vec4 _LG_Tex_ST;
uniform 	mediump float _useUv32;
uniform 	mediump float _useLg2;
uniform 	float _U_LG2;
uniform 	float _V_LG2;
uniform 	mediump float _LG_Intensity2;
uniform 	mediump vec3 _LG_Color2;
uniform 	mediump vec4 _LG_Tex2_ST;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _InSideLine;
uniform lowp sampler2D _LightMapTex;
uniform lowp sampler2D _RampTex;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _LG_Tex2;
uniform highp sampler2D _CameraDepthTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_VAR_INSIDELINE0;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD6;
varying highp vec4 vs_TEXCOORD7;
varying highp vec2 vs_VAR_LIUUV0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_3;
lowp vec4 u_xlat10_3;
mediump vec4 u_xlat16_4;
lowp vec3 u_xlat10_4;
mediump vec4 u_xlat16_5;
mediump vec3 u_xlat16_6;
lowp vec3 u_xlat10_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_14;
vec2 u_xlat16;
vec2 u_xlat17;
mediump vec2 u_xlat16_22;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat25;
lowp float u_xlat10_25;
bool u_xlatb26;
mediump float u_xlat16_29;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD6.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat25 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat2.xyz = vec3(u_xlat25) * _WorldSpaceLightPos0.xyz;
    u_xlat10_3 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat10_4.xyz = texture2D(_InSideLine, vs_VAR_INSIDELINE0.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_5.xyz = u_xlat10_3.xyz * u_xlat16_5.xyz;
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(_InSideLine_Width) * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat10_25 = texture2D(_LightMapTex, vs_TEXCOORD0.xy).x;
    u_xlat16_29 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat16_29 = u_xlat16_29 * 0.5 + 0.5;
    u_xlatb26 = 0.0350000001<u_xlat10_3.w;
    u_xlat16_6.x = log2(u_xlat10_3.w);
    u_xlat16_6.x = u_xlat16_6.x * _HairSelfShadowPow;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_29) + u_xlat16_6.x;
    u_xlat16_29 = _HairSelfShadowLerp * u_xlat16_6.x + u_xlat16_29;
    u_xlat16_6.x = _ShadowThreshold + 0.5;
    u_xlat16_14.x = u_xlat16_6.x + (-_ShadowFeather);
    u_xlat16_6.x = u_xlat16_6.x + _ShadowFeather;
    u_xlat16_6.x = (-u_xlat16_14.x) + u_xlat16_6.x;
    u_xlat16_29 = u_xlat16_29 + (-u_xlat16_14.x);
    u_xlat16_6.x = float(1.0) / u_xlat16_6.x;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_6.x;
    u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_29 * -2.0 + 3.0;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_29;
    u_xlat16_29 = u_xlat16_29 * u_xlat16_6.x;
    u_xlat16_29 = min(u_xlat16_29, 1.0);
    u_xlat16_6.x = (u_xlatb26) ? u_xlat16_29 : 0.0;
    u_xlat16_29 = 1.5 / _RampRowsCount;
    u_xlat16_6.y = (-u_xlat16_29) + 1.0;
    u_xlat10_3.xyz = texture2D(_RampTex, u_xlat16_6.xy).xyz;
    u_xlat16_14.xyz = u_xlat10_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat10_3.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat10_3.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_5.xyz + (-u_xlat16_5.xyz);
    u_xlat16_5.xyz = vec3(_RampDifLerpValue) * u_xlat16_14.xyz + u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat16_5.xyz * _DarkColor.xyz;
    u_xlat16_4.w = u_xlat10_3.w * _DarkColor.w;
    u_xlat16_5.xyz = u_xlat16_5.xyz * _LightAreaColor.xyz;
    u_xlat16_5.w = u_xlat10_3.w * _LightAreaColor.w;
    u_xlat16_3 = (-u_xlat16_4) + u_xlat16_5;
    u_xlat16_3 = u_xlat16_6.xxxx * u_xlat16_3 + u_xlat16_4;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat24) + u_xlat2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_5.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat16_5.x = u_xlat16_5.x * 0.5 + 0.5;
    u_xlat16_5.x = log2(u_xlat16_5.x);
    u_xlat16_5.x = u_xlat16_5.x * _SpePow;
    u_xlat16_5.x = exp2(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_5.xxx * vec3(_SpeColor.x, _SpeColor.y, _SpeColor.z);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat10_25) + u_xlat16_3.xyz;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv3);
    u_xlat1.xy = (bool(u_xlatb24)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
    u_xlat17.xy = _Time.yy * vec2(_U_LG, _V_LG) + u_xlat1.xy;
    u_xlat17.xy = u_xlat17.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_7.xyz = texture2D(_LG_Tex, u_xlat17.xy).xyz;
    u_xlat10_24 = texture2D(_LG_Tex, u_xlat1.xy).w;
    u_xlat16_6.xyz = u_xlat10_7.xyz * vec3(_LG_Intensity);
    u_xlat16_6.xyz = vec3(u_xlat10_24) * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(_LG_Color.x, _LG_Color.y, _LG_Color.z) + u_xlat16_5.xyz;
    u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useLg2);
    if(u_xlatb24){
        u_xlatb24 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_useUv32);
        u_xlat1.xy = (bool(u_xlatb24)) ? vs_VAR_LIUUV0.xy : vs_TEXCOORD0.xy;
        u_xlat17.xy = _Time.yy * vec2(_U_LG2, _V_LG2) + u_xlat1.xy;
        u_xlat17.xy = u_xlat17.xy * _LG_Tex2_ST.xy + _LG_Tex2_ST.zw;
        u_xlat10_7.xyz = texture2D(_LG_Tex2, u_xlat17.xy).xyz;
        u_xlat10_24 = texture2D(_LG_Tex2, u_xlat1.xy).w;
        u_xlat16_6.xyz = u_xlat10_7.xyz * vec3(_LG_Intensity2);
        u_xlat16_6.xyz = vec3(u_xlat10_24) * u_xlat16_6.xyz;
        u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(_LG_Color2.x, _LG_Color2.y, _LG_Color2.z) + u_xlat16_5.xyz;
    }
    u_xlat8.xz = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat8.xz;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat16.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat1.xy = u_xlat2.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat2.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat2.zz + u_xlat1.xy;
    u_xlat16_29 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_6.xy = u_xlat0.xy * vec2(u_xlat16_29);
    u_xlat16_29 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat16_29 = inversesqrt(u_xlat16_29);
    u_xlat16_22.xy = u_xlat1.xy * vec2(u_xlat16_29);
    u_xlat16_29 = dot(u_xlat16_6.xy, u_xlat16_22.xy);
    u_xlat16_29 = u_xlat16_29 * 0.5 + 0.5;
    u_xlat16_29 = log2(u_xlat16_29);
    u_xlat16_29 = u_xlat16_29 * _ColorScaleByLightDir;
    u_xlat16_29 = exp2(u_xlat16_29);
    u_xlat16_29 = min(u_xlat16_29, 1.0);
    u_xlat16_6.xy = (-u_xlat0.xy) + u_xlat1.xy;
    u_xlat16_6.xy = vec2(vec2(_WidthEffectByLightDir, _WidthEffectByLightDir)) * u_xlat16_6.xy + u_xlat0.xy;
    u_xlat16_22.x = dot(u_xlat16_6.xy, u_xlat16_6.xy);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_6.xy = u_xlat16_22.xx * u_xlat16_6.xy;
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(_RimWidth);
    u_xlat0.x = float(1.0) / vs_TEXCOORD7.w;
    u_xlat0.xy = u_xlat16_6.xy * u_xlat0.xx + u_xlat16.xy;
    u_xlat0.x = texture2D(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.w);
    u_xlatb0 = u_xlat0.x>=_depthSubThreshold;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat0.xxx * _RimCol.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(u_xlat16_29) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_5.xyz = exp2(u_xlat16_5.xyz);
    SV_Target0.xyz = u_xlat16_5.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.w = u_xlat16_3.w;
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
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_LG_ON" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "SHADOWSUPPORT" = "true" }
  GpuProgramID 103141
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
}
}
 Pass {
 Name "Outline"
 Cull Front
  GpuProgramID 189292
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump float _Outline_Width;
uniform lowp sampler2D _LightMapTex;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat9 = texture2DLod(_LightMapTex, in_TEXCOORD0.xy, 0.0).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Outline_Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * _Outline_Color;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump float _Outline_Width;
uniform lowp sampler2D _LightMapTex;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat9 = texture2DLod(_LightMapTex, in_TEXCOORD0.xy, 0.0).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Outline_Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * _Outline_Color;
    return;
}

#endif
"
}
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump float _Outline_Width;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMapTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat9 = textureLod(_LightMapTex, in_TEXCOORD0.xy, 0.0).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Outline_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0 * _Outline_Color;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	mediump float _Outline_Width;
UNITY_LOCATION(1) uniform mediump sampler2D _LightMapTex;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = in_NORMAL0.zxy * in_TANGENT0.yzx;
    u_xlat1.xyz = in_NORMAL0.yzx * in_TANGENT0.zxy + (-u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat1.xyz = u_xlat1.xyz * unity_WorldTransformParams.www;
    u_xlat2.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.yyy;
    u_xlat1.xyz = in_TANGENT0.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = in_NORMAL0.xyz * u_xlat2.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat2.xyz;
    u_xlat0.y = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.z = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Outline_Width);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat1.www + u_xlat1.xyz;
    u_xlat9 = textureLod(_LightMapTex, in_TEXCOORD0.xy, 0.0).y;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4glstate_matrix_projection[1];
    u_xlat1 = hlslcc_mtx4x4glstate_matrix_projection[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4glstate_matrix_projection[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4glstate_matrix_projection[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Outline_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0 * _Outline_Color;
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