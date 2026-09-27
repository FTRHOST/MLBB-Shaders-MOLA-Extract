//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/Effect/AS_BlackWhiteComicFlash" {
Properties {

_Usage ("仅能用于Theseus工艺的皮肤特效", Float) = 1.0

_MainTex ("Texture", 2D) = "white" { }

_NoiseStyleTex ("NoiseStyleTex分辨率256", 2D) = "white" { }

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 31032
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	float _UseFlash;
uniform 	float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	vec4 _CenterAndSpeed;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseStyleTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_6;
bool u_xlatb7;
mediump float u_xlat16_11;
vec2 u_xlat12;
float u_xlat13;
float u_xlat15;
mediump float u_xlat16_15;
bool u_xlatb15;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
bool u_xlatb18;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
#endif
    if(!u_xlatb15){
        SV_Target0.xyz = u_xlat16_0.xyz;
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_1.x = _RadialScale + _RadialScale;
    u_xlat2.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat3.x = u_xlat16_1.x * u_xlat15;
    u_xlat12.x = min(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat17 = max(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat12.x = u_xlat17 * u_xlat12.x;
    u_xlat17 = u_xlat12.x * u_xlat12.x;
    u_xlat13 = u_xlat17 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat17 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat17 * u_xlat13 + -0.330299497;
    u_xlat17 = u_xlat17 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat17 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(abs(u_xlat2.y)<abs(u_xlat2.x));
#else
    u_xlatb18 = abs(u_xlat2.y)<abs(u_xlat2.x);
#endif
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlat13 = u_xlatb18 ? u_xlat13 : float(0.0);
    u_xlat12.x = u_xlat12.x * u_xlat17 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat2.y<(-u_xlat2.y));
#else
    u_xlatb17 = u_xlat2.y<(-u_xlat2.y);
#endif
    u_xlat17 = u_xlatb17 ? -3.14159274 : float(0.0);
    u_xlat12.x = u_xlat17 + u_xlat12.x;
    u_xlat17 = min(u_xlat2.y, u_xlat2.x);
    u_xlat2.x = max(u_xlat2.y, u_xlat2.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat17<(-u_xlat17));
#else
    u_xlatb7 = u_xlat17<(-u_xlat17);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlatb2 = u_xlatb2 && u_xlatb7;
    u_xlat2.x = (u_xlatb2) ? (-u_xlat12.x) : u_xlat12.x;
    u_xlat2.x = u_xlat2.x * _LengthScale;
    u_xlat3.y = u_xlat2.x * 0.159154579;
    u_xlat2.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat3.xy;
    u_xlat16_2 = texture(_NoiseStyleTex, u_xlat2.xy).x;
    u_xlat16_1.x = log2(u_xlat15);
    u_xlat16_1.x = u_xlat16_1.x * _ExplodeRange;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_1.x = _ExplodeProgress * u_xlat16_1.x + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2;
    u_xlat2.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat2.y = 1.0;
    u_xlat2.xy = u_xlat2.xy * u_xlat12.xy;
    u_xlat16_15 = texture(_NoiseStyleTex, u_xlat2.xy).y;
    u_xlat16_6.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_1.x + u_xlat16_6.x;
    u_xlat16_1.x = u_xlat16_1.x + (-_BlackWhiteThreshold);
    u_xlat16_6.x = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_11 = u_xlat16_1.x * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex));
#else
    u_xlatb2 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
#endif
    u_xlat16_16 = u_xlat16_15 * _StyleStr;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_1.x + u_xlat16_16;
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_1.x + (-u_xlat16_16);
    u_xlat16_1.x = (-u_xlat16_4.x) + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_11 * u_xlat16_1.x + u_xlat16_4.x;
    u_xlat16_1.x = (u_xlatb2) ? u_xlat16_1.x : u_xlat16_11;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = (-u_xlat16_0.xyz) + _FirstColor.xyz;
    u_xlat16_6.xyz = _FirstColor.www * u_xlat16_6.xyz + u_xlat16_0.xyz;
    u_xlat16_4.xyz = (-u_xlat16_0.xyz) + _SecondColor.xyz;
    u_xlat16_4.xyz = _SecondColor.www * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_6.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	float _UseFlash;
uniform 	float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	vec4 _CenterAndSpeed;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseStyleTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump float u_xlat16_2;
bool u_xlatb2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_6;
bool u_xlatb7;
mediump float u_xlat16_11;
vec2 u_xlat12;
float u_xlat13;
float u_xlat15;
mediump float u_xlat16_15;
bool u_xlatb15;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
bool u_xlatb18;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
#endif
    if(!u_xlatb15){
        SV_Target0.xyz = u_xlat16_0.xyz;
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_1.x = _RadialScale + _RadialScale;
    u_xlat2.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat3.x = u_xlat16_1.x * u_xlat15;
    u_xlat12.x = min(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat17 = max(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat12.x = u_xlat17 * u_xlat12.x;
    u_xlat17 = u_xlat12.x * u_xlat12.x;
    u_xlat13 = u_xlat17 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat17 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat17 * u_xlat13 + -0.330299497;
    u_xlat17 = u_xlat17 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat17 * u_xlat12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(abs(u_xlat2.y)<abs(u_xlat2.x));
#else
    u_xlatb18 = abs(u_xlat2.y)<abs(u_xlat2.x);
#endif
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlat13 = u_xlatb18 ? u_xlat13 : float(0.0);
    u_xlat12.x = u_xlat12.x * u_xlat17 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat2.y<(-u_xlat2.y));
#else
    u_xlatb17 = u_xlat2.y<(-u_xlat2.y);
#endif
    u_xlat17 = u_xlatb17 ? -3.14159274 : float(0.0);
    u_xlat12.x = u_xlat17 + u_xlat12.x;
    u_xlat17 = min(u_xlat2.y, u_xlat2.x);
    u_xlat2.x = max(u_xlat2.y, u_xlat2.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat17<(-u_xlat17));
#else
    u_xlatb7 = u_xlat17<(-u_xlat17);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlatb2 = u_xlatb2 && u_xlatb7;
    u_xlat2.x = (u_xlatb2) ? (-u_xlat12.x) : u_xlat12.x;
    u_xlat2.x = u_xlat2.x * _LengthScale;
    u_xlat3.y = u_xlat2.x * 0.159154579;
    u_xlat2.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat3.xy;
    u_xlat16_2 = texture(_NoiseStyleTex, u_xlat2.xy).x;
    u_xlat16_1.x = log2(u_xlat15);
    u_xlat16_1.x = u_xlat16_1.x * _ExplodeRange;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_1.x = _ExplodeProgress * u_xlat16_1.x + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2;
    u_xlat2.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat2.y = 1.0;
    u_xlat2.xy = u_xlat2.xy * u_xlat12.xy;
    u_xlat16_15 = texture(_NoiseStyleTex, u_xlat2.xy).y;
    u_xlat16_6.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_1.x + u_xlat16_6.x;
    u_xlat16_1.x = u_xlat16_1.x + (-_BlackWhiteThreshold);
    u_xlat16_6.x = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_11 = u_xlat16_1.x * u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex));
#else
    u_xlatb2 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
#endif
    u_xlat16_16 = u_xlat16_15 * _StyleStr;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_1.x + u_xlat16_16;
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_1.x + (-u_xlat16_16);
    u_xlat16_1.x = (-u_xlat16_4.x) + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_11 * u_xlat16_1.x + u_xlat16_4.x;
    u_xlat16_1.x = (u_xlatb2) ? u_xlat16_1.x : u_xlat16_11;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = (-u_xlat16_0.xyz) + _FirstColor.xyz;
    u_xlat16_6.xyz = _FirstColor.www * u_xlat16_6.xyz + u_xlat16_0.xyz;
    u_xlat16_4.xyz = (-u_xlat16_0.xyz) + _SecondColor.xyz;
    u_xlat16_4.xyz = _SecondColor.www * u_xlat16_4.xyz + u_xlat16_0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_6.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	float _UseFlash;
uniform 	float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	vec4 _CenterAndSpeed;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseStyleTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
bool u_xlatb2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_6;
bool u_xlatb7;
mediump float u_xlat16_11;
vec2 u_xlat12;
float u_xlat13;
float u_xlat15;
lowp float u_xlat10_15;
bool u_xlatb15;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
bool u_xlatb18;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
    if(!u_xlatb15){
        SV_Target0.xyz = u_xlat10_0.xyz;
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_1.x = _RadialScale + _RadialScale;
    u_xlat2.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat3.x = u_xlat16_1.x * u_xlat15;
    u_xlat12.x = min(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat17 = max(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat12.x = u_xlat17 * u_xlat12.x;
    u_xlat17 = u_xlat12.x * u_xlat12.x;
    u_xlat13 = u_xlat17 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat17 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat17 * u_xlat13 + -0.330299497;
    u_xlat17 = u_xlat17 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat17 * u_xlat12.x;
    u_xlatb18 = abs(u_xlat2.y)<abs(u_xlat2.x);
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlat13 = u_xlatb18 ? u_xlat13 : float(0.0);
    u_xlat12.x = u_xlat12.x * u_xlat17 + u_xlat13;
    u_xlatb17 = u_xlat2.y<(-u_xlat2.y);
    u_xlat17 = u_xlatb17 ? -3.14159274 : float(0.0);
    u_xlat12.x = u_xlat17 + u_xlat12.x;
    u_xlat17 = min(u_xlat2.y, u_xlat2.x);
    u_xlat2.x = max(u_xlat2.y, u_xlat2.x);
    u_xlatb7 = u_xlat17<(-u_xlat17);
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlatb2 = u_xlatb2 && u_xlatb7;
    u_xlat2.x = (u_xlatb2) ? (-u_xlat12.x) : u_xlat12.x;
    u_xlat2.x = u_xlat2.x * _LengthScale;
    u_xlat3.y = u_xlat2.x * 0.159154579;
    u_xlat2.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat3.xy;
    u_xlat10_2 = texture2D(_NoiseStyleTex, u_xlat2.xy).x;
    u_xlat16_1.x = log2(u_xlat15);
    u_xlat16_1.x = u_xlat16_1.x * _ExplodeRange;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_1.x = _ExplodeProgress * u_xlat16_1.x + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat10_2;
    u_xlat2.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat2.y = 1.0;
    u_xlat2.xy = u_xlat2.xy * u_xlat12.xy;
    u_xlat10_15 = texture2D(_NoiseStyleTex, u_xlat2.xy).y;
    u_xlat16_6.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_1.x + u_xlat16_6.x;
    u_xlat16_1.x = u_xlat16_1.x + (-_BlackWhiteThreshold);
    u_xlat16_6.x = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_11 = u_xlat16_1.x * u_xlat16_6.x;
    u_xlatb2 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
    u_xlat16_16 = u_xlat10_15 * _StyleStr;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_1.x + u_xlat16_16;
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_1.x + (-u_xlat16_16);
    u_xlat16_1.x = (-u_xlat16_4.x) + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_11 * u_xlat16_1.x + u_xlat16_4.x;
    u_xlat16_1.x = (u_xlatb2) ? u_xlat16_1.x : u_xlat16_11;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_6.xyz = (-u_xlat10_0.xyz) + _FirstColor.xyz;
    u_xlat16_6.xyz = _FirstColor.www * u_xlat16_6.xyz + u_xlat10_0.xyz;
    u_xlat16_4.xyz = (-u_xlat10_0.xyz) + _SecondColor.xyz;
    u_xlat16_4.xyz = _SecondColor.www * u_xlat16_4.xyz + u_xlat10_0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_6.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	float _UseFlash;
uniform 	float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	vec4 _CenterAndSpeed;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseStyleTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
lowp float u_xlat10_2;
bool u_xlatb2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_6;
bool u_xlatb7;
mediump float u_xlat16_11;
vec2 u_xlat12;
float u_xlat13;
float u_xlat15;
lowp float u_xlat10_15;
bool u_xlatb15;
mediump float u_xlat16_16;
float u_xlat17;
bool u_xlatb17;
bool u_xlatb18;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
    if(!u_xlatb15){
        SV_Target0.xyz = u_xlat10_0.xyz;
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_1.x = _RadialScale + _RadialScale;
    u_xlat2.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat15 = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat3.x = u_xlat16_1.x * u_xlat15;
    u_xlat12.x = min(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat17 = max(abs(u_xlat2.y), abs(u_xlat2.x));
    u_xlat17 = float(1.0) / u_xlat17;
    u_xlat12.x = u_xlat17 * u_xlat12.x;
    u_xlat17 = u_xlat12.x * u_xlat12.x;
    u_xlat13 = u_xlat17 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat17 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat17 * u_xlat13 + -0.330299497;
    u_xlat17 = u_xlat17 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat17 * u_xlat12.x;
    u_xlatb18 = abs(u_xlat2.y)<abs(u_xlat2.x);
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlat13 = u_xlatb18 ? u_xlat13 : float(0.0);
    u_xlat12.x = u_xlat12.x * u_xlat17 + u_xlat13;
    u_xlatb17 = u_xlat2.y<(-u_xlat2.y);
    u_xlat17 = u_xlatb17 ? -3.14159274 : float(0.0);
    u_xlat12.x = u_xlat17 + u_xlat12.x;
    u_xlat17 = min(u_xlat2.y, u_xlat2.x);
    u_xlat2.x = max(u_xlat2.y, u_xlat2.x);
    u_xlatb7 = u_xlat17<(-u_xlat17);
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlatb2 = u_xlatb2 && u_xlatb7;
    u_xlat2.x = (u_xlatb2) ? (-u_xlat12.x) : u_xlat12.x;
    u_xlat2.x = u_xlat2.x * _LengthScale;
    u_xlat3.y = u_xlat2.x * 0.159154579;
    u_xlat2.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat3.xy;
    u_xlat10_2 = texture2D(_NoiseStyleTex, u_xlat2.xy).x;
    u_xlat16_1.x = log2(u_xlat15);
    u_xlat16_1.x = u_xlat16_1.x * _ExplodeRange;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_1.x + -1.0;
    u_xlat16_1.x = _ExplodeProgress * u_xlat16_1.x + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat10_2;
    u_xlat2.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat12.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat2.y = 1.0;
    u_xlat2.xy = u_xlat2.xy * u_xlat12.xy;
    u_xlat10_15 = texture2D(_NoiseStyleTex, u_xlat2.xy).y;
    u_xlat16_6.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_1.x + u_xlat16_6.x;
    u_xlat16_1.x = u_xlat16_1.x + (-_BlackWhiteThreshold);
    u_xlat16_6.x = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_1.x;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_6.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_11 = u_xlat16_1.x * u_xlat16_6.x;
    u_xlatb2 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
    u_xlat16_16 = u_xlat10_15 * _StyleStr;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_1.x + u_xlat16_16;
    u_xlat16_1.x = u_xlat16_6.x * u_xlat16_1.x + (-u_xlat16_16);
    u_xlat16_1.x = (-u_xlat16_4.x) + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_11 * u_xlat16_1.x + u_xlat16_4.x;
    u_xlat16_1.x = (u_xlatb2) ? u_xlat16_1.x : u_xlat16_11;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_6.xyz = (-u_xlat10_0.xyz) + _FirstColor.xyz;
    u_xlat16_6.xyz = _FirstColor.www * u_xlat16_6.xyz + u_xlat10_0.xyz;
    u_xlat16_4.xyz = (-u_xlat10_0.xyz) + _SecondColor.xyz;
    u_xlat16_4.xyz = _SecondColor.www * u_xlat16_4.xyz + u_xlat10_0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_6.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	float _UseFlash;
uniform 	float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	vec4 _CenterAndSpeed;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseStyleTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
vec2 u_xlat11;
mediump float u_xlat16_12;
float u_xlat13;
float u_xlat15;
mediump float u_xlat16_15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
bool u_xlatb18;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
#endif
    if(!u_xlatb15){
        u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
        u_xlat1.xyz = log2(u_xlat16_2.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
        u_xlat1.xyz = exp2(u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
        SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_2.x = _RadialScale + _RadialScale;
    u_xlat1.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat3.x = u_xlat16_2.x * u_xlat15;
    u_xlat11.x = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat16 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat16 = float(1.0) / u_xlat16;
    u_xlat11.x = u_xlat16 * u_xlat11.x;
    u_xlat16 = u_xlat11.x * u_xlat11.x;
    u_xlat13 = u_xlat16 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat16 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat16 * u_xlat13 + -0.330299497;
    u_xlat16 = u_xlat16 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat16 * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb18 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlat13 = u_xlatb18 ? u_xlat13 : float(0.0);
    u_xlat11.x = u_xlat11.x * u_xlat16 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb16 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat16 = u_xlatb16 ? -3.14159274 : float(0.0);
    u_xlat11.x = u_xlat16 + u_xlat11.x;
    u_xlat16 = min(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16<(-u_xlat16));
#else
    u_xlatb6 = u_xlat16<(-u_xlat16);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb6;
    u_xlat1.x = (u_xlatb1) ? (-u_xlat11.x) : u_xlat11.x;
    u_xlat1.x = u_xlat1.x * _LengthScale;
    u_xlat3.y = u_xlat1.x * 0.159154579;
    u_xlat1.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat3.xy;
    u_xlat16_1 = texture(_NoiseStyleTex, u_xlat1.xy).x;
    u_xlat16_2.x = log2(u_xlat15);
    u_xlat16_2.x = u_xlat16_2.x * _ExplodeRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + -1.0;
    u_xlat16_2.x = _ExplodeProgress * u_xlat16_2.x + 1.0;
    u_xlat16_2.x = u_xlat16_1 * u_xlat16_2.x;
    u_xlat1.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat11.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat1.y = 1.0;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat16_15 = texture(_NoiseStyleTex, u_xlat1.xy).y;
    u_xlat16_7.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.x = u_xlat16_7.x * u_xlat16_2.x + u_xlat16_7.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_BlackWhiteThreshold);
    u_xlat16_7.x = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_2.x = u_xlat16_7.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_12 = u_xlat16_2.x * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
#endif
    u_xlat16_17 = u_xlat16_15 * _StyleStr;
    u_xlat16_4.x = u_xlat16_7.x * u_xlat16_2.x + u_xlat16_17;
    u_xlat16_2.x = u_xlat16_7.x * u_xlat16_2.x + (-u_xlat16_17);
    u_xlat16_2.x = (-u_xlat16_4.x) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_12 * u_xlat16_2.x + u_xlat16_4.x;
    u_xlat16_2.x = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_12;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = _FirstColor.xyz * _FirstColor.xyz + (-u_xlat0.xyz);
    u_xlat16_7.xyz = _FirstColor.www * u_xlat16_7.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = _SecondColor.xyz * _SecondColor.xyz + (-u_xlat0.xyz);
    u_xlat16_4.xyz = _SecondColor.www * u_xlat16_4.xyz + u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_4.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_7.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	float _UseFlash;
uniform 	float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	vec4 _CenterAndSpeed;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseStyleTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
vec2 u_xlat11;
mediump float u_xlat16_12;
float u_xlat13;
float u_xlat15;
mediump float u_xlat16_15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
bool u_xlatb18;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash));
#else
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
#endif
    if(!u_xlatb15){
        u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
        u_xlat1.xyz = log2(u_xlat16_2.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
        u_xlat1.xyz = exp2(u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
        SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_2.x = _RadialScale + _RadialScale;
    u_xlat1.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat3.x = u_xlat16_2.x * u_xlat15;
    u_xlat11.x = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat16 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat16 = float(1.0) / u_xlat16;
    u_xlat11.x = u_xlat16 * u_xlat11.x;
    u_xlat16 = u_xlat11.x * u_xlat11.x;
    u_xlat13 = u_xlat16 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat16 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat16 * u_xlat13 + -0.330299497;
    u_xlat16 = u_xlat16 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat16 * u_xlat11.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(abs(u_xlat1.y)<abs(u_xlat1.x));
#else
    u_xlatb18 = abs(u_xlat1.y)<abs(u_xlat1.x);
#endif
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlat13 = u_xlatb18 ? u_xlat13 : float(0.0);
    u_xlat11.x = u_xlat11.x * u_xlat16 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlat1.y<(-u_xlat1.y));
#else
    u_xlatb16 = u_xlat1.y<(-u_xlat1.y);
#endif
    u_xlat16 = u_xlatb16 ? -3.14159274 : float(0.0);
    u_xlat11.x = u_xlat16 + u_xlat11.x;
    u_xlat16 = min(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat16<(-u_xlat16));
#else
    u_xlatb6 = u_xlat16<(-u_xlat16);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb6;
    u_xlat1.x = (u_xlatb1) ? (-u_xlat11.x) : u_xlat11.x;
    u_xlat1.x = u_xlat1.x * _LengthScale;
    u_xlat3.y = u_xlat1.x * 0.159154579;
    u_xlat1.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat3.xy;
    u_xlat16_1 = texture(_NoiseStyleTex, u_xlat1.xy).x;
    u_xlat16_2.x = log2(u_xlat15);
    u_xlat16_2.x = u_xlat16_2.x * _ExplodeRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + -1.0;
    u_xlat16_2.x = _ExplodeProgress * u_xlat16_2.x + 1.0;
    u_xlat16_2.x = u_xlat16_1 * u_xlat16_2.x;
    u_xlat1.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat11.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat1.y = 1.0;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat16_15 = texture(_NoiseStyleTex, u_xlat1.xy).y;
    u_xlat16_7.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.x = u_xlat16_7.x * u_xlat16_2.x + u_xlat16_7.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_BlackWhiteThreshold);
    u_xlat16_7.x = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_2.x = u_xlat16_7.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_12 = u_xlat16_2.x * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex));
#else
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
#endif
    u_xlat16_17 = u_xlat16_15 * _StyleStr;
    u_xlat16_4.x = u_xlat16_7.x * u_xlat16_2.x + u_xlat16_17;
    u_xlat16_2.x = u_xlat16_7.x * u_xlat16_2.x + (-u_xlat16_17);
    u_xlat16_2.x = (-u_xlat16_4.x) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_12 * u_xlat16_2.x + u_xlat16_4.x;
    u_xlat16_2.x = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_12;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = _FirstColor.xyz * _FirstColor.xyz + (-u_xlat0.xyz);
    u_xlat16_7.xyz = _FirstColor.www * u_xlat16_7.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = _SecondColor.xyz * _SecondColor.xyz + (-u_xlat0.xyz);
    u_xlat16_4.xyz = _SecondColor.www * u_xlat16_4.xyz + u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_4.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_7.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	float _UseFlash;
uniform 	float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	vec4 _CenterAndSpeed;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseStyleTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
vec2 u_xlat11;
mediump float u_xlat16_12;
float u_xlat13;
float u_xlat15;
lowp float u_xlat10_15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
bool u_xlatb18;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
    if(!u_xlatb15){
        u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
        u_xlat1.xyz = log2(u_xlat16_2.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
        u_xlat1.xyz = exp2(u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
        SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_2.x = _RadialScale + _RadialScale;
    u_xlat1.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat3.x = u_xlat16_2.x * u_xlat15;
    u_xlat11.x = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat16 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat16 = float(1.0) / u_xlat16;
    u_xlat11.x = u_xlat16 * u_xlat11.x;
    u_xlat16 = u_xlat11.x * u_xlat11.x;
    u_xlat13 = u_xlat16 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat16 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat16 * u_xlat13 + -0.330299497;
    u_xlat16 = u_xlat16 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat16 * u_xlat11.x;
    u_xlatb18 = abs(u_xlat1.y)<abs(u_xlat1.x);
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlat13 = u_xlatb18 ? u_xlat13 : float(0.0);
    u_xlat11.x = u_xlat11.x * u_xlat16 + u_xlat13;
    u_xlatb16 = u_xlat1.y<(-u_xlat1.y);
    u_xlat16 = u_xlatb16 ? -3.14159274 : float(0.0);
    u_xlat11.x = u_xlat16 + u_xlat11.x;
    u_xlat16 = min(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
    u_xlatb6 = u_xlat16<(-u_xlat16);
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb1 = u_xlatb1 && u_xlatb6;
    u_xlat1.x = (u_xlatb1) ? (-u_xlat11.x) : u_xlat11.x;
    u_xlat1.x = u_xlat1.x * _LengthScale;
    u_xlat3.y = u_xlat1.x * 0.159154579;
    u_xlat1.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat3.xy;
    u_xlat10_1 = texture2D(_NoiseStyleTex, u_xlat1.xy).x;
    u_xlat16_2.x = log2(u_xlat15);
    u_xlat16_2.x = u_xlat16_2.x * _ExplodeRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + -1.0;
    u_xlat16_2.x = _ExplodeProgress * u_xlat16_2.x + 1.0;
    u_xlat16_2.x = u_xlat10_1 * u_xlat16_2.x;
    u_xlat1.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat11.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat1.y = 1.0;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat10_15 = texture2D(_NoiseStyleTex, u_xlat1.xy).y;
    u_xlat16_7.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.x = u_xlat16_7.x * u_xlat16_2.x + u_xlat16_7.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_BlackWhiteThreshold);
    u_xlat16_7.x = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_2.x = u_xlat16_7.x * u_xlat16_2.x;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_12 = u_xlat16_2.x * u_xlat16_7.x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
    u_xlat16_17 = u_xlat10_15 * _StyleStr;
    u_xlat16_4.x = u_xlat16_7.x * u_xlat16_2.x + u_xlat16_17;
    u_xlat16_2.x = u_xlat16_7.x * u_xlat16_2.x + (-u_xlat16_17);
    u_xlat16_2.x = (-u_xlat16_4.x) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_12 * u_xlat16_2.x + u_xlat16_4.x;
    u_xlat16_2.x = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_12;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_7.xyz = _FirstColor.xyz * _FirstColor.xyz + (-u_xlat0.xyz);
    u_xlat16_7.xyz = _FirstColor.www * u_xlat16_7.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = _SecondColor.xyz * _SecondColor.xyz + (-u_xlat0.xyz);
    u_xlat16_4.xyz = _SecondColor.www * u_xlat16_4.xyz + u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_4.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_7.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec2 vs_TEXCOORD2;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _ScreenParams;
uniform 	float _UseFlash;
uniform 	float _UseStyleTex;
uniform 	mediump float _RadialScale;
uniform 	mediump float _LengthScale;
uniform 	vec4 _CenterAndSpeed;
uniform 	mediump float _BlackWhiteThreshold;
uniform 	mediump float _BlackWhiteSmooth;
uniform 	mediump float _StyleUvScale;
uniform 	mediump float _StyleStr;
uniform 	mediump vec4 _FirstColor;
uniform 	mediump vec4 _SecondColor;
uniform 	mediump float _ExplodeProgress;
uniform 	mediump float _ExplodeRange;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _NoiseStyleTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp float u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
mediump vec3 u_xlat16_4;
bool u_xlatb6;
mediump vec3 u_xlat16_7;
vec2 u_xlat11;
mediump float u_xlat16_12;
float u_xlat13;
float u_xlat15;
lowp float u_xlat10_15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
mediump float u_xlat16_17;
bool u_xlatb18;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlatb15 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseFlash);
    if(!u_xlatb15){
        u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
        u_xlat1.xyz = log2(u_xlat16_2.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
        u_xlat1.xyz = exp2(u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
        SV_Target0.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
        SV_Target0.w = 1.0;
        return;
    }
    u_xlat16_2.x = _RadialScale + _RadialScale;
    u_xlat1.xy = vs_TEXCOORD1.xy + (-_CenterAndSpeed.xy);
    u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat15 = sqrt(u_xlat15);
    u_xlat3.x = u_xlat16_2.x * u_xlat15;
    u_xlat11.x = min(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat16 = max(abs(u_xlat1.y), abs(u_xlat1.x));
    u_xlat16 = float(1.0) / u_xlat16;
    u_xlat11.x = u_xlat16 * u_xlat11.x;
    u_xlat16 = u_xlat11.x * u_xlat11.x;
    u_xlat13 = u_xlat16 * 0.0208350997 + -0.0851330012;
    u_xlat13 = u_xlat16 * u_xlat13 + 0.180141002;
    u_xlat13 = u_xlat16 * u_xlat13 + -0.330299497;
    u_xlat16 = u_xlat16 * u_xlat13 + 0.999866009;
    u_xlat13 = u_xlat16 * u_xlat11.x;
    u_xlatb18 = abs(u_xlat1.y)<abs(u_xlat1.x);
    u_xlat13 = u_xlat13 * -2.0 + 1.57079637;
    u_xlat13 = u_xlatb18 ? u_xlat13 : float(0.0);
    u_xlat11.x = u_xlat11.x * u_xlat16 + u_xlat13;
    u_xlatb16 = u_xlat1.y<(-u_xlat1.y);
    u_xlat16 = u_xlatb16 ? -3.14159274 : float(0.0);
    u_xlat11.x = u_xlat16 + u_xlat11.x;
    u_xlat16 = min(u_xlat1.y, u_xlat1.x);
    u_xlat1.x = max(u_xlat1.y, u_xlat1.x);
    u_xlatb6 = u_xlat16<(-u_xlat16);
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb1 = u_xlatb1 && u_xlatb6;
    u_xlat1.x = (u_xlatb1) ? (-u_xlat11.x) : u_xlat11.x;
    u_xlat1.x = u_xlat1.x * _LengthScale;
    u_xlat3.y = u_xlat1.x * 0.159154579;
    u_xlat1.xy = (-_Time.xx) * _CenterAndSpeed.zw + u_xlat3.xy;
    u_xlat10_1 = texture2D(_NoiseStyleTex, u_xlat1.xy).x;
    u_xlat16_2.x = log2(u_xlat15);
    u_xlat16_2.x = u_xlat16_2.x * _ExplodeRange;
    u_xlat16_2.x = exp2(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + -1.0;
    u_xlat16_2.x = _ExplodeProgress * u_xlat16_2.x + 1.0;
    u_xlat16_2.x = u_xlat10_1 * u_xlat16_2.x;
    u_xlat1.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat11.xy = vs_TEXCOORD1.xy * vec2(vec2(_StyleUvScale, _StyleUvScale));
    u_xlat1.y = 1.0;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat10_15 = texture2D(_NoiseStyleTex, u_xlat1.xy).y;
    u_xlat16_7.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.x = u_xlat16_7.x * u_xlat16_2.x + u_xlat16_7.x;
    u_xlat16_2.x = u_xlat16_2.x + (-_BlackWhiteThreshold);
    u_xlat16_7.x = float(1.0) / _BlackWhiteSmooth;
    u_xlat16_2.x = u_xlat16_7.x * u_xlat16_2.x;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_12 = u_xlat16_2.x * u_xlat16_7.x;
    u_xlatb1 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseStyleTex);
    u_xlat16_17 = u_xlat10_15 * _StyleStr;
    u_xlat16_4.x = u_xlat16_7.x * u_xlat16_2.x + u_xlat16_17;
    u_xlat16_2.x = u_xlat16_7.x * u_xlat16_2.x + (-u_xlat16_17);
    u_xlat16_2.x = (-u_xlat16_4.x) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_12 * u_xlat16_2.x + u_xlat16_4.x;
    u_xlat16_2.x = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_12;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_7.xyz = _FirstColor.xyz * _FirstColor.xyz + (-u_xlat0.xyz);
    u_xlat16_7.xyz = _FirstColor.www * u_xlat16_7.xyz + u_xlat0.xyz;
    u_xlat16_4.xyz = _SecondColor.xyz * _SecondColor.xyz + (-u_xlat0.xyz);
    u_xlat16_4.xyz = _SecondColor.www * u_xlat16_4.xyz + u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz + (-u_xlat16_4.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_7.xyz + u_xlat16_4.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.w = 1.0;
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