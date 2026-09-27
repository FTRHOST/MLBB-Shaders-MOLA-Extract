//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/PieChart" {
Properties {

_Color ("颜色", Color) = (1,1,1,1)

_MainTex ("MainTex", 2D) = "white" { }

_StartAngle ("起始角度", Range(0, 360)) = 0.0

_Angle ("角度", Range(0, 360)) = 90.0

_Edge ("边缘间隔/描边粗细", Range(0, 0.1)) = 0.009999999776482582

[Toggle] _Edge_On ("边缘间隙", Float) = 1.0

[Toggle] _Outline_On ("显示描边", Float) = 0.0

_Outline_Color ("描边颜色", Color) = (1,1,1,1)

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
  GpuProgramID 46438
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
uniform 	float _Outline_On;
uniform 	float _Edge_On;
uniform 	float _Angle;
uniform 	float _Edge;
uniform 	float _StartAngle;
uniform 	vec3 _Color;
uniform 	vec3 _Outline_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
mediump float u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Angle<180.0);
#else
    u_xlatb0 = _Angle<180.0;
#endif
    u_xlat6.x = (-_Angle) + (-_StartAngle);
    u_xlat6.x = u_xlat6.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat6.x);
    u_xlat2 = cos(u_xlat6.x);
    u_xlat6.xy = vs_TEXCOORD0.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat18 = u_xlat6.x * u_xlat2 + u_xlat1.y;
    u_xlat1.x = u_xlat6.y * u_xlat2 + (-u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat1.x);
#else
    u_xlatb1 = 0.0>=u_xlat1.x;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat7 = u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(_Edge_On==0.0);
#else
    u_xlatb13 = _Edge_On==0.0;
#endif
    u_xlat19 = (u_xlatb13) ? 0.0 : _Edge;
    u_xlat7 = (-u_xlat7) + u_xlat19;
    u_xlat2 = float(1.0) / u_xlat19;
    u_xlat7 = u_xlat7 * u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat15.y = u_xlat7 * u_xlat8.x;
    u_xlat3.x = float(0.5);
    u_xlat15.x = float(0.5);
    u_xlat8.xy = (-u_xlat15.xy) + vec2(1.0, 1.0);
    u_xlat16_7 = texture(_MainTex, u_xlat8.xy).x;
    u_xlat7 = u_xlat1.x * u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0>=(-u_xlat18));
#else
    u_xlatb8 = 0.0>=(-u_xlat18);
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat14.x = u_xlat7 * u_xlat8.x + 1.0;
    u_xlat15.y = u_xlat7 * u_xlat8.x;
    u_xlat7 = u_xlat19 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat7>=u_xlat18);
#else
    u_xlatb18 = u_xlat7>=u_xlat18;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat1.x = (-u_xlat18) * u_xlat8.x + u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat14.x = _StartAngle * -0.0174532924;
    u_xlat4.x = sin(u_xlat14.x);
    u_xlat5 = cos(u_xlat14.x);
    u_xlat14.xy = u_xlat6.xy * u_xlat4.xx;
    u_xlat20 = u_xlat6.x * u_xlat5 + u_xlat14.y;
    u_xlat14.x = u_xlat6.y * u_xlat5 + (-u_xlat14.x);
    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat12 = (-u_xlat20);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat12 = (-u_xlat12) + u_xlat19;
    u_xlat12 = u_xlat2 * u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat19 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat3.y = u_xlat12 * u_xlat19;
    u_xlat3.xy = (-u_xlat3.xy) + vec2(1.0, 1.0);
    u_xlat16_12 = texture(_MainTex, u_xlat3.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=u_xlat14.x);
#else
    u_xlatb19 = 0.0>=u_xlat14.x;
#endif
    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat16_12 * u_xlat19;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=u_xlat20);
#else
    u_xlatb2 = 0.0>=u_xlat20;
#endif
    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat15.x = u_xlat12 * u_xlat2;
    u_xlat12 = u_xlat12 * u_xlat2 + 1.0;
    u_xlat16.x = u_xlat1.x * u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat7>=(-u_xlat20));
#else
    u_xlatb1 = u_xlat7>=(-u_xlat20);
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat19 * u_xlat1.x;
    u_xlat12 = (-u_xlat1.x) * u_xlat2 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16.y = u_xlat12 * u_xlat15.y;
    u_xlat3.zw = (bool(u_xlatb0)) ? u_xlat16.xy : u_xlat15.xy;
    u_xlat0.x = (-u_xlat6.x) + _Edge;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = float(1.0) / _Edge;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16.y = u_xlat0.x * u_xlat7;
    u_xlat4.x = float(0.5);
    u_xlat16.x = float(0.5);
    u_xlat3.x = texture(_MainTex, u_xlat16.xy).x;
    u_xlat0.x = _Edge * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=u_xlat6.x);
#else
    u_xlatb0 = u_xlat0.x>=u_xlat6.x;
#endif
    u_xlat3.y = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3 = (bool(u_xlatb13)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat3;
    u_xlat0.x = (-u_xlat3.x) + u_xlat3.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = fract((-u_xlat6.x));
    u_xlat12 = u_xlat12 * u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat4.y = u_xlat12 * u_xlat7;
    u_xlat16_12 = texture(_MainTex, u_xlat4.xy).x;
    u_xlat7 = (-_Edge) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat7>=u_xlat6.x);
#else
    u_xlatb6 = u_xlat7>=u_xlat6.x;
#endif
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat7 = u_xlat16_12 + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat6.x = (-u_xlat16_12) + u_xlat6.x;
    u_xlat12 = u_xlat8.x * u_xlat18;
    u_xlat13 = u_xlat2 * u_xlat1.x;
    u_xlat19 = max(u_xlat12, u_xlat13);
    u_xlat12 = max(u_xlat3.w, u_xlat12);
    u_xlat13 = max(u_xlat3.z, u_xlat13);
    u_xlat12 = max(u_xlat12, u_xlat13);
    u_xlat13 = (-u_xlat19) + u_xlat7;
    u_xlat13 = max(u_xlat13, 0.0);
    u_xlat0.x = (-u_xlat0.x) + u_xlat13;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat13 = max(u_xlat3.w, u_xlat3.z);
    u_xlat7 = u_xlat7 * u_xlat13;
    u_xlat0.x = u_xlat7 * u_xlat19 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = max(abs(u_xlat14.x), abs(u_xlat20));
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat13 = min(abs(u_xlat14.x), abs(u_xlat20));
    u_xlat7 = u_xlat7 * u_xlat13;
    u_xlat13 = u_xlat7 * u_xlat7;
    u_xlat19 = u_xlat13 * 0.0208350997 + -0.0851330012;
    u_xlat19 = u_xlat13 * u_xlat19 + 0.180141002;
    u_xlat19 = u_xlat13 * u_xlat19 + -0.330299497;
    u_xlat13 = u_xlat13 * u_xlat19 + 0.999866009;
    u_xlat19 = u_xlat13 * u_xlat7;
    u_xlat19 = u_xlat19 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat14.x)<abs(u_xlat20));
#else
    u_xlatb4 = abs(u_xlat14.x)<abs(u_xlat20);
#endif
    u_xlat19 = u_xlatb4 ? u_xlat19 : float(0.0);
    u_xlat7 = u_xlat7 * u_xlat13 + u_xlat19;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat14.x<(-u_xlat14.x));
#else
    u_xlatb13 = u_xlat14.x<(-u_xlat14.x);
#endif
    u_xlat13 = u_xlatb13 ? -3.14159274 : float(0.0);
    u_xlat7 = u_xlat13 + u_xlat7;
    u_xlat13 = min(u_xlat14.x, (-u_xlat20));
    u_xlat19 = max(u_xlat14.x, (-u_xlat20));
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat19>=(-u_xlat19));
#else
    u_xlatb19 = u_xlat19>=(-u_xlat19);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
    u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
    u_xlatb13 = u_xlatb19 && u_xlatb13;
    u_xlat7 = (u_xlatb13) ? (-u_xlat7) : u_xlat7;
    u_xlat7 = (-u_xlat7) * 57.2957802 + 180.0;
    u_xlat7 = u_xlat7 * 0.00277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat7>=(-u_xlat7));
#else
    u_xlatb13 = u_xlat7>=(-u_xlat7);
#endif
    u_xlat7 = fract(abs(u_xlat7));
    u_xlat7 = (u_xlatb13) ? u_xlat7 : (-u_xlat7);
    u_xlat7 = u_xlat7 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_Angle>=u_xlat7);
#else
    u_xlatb7 = _Angle>=u_xlat7;
#endif
    u_xlat7 = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat4.w = u_xlat0.x * u_xlat7;
    u_xlat0.x = u_xlat3.y + u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = max(u_xlat12, u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat12 = (-u_xlat12) + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat6.x = (-u_xlat3.z) + u_xlat6.x;
    u_xlat6.x = (-u_xlat3.w) + u_xlat6.x;
    u_xlat6.x = (-u_xlat1.x) * u_xlat2 + u_xlat6.x;
    u_xlat6.x = (-u_xlat18) * u_xlat8.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = min(u_xlat0.x, u_xlat6.x);
    u_xlat1.w = u_xlat12 * u_xlat7;
    u_xlat6.xyz = vec3(_Color.x, _Color.y, _Color.z) + (-_Outline_Color.xyz);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat6.xyz + _Outline_Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Outline_On));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Outline_On);
#endif
    u_xlat1.xyz = vec3(_Color.x, _Color.y, _Color.z);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat1;
    SV_Target0 = u_xlat0;
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
uniform 	float _Outline_On;
uniform 	float _Edge_On;
uniform 	float _Angle;
uniform 	float _Edge;
uniform 	float _StartAngle;
uniform 	vec3 _Color;
uniform 	vec3 _Outline_Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
mediump float u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_Angle<180.0);
#else
    u_xlatb0 = _Angle<180.0;
#endif
    u_xlat6.x = (-_Angle) + (-_StartAngle);
    u_xlat6.x = u_xlat6.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat6.x);
    u_xlat2 = cos(u_xlat6.x);
    u_xlat6.xy = vs_TEXCOORD0.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat18 = u_xlat6.x * u_xlat2 + u_xlat1.y;
    u_xlat1.x = u_xlat6.y * u_xlat2 + (-u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0>=u_xlat1.x);
#else
    u_xlatb1 = 0.0>=u_xlat1.x;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat7 = u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(_Edge_On==0.0);
#else
    u_xlatb13 = _Edge_On==0.0;
#endif
    u_xlat19 = (u_xlatb13) ? 0.0 : _Edge;
    u_xlat7 = (-u_xlat7) + u_xlat19;
    u_xlat2 = float(1.0) / u_xlat19;
    u_xlat7 = u_xlat7 * u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat8.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat15.y = u_xlat7 * u_xlat8.x;
    u_xlat3.x = float(0.5);
    u_xlat15.x = float(0.5);
    u_xlat8.xy = (-u_xlat15.xy) + vec2(1.0, 1.0);
    u_xlat16_7 = texture(_MainTex, u_xlat8.xy).x;
    u_xlat7 = u_xlat1.x * u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.0>=(-u_xlat18));
#else
    u_xlatb8 = 0.0>=(-u_xlat18);
#endif
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat14.x = u_xlat7 * u_xlat8.x + 1.0;
    u_xlat15.y = u_xlat7 * u_xlat8.x;
    u_xlat7 = u_xlat19 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat7>=u_xlat18);
#else
    u_xlatb18 = u_xlat7>=u_xlat18;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat1.x = (-u_xlat18) * u_xlat8.x + u_xlat14.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat14.x = _StartAngle * -0.0174532924;
    u_xlat4.x = sin(u_xlat14.x);
    u_xlat5 = cos(u_xlat14.x);
    u_xlat14.xy = u_xlat6.xy * u_xlat4.xx;
    u_xlat20 = u_xlat6.x * u_xlat5 + u_xlat14.y;
    u_xlat14.x = u_xlat6.y * u_xlat5 + (-u_xlat14.x);
    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat12 = (-u_xlat20);
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat12 = (-u_xlat12) + u_xlat19;
    u_xlat12 = u_xlat2 * u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat19 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat3.y = u_xlat12 * u_xlat19;
    u_xlat3.xy = (-u_xlat3.xy) + vec2(1.0, 1.0);
    u_xlat16_12 = texture(_MainTex, u_xlat3.xy).x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0>=u_xlat14.x);
#else
    u_xlatb19 = 0.0>=u_xlat14.x;
#endif
    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat16_12 * u_xlat19;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0>=u_xlat20);
#else
    u_xlatb2 = 0.0>=u_xlat20;
#endif
    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat15.x = u_xlat12 * u_xlat2;
    u_xlat12 = u_xlat12 * u_xlat2 + 1.0;
    u_xlat16.x = u_xlat1.x * u_xlat15.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat7>=(-u_xlat20));
#else
    u_xlatb1 = u_xlat7>=(-u_xlat20);
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat19 * u_xlat1.x;
    u_xlat12 = (-u_xlat1.x) * u_xlat2 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat16.y = u_xlat12 * u_xlat15.y;
    u_xlat3.zw = (bool(u_xlatb0)) ? u_xlat16.xy : u_xlat15.xy;
    u_xlat0.x = (-u_xlat6.x) + _Edge;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = float(1.0) / _Edge;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16.y = u_xlat0.x * u_xlat7;
    u_xlat4.x = float(0.5);
    u_xlat16.x = float(0.5);
    u_xlat3.x = texture(_MainTex, u_xlat16.xy).x;
    u_xlat0.x = _Edge * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=u_xlat6.x);
#else
    u_xlatb0 = u_xlat0.x>=u_xlat6.x;
#endif
    u_xlat3.y = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3 = (bool(u_xlatb13)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat3;
    u_xlat0.x = (-u_xlat3.x) + u_xlat3.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = fract((-u_xlat6.x));
    u_xlat12 = u_xlat12 * u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat4.y = u_xlat12 * u_xlat7;
    u_xlat16_12 = texture(_MainTex, u_xlat4.xy).x;
    u_xlat7 = (-_Edge) * 0.5 + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat7>=u_xlat6.x);
#else
    u_xlatb6 = u_xlat7>=u_xlat6.x;
#endif
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat7 = u_xlat16_12 + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat6.x = (-u_xlat16_12) + u_xlat6.x;
    u_xlat12 = u_xlat8.x * u_xlat18;
    u_xlat13 = u_xlat2 * u_xlat1.x;
    u_xlat19 = max(u_xlat12, u_xlat13);
    u_xlat12 = max(u_xlat3.w, u_xlat12);
    u_xlat13 = max(u_xlat3.z, u_xlat13);
    u_xlat12 = max(u_xlat12, u_xlat13);
    u_xlat13 = (-u_xlat19) + u_xlat7;
    u_xlat13 = max(u_xlat13, 0.0);
    u_xlat0.x = (-u_xlat0.x) + u_xlat13;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat13 = max(u_xlat3.w, u_xlat3.z);
    u_xlat7 = u_xlat7 * u_xlat13;
    u_xlat0.x = u_xlat7 * u_xlat19 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = max(abs(u_xlat14.x), abs(u_xlat20));
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat13 = min(abs(u_xlat14.x), abs(u_xlat20));
    u_xlat7 = u_xlat7 * u_xlat13;
    u_xlat13 = u_xlat7 * u_xlat7;
    u_xlat19 = u_xlat13 * 0.0208350997 + -0.0851330012;
    u_xlat19 = u_xlat13 * u_xlat19 + 0.180141002;
    u_xlat19 = u_xlat13 * u_xlat19 + -0.330299497;
    u_xlat13 = u_xlat13 * u_xlat19 + 0.999866009;
    u_xlat19 = u_xlat13 * u_xlat7;
    u_xlat19 = u_xlat19 * -2.0 + 1.57079637;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(abs(u_xlat14.x)<abs(u_xlat20));
#else
    u_xlatb4 = abs(u_xlat14.x)<abs(u_xlat20);
#endif
    u_xlat19 = u_xlatb4 ? u_xlat19 : float(0.0);
    u_xlat7 = u_xlat7 * u_xlat13 + u_xlat19;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat14.x<(-u_xlat14.x));
#else
    u_xlatb13 = u_xlat14.x<(-u_xlat14.x);
#endif
    u_xlat13 = u_xlatb13 ? -3.14159274 : float(0.0);
    u_xlat7 = u_xlat13 + u_xlat7;
    u_xlat13 = min(u_xlat14.x, (-u_xlat20));
    u_xlat19 = max(u_xlat14.x, (-u_xlat20));
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlat19>=(-u_xlat19));
#else
    u_xlatb19 = u_xlat19>=(-u_xlat19);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat13<(-u_xlat13));
#else
    u_xlatb13 = u_xlat13<(-u_xlat13);
#endif
    u_xlatb13 = u_xlatb19 && u_xlatb13;
    u_xlat7 = (u_xlatb13) ? (-u_xlat7) : u_xlat7;
    u_xlat7 = (-u_xlat7) * 57.2957802 + 180.0;
    u_xlat7 = u_xlat7 * 0.00277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat7>=(-u_xlat7));
#else
    u_xlatb13 = u_xlat7>=(-u_xlat7);
#endif
    u_xlat7 = fract(abs(u_xlat7));
    u_xlat7 = (u_xlatb13) ? u_xlat7 : (-u_xlat7);
    u_xlat7 = u_xlat7 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(_Angle>=u_xlat7);
#else
    u_xlatb7 = _Angle>=u_xlat7;
#endif
    u_xlat7 = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat4.w = u_xlat0.x * u_xlat7;
    u_xlat0.x = u_xlat3.y + u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat12 = max(u_xlat12, u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat12 = (-u_xlat12) + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat6.x = (-u_xlat3.z) + u_xlat6.x;
    u_xlat6.x = (-u_xlat3.w) + u_xlat6.x;
    u_xlat6.x = (-u_xlat1.x) * u_xlat2 + u_xlat6.x;
    u_xlat6.x = (-u_xlat18) * u_xlat8.x + u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = min(u_xlat0.x, u_xlat6.x);
    u_xlat1.w = u_xlat12 * u_xlat7;
    u_xlat6.xyz = vec3(_Color.x, _Color.y, _Color.z) + (-_Outline_Color.xyz);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat6.xyz + _Outline_Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Outline_On));
#else
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Outline_On);
#endif
    u_xlat1.xyz = vec3(_Color.x, _Color.y, _Color.z);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat1;
    SV_Target0 = u_xlat0;
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

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _Outline_On;
uniform 	float _Edge_On;
uniform 	float _Angle;
uniform 	float _Edge;
uniform 	float _StartAngle;
uniform 	vec3 _Color;
uniform 	vec3 _Outline_Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
lowp float u_xlat10_12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlatb0 = _Angle<180.0;
    u_xlat6.x = (-_Angle) + (-_StartAngle);
    u_xlat6.x = u_xlat6.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat6.x);
    u_xlat2 = cos(u_xlat6.x);
    u_xlat6.xy = vs_TEXCOORD0.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat18 = u_xlat6.x * u_xlat2 + u_xlat1.y;
    u_xlat1.x = u_xlat6.y * u_xlat2 + (-u_xlat1.x);
    u_xlatb1 = 0.0>=u_xlat1.x;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat7 = u_xlat18;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlatb13 = _Edge_On==0.0;
    u_xlat19 = (u_xlatb13) ? 0.0 : _Edge;
    u_xlat7 = (-u_xlat7) + u_xlat19;
    u_xlat2 = float(1.0) / u_xlat19;
    u_xlat7 = u_xlat7 * u_xlat2;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat8.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat15.y = u_xlat7 * u_xlat8.x;
    u_xlat3.x = float(0.5);
    u_xlat15.x = float(0.5);
    u_xlat8.xy = (-u_xlat15.xy) + vec2(1.0, 1.0);
    u_xlat10_7 = texture2D(_MainTex, u_xlat8.xy).x;
    u_xlat7 = u_xlat1.x * u_xlat10_7;
    u_xlatb8 = 0.0>=(-u_xlat18);
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat14.x = u_xlat7 * u_xlat8.x + 1.0;
    u_xlat15.y = u_xlat7 * u_xlat8.x;
    u_xlat7 = u_xlat19 * 0.5;
    u_xlatb18 = u_xlat7>=u_xlat18;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat1.x = (-u_xlat18) * u_xlat8.x + u_xlat14.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat14.x = _StartAngle * -0.0174532924;
    u_xlat4.x = sin(u_xlat14.x);
    u_xlat5 = cos(u_xlat14.x);
    u_xlat14.xy = u_xlat6.xy * u_xlat4.xx;
    u_xlat20 = u_xlat6.x * u_xlat5 + u_xlat14.y;
    u_xlat14.x = u_xlat6.y * u_xlat5 + (-u_xlat14.x);
    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat12 = (-u_xlat20);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat12 = (-u_xlat12) + u_xlat19;
    u_xlat12 = u_xlat2 * u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat19 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat3.y = u_xlat12 * u_xlat19;
    u_xlat3.xy = (-u_xlat3.xy) + vec2(1.0, 1.0);
    u_xlat10_12 = texture2D(_MainTex, u_xlat3.xy).x;
    u_xlatb19 = 0.0>=u_xlat14.x;
    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat10_12 * u_xlat19;
    u_xlatb2 = 0.0>=u_xlat20;
    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat15.x = u_xlat12 * u_xlat2;
    u_xlat12 = u_xlat12 * u_xlat2 + 1.0;
    u_xlat16.x = u_xlat1.x * u_xlat15.x;
    u_xlatb1 = u_xlat7>=(-u_xlat20);
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat19 * u_xlat1.x;
    u_xlat12 = (-u_xlat1.x) * u_xlat2 + u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16.y = u_xlat12 * u_xlat15.y;
    u_xlat3.zw = (bool(u_xlatb0)) ? u_xlat16.xy : u_xlat15.xy;
    u_xlat0.x = (-u_xlat6.x) + _Edge;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12 = float(1.0) / _Edge;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16.y = u_xlat0.x * u_xlat7;
    u_xlat4.x = float(0.5);
    u_xlat16.x = float(0.5);
    u_xlat3.x = texture2D(_MainTex, u_xlat16.xy).x;
    u_xlat0.x = _Edge * 0.5;
    u_xlatb0 = u_xlat0.x>=u_xlat6.x;
    u_xlat3.y = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3 = (bool(u_xlatb13)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat3;
    u_xlat0.x = (-u_xlat3.x) + u_xlat3.y;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = fract((-u_xlat6.x));
    u_xlat12 = u_xlat12 * u_xlat7;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat7 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat4.y = u_xlat12 * u_xlat7;
    u_xlat10_12 = texture2D(_MainTex, u_xlat4.xy).x;
    u_xlat7 = (-_Edge) * 0.5 + 1.0;
    u_xlatb6 = u_xlat7>=u_xlat6.x;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat7 = u_xlat10_12 + u_xlat6.x;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat6.x = (-u_xlat10_12) + u_xlat6.x;
    u_xlat12 = u_xlat8.x * u_xlat18;
    u_xlat13 = u_xlat2 * u_xlat1.x;
    u_xlat19 = max(u_xlat12, u_xlat13);
    u_xlat12 = max(u_xlat3.w, u_xlat12);
    u_xlat13 = max(u_xlat3.z, u_xlat13);
    u_xlat12 = max(u_xlat12, u_xlat13);
    u_xlat13 = (-u_xlat19) + u_xlat7;
    u_xlat13 = max(u_xlat13, 0.0);
    u_xlat0.x = (-u_xlat0.x) + u_xlat13;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat13 = max(u_xlat3.w, u_xlat3.z);
    u_xlat7 = u_xlat7 * u_xlat13;
    u_xlat0.x = u_xlat7 * u_xlat19 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = max(abs(u_xlat14.x), abs(u_xlat20));
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat13 = min(abs(u_xlat14.x), abs(u_xlat20));
    u_xlat7 = u_xlat7 * u_xlat13;
    u_xlat13 = u_xlat7 * u_xlat7;
    u_xlat19 = u_xlat13 * 0.0208350997 + -0.0851330012;
    u_xlat19 = u_xlat13 * u_xlat19 + 0.180141002;
    u_xlat19 = u_xlat13 * u_xlat19 + -0.330299497;
    u_xlat13 = u_xlat13 * u_xlat19 + 0.999866009;
    u_xlat19 = u_xlat13 * u_xlat7;
    u_xlat19 = u_xlat19 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat14.x)<abs(u_xlat20);
    u_xlat19 = u_xlatb4 ? u_xlat19 : float(0.0);
    u_xlat7 = u_xlat7 * u_xlat13 + u_xlat19;
    u_xlatb13 = u_xlat14.x<(-u_xlat14.x);
    u_xlat13 = u_xlatb13 ? -3.14159274 : float(0.0);
    u_xlat7 = u_xlat13 + u_xlat7;
    u_xlat13 = min(u_xlat14.x, (-u_xlat20));
    u_xlat19 = max(u_xlat14.x, (-u_xlat20));
    u_xlatb19 = u_xlat19>=(-u_xlat19);
    u_xlatb13 = u_xlat13<(-u_xlat13);
    u_xlatb13 = u_xlatb19 && u_xlatb13;
    u_xlat7 = (u_xlatb13) ? (-u_xlat7) : u_xlat7;
    u_xlat7 = (-u_xlat7) * 57.2957802 + 180.0;
    u_xlat7 = u_xlat7 * 0.00277777785;
    u_xlatb13 = u_xlat7>=(-u_xlat7);
    u_xlat7 = fract(abs(u_xlat7));
    u_xlat7 = (u_xlatb13) ? u_xlat7 : (-u_xlat7);
    u_xlat7 = u_xlat7 * 360.0;
    u_xlatb7 = _Angle>=u_xlat7;
    u_xlat7 = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat4.w = u_xlat0.x * u_xlat7;
    u_xlat0.x = u_xlat3.y + u_xlat3.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12 = max(u_xlat12, u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat12 = (-u_xlat12) + u_xlat6.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat6.x = (-u_xlat3.z) + u_xlat6.x;
    u_xlat6.x = (-u_xlat3.w) + u_xlat6.x;
    u_xlat6.x = (-u_xlat1.x) * u_xlat2 + u_xlat6.x;
    u_xlat6.x = (-u_xlat18) * u_xlat8.x + u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat6.x);
    u_xlat1.w = u_xlat12 * u_xlat7;
    u_xlat6.xyz = vec3(_Color.x, _Color.y, _Color.z) + (-_Outline_Color.xyz);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat6.xyz + _Outline_Color.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Outline_On);
    u_xlat1.xyz = vec3(_Color.x, _Color.y, _Color.z);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat1;
    SV_Target0 = u_xlat0;
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

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	float _Outline_On;
uniform 	float _Edge_On;
uniform 	float _Angle;
uniform 	float _Edge;
uniform 	float _StartAngle;
uniform 	vec3 _Color;
uniform 	vec3 _Outline_Color;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
vec4 u_xlat4;
bool u_xlatb4;
float u_xlat5;
vec3 u_xlat6;
bool u_xlatb6;
float u_xlat7;
lowp float u_xlat10_7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat12;
lowp float u_xlat10_12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat14;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlatb0 = _Angle<180.0;
    u_xlat6.x = (-_Angle) + (-_StartAngle);
    u_xlat6.x = u_xlat6.x * 0.0174532924;
    u_xlat1.x = sin(u_xlat6.x);
    u_xlat2 = cos(u_xlat6.x);
    u_xlat6.xy = vs_TEXCOORD0.yx * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat18 = u_xlat6.x * u_xlat2 + u_xlat1.y;
    u_xlat1.x = u_xlat6.y * u_xlat2 + (-u_xlat1.x);
    u_xlatb1 = 0.0>=u_xlat1.x;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat7 = u_xlat18;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlatb13 = _Edge_On==0.0;
    u_xlat19 = (u_xlatb13) ? 0.0 : _Edge;
    u_xlat7 = (-u_xlat7) + u_xlat19;
    u_xlat2 = float(1.0) / u_xlat19;
    u_xlat7 = u_xlat7 * u_xlat2;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat8.x = u_xlat7 * -2.0 + 3.0;
    u_xlat7 = u_xlat7 * u_xlat7;
    u_xlat15.y = u_xlat7 * u_xlat8.x;
    u_xlat3.x = float(0.5);
    u_xlat15.x = float(0.5);
    u_xlat8.xy = (-u_xlat15.xy) + vec2(1.0, 1.0);
    u_xlat10_7 = texture2D(_MainTex, u_xlat8.xy).x;
    u_xlat7 = u_xlat1.x * u_xlat10_7;
    u_xlatb8 = 0.0>=(-u_xlat18);
    u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat14.x = u_xlat7 * u_xlat8.x + 1.0;
    u_xlat15.y = u_xlat7 * u_xlat8.x;
    u_xlat7 = u_xlat19 * 0.5;
    u_xlatb18 = u_xlat7>=u_xlat18;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat18 = u_xlat1.x * u_xlat18;
    u_xlat1.x = (-u_xlat18) * u_xlat8.x + u_xlat14.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat14.x = _StartAngle * -0.0174532924;
    u_xlat4.x = sin(u_xlat14.x);
    u_xlat5 = cos(u_xlat14.x);
    u_xlat14.xy = u_xlat6.xy * u_xlat4.xx;
    u_xlat20 = u_xlat6.x * u_xlat5 + u_xlat14.y;
    u_xlat14.x = u_xlat6.y * u_xlat5 + (-u_xlat14.x);
    u_xlat6.x = dot(u_xlat6.xy, u_xlat6.xy);
    u_xlat6.x = sqrt(u_xlat6.x);
    u_xlat12 = (-u_xlat20);
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat12 = (-u_xlat12) + u_xlat19;
    u_xlat12 = u_xlat2 * u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat19 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat3.y = u_xlat12 * u_xlat19;
    u_xlat3.xy = (-u_xlat3.xy) + vec2(1.0, 1.0);
    u_xlat10_12 = texture2D(_MainTex, u_xlat3.xy).x;
    u_xlatb19 = 0.0>=u_xlat14.x;
    u_xlat19 = u_xlatb19 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat10_12 * u_xlat19;
    u_xlatb2 = 0.0>=u_xlat20;
    u_xlat2 = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat15.x = u_xlat12 * u_xlat2;
    u_xlat12 = u_xlat12 * u_xlat2 + 1.0;
    u_xlat16.x = u_xlat1.x * u_xlat15.x;
    u_xlatb1 = u_xlat7>=(-u_xlat20);
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat19 * u_xlat1.x;
    u_xlat12 = (-u_xlat1.x) * u_xlat2 + u_xlat12;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat16.y = u_xlat12 * u_xlat15.y;
    u_xlat3.zw = (bool(u_xlatb0)) ? u_xlat16.xy : u_xlat15.xy;
    u_xlat0.x = (-u_xlat6.x) + _Edge;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12 = float(1.0) / _Edge;
    u_xlat0.x = u_xlat12 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat16.y = u_xlat0.x * u_xlat7;
    u_xlat4.x = float(0.5);
    u_xlat16.x = float(0.5);
    u_xlat3.x = texture2D(_MainTex, u_xlat16.xy).x;
    u_xlat0.x = _Edge * 0.5;
    u_xlatb0 = u_xlat0.x>=u_xlat6.x;
    u_xlat3.y = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3 = (bool(u_xlatb13)) ? vec4(0.0, 0.0, 0.0, 0.0) : u_xlat3;
    u_xlat0.x = (-u_xlat3.x) + u_xlat3.y;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = fract((-u_xlat6.x));
    u_xlat12 = u_xlat12 * u_xlat7;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat7 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat4.y = u_xlat12 * u_xlat7;
    u_xlat10_12 = texture2D(_MainTex, u_xlat4.xy).x;
    u_xlat7 = (-_Edge) * 0.5 + 1.0;
    u_xlatb6 = u_xlat7>=u_xlat6.x;
    u_xlat6.x = u_xlatb6 ? 1.0 : float(0.0);
    u_xlat7 = u_xlat10_12 + u_xlat6.x;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat6.x = (-u_xlat10_12) + u_xlat6.x;
    u_xlat12 = u_xlat8.x * u_xlat18;
    u_xlat13 = u_xlat2 * u_xlat1.x;
    u_xlat19 = max(u_xlat12, u_xlat13);
    u_xlat12 = max(u_xlat3.w, u_xlat12);
    u_xlat13 = max(u_xlat3.z, u_xlat13);
    u_xlat12 = max(u_xlat12, u_xlat13);
    u_xlat13 = (-u_xlat19) + u_xlat7;
    u_xlat13 = max(u_xlat13, 0.0);
    u_xlat0.x = (-u_xlat0.x) + u_xlat13;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat13 = max(u_xlat3.w, u_xlat3.z);
    u_xlat7 = u_xlat7 * u_xlat13;
    u_xlat0.x = u_xlat7 * u_xlat19 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = max(abs(u_xlat14.x), abs(u_xlat20));
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat13 = min(abs(u_xlat14.x), abs(u_xlat20));
    u_xlat7 = u_xlat7 * u_xlat13;
    u_xlat13 = u_xlat7 * u_xlat7;
    u_xlat19 = u_xlat13 * 0.0208350997 + -0.0851330012;
    u_xlat19 = u_xlat13 * u_xlat19 + 0.180141002;
    u_xlat19 = u_xlat13 * u_xlat19 + -0.330299497;
    u_xlat13 = u_xlat13 * u_xlat19 + 0.999866009;
    u_xlat19 = u_xlat13 * u_xlat7;
    u_xlat19 = u_xlat19 * -2.0 + 1.57079637;
    u_xlatb4 = abs(u_xlat14.x)<abs(u_xlat20);
    u_xlat19 = u_xlatb4 ? u_xlat19 : float(0.0);
    u_xlat7 = u_xlat7 * u_xlat13 + u_xlat19;
    u_xlatb13 = u_xlat14.x<(-u_xlat14.x);
    u_xlat13 = u_xlatb13 ? -3.14159274 : float(0.0);
    u_xlat7 = u_xlat13 + u_xlat7;
    u_xlat13 = min(u_xlat14.x, (-u_xlat20));
    u_xlat19 = max(u_xlat14.x, (-u_xlat20));
    u_xlatb19 = u_xlat19>=(-u_xlat19);
    u_xlatb13 = u_xlat13<(-u_xlat13);
    u_xlatb13 = u_xlatb19 && u_xlatb13;
    u_xlat7 = (u_xlatb13) ? (-u_xlat7) : u_xlat7;
    u_xlat7 = (-u_xlat7) * 57.2957802 + 180.0;
    u_xlat7 = u_xlat7 * 0.00277777785;
    u_xlatb13 = u_xlat7>=(-u_xlat7);
    u_xlat7 = fract(abs(u_xlat7));
    u_xlat7 = (u_xlatb13) ? u_xlat7 : (-u_xlat7);
    u_xlat7 = u_xlat7 * 360.0;
    u_xlatb7 = _Angle>=u_xlat7;
    u_xlat7 = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat4.w = u_xlat0.x * u_xlat7;
    u_xlat0.x = u_xlat3.y + u_xlat3.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12 = max(u_xlat12, u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat12 = (-u_xlat12) + u_xlat6.x;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat6.x = (-u_xlat3.z) + u_xlat6.x;
    u_xlat6.x = (-u_xlat3.w) + u_xlat6.x;
    u_xlat6.x = (-u_xlat1.x) * u_xlat2 + u_xlat6.x;
    u_xlat6.x = (-u_xlat18) * u_xlat8.x + u_xlat6.x;
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
    u_xlat0.x = min(u_xlat0.x, u_xlat6.x);
    u_xlat1.w = u_xlat12 * u_xlat7;
    u_xlat6.xyz = vec3(_Color.x, _Color.y, _Color.z) + (-_Outline_Color.xyz);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat6.xyz + _Outline_Color.xyz;
    u_xlatb0 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Outline_On);
    u_xlat1.xyz = vec3(_Color.x, _Color.y, _Color.z);
    u_xlat0 = (bool(u_xlatb0)) ? u_xlat4 : u_xlat1;
    SV_Target0 = u_xlat0;
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