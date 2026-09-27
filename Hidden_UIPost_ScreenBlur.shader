//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/UIPost_ScreenBlur" {
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
  GpuProgramID 62426
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
in highp vec4 in_TEXCOORD0;
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
uniform 	vec4 _ScreenParams;
uniform 	float _BlurFactor;
uniform 	vec4 _BlurCenter;
uniform 	int _SampleCount;
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	float _lerpFromOriginal;
uniform 	float _stepDirNorValue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
float u_xlat15;
float u_xlat16;
int u_xlati16;
float u_xlat17;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_BlurCenter.xy);
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
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlati16 = int(0);
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlati16>=_SampleCount);
#else
        u_xlatb2 = u_xlati16>=_SampleCount;
#endif
        if(u_xlatb2){break;}
        u_xlati16 = u_xlati16 + 1;
        u_xlat16_3.x = float(u_xlati16);
        u_xlat2.x = u_xlat16_3.x * _BlurFactor;
        u_xlat2.xy = u_xlat2.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
        u_xlat2.xyz = u_xlat1.xyz + u_xlat16_2.xyz;
        u_xlat17 = (-u_xlat16_3.x) * _BlurFactor;
        u_xlat4.xy = vec2(u_xlat17) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_MainTex, u_xlat4.xy).xyz;
        u_xlat2.xyz = u_xlat2.xyz + u_xlat16_4.xyz;
        u_xlat16_3 = u_xlat16_3.xxxx * vec4(1.0, -1.0, -1.0, 1.0);
        u_xlat3 = u_xlat16_3 * vec4(vec4(_BlurFactor, _BlurFactor, _BlurFactor, _BlurFactor));
        u_xlat3 = u_xlat3 * vec4(0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
        u_xlat16_4.xyz = texture(_MainTex, u_xlat3.xy).xyz;
        u_xlat2.xyz = u_xlat2.xyz + u_xlat16_4.xyz;
        u_xlat16_4.xyz = texture(_MainTex, u_xlat3.zw).xyz;
        u_xlat1.xyz = u_xlat2.xyz + u_xlat16_4.xyz;
    }
    u_xlati16 = int(_SampleCount << 2);
    u_xlat16 = float(u_xlati16);
    u_xlat1.xyz = u_xlat1.xyz / vec3(u_xlat16);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(vec3(_lerpFromOriginal, _lerpFromOriginal, _lerpFromOriginal)) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
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
uniform 	vec4 _ScreenParams;
uniform 	float _BlurFactor;
uniform 	vec4 _BlurCenter;
uniform 	int _SampleCount;
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	float _lerpFromOriginal;
uniform 	float _stepDirNorValue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat11;
float u_xlat15;
float u_xlat16;
int u_xlati16;
float u_xlat17;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_BlurCenter.xy);
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
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlati16 = int(0);
    while(true){
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlati16>=_SampleCount);
#else
        u_xlatb2 = u_xlati16>=_SampleCount;
#endif
        if(u_xlatb2){break;}
        u_xlati16 = u_xlati16 + 1;
        u_xlat16_3.x = float(u_xlati16);
        u_xlat2.x = u_xlat16_3.x * _BlurFactor;
        u_xlat2.xy = u_xlat2.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat16_2.xyz = texture(_MainTex, u_xlat2.xy).xyz;
        u_xlat2.xyz = u_xlat1.xyz + u_xlat16_2.xyz;
        u_xlat17 = (-u_xlat16_3.x) * _BlurFactor;
        u_xlat4.xy = vec2(u_xlat17) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat16_4.xyz = texture(_MainTex, u_xlat4.xy).xyz;
        u_xlat2.xyz = u_xlat2.xyz + u_xlat16_4.xyz;
        u_xlat16_3 = u_xlat16_3.xxxx * vec4(1.0, -1.0, -1.0, 1.0);
        u_xlat3 = u_xlat16_3 * vec4(vec4(_BlurFactor, _BlurFactor, _BlurFactor, _BlurFactor));
        u_xlat3 = u_xlat3 * vec4(0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
        u_xlat16_4.xyz = texture(_MainTex, u_xlat3.xy).xyz;
        u_xlat2.xyz = u_xlat2.xyz + u_xlat16_4.xyz;
        u_xlat16_4.xyz = texture(_MainTex, u_xlat3.zw).xyz;
        u_xlat1.xyz = u_xlat2.xyz + u_xlat16_4.xyz;
    }
    u_xlati16 = int(_SampleCount << 2);
    u_xlat16 = float(u_xlati16);
    u_xlat1.xyz = u_xlat1.xyz / vec3(u_xlat16);
    u_xlat1.xyz = (-u_xlat16_0.xyz) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz + u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(vec3(_lerpFromOriginal, _lerpFromOriginal, _lerpFromOriginal)) * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
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
attribute highp vec4 in_TEXCOORD0;
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
uniform 	vec4 _ScreenParams;
uniform 	float _BlurFactor;
uniform 	vec4 _BlurCenter;
uniform 	int _SampleCount;
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	float _lerpFromOriginal;
uniform 	float _stepDirNorValue;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
lowp vec3 u_xlat10_4;
vec2 u_xlat11;
float u_xlat15;
float u_xlat16;
int u_xlati16;
float u_xlat17;
int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }

void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_BlurCenter.xy);
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
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlati16 = int(0);
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb2 = u_xlati16>=_SampleCount;
        if(u_xlatb2){break;}
        u_xlati16 = u_xlati16 + 1;
        u_xlat16_3.x = float(u_xlati16);
        u_xlat2.x = u_xlat16_3.x * _BlurFactor;
        u_xlat2.xy = u_xlat2.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
        u_xlat2.xyz = u_xlat1.xyz + u_xlat10_2.xyz;
        u_xlat17 = (-u_xlat16_3.x) * _BlurFactor;
        u_xlat4.xy = vec2(u_xlat17) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat10_4.xyz = texture2D(_MainTex, u_xlat4.xy).xyz;
        u_xlat2.xyz = u_xlat2.xyz + u_xlat10_4.xyz;
        u_xlat16_3 = u_xlat16_3.xxxx * vec4(1.0, -1.0, -1.0, 1.0);
        u_xlat3 = u_xlat16_3 * vec4(vec4(_BlurFactor, _BlurFactor, _BlurFactor, _BlurFactor));
        u_xlat3 = u_xlat3 * vec4(0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
        u_xlat10_4.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
        u_xlat2.xyz = u_xlat2.xyz + u_xlat10_4.xyz;
        u_xlat10_4.xyz = texture2D(_MainTex, u_xlat3.zw).xyz;
        u_xlat1.xyz = u_xlat2.xyz + u_xlat10_4.xyz;
    }
    u_xlati16 = op_shl(_SampleCount, 2);
    u_xlat16 = float(u_xlati16);
    u_xlat1.xyz = u_xlat1.xyz / vec3(u_xlat16);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(vec3(_lerpFromOriginal, _lerpFromOriginal, _lerpFromOriginal)) * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
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
attribute highp vec4 in_TEXCOORD0;
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
uniform 	vec4 _ScreenParams;
uniform 	float _BlurFactor;
uniform 	vec4 _BlurCenter;
uniform 	int _SampleCount;
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	float _lerpFromOriginal;
uniform 	float _stepDirNorValue;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec2 u_xlat4;
lowp vec3 u_xlat10_4;
vec2 u_xlat11;
float u_xlat15;
float u_xlat16;
int u_xlati16;
float u_xlat17;
int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }

void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_BlurCenter.xy);
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
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    u_xlati16 = int(0);
    for(int u_xlati_while_true_0 = 0 ; u_xlati_while_true_0 < 0x7FFF ; u_xlati_while_true_0++){
        u_xlatb2 = u_xlati16>=_SampleCount;
        if(u_xlatb2){break;}
        u_xlati16 = u_xlati16 + 1;
        u_xlat16_3.x = float(u_xlati16);
        u_xlat2.x = u_xlat16_3.x * _BlurFactor;
        u_xlat2.xy = u_xlat2.xx * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat10_2.xyz = texture2D(_MainTex, u_xlat2.xy).xyz;
        u_xlat2.xyz = u_xlat1.xyz + u_xlat10_2.xyz;
        u_xlat17 = (-u_xlat16_3.x) * _BlurFactor;
        u_xlat4.xy = vec2(u_xlat17) * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
        u_xlat10_4.xyz = texture2D(_MainTex, u_xlat4.xy).xyz;
        u_xlat2.xyz = u_xlat2.xyz + u_xlat10_4.xyz;
        u_xlat16_3 = u_xlat16_3.xxxx * vec4(1.0, -1.0, -1.0, 1.0);
        u_xlat3 = u_xlat16_3 * vec4(vec4(_BlurFactor, _BlurFactor, _BlurFactor, _BlurFactor));
        u_xlat3 = u_xlat3 * vec4(0.5, 0.5, 0.5, 0.5) + vs_TEXCOORD0.xyxy;
        u_xlat10_4.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
        u_xlat2.xyz = u_xlat2.xyz + u_xlat10_4.xyz;
        u_xlat10_4.xyz = texture2D(_MainTex, u_xlat3.zw).xyz;
        u_xlat1.xyz = u_xlat2.xyz + u_xlat10_4.xyz;
    }
    u_xlati16 = op_shl(_SampleCount, 2);
    u_xlat16 = float(u_xlati16);
    u_xlat1.xyz = u_xlat1.xyz / vec3(u_xlat16);
    u_xlat1.xyz = (-u_xlat10_0.xyz) + u_xlat1.xyz;
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz + u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(vec3(_lerpFromOriginal, _lerpFromOriginal, _lerpFromOriginal)) * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_RADIUS_BLUR" }
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
in highp vec4 in_TEXCOORD0;
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
uniform 	vec4 _ScreenParams;
uniform 	float _BlurFactor;
uniform 	vec4 _BlurCenter;
uniform 	int _SampleCount;
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	float _lerpFromOriginal;
uniform 	float _stepDirNorValue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat9;
int u_xlati9;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_BlurCenter.xy);
    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat9.xy = u_xlat1.xy * vec2(u_xlat12) + (-u_xlat1.xy);
    u_xlat1.yz = vec2(_stepDirNorValue) * u_xlat9.xy + u_xlat1.xy;
    u_xlat12 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat12 * u_xlat1.y;
    u_xlat12 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat12 = u_xlat12 + (-_MaskRadius);
    u_xlat12 = u_xlat12 / _MaskSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat1.xy = u_xlat1.yz * vec2(vec2(_BlurFactor, _BlurFactor));
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
    {
        u_xlat13 = float(u_xlati_loop_1);
        u_xlat3.xy = vec2(u_xlat13) * u_xlat1.xy;
        u_xlat3.xy = (-u_xlat3.xy) * vec2(u_xlat12) + vs_TEXCOORD0.xy;
        u_xlat16_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
        u_xlat2.xyz = u_xlat2.xyz + u_xlat16_3.xyz;
    }
    u_xlat12 = float(_SampleCount);
    u_xlat1.xyz = u_xlat2.xyz / vec3(u_xlat12);
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(vec3(_lerpFromOriginal, _lerpFromOriginal, _lerpFromOriginal)) * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_RADIUS_BLUR" }
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
in highp vec4 in_TEXCOORD0;
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
uniform 	vec4 _ScreenParams;
uniform 	float _BlurFactor;
uniform 	vec4 _BlurCenter;
uniform 	int _SampleCount;
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	float _lerpFromOriginal;
uniform 	float _stepDirNorValue;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
mediump vec3 u_xlat16_3;
vec2 u_xlat9;
int u_xlati9;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_BlurCenter.xy);
    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat9.xy = u_xlat1.xy * vec2(u_xlat12) + (-u_xlat1.xy);
    u_xlat1.yz = vec2(_stepDirNorValue) * u_xlat9.xy + u_xlat1.xy;
    u_xlat12 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat12 * u_xlat1.y;
    u_xlat12 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat12 = u_xlat12 + (-_MaskRadius);
    u_xlat12 = u_xlat12 / _MaskSoftness;
#ifdef UNITY_ADRENO_ES3
    u_xlat12 = min(max(u_xlat12, 0.0), 1.0);
#else
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat1.xy = u_xlat1.yz * vec2(vec2(_BlurFactor, _BlurFactor));
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
    {
        u_xlat13 = float(u_xlati_loop_1);
        u_xlat3.xy = vec2(u_xlat13) * u_xlat1.xy;
        u_xlat3.xy = (-u_xlat3.xy) * vec2(u_xlat12) + vs_TEXCOORD0.xy;
        u_xlat16_3.xyz = texture(_MainTex, u_xlat3.xy).xyz;
        u_xlat2.xyz = u_xlat2.xyz + u_xlat16_3.xyz;
    }
    u_xlat12 = float(_SampleCount);
    u_xlat1.xyz = u_xlat2.xyz / vec3(u_xlat12);
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(vec3(_lerpFromOriginal, _lerpFromOriginal, _lerpFromOriginal)) * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_RADIUS_BLUR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
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
uniform 	vec4 _ScreenParams;
uniform 	float _BlurFactor;
uniform 	vec4 _BlurCenter;
uniform 	int _SampleCount;
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	float _lerpFromOriginal;
uniform 	float _stepDirNorValue;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
lowp vec3 u_xlat10_3;
vec2 u_xlat9;
int u_xlati9;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_BlurCenter.xy);
    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat9.xy = u_xlat1.xy * vec2(u_xlat12) + (-u_xlat1.xy);
    u_xlat1.yz = vec2(_stepDirNorValue) * u_xlat9.xy + u_xlat1.xy;
    u_xlat12 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat12 * u_xlat1.y;
    u_xlat12 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat12 = u_xlat12 + (-_MaskRadius);
    u_xlat12 = u_xlat12 / _MaskSoftness;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat1.x = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat1.xy = u_xlat1.yz * vec2(vec2(_BlurFactor, _BlurFactor));
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
    {
        u_xlat13 = float(u_xlati_loop_1);
        u_xlat3.xy = vec2(u_xlat13) * u_xlat1.xy;
        u_xlat3.xy = (-u_xlat3.xy) * vec2(u_xlat12) + vs_TEXCOORD0.xy;
        u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
        u_xlat2.xyz = u_xlat2.xyz + u_xlat10_3.xyz;
    }
    u_xlat12 = float(_SampleCount);
    u_xlat1.xyz = u_xlat2.xyz / vec3(u_xlat12);
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(vec3(_lerpFromOriginal, _lerpFromOriginal, _lerpFromOriginal)) * u_xlat0.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_RADIUS_BLUR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
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
uniform 	vec4 _ScreenParams;
uniform 	float _BlurFactor;
uniform 	vec4 _BlurCenter;
uniform 	int _SampleCount;
uniform 	float _MaskRadius;
uniform 	float _MaskSoftness;
uniform 	float _lerpFromOriginal;
uniform 	float _stepDirNorValue;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec3 u_xlat2;
vec2 u_xlat3;
lowp vec3 u_xlat10_3;
vec2 u_xlat9;
int u_xlati9;
float u_xlat12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy + (-_BlurCenter.xy);
    u_xlat12 = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat9.xy = u_xlat1.xy * vec2(u_xlat12) + (-u_xlat1.xy);
    u_xlat1.yz = vec2(_stepDirNorValue) * u_xlat9.xy + u_xlat1.xy;
    u_xlat12 = _ScreenParams.x / _ScreenParams.y;
    u_xlat1.x = u_xlat12 * u_xlat1.y;
    u_xlat12 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat12 = u_xlat12 + (-_MaskRadius);
    u_xlat12 = u_xlat12 / _MaskSoftness;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat1.x = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat1.x;
    u_xlat1.xy = u_xlat1.yz * vec2(vec2(_BlurFactor, _BlurFactor));
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_SampleCount ; u_xlati_loop_1++)
    {
        u_xlat13 = float(u_xlati_loop_1);
        u_xlat3.xy = vec2(u_xlat13) * u_xlat1.xy;
        u_xlat3.xy = (-u_xlat3.xy) * vec2(u_xlat12) + vs_TEXCOORD0.xy;
        u_xlat10_3.xyz = texture2D(_MainTex, u_xlat3.xy).xyz;
        u_xlat2.xyz = u_xlat2.xyz + u_xlat10_3.xyz;
    }
    u_xlat12 = float(_SampleCount);
    u_xlat1.xyz = u_xlat2.xyz / vec3(u_xlat12);
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat1.xyz);
    SV_Target0.xyz = vec3(vec3(_lerpFromOriginal, _lerpFromOriginal, _lerpFromOriginal)) * u_xlat0.xyz + u_xlat1.xyz;
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
Local Keywords { "_RADIUS_BLUR" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_RADIUS_BLUR" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_RADIUS_BLUR" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_RADIUS_BLUR" }
""
}
}
}
}
}