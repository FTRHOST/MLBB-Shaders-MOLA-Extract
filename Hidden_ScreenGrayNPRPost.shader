//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ScreenGrayNPRPost" {
Properties {

_MainTex ("Texture", 2D) = "white" { }

_RampTex ("_RampTex", 2D) = "white" { }

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 6714
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
out highp vec4 vs_TEXCOORD1;
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
uniform 	vec4 _ScreenParams;
uniform 	float _UseGray;
uniform 	float _UseBlackWhite;
uniform 	float _BlackWhiteThredhold;
uniform 	float _InvertBlackWhite;
uniform 	float _InvertColor;
uniform 	float _UseRampTex;
uniform 	float _UseBlur;
uniform 	float _BlurFactor;
uniform 	vec4 _BlurCenter;
uniform 	int _SampleCount;
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	float _lerpFromOriginal;
uniform 	float _stepDirNorValue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _RampTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat11;
int u_xlati11;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_UseBlur);
#else
    u_xlatb15 = 0.0<_UseBlur;
#endif
    if(u_xlatb15){
        u_xlat1.xy = vs_TEXCOORD1.xy + (-_BlurCenter.xy);
        u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
        u_xlat15 = inversesqrt(u_xlat15);
        u_xlat11.xy = u_xlat1.xy * vec2(u_xlat15) + (-u_xlat1.xy);
        u_xlat1.yz = vec2(_stepDirNorValue) * u_xlat11.xy + u_xlat1.xy;
        u_xlat15 = _ScreenParams.x / _ScreenParams.y;
        u_xlat1.x = u_xlat15 * u_xlat1.y;
        u_xlat15 = dot(u_xlat1.xz, u_xlat1.xz);
        u_xlat15 = sqrt(u_xlat15);
        u_xlat15 = u_xlat15 + (-_MaskRadius);
        u_xlat15 = u_xlat15 / _MaskSoftness;
#ifdef UNITY_ADRENO_ES3
        u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
        u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
        u_xlat1.x = u_xlat15 * -2.0 + 3.0;
        u_xlat15 = u_xlat15 * u_xlat15;
        u_xlat15 = u_xlat15 * u_xlat1.x;
        u_xlat1.xy = u_xlat1.yz * vec2(vec2(_BlurFactor, _BlurFactor));
        u_xlat2.x = float(0.0);
        u_xlat2.y = float(0.0);
        u_xlat2.z = float(0.0);
        for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
        {
            u_xlat16 = float(u_xlati_loop_1);
            u_xlat3.xy = vec2(u_xlat16) * u_xlat1.xy;
            u_xlat3.xy = (-u_xlat3.xy) * vec2(u_xlat15) + vs_TEXCOORD1.xy;
            u_xlat16_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
            u_xlat2.xyz = u_xlat2.xyz + u_xlat16_3.xyz;
        }
        u_xlat15 = float(_SampleCount);
        u_xlat1.xyz = u_xlat2.xyz / vec3(u_xlat15);
    } else {
        u_xlat1.xyz = u_xlat16_0.xyz;
    }
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(vec3(_lerpFromOriginal, _lerpFromOriginal, _lerpFromOriginal)) * u_xlat0.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_UseGray);
#else
    u_xlatb15 = 0.0<_UseGray;
#endif
    if(u_xlatb15){
        u_xlat16_4.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseRampTex, _InvertColor, _UseRampTex, _UseRampTex)).xy;
        u_xlat16_4.y = 0.5;
        u_xlat15 = texture(_RampTex, u_xlat16_4.xy).x;
        u_xlat15 = (u_xlatb1.x) ? u_xlat15 : u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1.x = !!(_BlackWhiteThredhold<u_xlat15);
#else
        u_xlatb1.x = _BlackWhiteThredhold<u_xlat15;
#endif
        u_xlat11.x = u_xlatb1.x ? 1.0 : float(0.0);
        u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_InvertBlackWhite, _UseBlackWhite, _InvertBlackWhite, _InvertBlackWhite)).xy;
        u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
        u_xlat1.x = (u_xlatb2.x) ? u_xlat1.x : u_xlat11.x;
        u_xlat2.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
        u_xlat15 = (u_xlatb2.y) ? u_xlat1.x : u_xlat15;
        u_xlat0.xyz = (u_xlatb1.y) ? u_xlat2.xzw : vec3(u_xlat15);
    }
    SV_Target0.xyz = u_xlat0.xyz;
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
out highp vec4 vs_TEXCOORD1;
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
uniform 	vec4 _ScreenParams;
uniform 	float _UseGray;
uniform 	float _UseBlackWhite;
uniform 	float _BlackWhiteThredhold;
uniform 	float _InvertBlackWhite;
uniform 	float _InvertColor;
uniform 	float _UseRampTex;
uniform 	float _UseBlur;
uniform 	float _BlurFactor;
uniform 	vec4 _BlurCenter;
uniform 	int _SampleCount;
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	float _lerpFromOriginal;
uniform 	float _stepDirNorValue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _RampTex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat11;
int u_xlati11;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_UseBlur);
#else
    u_xlatb15 = 0.0<_UseBlur;
#endif
    if(u_xlatb15){
        u_xlat1.xy = vs_TEXCOORD1.xy + (-_BlurCenter.xy);
        u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
        u_xlat15 = inversesqrt(u_xlat15);
        u_xlat11.xy = u_xlat1.xy * vec2(u_xlat15) + (-u_xlat1.xy);
        u_xlat1.yz = vec2(_stepDirNorValue) * u_xlat11.xy + u_xlat1.xy;
        u_xlat15 = _ScreenParams.x / _ScreenParams.y;
        u_xlat1.x = u_xlat15 * u_xlat1.y;
        u_xlat15 = dot(u_xlat1.xz, u_xlat1.xz);
        u_xlat15 = sqrt(u_xlat15);
        u_xlat15 = u_xlat15 + (-_MaskRadius);
        u_xlat15 = u_xlat15 / _MaskSoftness;
#ifdef UNITY_ADRENO_ES3
        u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
        u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
        u_xlat1.x = u_xlat15 * -2.0 + 3.0;
        u_xlat15 = u_xlat15 * u_xlat15;
        u_xlat15 = u_xlat15 * u_xlat1.x;
        u_xlat1.xy = u_xlat1.yz * vec2(vec2(_BlurFactor, _BlurFactor));
        u_xlat2.x = float(0.0);
        u_xlat2.y = float(0.0);
        u_xlat2.z = float(0.0);
        for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
        {
            u_xlat16 = float(u_xlati_loop_1);
            u_xlat3.xy = vec2(u_xlat16) * u_xlat1.xy;
            u_xlat3.xy = (-u_xlat3.xy) * vec2(u_xlat15) + vs_TEXCOORD1.xy;
            u_xlat16_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
            u_xlat2.xyz = u_xlat2.xyz + u_xlat16_3.xyz;
        }
        u_xlat15 = float(_SampleCount);
        u_xlat1.xyz = u_xlat2.xyz / vec3(u_xlat15);
    } else {
        u_xlat1.xyz = u_xlat16_0.xyz;
    }
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(vec3(_lerpFromOriginal, _lerpFromOriginal, _lerpFromOriginal)) * u_xlat0.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(0.0<_UseGray);
#else
    u_xlatb15 = 0.0<_UseGray;
#endif
    if(u_xlatb15){
        u_xlat16_4.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseRampTex, _InvertColor, _UseRampTex, _UseRampTex)).xy;
        u_xlat16_4.y = 0.5;
        u_xlat15 = texture(_RampTex, u_xlat16_4.xy).x;
        u_xlat15 = (u_xlatb1.x) ? u_xlat15 : u_xlat16_4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb1.x = !!(_BlackWhiteThredhold<u_xlat15);
#else
        u_xlatb1.x = _BlackWhiteThredhold<u_xlat15;
#endif
        u_xlat11.x = u_xlatb1.x ? 1.0 : float(0.0);
        u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_InvertBlackWhite, _UseBlackWhite, _InvertBlackWhite, _InvertBlackWhite)).xy;
        u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
        u_xlat1.x = (u_xlatb2.x) ? u_xlat1.x : u_xlat11.x;
        u_xlat2.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
        u_xlat15 = (u_xlatb2.y) ? u_xlat1.x : u_xlat15;
        u_xlat0.xyz = (u_xlatb1.y) ? u_xlat2.xzw : vec3(u_xlat15);
    }
    SV_Target0.xyz = u_xlat0.xyz;
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
varying highp vec4 vs_TEXCOORD1;
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
uniform 	vec4 _ScreenParams;
uniform 	float _UseGray;
uniform 	float _UseBlackWhite;
uniform 	float _BlackWhiteThredhold;
uniform 	float _InvertBlackWhite;
uniform 	float _InvertColor;
uniform 	float _UseRampTex;
uniform 	float _UseBlur;
uniform 	float _BlurFactor;
uniform 	vec4 _BlurCenter;
uniform 	int _SampleCount;
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	float _lerpFromOriginal;
uniform 	float _stepDirNorValue;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _RampTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat11;
int u_xlati11;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlatb15 = 0.0<_UseBlur;
    if(u_xlatb15){
        u_xlat1.xy = vs_TEXCOORD1.xy + (-_BlurCenter.xy);
        u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
        u_xlat15 = inversesqrt(u_xlat15);
        u_xlat11.xy = u_xlat1.xy * vec2(u_xlat15) + (-u_xlat1.xy);
        u_xlat1.yz = vec2(_stepDirNorValue) * u_xlat11.xy + u_xlat1.xy;
        u_xlat15 = _ScreenParams.x / _ScreenParams.y;
        u_xlat1.x = u_xlat15 * u_xlat1.y;
        u_xlat15 = dot(u_xlat1.xz, u_xlat1.xz);
        u_xlat15 = sqrt(u_xlat15);
        u_xlat15 = u_xlat15 + (-_MaskRadius);
        u_xlat15 = u_xlat15 / _MaskSoftness;
        u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
        u_xlat1.x = u_xlat15 * -2.0 + 3.0;
        u_xlat15 = u_xlat15 * u_xlat15;
        u_xlat15 = u_xlat15 * u_xlat1.x;
        u_xlat1.xy = u_xlat1.yz * vec2(vec2(_BlurFactor, _BlurFactor));
        u_xlat2.x = float(0.0);
        u_xlat2.y = float(0.0);
        u_xlat2.z = float(0.0);
        for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
        {
            u_xlat16 = float(u_xlati_loop_1);
            u_xlat3.xy = vec2(u_xlat16) * u_xlat1.xy;
            u_xlat3.xy = (-u_xlat3.xy) * vec2(u_xlat15) + vs_TEXCOORD1.xy;
            u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
            u_xlat2.xyz = u_xlat2.xyz + u_xlat10_3.xyz;
        }
        u_xlat15 = float(_SampleCount);
        u_xlat1.xyz = u_xlat2.xyz / vec3(u_xlat15);
    } else {
        u_xlat1.xyz = u_xlat10_0.xyz;
    }
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(vec3(_lerpFromOriginal, _lerpFromOriginal, _lerpFromOriginal)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlatb15 = 0.0<_UseGray;
    if(u_xlatb15){
        u_xlat16_4.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseRampTex, _InvertColor, _UseRampTex, _UseRampTex)).xy;
        u_xlat16_4.y = 0.5;
        u_xlat15 = texture2D(_RampTex, u_xlat16_4.xy).x;
        u_xlat15 = (u_xlatb1.x) ? u_xlat15 : u_xlat16_4.x;
        u_xlatb1.x = _BlackWhiteThredhold<u_xlat15;
        u_xlat11.x = u_xlatb1.x ? 1.0 : float(0.0);
        u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_InvertBlackWhite, _UseBlackWhite, _InvertBlackWhite, _InvertBlackWhite)).xy;
        u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
        u_xlat1.x = (u_xlatb2.x) ? u_xlat1.x : u_xlat11.x;
        u_xlat2.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
        u_xlat15 = (u_xlatb2.y) ? u_xlat1.x : u_xlat15;
        u_xlat0.xyz = (u_xlatb1.y) ? u_xlat2.xzw : vec3(u_xlat15);
    }
    SV_Target0.xyz = u_xlat0.xyz;
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
varying highp vec4 vs_TEXCOORD1;
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
uniform 	vec4 _ScreenParams;
uniform 	float _UseGray;
uniform 	float _UseBlackWhite;
uniform 	float _BlackWhiteThredhold;
uniform 	float _InvertBlackWhite;
uniform 	float _InvertColor;
uniform 	float _UseRampTex;
uniform 	float _UseBlur;
uniform 	float _BlurFactor;
uniform 	vec4 _BlurCenter;
uniform 	int _SampleCount;
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	float _lerpFromOriginal;
uniform 	float _stepDirNorValue;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _RampTex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
bvec2 u_xlatb2;
vec2 u_xlat3;
lowp vec3 u_xlat10_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat11;
int u_xlati11;
float u_xlat15;
bool u_xlatb15;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlatb15 = 0.0<_UseBlur;
    if(u_xlatb15){
        u_xlat1.xy = vs_TEXCOORD1.xy + (-_BlurCenter.xy);
        u_xlat15 = dot(u_xlat1.xy, u_xlat1.xy);
        u_xlat15 = inversesqrt(u_xlat15);
        u_xlat11.xy = u_xlat1.xy * vec2(u_xlat15) + (-u_xlat1.xy);
        u_xlat1.yz = vec2(_stepDirNorValue) * u_xlat11.xy + u_xlat1.xy;
        u_xlat15 = _ScreenParams.x / _ScreenParams.y;
        u_xlat1.x = u_xlat15 * u_xlat1.y;
        u_xlat15 = dot(u_xlat1.xz, u_xlat1.xz);
        u_xlat15 = sqrt(u_xlat15);
        u_xlat15 = u_xlat15 + (-_MaskRadius);
        u_xlat15 = u_xlat15 / _MaskSoftness;
        u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
        u_xlat1.x = u_xlat15 * -2.0 + 3.0;
        u_xlat15 = u_xlat15 * u_xlat15;
        u_xlat15 = u_xlat15 * u_xlat1.x;
        u_xlat1.xy = u_xlat1.yz * vec2(vec2(_BlurFactor, _BlurFactor));
        u_xlat2.x = float(0.0);
        u_xlat2.y = float(0.0);
        u_xlat2.z = float(0.0);
        for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
        {
            u_xlat16 = float(u_xlati_loop_1);
            u_xlat3.xy = vec2(u_xlat16) * u_xlat1.xy;
            u_xlat3.xy = (-u_xlat3.xy) * vec2(u_xlat15) + vs_TEXCOORD1.xy;
            u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
            u_xlat2.xyz = u_xlat2.xyz + u_xlat10_3.xyz;
        }
        u_xlat15 = float(_SampleCount);
        u_xlat1.xyz = u_xlat2.xyz / vec3(u_xlat15);
    } else {
        u_xlat1.xyz = u_xlat10_0.xyz;
    }
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(vec3(_lerpFromOriginal, _lerpFromOriginal, _lerpFromOriginal)) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlatb15 = 0.0<_UseGray;
    if(u_xlatb15){
        u_xlat16_4.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
        u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseRampTex, _InvertColor, _UseRampTex, _UseRampTex)).xy;
        u_xlat16_4.y = 0.5;
        u_xlat15 = texture2D(_RampTex, u_xlat16_4.xy).x;
        u_xlat15 = (u_xlatb1.x) ? u_xlat15 : u_xlat16_4.x;
        u_xlatb1.x = _BlackWhiteThredhold<u_xlat15;
        u_xlat11.x = u_xlatb1.x ? 1.0 : float(0.0);
        u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_InvertBlackWhite, _UseBlackWhite, _InvertBlackWhite, _InvertBlackWhite)).xy;
        u_xlat1.x = (u_xlatb1.x) ? 0.0 : 1.0;
        u_xlat1.x = (u_xlatb2.x) ? u_xlat1.x : u_xlat11.x;
        u_xlat2.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
        u_xlat15 = (u_xlatb2.y) ? u_xlat1.x : u_xlat15;
        u_xlat0.xyz = (u_xlatb1.y) ? u_xlat2.xzw : vec3(u_xlat15);
    }
    SV_Target0.xyz = u_xlat0.xyz;
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
}
}
}
}