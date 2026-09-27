//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/Fishing/Fishing_Line" {
Properties {

[Header(00_Quick)] _BaseColor ("Base Color", Color) = (0.85,0.9,0.95,1)

_BaseAlpha ("Base Alpha", Range(0, 1)) = 0.550000011920929

_WidthMul ("Width Multiplier", Range(0, 3)) = 1.0

_HiStrength ("Highlight Strength", Range(0, 5)) = 1.600000023841858

_HiWidth ("Highlight Width (V)", Range(0.001, 0.2)) = 0.03500000014901161

[Header(05_FrontBackWidthAlpha)] _WidthFrontMul ("Width Front (U=0) Mul", Range(0, 3)) = 1.0

_WidthBackMul ("Width Back  (U=1) Mul", Range(0, 3)) = 1.0

_AlphaFrontMul ("Alpha Front (U=0) Mul", Range(0, 3)) = 1.0

_AlphaBackMul ("Alpha Back  (U=1) Mul", Range(0, 3)) = 1.0

_FrontBackCurve ("Front-Back Curve", Range(0.2, 5)) = 1.0

_FrontBackSoft ("Front-Back Softness", Range(0, 0.5)) = 0.07999999821186066

[Header(10_Ends)] _EndFadeLen ("End Fade Length (U)", Range(0, 0.5)) = 0.05999999865889549

_EndThin ("End Thin (0..1)", Range(0, 1)) = 0.3499999940395355

[Header(20_CylinderEdge)] _CylPower ("Cylinder Power", Range(0.5, 8)) = 2.200000047683716

_EdgeBoost ("Edge Boost", Range(0, 2)) = 0.3499999940395355

_EdgePower ("Edge Power", Range(0.5, 8)) = 2.200000047683716

[Header(30_Highlight)] _HiColor ("Highlight Color", Color) = (1,1,1,1)

_HiOffset ("Highlight Offset (V)", Range(-0.5, 0.5)) = -0.07999999821186066

_HiScroll ("Highlight Scroll Speed", Range(-5, 5)) = 0.6000000238418579

_TwistAmp ("Twist Amp (V)", Range(0, 0.3)) = 0.05999999865889549

_TwistFreq ("Twist Freq (per U)", Range(0, 50)) = 10.0

_TwistSpeed ("Twist Speed", Range(-20, 20)) = 2.0

[Header(40_MicroVar)] _WidthNoiseAmp ("Width Noise Amp", Range(0, 1)) = 0.18000000715255737

_WidthNoiseFreq ("Width Noise Freq", Range(0, 200)) = 50.0

_WidthNoiseSpeed ("Width Noise Speed", Range(-50, 50)) = 8.0

_HiJitterAmp ("Highlight Jitter Amp (V)", Range(0, 0.2)) = 0.019999999552965164

_HiJitterFreq ("Highlight Jitter Freq", Range(0, 200)) = 70.0

_HiJitterSpeed ("Highlight Jitter Speed", Range(-50, 50)) = 10.0

[Header(90_AA)] _FeatherBoost ("Feather Boost", Range(0.5, 4)) = 1.899999976158142

_FeatherMin ("Feather Min", Range(0, 3)) = 0.8999999761581421

}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 40542
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _BaseAlpha;
uniform 	mediump float _WidthMul;
uniform 	mediump float _HiStrength;
uniform 	mediump float _HiWidth;
uniform 	mediump float _WidthFrontMul;
uniform 	mediump float _WidthBackMul;
uniform 	mediump float _AlphaFrontMul;
uniform 	mediump float _AlphaBackMul;
uniform 	mediump float _FrontBackCurve;
uniform 	mediump float _FrontBackSoft;
uniform 	mediump float _EndFadeLen;
uniform 	mediump float _EndThin;
uniform 	mediump float _CylPower;
uniform 	mediump float _EdgeBoost;
uniform 	mediump float _EdgePower;
uniform 	mediump vec4 _HiColor;
uniform 	mediump float _HiOffset;
uniform 	float _HiScroll;
uniform 	mediump float _TwistAmp;
uniform 	float _TwistFreq;
uniform 	float _TwistSpeed;
uniform 	mediump float _WidthNoiseAmp;
uniform 	float _WidthNoiseFreq;
uniform 	float _WidthNoiseSpeed;
uniform 	mediump float _HiJitterAmp;
uniform 	float _HiJitterFreq;
uniform 	float _HiJitterSpeed;
uniform 	mediump float _FeatherBoost;
uniform 	mediump float _FeatherMin;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat5;
float u_xlat6;
mediump float u_xlat16_7;
vec2 u_xlat8;
float u_xlat9;
float u_xlat11;
void main()
{
    u_xlat0.x = _Time.y * _WidthNoiseSpeed;
    u_xlat0.x = vs_TEXCOORD0.x * _WidthNoiseFreq + u_xlat0.x;
    u_xlat3.x = floor(u_xlat0.x);
    u_xlat3.y = u_xlat3.x + 1.0;
    u_xlat0.yz = u_xlat3.xy * vec2(0.103100002, 0.103100002);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat9 = u_xlat0.z + 33.3300018;
    u_xlat6 = u_xlat9 * u_xlat0.z;
    u_xlat9 = u_xlat6 + u_xlat6;
    u_xlat3.y = u_xlat9 * u_xlat6;
    u_xlat9 = u_xlat0.y + 33.3300018;
    u_xlat3.x = u_xlat9 * u_xlat0.y;
    u_xlat9 = u_xlat3.x + u_xlat3.x;
    u_xlat3.x = u_xlat9 * u_xlat3.x;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat6 = (-u_xlat3.x) + u_xlat3.y;
    u_xlat9 = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) * 2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat0.x = u_xlat0.x * u_xlat6 + u_xlat3.x;
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = _WidthNoiseAmp * u_xlat0.x + 1.0;
    u_xlat16_1.xy = vec2(_FrontBackSoft, _EndFadeLen);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_7 = (-u_xlat16_1.x) + 1.0;
    u_xlat3.xy = vec2(1.0, 1.0) / u_xlat16_1.xy;
    u_xlat9 = (-u_xlat16_7) + 1.0;
    u_xlat2.x = (-u_xlat16_7) + vs_TEXCOORD0.x;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat9 * -2.0 + 3.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat9 = (-u_xlat2.x) * u_xlat9 + 1.0;
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * vs_TEXCOORD0.x;
    u_xlat2.xy = u_xlat3.xy * vs_TEXCOORD0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * u_xlat8.xy;
    u_xlat3.x = vs_TEXCOORD0.x * u_xlat2.x + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat16_1.x = max(_FrontBackCurve, 0.00100000005);
    u_xlat3.x = u_xlat3.x * u_xlat16_1.x;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat2.xz = (-vec2(_WidthFrontMul, _AlphaFrontMul)) + vec2(_WidthBackMul, _AlphaBackMul);
    u_xlat3.xz = u_xlat3.xx * u_xlat2.xz + vec2(_WidthFrontMul, _AlphaFrontMul);
    u_xlat3.xz = u_xlat3.xz * vec2(_WidthMul, _BaseAlpha);
    u_xlat2.x = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat6 = u_xlat3.y * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat6 * -2.0 + 3.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat6 * u_xlat2.x;
    u_xlat0.z = u_xlat6 * u_xlat2.y;
    u_xlat2.x = (-_EndThin) + 1.0;
    u_xlat2.x = u_xlat0.z * u_xlat2.x + _EndThin;
    u_xlat3.x = u_xlat3.x * u_xlat2.x;
    u_xlat0.xz = u_xlat0.xz * u_xlat3.xz;
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat3.x = vs_TEXCOORD0.y + -0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + abs(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat9 = dFdx(vs_TEXCOORD0.y);
    u_xlat2.x = dFdy(vs_TEXCOORD0.y);
    u_xlat9 = abs(u_xlat9) + abs(u_xlat2.x);
    u_xlat9 = u_xlat9 * _FeatherBoost;
    u_xlat2.x = max(_ScreenParams.y, 1.0);
    u_xlat2.x = _FeatherMin / u_xlat2.x;
    u_xlat9 = max(u_xlat9, u_xlat2.x);
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.x = u_xlat9 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat9) * u_xlat0.x + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat0.z;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.x = min(abs(u_xlat3.x), 1.0);
    u_xlat3.x = (-u_xlat3.x) * u_xlat3.x + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * _CylPower;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _EdgePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _EdgeBoost;
    u_xlat0.xzw = u_xlat0.xxx * _BaseColor.xyz;
    u_xlat2.x = u_xlat3.x * 0.550000012 + 0.649999976;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = u_xlat3.x * 0.649999976 + 0.349999994;
    u_xlat0.xzw = _BaseColor.xyz * u_xlat2.xxx + u_xlat0.xzw;
    u_xlat2.x = _Time.y * _HiJitterSpeed;
    u_xlat2.x = vs_TEXCOORD0.x * _HiJitterFreq + u_xlat2.x;
    u_xlat5.x = floor(u_xlat2.x);
    u_xlat5.y = u_xlat5.x + 1.0;
    u_xlat2.yz = u_xlat5.xy * vec2(0.103100002, 0.103100002);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat11 = u_xlat2.z + 33.3300018;
    u_xlat8.x = u_xlat11 * u_xlat2.z;
    u_xlat11 = u_xlat8.x + u_xlat8.x;
    u_xlat5.y = u_xlat11 * u_xlat8.x;
    u_xlat11 = u_xlat2.y + 33.3300018;
    u_xlat5.x = u_xlat11 * u_xlat2.y;
    u_xlat11 = u_xlat5.x + u_xlat5.x;
    u_xlat5.x = u_xlat11 * u_xlat5.x;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat8.x = (-u_xlat5.x) + u_xlat5.y;
    u_xlat11 = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) * 2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat11;
    u_xlat2.x = u_xlat2.x * u_xlat8.x + u_xlat5.x;
    u_xlat2.x = u_xlat2.x + -0.5;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat5.x = _Time.y * _TwistSpeed;
    u_xlat5.x = vs_TEXCOORD0.x * _TwistFreq + u_xlat5.x;
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat16_1.x = _HiOffset + 0.5;
    u_xlat5.x = u_xlat5.x * _TwistAmp + u_xlat16_1.x;
    u_xlat2.x = u_xlat2.x * _HiJitterAmp + u_xlat5.x;
    u_xlat5.x = _Time.y * _HiScroll + vs_TEXCOORD0.x;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.5;
    u_xlat2.x = u_xlat5.x * 0.119999997 + u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) + vs_TEXCOORD0.y;
    u_xlat5.x = max(_HiWidth, 9.99999997e-07);
    u_xlat2.x = u_xlat2.x / u_xlat5.x;
    u_xlat2.x = u_xlat2.x * (-u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 1.44269502;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat3.x = u_xlat3.x * u_xlat2.x;
    u_xlat3.x = u_xlat3.x * _HiStrength;
    u_xlat0.xyz = _HiColor.xyz * u_xlat3.xxx + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
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
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _BaseAlpha;
uniform 	mediump float _WidthMul;
uniform 	mediump float _HiStrength;
uniform 	mediump float _HiWidth;
uniform 	mediump float _WidthFrontMul;
uniform 	mediump float _WidthBackMul;
uniform 	mediump float _AlphaFrontMul;
uniform 	mediump float _AlphaBackMul;
uniform 	mediump float _FrontBackCurve;
uniform 	mediump float _FrontBackSoft;
uniform 	mediump float _EndFadeLen;
uniform 	mediump float _EndThin;
uniform 	mediump float _CylPower;
uniform 	mediump float _EdgeBoost;
uniform 	mediump float _EdgePower;
uniform 	mediump vec4 _HiColor;
uniform 	mediump float _HiOffset;
uniform 	float _HiScroll;
uniform 	mediump float _TwistAmp;
uniform 	float _TwistFreq;
uniform 	float _TwistSpeed;
uniform 	mediump float _WidthNoiseAmp;
uniform 	float _WidthNoiseFreq;
uniform 	float _WidthNoiseSpeed;
uniform 	mediump float _HiJitterAmp;
uniform 	float _HiJitterFreq;
uniform 	float _HiJitterSpeed;
uniform 	mediump float _FeatherBoost;
uniform 	mediump float _FeatherMin;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat5;
float u_xlat6;
mediump float u_xlat16_7;
vec2 u_xlat8;
float u_xlat9;
float u_xlat11;
void main()
{
    u_xlat0.x = _Time.y * _WidthNoiseSpeed;
    u_xlat0.x = vs_TEXCOORD0.x * _WidthNoiseFreq + u_xlat0.x;
    u_xlat3.x = floor(u_xlat0.x);
    u_xlat3.y = u_xlat3.x + 1.0;
    u_xlat0.yz = u_xlat3.xy * vec2(0.103100002, 0.103100002);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat9 = u_xlat0.z + 33.3300018;
    u_xlat6 = u_xlat9 * u_xlat0.z;
    u_xlat9 = u_xlat6 + u_xlat6;
    u_xlat3.y = u_xlat9 * u_xlat6;
    u_xlat9 = u_xlat0.y + 33.3300018;
    u_xlat3.x = u_xlat9 * u_xlat0.y;
    u_xlat9 = u_xlat3.x + u_xlat3.x;
    u_xlat3.x = u_xlat9 * u_xlat3.x;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat6 = (-u_xlat3.x) + u_xlat3.y;
    u_xlat9 = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) * 2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat0.x = u_xlat0.x * u_xlat6 + u_xlat3.x;
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = _WidthNoiseAmp * u_xlat0.x + 1.0;
    u_xlat16_1.xy = vec2(_FrontBackSoft, _EndFadeLen);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_7 = (-u_xlat16_1.x) + 1.0;
    u_xlat3.xy = vec2(1.0, 1.0) / u_xlat16_1.xy;
    u_xlat9 = (-u_xlat16_7) + 1.0;
    u_xlat2.x = (-u_xlat16_7) + vs_TEXCOORD0.x;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9 = min(max(u_xlat9, 0.0), 1.0);
#else
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat9 * -2.0 + 3.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat9 = (-u_xlat2.x) * u_xlat9 + 1.0;
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * vs_TEXCOORD0.x;
    u_xlat2.xy = u_xlat3.xy * vs_TEXCOORD0.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat8.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * u_xlat8.xy;
    u_xlat3.x = vs_TEXCOORD0.x * u_xlat2.x + u_xlat9;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat16_1.x = max(_FrontBackCurve, 0.00100000005);
    u_xlat3.x = u_xlat3.x * u_xlat16_1.x;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat2.xz = (-vec2(_WidthFrontMul, _AlphaFrontMul)) + vec2(_WidthBackMul, _AlphaBackMul);
    u_xlat3.xz = u_xlat3.xx * u_xlat2.xz + vec2(_WidthFrontMul, _AlphaFrontMul);
    u_xlat3.xz = u_xlat3.xz * vec2(_WidthMul, _BaseAlpha);
    u_xlat2.x = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat6 = u_xlat3.y * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6 = min(max(u_xlat6, 0.0), 1.0);
#else
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat6 * -2.0 + 3.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat6 * u_xlat2.x;
    u_xlat0.z = u_xlat6 * u_xlat2.y;
    u_xlat2.x = (-_EndThin) + 1.0;
    u_xlat2.x = u_xlat0.z * u_xlat2.x + _EndThin;
    u_xlat3.x = u_xlat3.x * u_xlat2.x;
    u_xlat0.xz = u_xlat0.xz * u_xlat3.xz;
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat3.x = vs_TEXCOORD0.y + -0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + abs(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat9 = dFdx(vs_TEXCOORD0.y);
    u_xlat2.x = dFdy(vs_TEXCOORD0.y);
    u_xlat9 = abs(u_xlat9) + abs(u_xlat2.x);
    u_xlat9 = u_xlat9 * _FeatherBoost;
    u_xlat2.x = max(_ScreenParams.y, 1.0);
    u_xlat2.x = _FeatherMin / u_xlat2.x;
    u_xlat9 = max(u_xlat9, u_xlat2.x);
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.x = u_xlat9 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat9) * u_xlat0.x + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat0.z;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.x = min(abs(u_xlat3.x), 1.0);
    u_xlat3.x = (-u_xlat3.x) * u_xlat3.x + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * _CylPower;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _EdgePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _EdgeBoost;
    u_xlat0.xzw = u_xlat0.xxx * _BaseColor.xyz;
    u_xlat2.x = u_xlat3.x * 0.550000012 + 0.649999976;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = u_xlat3.x * 0.649999976 + 0.349999994;
    u_xlat0.xzw = _BaseColor.xyz * u_xlat2.xxx + u_xlat0.xzw;
    u_xlat2.x = _Time.y * _HiJitterSpeed;
    u_xlat2.x = vs_TEXCOORD0.x * _HiJitterFreq + u_xlat2.x;
    u_xlat5.x = floor(u_xlat2.x);
    u_xlat5.y = u_xlat5.x + 1.0;
    u_xlat2.yz = u_xlat5.xy * vec2(0.103100002, 0.103100002);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat11 = u_xlat2.z + 33.3300018;
    u_xlat8.x = u_xlat11 * u_xlat2.z;
    u_xlat11 = u_xlat8.x + u_xlat8.x;
    u_xlat5.y = u_xlat11 * u_xlat8.x;
    u_xlat11 = u_xlat2.y + 33.3300018;
    u_xlat5.x = u_xlat11 * u_xlat2.y;
    u_xlat11 = u_xlat5.x + u_xlat5.x;
    u_xlat5.x = u_xlat11 * u_xlat5.x;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat8.x = (-u_xlat5.x) + u_xlat5.y;
    u_xlat11 = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) * 2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat11;
    u_xlat2.x = u_xlat2.x * u_xlat8.x + u_xlat5.x;
    u_xlat2.x = u_xlat2.x + -0.5;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat5.x = _Time.y * _TwistSpeed;
    u_xlat5.x = vs_TEXCOORD0.x * _TwistFreq + u_xlat5.x;
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat16_1.x = _HiOffset + 0.5;
    u_xlat5.x = u_xlat5.x * _TwistAmp + u_xlat16_1.x;
    u_xlat2.x = u_xlat2.x * _HiJitterAmp + u_xlat5.x;
    u_xlat5.x = _Time.y * _HiScroll + vs_TEXCOORD0.x;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.5;
    u_xlat2.x = u_xlat5.x * 0.119999997 + u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) + vs_TEXCOORD0.y;
    u_xlat5.x = max(_HiWidth, 9.99999997e-07);
    u_xlat2.x = u_xlat2.x / u_xlat5.x;
    u_xlat2.x = u_xlat2.x * (-u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 1.44269502;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat3.x = u_xlat3.x * u_xlat2.x;
    u_xlat3.x = u_xlat3.x * _HiStrength;
    u_xlat0.xyz = _HiColor.xyz * u_xlat3.xxx + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
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
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_OES_standard_derivatives
#extension GL_OES_standard_derivatives : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _BaseAlpha;
uniform 	mediump float _WidthMul;
uniform 	mediump float _HiStrength;
uniform 	mediump float _HiWidth;
uniform 	mediump float _WidthFrontMul;
uniform 	mediump float _WidthBackMul;
uniform 	mediump float _AlphaFrontMul;
uniform 	mediump float _AlphaBackMul;
uniform 	mediump float _FrontBackCurve;
uniform 	mediump float _FrontBackSoft;
uniform 	mediump float _EndFadeLen;
uniform 	mediump float _EndThin;
uniform 	mediump float _CylPower;
uniform 	mediump float _EdgeBoost;
uniform 	mediump float _EdgePower;
uniform 	mediump vec4 _HiColor;
uniform 	mediump float _HiOffset;
uniform 	float _HiScroll;
uniform 	mediump float _TwistAmp;
uniform 	float _TwistFreq;
uniform 	float _TwistSpeed;
uniform 	mediump float _WidthNoiseAmp;
uniform 	float _WidthNoiseFreq;
uniform 	float _WidthNoiseSpeed;
uniform 	mediump float _HiJitterAmp;
uniform 	float _HiJitterFreq;
uniform 	float _HiJitterSpeed;
uniform 	mediump float _FeatherBoost;
uniform 	mediump float _FeatherMin;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat5;
float u_xlat6;
mediump float u_xlat16_7;
vec2 u_xlat8;
float u_xlat9;
float u_xlat11;
void main()
{
    u_xlat0.x = _Time.y * _WidthNoiseSpeed;
    u_xlat0.x = vs_TEXCOORD0.x * _WidthNoiseFreq + u_xlat0.x;
    u_xlat3.x = floor(u_xlat0.x);
    u_xlat3.y = u_xlat3.x + 1.0;
    u_xlat0.yz = u_xlat3.xy * vec2(0.103100002, 0.103100002);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat9 = u_xlat0.z + 33.3300018;
    u_xlat6 = u_xlat9 * u_xlat0.z;
    u_xlat9 = u_xlat6 + u_xlat6;
    u_xlat3.y = u_xlat9 * u_xlat6;
    u_xlat9 = u_xlat0.y + 33.3300018;
    u_xlat3.x = u_xlat9 * u_xlat0.y;
    u_xlat9 = u_xlat3.x + u_xlat3.x;
    u_xlat3.x = u_xlat9 * u_xlat3.x;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat6 = (-u_xlat3.x) + u_xlat3.y;
    u_xlat9 = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) * 2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat0.x = u_xlat0.x * u_xlat6 + u_xlat3.x;
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = _WidthNoiseAmp * u_xlat0.x + 1.0;
    u_xlat16_1.xy = vec2(_FrontBackSoft, _EndFadeLen);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_7 = (-u_xlat16_1.x) + 1.0;
    u_xlat3.xy = vec2(1.0, 1.0) / u_xlat16_1.xy;
    u_xlat9 = (-u_xlat16_7) + 1.0;
    u_xlat2.x = (-u_xlat16_7) + vs_TEXCOORD0.x;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat2.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat2.x = u_xlat9 * -2.0 + 3.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat9 = (-u_xlat2.x) * u_xlat9 + 1.0;
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * vs_TEXCOORD0.x;
    u_xlat2.xy = u_xlat3.xy * vs_TEXCOORD0.xx;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat8.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * u_xlat8.xy;
    u_xlat3.x = vs_TEXCOORD0.x * u_xlat2.x + u_xlat9;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat16_1.x = max(_FrontBackCurve, 0.00100000005);
    u_xlat3.x = u_xlat3.x * u_xlat16_1.x;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat2.xz = (-vec2(_WidthFrontMul, _AlphaFrontMul)) + vec2(_WidthBackMul, _AlphaBackMul);
    u_xlat3.xz = u_xlat3.xx * u_xlat2.xz + vec2(_WidthFrontMul, _AlphaFrontMul);
    u_xlat3.xz = u_xlat3.xz * vec2(_WidthMul, _BaseAlpha);
    u_xlat2.x = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat6 = u_xlat3.y * u_xlat2.x;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat2.x = u_xlat6 * -2.0 + 3.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat6 * u_xlat2.x;
    u_xlat0.z = u_xlat6 * u_xlat2.y;
    u_xlat2.x = (-_EndThin) + 1.0;
    u_xlat2.x = u_xlat0.z * u_xlat2.x + _EndThin;
    u_xlat3.x = u_xlat3.x * u_xlat2.x;
    u_xlat0.xz = u_xlat0.xz * u_xlat3.xz;
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat3.x = vs_TEXCOORD0.y + -0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + abs(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat9 = dFdx(vs_TEXCOORD0.y);
    u_xlat2.x = dFdy(vs_TEXCOORD0.y);
    u_xlat9 = abs(u_xlat9) + abs(u_xlat2.x);
    u_xlat9 = u_xlat9 * _FeatherBoost;
    u_xlat2.x = max(_ScreenParams.y, 1.0);
    u_xlat2.x = _FeatherMin / u_xlat2.x;
    u_xlat9 = max(u_xlat9, u_xlat2.x);
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.x = u_xlat9 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat9) * u_xlat0.x + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat0.z;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.x = min(abs(u_xlat3.x), 1.0);
    u_xlat3.x = (-u_xlat3.x) * u_xlat3.x + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * _CylPower;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _EdgePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _EdgeBoost;
    u_xlat0.xzw = u_xlat0.xxx * _BaseColor.xyz;
    u_xlat2.x = u_xlat3.x * 0.550000012 + 0.649999976;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = u_xlat3.x * 0.649999976 + 0.349999994;
    u_xlat0.xzw = _BaseColor.xyz * u_xlat2.xxx + u_xlat0.xzw;
    u_xlat2.x = _Time.y * _HiJitterSpeed;
    u_xlat2.x = vs_TEXCOORD0.x * _HiJitterFreq + u_xlat2.x;
    u_xlat5.x = floor(u_xlat2.x);
    u_xlat5.y = u_xlat5.x + 1.0;
    u_xlat2.yz = u_xlat5.xy * vec2(0.103100002, 0.103100002);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat11 = u_xlat2.z + 33.3300018;
    u_xlat8.x = u_xlat11 * u_xlat2.z;
    u_xlat11 = u_xlat8.x + u_xlat8.x;
    u_xlat5.y = u_xlat11 * u_xlat8.x;
    u_xlat11 = u_xlat2.y + 33.3300018;
    u_xlat5.x = u_xlat11 * u_xlat2.y;
    u_xlat11 = u_xlat5.x + u_xlat5.x;
    u_xlat5.x = u_xlat11 * u_xlat5.x;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat8.x = (-u_xlat5.x) + u_xlat5.y;
    u_xlat11 = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) * 2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat11;
    u_xlat2.x = u_xlat2.x * u_xlat8.x + u_xlat5.x;
    u_xlat2.x = u_xlat2.x + -0.5;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat5.x = _Time.y * _TwistSpeed;
    u_xlat5.x = vs_TEXCOORD0.x * _TwistFreq + u_xlat5.x;
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat16_1.x = _HiOffset + 0.5;
    u_xlat5.x = u_xlat5.x * _TwistAmp + u_xlat16_1.x;
    u_xlat2.x = u_xlat2.x * _HiJitterAmp + u_xlat5.x;
    u_xlat5.x = _Time.y * _HiScroll + vs_TEXCOORD0.x;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.5;
    u_xlat2.x = u_xlat5.x * 0.119999997 + u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) + vs_TEXCOORD0.y;
    u_xlat5.x = max(_HiWidth, 9.99999997e-07);
    u_xlat2.x = u_xlat2.x / u_xlat5.x;
    u_xlat2.x = u_xlat2.x * (-u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 1.44269502;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat3.x = u_xlat3.x * u_xlat2.x;
    u_xlat3.x = u_xlat3.x * _HiStrength;
    u_xlat0.xyz = _HiColor.xyz * u_xlat3.xxx + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
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
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_OES_standard_derivatives
#extension GL_OES_standard_derivatives : enable
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _ScreenParams;
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _BaseAlpha;
uniform 	mediump float _WidthMul;
uniform 	mediump float _HiStrength;
uniform 	mediump float _HiWidth;
uniform 	mediump float _WidthFrontMul;
uniform 	mediump float _WidthBackMul;
uniform 	mediump float _AlphaFrontMul;
uniform 	mediump float _AlphaBackMul;
uniform 	mediump float _FrontBackCurve;
uniform 	mediump float _FrontBackSoft;
uniform 	mediump float _EndFadeLen;
uniform 	mediump float _EndThin;
uniform 	mediump float _CylPower;
uniform 	mediump float _EdgeBoost;
uniform 	mediump float _EdgePower;
uniform 	mediump vec4 _HiColor;
uniform 	mediump float _HiOffset;
uniform 	float _HiScroll;
uniform 	mediump float _TwistAmp;
uniform 	float _TwistFreq;
uniform 	float _TwistSpeed;
uniform 	mediump float _WidthNoiseAmp;
uniform 	float _WidthNoiseFreq;
uniform 	float _WidthNoiseSpeed;
uniform 	mediump float _HiJitterAmp;
uniform 	float _HiJitterFreq;
uniform 	float _HiJitterSpeed;
uniform 	mediump float _FeatherBoost;
uniform 	mediump float _FeatherMin;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec2 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec2 u_xlat5;
float u_xlat6;
mediump float u_xlat16_7;
vec2 u_xlat8;
float u_xlat9;
float u_xlat11;
void main()
{
    u_xlat0.x = _Time.y * _WidthNoiseSpeed;
    u_xlat0.x = vs_TEXCOORD0.x * _WidthNoiseFreq + u_xlat0.x;
    u_xlat3.x = floor(u_xlat0.x);
    u_xlat3.y = u_xlat3.x + 1.0;
    u_xlat0.yz = u_xlat3.xy * vec2(0.103100002, 0.103100002);
    u_xlat0.xyz = fract(u_xlat0.xyz);
    u_xlat9 = u_xlat0.z + 33.3300018;
    u_xlat6 = u_xlat9 * u_xlat0.z;
    u_xlat9 = u_xlat6 + u_xlat6;
    u_xlat3.y = u_xlat9 * u_xlat6;
    u_xlat9 = u_xlat0.y + 33.3300018;
    u_xlat3.x = u_xlat9 * u_xlat0.y;
    u_xlat9 = u_xlat3.x + u_xlat3.x;
    u_xlat3.x = u_xlat9 * u_xlat3.x;
    u_xlat3.xy = fract(u_xlat3.xy);
    u_xlat6 = (-u_xlat3.x) + u_xlat3.y;
    u_xlat9 = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat0.x) * 2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat0.x = u_xlat0.x * u_xlat6 + u_xlat3.x;
    u_xlat0.x = u_xlat0.x + -0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = _WidthNoiseAmp * u_xlat0.x + 1.0;
    u_xlat16_1.xy = vec2(_FrontBackSoft, _EndFadeLen);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_7 = (-u_xlat16_1.x) + 1.0;
    u_xlat3.xy = vec2(1.0, 1.0) / u_xlat16_1.xy;
    u_xlat9 = (-u_xlat16_7) + 1.0;
    u_xlat2.x = (-u_xlat16_7) + vs_TEXCOORD0.x;
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat9 = u_xlat9 * u_xlat2.x;
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat2.x = u_xlat9 * -2.0 + 3.0;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat9 = (-u_xlat2.x) * u_xlat9 + 1.0;
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat9 = u_xlat9 * vs_TEXCOORD0.x;
    u_xlat2.xy = u_xlat3.xy * vs_TEXCOORD0.xx;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat8.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(3.0, 3.0);
    u_xlat2.xy = u_xlat2.xy * u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy * u_xlat8.xy;
    u_xlat3.x = vs_TEXCOORD0.x * u_xlat2.x + u_xlat9;
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat16_1.x = max(_FrontBackCurve, 0.00100000005);
    u_xlat3.x = u_xlat3.x * u_xlat16_1.x;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat2.xz = (-vec2(_WidthFrontMul, _AlphaFrontMul)) + vec2(_WidthBackMul, _AlphaBackMul);
    u_xlat3.xz = u_xlat3.xx * u_xlat2.xz + vec2(_WidthFrontMul, _AlphaFrontMul);
    u_xlat3.xz = u_xlat3.xz * vec2(_WidthMul, _BaseAlpha);
    u_xlat2.x = (-vs_TEXCOORD0.x) + 1.0;
    u_xlat6 = u_xlat3.y * u_xlat2.x;
    u_xlat6 = clamp(u_xlat6, 0.0, 1.0);
    u_xlat2.x = u_xlat6 * -2.0 + 3.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    u_xlat6 = u_xlat6 * u_xlat2.x;
    u_xlat0.z = u_xlat6 * u_xlat2.y;
    u_xlat2.x = (-_EndThin) + 1.0;
    u_xlat2.x = u_xlat0.z * u_xlat2.x + _EndThin;
    u_xlat3.x = u_xlat3.x * u_xlat2.x;
    u_xlat0.xz = u_xlat0.xz * u_xlat3.xz;
    u_xlat0.x = max(u_xlat0.x, 0.0500000007);
    u_xlat3.x = vs_TEXCOORD0.y + -0.5;
    u_xlat0.x = (-u_xlat0.x) * 0.5 + abs(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat3.x;
    u_xlat9 = dFdx(vs_TEXCOORD0.y);
    u_xlat2.x = dFdy(vs_TEXCOORD0.y);
    u_xlat9 = abs(u_xlat9) + abs(u_xlat2.x);
    u_xlat9 = u_xlat9 * _FeatherBoost;
    u_xlat2.x = max(_ScreenParams.y, 1.0);
    u_xlat2.x = _FeatherMin / u_xlat2.x;
    u_xlat9 = max(u_xlat9, u_xlat2.x);
    u_xlat9 = float(1.0) / u_xlat9;
    u_xlat0.x = u_xlat9 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat9 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = (-u_xlat9) * u_xlat0.x + 1.0;
    SV_Target0.w = u_xlat0.x * u_xlat0.z;
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.x = min(abs(u_xlat3.x), 1.0);
    u_xlat3.x = (-u_xlat3.x) * u_xlat3.x + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = log2(u_xlat3.x);
    u_xlat3.x = u_xlat3.x * _CylPower;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _EdgePower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _EdgeBoost;
    u_xlat0.xzw = u_xlat0.xxx * _BaseColor.xyz;
    u_xlat2.x = u_xlat3.x * 0.550000012 + 0.649999976;
    u_xlat3.x = (-u_xlat3.x) + 1.0;
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat3.x = u_xlat3.x * 0.649999976 + 0.349999994;
    u_xlat0.xzw = _BaseColor.xyz * u_xlat2.xxx + u_xlat0.xzw;
    u_xlat2.x = _Time.y * _HiJitterSpeed;
    u_xlat2.x = vs_TEXCOORD0.x * _HiJitterFreq + u_xlat2.x;
    u_xlat5.x = floor(u_xlat2.x);
    u_xlat5.y = u_xlat5.x + 1.0;
    u_xlat2.yz = u_xlat5.xy * vec2(0.103100002, 0.103100002);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat11 = u_xlat2.z + 33.3300018;
    u_xlat8.x = u_xlat11 * u_xlat2.z;
    u_xlat11 = u_xlat8.x + u_xlat8.x;
    u_xlat5.y = u_xlat11 * u_xlat8.x;
    u_xlat11 = u_xlat2.y + 33.3300018;
    u_xlat5.x = u_xlat11 * u_xlat2.y;
    u_xlat11 = u_xlat5.x + u_xlat5.x;
    u_xlat5.x = u_xlat11 * u_xlat5.x;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat8.x = (-u_xlat5.x) + u_xlat5.y;
    u_xlat11 = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) * 2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat11;
    u_xlat2.x = u_xlat2.x * u_xlat8.x + u_xlat5.x;
    u_xlat2.x = u_xlat2.x + -0.5;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat5.x = _Time.y * _TwistSpeed;
    u_xlat5.x = vs_TEXCOORD0.x * _TwistFreq + u_xlat5.x;
    u_xlat5.x = sin(u_xlat5.x);
    u_xlat16_1.x = _HiOffset + 0.5;
    u_xlat5.x = u_xlat5.x * _TwistAmp + u_xlat16_1.x;
    u_xlat2.x = u_xlat2.x * _HiJitterAmp + u_xlat5.x;
    u_xlat5.x = _Time.y * _HiScroll + vs_TEXCOORD0.x;
    u_xlat5.x = fract(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + -0.5;
    u_xlat2.x = u_xlat5.x * 0.119999997 + u_xlat2.x;
    u_xlat2.x = (-u_xlat2.x) + vs_TEXCOORD0.y;
    u_xlat5.x = max(_HiWidth, 9.99999997e-07);
    u_xlat2.x = u_xlat2.x / u_xlat5.x;
    u_xlat2.x = u_xlat2.x * (-u_xlat2.x);
    u_xlat2.x = u_xlat2.x * 1.44269502;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat3.x = u_xlat3.x * u_xlat2.x;
    u_xlat3.x = u_xlat3.x * _HiStrength;
    u_xlat0.xyz = _HiColor.xyz * u_xlat3.xxx + u_xlat0.xzw;
    SV_Target0.xyz = u_xlat0.xyz;
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