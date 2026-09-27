//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Scene/CrystalUI2_glow" {
Properties {

_MainColor ("MainColor", Color) = (0.5,0.5,0.5,1)

_MainTex ("MainTex", 2D) = "white" { }

_ExposeStrong ("ExposeStrong", Range(0, 3)) = 2.0

[Space(20)] _HideThredhold ("HideThredhold", Range(0, 1)) = 0.5

_HideSoftness ("HideSoftness", Range(0, 0.1)) = 0.10000000149011612

[Header(Dissolve)] _DissolveTex ("R:溶解纹理 G:溶解走向", 2D) = "white" { }

[Enum(1U,0,2U,1)] _Dissolve_UV ("溶解UV选择", Float) = 0.0

_DisDirWeight ("溶解走向权重", Range(0, 1)) = 0.5

_DissolveStep ("溶解阈值", Range(0, 2)) = 0.0

_DissolveSoftSize ("溶解软边", Range(0, 1)) = 0.0

_DissolveColor ("溶解边缘颜色", Color) = (1,1,1,1)

_DissolveColorWidth ("溶解边缘粗细", Range(0, 1)) = 0.10000000149011612

_DissolveColorPW ("溶解边缘强度", Float) = 1.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
  GpuProgramID 18815
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Dissolve_UV;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD5;
out highp vec2 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
#endif
    vs_TEXCOORD6.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _ExposeStrong;
uniform 	float _HideThredhold;
uniform 	float _HideSoftness;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DisDirWeight;
uniform 	float _DissolveStep;
uniform 	float _DissolveSoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	float _DissolveColorWidth;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD5;
in highp vec2 vs_TEXCOORD6;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_2;
float u_xlat4;
bool u_xlatb4;
void main()
{
    u_xlat16_0 = texture(_DissolveTex, vs_TEXCOORD6.xy).y;
    u_xlat2.xy = vs_TEXCOORD6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_2 = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat0.x = (-u_xlat16_2) + u_xlat16_0;
    u_xlat0.x = _DisDirWeight * u_xlat0.x + u_xlat16_2;
    u_xlat2.x = u_xlat0.x + (-_DissolveStep);
    u_xlat2.x = u_xlat2.x + (-_DissolveColorWidth);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=u_xlat0.x);
#else
    u_xlatb4 = 0.0>=u_xlat0.x;
#endif
    u_xlat0.x = u_xlat0.x + _DissolveSoftSize;
    u_xlat4 = (u_xlatb4) ? -1.0 : -0.0;
    u_xlat0.y = u_xlat4 + u_xlat2.x;
    u_xlat0.xy = u_xlat0.xy + (-vec2(_DissolveStep, _DissolveSoftSize));
    u_xlat4 = float(1.0) / (-_DissolveSoftSize);
    u_xlat2.x = u_xlat4 * u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat0.y = u_xlat2.x * u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=u_xlat0.x);
#else
    u_xlatb4 = 0.0>=u_xlat0.x;
#endif
    u_xlat0.x = u_xlat0.x + _DissolveColorWidth;
    u_xlat4 = (u_xlatb4) ? -1.0 : -0.0;
    u_xlat0.x = u_xlat4 + u_xlat0.x;
    u_xlat4 = float(1.0) / _DissolveSoftSize;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    SV_Target0.xyz = u_xlat1.xyz * vec3(_ExposeStrong) + u_xlat0.xyz;
    u_xlat0.x = vs_TEXCOORD5.y + (-_HideThredhold);
    u_xlat2.x = float(1.0) / _HideSoftness;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    SV_Target0.w = u_xlat0.x * _MainColor.w;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _Dissolve_UV;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD5;
out highp vec2 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
#endif
    vs_TEXCOORD6.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _ExposeStrong;
uniform 	float _HideThredhold;
uniform 	float _HideSoftness;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DisDirWeight;
uniform 	float _DissolveStep;
uniform 	float _DissolveSoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	float _DissolveColorWidth;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DissolveTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD5;
in highp vec2 vs_TEXCOORD6;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump float u_xlat16_2;
float u_xlat4;
bool u_xlatb4;
void main()
{
    u_xlat16_0 = texture(_DissolveTex, vs_TEXCOORD6.xy).y;
    u_xlat2.xy = vs_TEXCOORD6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat16_2 = texture(_DissolveTex, u_xlat2.xy).x;
    u_xlat0.x = (-u_xlat16_2) + u_xlat16_0;
    u_xlat0.x = _DisDirWeight * u_xlat0.x + u_xlat16_2;
    u_xlat2.x = u_xlat0.x + (-_DissolveStep);
    u_xlat2.x = u_xlat2.x + (-_DissolveColorWidth);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=u_xlat0.x);
#else
    u_xlatb4 = 0.0>=u_xlat0.x;
#endif
    u_xlat0.x = u_xlat0.x + _DissolveSoftSize;
    u_xlat4 = (u_xlatb4) ? -1.0 : -0.0;
    u_xlat0.y = u_xlat4 + u_xlat2.x;
    u_xlat0.xy = u_xlat0.xy + (-vec2(_DissolveStep, _DissolveSoftSize));
    u_xlat4 = float(1.0) / (-_DissolveSoftSize);
    u_xlat2.x = u_xlat4 * u_xlat0.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat0.y = u_xlat2.x * u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=u_xlat0.x);
#else
    u_xlatb4 = 0.0>=u_xlat0.x;
#endif
    u_xlat0.x = u_xlat0.x + _DissolveColorWidth;
    u_xlat4 = (u_xlatb4) ? -1.0 : -0.0;
    u_xlat0.x = u_xlat4 + u_xlat0.x;
    u_xlat4 = float(1.0) / _DissolveSoftSize;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _MainColor.xyz;
    SV_Target0.xyz = u_xlat1.xyz * vec3(_ExposeStrong) + u_xlat0.xyz;
    u_xlat0.x = vs_TEXCOORD5.y + (-_HideThredhold);
    u_xlat2.x = float(1.0) / _HideSoftness;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    SV_Target0.w = u_xlat0.x * _MainColor.w;
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
uniform 	float _Dissolve_UV;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD5;
varying highp vec2 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD1.xy;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
    vs_TEXCOORD6.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _ExposeStrong;
uniform 	float _HideThredhold;
uniform 	float _HideSoftness;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DisDirWeight;
uniform 	float _DissolveStep;
uniform 	float _DissolveSoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	float _DissolveColorWidth;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD5;
varying highp vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp float u_xlat10_2;
float u_xlat4;
bool u_xlatb4;
void main()
{
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD6.xy).y;
    u_xlat2.xy = vs_TEXCOORD6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_2 = texture2D(_DissolveTex, u_xlat2.xy).x;
    u_xlat0.x = (-u_xlat10_2) + u_xlat10_0;
    u_xlat0.x = _DisDirWeight * u_xlat0.x + u_xlat10_2;
    u_xlat2.x = u_xlat0.x + (-_DissolveStep);
    u_xlat2.x = u_xlat2.x + (-_DissolveColorWidth);
    u_xlatb4 = 0.0>=u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _DissolveSoftSize;
    u_xlat4 = (u_xlatb4) ? -1.0 : -0.0;
    u_xlat0.y = u_xlat4 + u_xlat2.x;
    u_xlat0.xy = u_xlat0.xy + (-vec2(_DissolveStep, _DissolveSoftSize));
    u_xlat4 = float(1.0) / (-_DissolveSoftSize);
    u_xlat2.x = u_xlat4 * u_xlat0.y;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat4 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat0.y = u_xlat2.x * u_xlat4;
    u_xlatb4 = 0.0>=u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _DissolveColorWidth;
    u_xlat4 = (u_xlatb4) ? -1.0 : -0.0;
    u_xlat0.x = u_xlat4 + u_xlat0.x;
    u_xlat4 = float(1.0) / _DissolveSoftSize;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _MainColor.xyz;
    SV_Target0.xyz = u_xlat1.xyz * vec3(_ExposeStrong) + u_xlat0.xyz;
    u_xlat0.x = vs_TEXCOORD5.y + (-_HideThredhold);
    u_xlat2.x = float(1.0) / _HideSoftness;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    SV_Target0.w = u_xlat0.x * _MainColor.w;
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
uniform 	float _Dissolve_UV;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD5;
varying highp vec2 vs_TEXCOORD6;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD5.xy = in_TEXCOORD1.xy;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Dissolve_UV);
    vs_TEXCOORD6.xy = (bool(u_xlatb0)) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainColor;
uniform 	float _ExposeStrong;
uniform 	float _HideThredhold;
uniform 	float _HideSoftness;
uniform 	vec4 _DissolveTex_ST;
uniform 	float _DisDirWeight;
uniform 	float _DissolveStep;
uniform 	float _DissolveSoftSize;
uniform 	vec4 _DissolveColor;
uniform 	float _DissolveColorPW;
uniform 	float _DissolveColorWidth;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _DissolveTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD5;
varying highp vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
lowp float u_xlat10_2;
float u_xlat4;
bool u_xlatb4;
void main()
{
    u_xlat10_0 = texture2D(_DissolveTex, vs_TEXCOORD6.xy).y;
    u_xlat2.xy = vs_TEXCOORD6.xy * _DissolveTex_ST.xy + _DissolveTex_ST.zw;
    u_xlat10_2 = texture2D(_DissolveTex, u_xlat2.xy).x;
    u_xlat0.x = (-u_xlat10_2) + u_xlat10_0;
    u_xlat0.x = _DisDirWeight * u_xlat0.x + u_xlat10_2;
    u_xlat2.x = u_xlat0.x + (-_DissolveStep);
    u_xlat2.x = u_xlat2.x + (-_DissolveColorWidth);
    u_xlatb4 = 0.0>=u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _DissolveSoftSize;
    u_xlat4 = (u_xlatb4) ? -1.0 : -0.0;
    u_xlat0.y = u_xlat4 + u_xlat2.x;
    u_xlat0.xy = u_xlat0.xy + (-vec2(_DissolveStep, _DissolveSoftSize));
    u_xlat4 = float(1.0) / (-_DissolveSoftSize);
    u_xlat2.x = u_xlat4 * u_xlat0.y;
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat4 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat0.y = u_xlat2.x * u_xlat4;
    u_xlatb4 = 0.0>=u_xlat0.x;
    u_xlat0.x = u_xlat0.x + _DissolveColorWidth;
    u_xlat4 = (u_xlatb4) ? -1.0 : -0.0;
    u_xlat0.x = u_xlat4 + u_xlat0.x;
    u_xlat4 = float(1.0) / _DissolveSoftSize;
    u_xlat0.x = u_xlat4 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat4;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat2.xyz = _DissolveColor.xyz * vec3(_DissolveColorPW);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _MainColor.xyz;
    SV_Target0.xyz = u_xlat1.xyz * vec3(_ExposeStrong) + u_xlat0.xyz;
    u_xlat0.x = vs_TEXCOORD5.y + (-_HideThredhold);
    u_xlat2.x = float(1.0) / _HideSoftness;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    SV_Target0.w = u_xlat0.x * _MainColor.w;
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