//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Scene/Toon_Water" {
Properties {

_lightPower ("灯光次幂", Float) = 0.0

_normalOffset ("灯光法线偏移", Vector) = (0,0,0,0)

_ShallowColor ("浅水区颜色", Color) = (0,0,0,0)

_Float13 ("浅水区颜色强度", Float) = 1.0

_DeepColor ("深水区颜色", Color) = (0,0,0,0)

_Float12 ("深水区颜色强度", Float) = 0.0

_DeepRange ("浅水区域", Range(0.001, 100)) = 0.0

_ReflectDistort ("反射扰动", Float) = 0.0

_ReflectPower ("反射次幂", Float) = 0.0

_ReflectIntensity ("反射强度", Range(0, 1)) = 0.0

_NormalScale ("水面法线扰动缩放值", Float) = 0.0

_NormalSpeed ("水面法线扰动速度", Vector) = (0,0,0,0)

_UnderWaterDistort ("水底扰动强度", Float) = 0.0

_ShoreRange1 ("岸边范围", Range(0.001, 100)) = 0.0

_ShoreColor ("岸边颜色", Color) = (0,0,0,0)

_ShoreRange ("白边范围", Range(0.001, 100)) = 0.0

_ShoreEdgeColor ("白边颜色", Color) = (0,0,0,0)

_ShoreEdgeWidth ("白边宽度", Range(0, 1)) = 0.0

_ShoreEdgeIntensity ("白边颜色强度", Float) = 0.0

_NormalScaleNew ("水面法线贴图缩放值", Range(0.001, 10)) = 0.0

_BumpTex ("水面法线贴图", 2D) = "white" { }

_WaterTex ("水波纹贴图", 2D) = "white" { }

_NormalsStrength ("水波纹扰动强度", Float) = 0.0

_WaveSpeed ("水波纹速度", Vector) = (0,0,0,0)

_WaterColor ("水波纹颜色", Color) = (0,0,0,0)

_WaterIntensity ("水波纹颜色强度", Float) = 0.0

_DistortIntensity ("水波纹扰动次幂", Float) = 0.0

_WaveColor ("WaveColor", Color) = (0.216981,0.160689,0.160689,1)

_WaveColorIntensity ("WaveColorIntensity", Float) = 0.0

_WaveASpeedXY ("波浪1速度", Vector) = (0,0,0,0)

_WaveBSpeedXY ("波浪2速度", Vector) = (0,0,0,0)

_WaveCSpeedXY ("波浪3速度", Vector) = (0,0,0,0)

}
SubShader {
 LOD 100
 Tags { "QUEUE" = "AlphaTest" "RenderType" = "AlphaTest" }
 GrabPass {
}
 Pass {
  LOD 100
  Tags { "QUEUE" = "AlphaTest" "RenderType" = "AlphaTest" }
 ZWrite Off
  GpuProgramID 530
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
uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _WaveASpeedXY;
uniform 	vec4 _WaveBSpeedXY;
uniform 	vec4 _WaveCSpeedXY;
uniform 	vec4 _WaterColor;
uniform 	float _WaveColorIntensity;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
float u_xlat7;
vec4 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat15;
vec2 u_xlat20;
float u_xlat24;
float u_xlat30;
float u_xlat31;
float u_xlat32;
float u_xlat34;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = 6.28318548 / _WaveASpeedXY.w;
    u_xlat10.x = 9.80000019 / u_xlat0.x;
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat20.x = dot(_WaveASpeedXY.xy, _WaveASpeedXY.xy);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat20.xy = u_xlat20.xx * _WaveASpeedXY.xy;
    u_xlat31 = dot(u_xlat20.xy, u_xlat1.xz);
    u_xlat10.x = (-u_xlat10.x) * _Time.y + u_xlat31;
    u_xlat10.x = u_xlat10.x * u_xlat0.x;
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3.x = cos(u_xlat10.x);
    u_xlat10.x = _WaveASpeedXY.z * 0.00999999978;
    u_xlat0.x = u_xlat10.x / u_xlat0.x;
    u_xlat31 = u_xlat3.x * u_xlat0.x;
    u_xlat4.y = u_xlat2.x * u_xlat0.x;
    u_xlat4.xz = u_xlat20.xy * vec2(u_xlat31);
    u_xlat0.x = dot(_WaveBSpeedXY.xy, _WaveBSpeedXY.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat12.xy = u_xlat0.xx * _WaveBSpeedXY.xy;
    u_xlat0.x = dot(u_xlat12.xy, u_xlat1.xz);
    u_xlat31 = 6.28318548 / _WaveBSpeedXY.w;
    u_xlat32 = 9.80000019 / u_xlat31;
    u_xlat32 = sqrt(u_xlat32);
    u_xlat0.x = (-u_xlat32) * _Time.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat31;
    u_xlat5 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat32 = _WaveBSpeedXY.z * 0.00999999978;
    u_xlat31 = u_xlat32 / u_xlat31;
    u_xlat13.x = u_xlat5 * u_xlat31;
    u_xlat6.y = u_xlat0.x * u_xlat31;
    u_xlat6.xz = u_xlat12.xy * u_xlat13.xx;
    u_xlat13.xyz = u_xlat4.xyz + u_xlat6.xyz;
    u_xlat31 = dot(_WaveCSpeedXY.xy, _WaveCSpeedXY.xy);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat4.xy = vec2(u_xlat31) * _WaveCSpeedXY.xy;
    u_xlat31 = dot(u_xlat4.xy, u_xlat1.xz);
    u_xlat24 = 6.28318548 / _WaveCSpeedXY.w;
    u_xlat34 = 9.80000019 / u_xlat24;
    u_xlat34 = sqrt(u_xlat34);
    u_xlat31 = (-u_xlat34) * _Time.y + u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat24;
    u_xlat6.x = sin(u_xlat31);
    u_xlat7 = cos(u_xlat31);
    u_xlat31 = _WaveCSpeedXY.z * 0.00999999978;
    u_xlat24 = u_xlat31 / u_xlat24;
    u_xlat34 = u_xlat7 * u_xlat24;
    u_xlat8.y = u_xlat6.x * u_xlat24;
    u_xlat8.xz = vec2(u_xlat34) * u_xlat4.xy;
    u_xlat13.xyz = u_xlat13.xyz + u_xlat8.xyz;
    u_xlat15.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat8 = u_xlat13.yyyy * _WaterColor;
    vs_TEXCOORD2 = u_xlat8 * vec4(_WaveColorIntensity);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = u_xlat15.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat15.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat15.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat8 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat8 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat8;
    u_xlat8 = u_xlat8 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat9 = u_xlat8.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat9 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat8.xxxx + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat8.zzzz + u_xlat9;
    u_xlat8 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat8.wwww + u_xlat9;
    gl_Position = u_xlat8;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = u_xlat2.x * u_xlat10.x;
    u_xlat10.x = u_xlat3.x * u_xlat10.x;
    u_xlat3.xy = u_xlat10.xx * u_xlat20.xy;
    u_xlat10.xyz = u_xlat20.xyy * (-u_xlat20.xxy);
    u_xlat9.xyz = u_xlat1.xxx * u_xlat10.xyz;
    u_xlat9.w = u_xlat3.x;
    u_xlat10.xyz = u_xlat9.wyx + vec3(0.0, 0.0, 1.0);
    u_xlat3.zw = u_xlat9.yz;
    u_xlat1.xyz = u_xlat3.wzy + vec3(1.0, 0.0, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat32;
    u_xlat2.x = u_xlat5 * u_xlat32;
    u_xlat3.xy = u_xlat2.xx * u_xlat12.xy;
    u_xlat2.xyz = u_xlat12.xyy * (-u_xlat12.xxy);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.w = u_xlat3.x;
    u_xlat0.xyz = u_xlat10.xyz + u_xlat2.wyx;
    u_xlat3.zw = u_xlat2.yz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.wzy;
    u_xlat30 = u_xlat6.x * u_xlat31;
    u_xlat31 = u_xlat7 * u_xlat31;
    u_xlat2.xy = vec2(u_xlat31) * u_xlat4.xy;
    u_xlat3.xyz = u_xlat4.xyy * (-u_xlat4.xxy);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz;
    u_xlat3.w = u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.wyx;
    u_xlat2.zw = u_xlat3.yz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.wzy;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 0.00100000005);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat30 = dot(u_xlat0, u_xlat0);
    u_xlat30 = inversesqrt(u_xlat30);
    vs_TEXCOORD3.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat0.x = u_xlat8.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat8.xw * vec2(0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat8.zw;
    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _WaterTex_ST;
uniform 	vec4 _WaveSpeed;
uniform 	float _NormalScaleNew;
uniform 	vec4 _NormalSpeed;
uniform 	float _NormalsStrength;
uniform 	float _DistortIntensity;
uniform 	vec4 _WaterColor;
uniform 	float _WaterIntensity;
uniform 	vec4 _DeepColor;
uniform 	vec4 _ShallowColor;
uniform 	float _DeepRange;
uniform 	vec3 _normalOffset;
uniform 	float _lightPower;
uniform 	float _ReflectDistort;
uniform 	float _ShoreRange1;
uniform 	float _ReflectPower;
uniform 	float _ReflectIntensity;
uniform 	float _UnderWaterDistort;
uniform 	vec4 _ShoreColor;
uniform 	float _ShoreEdgeWidth;
uniform 	float _ShoreRange;
uniform 	vec4 _ShoreEdgeColor;
uniform 	float _ShoreEdgeIntensity;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _BumpTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _GrabTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
vec2 u_xlat18;
vec2 u_xlat19;
float u_xlat24;
float u_xlat26;
void main()
{
    u_xlat0.x = _CosTime.w * _WaveSpeed.z;
    u_xlat0.z = _SinTime.w * _WaveSpeed.w;
    u_xlat0.xy = u_xlat0.xz * vec2(1.20000005, 0.5);
    u_xlat16.xy = vs_TEXCOORD0.xy / vec2(_NormalScaleNew);
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16.xy = _SinTime.ww * _WaveSpeed.xy + u_xlat16.xy;
    u_xlat16_16.xy = texture(_BumpTex, u_xlat16.xy).xy;
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat16_16.xy * vec2(2.0, 2.0) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-2.0, -2.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_NormalsStrength);
    u_xlat0.xy = u_xlat0.xy * _WaterTex_ST.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _WaterTex_ST.zw;
    u_xlat16_0.x = texture(_WaterTex, u_xlat0.xy).x;
    u_xlat0.x = log2(u_xlat16_0.x);
    u_xlat0.x = u_xlat0.x * _DistortIntensity;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _WaterColor.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat3.xyz = vs_TEXCOORD3.xyz + vec3(_normalOffset.x, _normalOffset.y, _normalOffset.z);
    u_xlat24 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 9.99999975e-05);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _lightPower;
    u_xlat24 = exp2(u_xlat24);
    u_xlat1.xyw = vs_TEXCOORD4.wxw + vec3(9.99999996e-12, 0.0, 9.99999996e-12);
    u_xlat2.xy = vs_TEXCOORD4.xy / u_xlat1.xx;
    u_xlat2.z = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat3.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat4 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat3 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat18.x = u_xlat3.y * hlslcc_mtx4x4unity_CameraToWorld[1].y;
    u_xlat18.x = hlslcc_mtx4x4unity_CameraToWorld[0].y * u_xlat3.x + u_xlat18.x;
    u_xlat18.x = (-u_xlat3.z) * hlslcc_mtx4x4unity_CameraToWorld[2].y + u_xlat18.x;
    u_xlat18.x = u_xlat18.x + hlslcc_mtx4x4unity_CameraToWorld[3].y;
    u_xlat18.x = u_xlat18.x + 9.99999975e-06;
    u_xlat26 = vs_TEXCOORD1.y + 0.349999994;
    u_xlat18.y = (-u_xlat18.x) + u_xlat26;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.y = min(max(u_xlat18.y, 0.0), 1.0);
#else
    u_xlat18.y = clamp(u_xlat18.y, 0.0, 1.0);
#endif
    u_xlat18.x = (-u_xlat18.x) + vs_TEXCOORD1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlatb3.xy = lessThan(vec4(0.200000003, 0.25, 0.0, 0.0), vs_TEXCOORD0.yyyy).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat18;
        hlslcc_movcTemp.x = (u_xlatb3.y) ? (-u_xlat18.x) : float(-1.0);
        hlslcc_movcTemp.y = (u_xlatb3.x) ? (-u_xlat18.y) : float(-1.0);
        u_xlat18 = hlslcc_movcTemp;
    }
    u_xlat18.x = u_xlat18.x / _ShoreRange;
    u_xlat18.x = u_xlat18.x * 1.44269502;
    u_xlat18.x = exp2(u_xlat18.x);
    u_xlat18.x = min(u_xlat18.x, 1.10000002);
    u_xlat3.x = u_xlat18.y / _DeepRange;
    u_xlat26 = u_xlat18.y / _ShoreRange1;
    u_xlat26 = u_xlat26 * 1.44269502;
    u_xlat26 = exp2(u_xlat26);
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat3.x = u_xlat3.x * 1.44269502;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat11.xyz = (-_DeepColor.xyz) + _ShallowColor.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat11.xyz + _DeepColor.xyz;
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_WaterIntensity) + u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD1.xy * vec2(-0.100000001, -0.100000001);
    u_xlat3.xy = u_xlat3.xy / vec2(_NormalScaleNew);
    u_xlat4 = _Time.yyyy * _NormalSpeed.xyxy;
    u_xlat19.xy = u_xlat4.zw * vec2(-0.0500000007, -0.0500000007);
    u_xlat4.xy = u_xlat4.xy * vec2(0.100000001, 0.100000001) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(2.0, 2.0) + u_xlat19.xy;
    u_xlat16_3.xyz = texture(_BumpTex, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_BumpTex, u_xlat4.xy).xyz;
    u_xlat16_6.z = u_xlat16_5.z * u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_5.xy + u_xlat16_3.xy;
    u_xlat16_5.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xy = u_xlat16_5.xx * u_xlat16_6.xy;
    u_xlat24 = _ReflectDistort * 0.00999999978;
    u_xlat2.xy = u_xlat16_5.xy * vec2(u_xlat24) + u_xlat2.xy;
    u_xlat3.xy = u_xlat16_5.xy * vec2(vec2(_UnderWaterDistort, _UnderWaterDistort));
    u_xlat19.xy = u_xlat2.xy + vec2(0.0, -0.200000003);
    u_xlat16_4.xyz = texture(_ReflectionTex, u_xlat2.xy).xyz;
    u_xlat16_7.xyz = texture(_ReflectionTex, u_xlat19.xy).xyz;
    u_xlat12.xyz = u_xlat16_4.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat16_4.xxx * u_xlat12.xyz + u_xlat16_7.xyz;
    u_xlat24 = u_xlat26 * -2.0 + 3.0;
    u_xlat2.x = u_xlat26 * u_xlat26;
    u_xlat24 = u_xlat24 * u_xlat2.x;
    u_xlat2.x = log2(u_xlat24);
    u_xlat2.x = u_xlat2.x * _ReflectPower;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat2.xxx + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x * _ReflectIntensity;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vs_TEXCOORD2.xyz;
    u_xlat2.x = u_xlat1.x * 0.5;
    u_xlat10 = (-u_xlat1.x) * 0.5 + vs_TEXCOORD4.y;
    u_xlat1.z = u_xlat10 * _ProjectionParams.x + u_xlat2.x;
    u_xlat2.xyw = u_xlat1.yzw / u_xlat1.xxx;
    u_xlat2.xy = u_xlat3.xy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat16_2.xyw = texture(_GrabTexture, u_xlat2.xy).xyz;
    u_xlat3.xyz = (-u_xlat0.xyz) + u_xlat16_2.xyw;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat2.xyw = u_xlat16_2.xyw * _ShoreColor.xyz + (-u_xlat0.xyz);
    u_xlat3.x = (-_ShoreEdgeWidth) + 1.0;
    u_xlat18.x = u_xlat18.x + (-u_xlat3.x);
    u_xlat3.x = (-u_xlat3.x) + 1.10000002;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat18.x = u_xlat18.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat18.x * -2.0 + 3.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat3.x;
    u_xlat24 = u_xlat24 * 2.0 + u_xlat18.x;
    u_xlat3.xyz = u_xlat18.xxx * _ShoreEdgeColor.xyz;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat2.xyw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_ShoreEdgeIntensity) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.w = vs_COLOR0.w;
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
uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _WaveASpeedXY;
uniform 	vec4 _WaveBSpeedXY;
uniform 	vec4 _WaveCSpeedXY;
uniform 	vec4 _WaterColor;
uniform 	float _WaveColorIntensity;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
float u_xlat7;
vec4 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat15;
vec2 u_xlat20;
float u_xlat24;
float u_xlat30;
float u_xlat31;
float u_xlat32;
float u_xlat34;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = 6.28318548 / _WaveASpeedXY.w;
    u_xlat10.x = 9.80000019 / u_xlat0.x;
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat20.x = dot(_WaveASpeedXY.xy, _WaveASpeedXY.xy);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat20.xy = u_xlat20.xx * _WaveASpeedXY.xy;
    u_xlat31 = dot(u_xlat20.xy, u_xlat1.xz);
    u_xlat10.x = (-u_xlat10.x) * _Time.y + u_xlat31;
    u_xlat10.x = u_xlat10.x * u_xlat0.x;
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3.x = cos(u_xlat10.x);
    u_xlat10.x = _WaveASpeedXY.z * 0.00999999978;
    u_xlat0.x = u_xlat10.x / u_xlat0.x;
    u_xlat31 = u_xlat3.x * u_xlat0.x;
    u_xlat4.y = u_xlat2.x * u_xlat0.x;
    u_xlat4.xz = u_xlat20.xy * vec2(u_xlat31);
    u_xlat0.x = dot(_WaveBSpeedXY.xy, _WaveBSpeedXY.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat12.xy = u_xlat0.xx * _WaveBSpeedXY.xy;
    u_xlat0.x = dot(u_xlat12.xy, u_xlat1.xz);
    u_xlat31 = 6.28318548 / _WaveBSpeedXY.w;
    u_xlat32 = 9.80000019 / u_xlat31;
    u_xlat32 = sqrt(u_xlat32);
    u_xlat0.x = (-u_xlat32) * _Time.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat31;
    u_xlat5 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat32 = _WaveBSpeedXY.z * 0.00999999978;
    u_xlat31 = u_xlat32 / u_xlat31;
    u_xlat13.x = u_xlat5 * u_xlat31;
    u_xlat6.y = u_xlat0.x * u_xlat31;
    u_xlat6.xz = u_xlat12.xy * u_xlat13.xx;
    u_xlat13.xyz = u_xlat4.xyz + u_xlat6.xyz;
    u_xlat31 = dot(_WaveCSpeedXY.xy, _WaveCSpeedXY.xy);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat4.xy = vec2(u_xlat31) * _WaveCSpeedXY.xy;
    u_xlat31 = dot(u_xlat4.xy, u_xlat1.xz);
    u_xlat24 = 6.28318548 / _WaveCSpeedXY.w;
    u_xlat34 = 9.80000019 / u_xlat24;
    u_xlat34 = sqrt(u_xlat34);
    u_xlat31 = (-u_xlat34) * _Time.y + u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat24;
    u_xlat6.x = sin(u_xlat31);
    u_xlat7 = cos(u_xlat31);
    u_xlat31 = _WaveCSpeedXY.z * 0.00999999978;
    u_xlat24 = u_xlat31 / u_xlat24;
    u_xlat34 = u_xlat7 * u_xlat24;
    u_xlat8.y = u_xlat6.x * u_xlat24;
    u_xlat8.xz = vec2(u_xlat34) * u_xlat4.xy;
    u_xlat13.xyz = u_xlat13.xyz + u_xlat8.xyz;
    u_xlat15.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat8 = u_xlat13.yyyy * _WaterColor;
    vs_TEXCOORD2 = u_xlat8 * vec4(_WaveColorIntensity);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = u_xlat15.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat15.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat15.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat8 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat8 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat8;
    u_xlat8 = u_xlat8 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat9 = u_xlat8.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat9 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat8.xxxx + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat8.zzzz + u_xlat9;
    u_xlat8 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat8.wwww + u_xlat9;
    gl_Position = u_xlat8;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = u_xlat2.x * u_xlat10.x;
    u_xlat10.x = u_xlat3.x * u_xlat10.x;
    u_xlat3.xy = u_xlat10.xx * u_xlat20.xy;
    u_xlat10.xyz = u_xlat20.xyy * (-u_xlat20.xxy);
    u_xlat9.xyz = u_xlat1.xxx * u_xlat10.xyz;
    u_xlat9.w = u_xlat3.x;
    u_xlat10.xyz = u_xlat9.wyx + vec3(0.0, 0.0, 1.0);
    u_xlat3.zw = u_xlat9.yz;
    u_xlat1.xyz = u_xlat3.wzy + vec3(1.0, 0.0, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat32;
    u_xlat2.x = u_xlat5 * u_xlat32;
    u_xlat3.xy = u_xlat2.xx * u_xlat12.xy;
    u_xlat2.xyz = u_xlat12.xyy * (-u_xlat12.xxy);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.w = u_xlat3.x;
    u_xlat0.xyz = u_xlat10.xyz + u_xlat2.wyx;
    u_xlat3.zw = u_xlat2.yz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.wzy;
    u_xlat30 = u_xlat6.x * u_xlat31;
    u_xlat31 = u_xlat7 * u_xlat31;
    u_xlat2.xy = vec2(u_xlat31) * u_xlat4.xy;
    u_xlat3.xyz = u_xlat4.xyy * (-u_xlat4.xxy);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz;
    u_xlat3.w = u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.wyx;
    u_xlat2.zw = u_xlat3.yz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.wzy;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 0.00100000005);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat30 = dot(u_xlat0, u_xlat0);
    u_xlat30 = inversesqrt(u_xlat30);
    vs_TEXCOORD3.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat0.x = u_xlat8.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat8.xw * vec2(0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat8.zw;
    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _WaterTex_ST;
uniform 	vec4 _WaveSpeed;
uniform 	float _NormalScaleNew;
uniform 	vec4 _NormalSpeed;
uniform 	float _NormalsStrength;
uniform 	float _DistortIntensity;
uniform 	vec4 _WaterColor;
uniform 	float _WaterIntensity;
uniform 	vec4 _DeepColor;
uniform 	vec4 _ShallowColor;
uniform 	float _DeepRange;
uniform 	vec3 _normalOffset;
uniform 	float _lightPower;
uniform 	float _ReflectDistort;
uniform 	float _ShoreRange1;
uniform 	float _ReflectPower;
uniform 	float _ReflectIntensity;
uniform 	float _UnderWaterDistort;
uniform 	vec4 _ShoreColor;
uniform 	float _ShoreEdgeWidth;
uniform 	float _ShoreRange;
uniform 	vec4 _ShoreEdgeColor;
uniform 	float _ShoreEdgeIntensity;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _BumpTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(4) uniform mediump sampler2D _GrabTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat16;
mediump vec2 u_xlat16_16;
vec2 u_xlat18;
vec2 u_xlat19;
float u_xlat24;
float u_xlat26;
void main()
{
    u_xlat0.x = _CosTime.w * _WaveSpeed.z;
    u_xlat0.z = _SinTime.w * _WaveSpeed.w;
    u_xlat0.xy = u_xlat0.xz * vec2(1.20000005, 0.5);
    u_xlat16.xy = vs_TEXCOORD0.xy / vec2(_NormalScaleNew);
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16.xy = _SinTime.ww * _WaveSpeed.xy + u_xlat16.xy;
    u_xlat16_16.xy = texture(_BumpTex, u_xlat16.xy).xy;
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat16_16.xy * vec2(2.0, 2.0) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-2.0, -2.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_NormalsStrength);
    u_xlat0.xy = u_xlat0.xy * _WaterTex_ST.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _WaterTex_ST.zw;
    u_xlat16_0.x = texture(_WaterTex, u_xlat0.xy).x;
    u_xlat0.x = log2(u_xlat16_0.x);
    u_xlat0.x = u_xlat0.x * _DistortIntensity;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _WaterColor.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat3.xyz = vs_TEXCOORD3.xyz + vec3(_normalOffset.x, _normalOffset.y, _normalOffset.z);
    u_xlat24 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 9.99999975e-05);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _lightPower;
    u_xlat24 = exp2(u_xlat24);
    u_xlat1.xyw = vs_TEXCOORD4.wxw + vec3(9.99999996e-12, 0.0, 9.99999996e-12);
    u_xlat2.xy = vs_TEXCOORD4.xy / u_xlat1.xx;
    u_xlat2.z = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat3.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat4 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat3 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat18.x = u_xlat3.y * hlslcc_mtx4x4unity_CameraToWorld[1].y;
    u_xlat18.x = hlslcc_mtx4x4unity_CameraToWorld[0].y * u_xlat3.x + u_xlat18.x;
    u_xlat18.x = (-u_xlat3.z) * hlslcc_mtx4x4unity_CameraToWorld[2].y + u_xlat18.x;
    u_xlat18.x = u_xlat18.x + hlslcc_mtx4x4unity_CameraToWorld[3].y;
    u_xlat18.x = u_xlat18.x + 9.99999975e-06;
    u_xlat26 = vs_TEXCOORD1.y + 0.349999994;
    u_xlat18.y = (-u_xlat18.x) + u_xlat26;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.y = min(max(u_xlat18.y, 0.0), 1.0);
#else
    u_xlat18.y = clamp(u_xlat18.y, 0.0, 1.0);
#endif
    u_xlat18.x = (-u_xlat18.x) + vs_TEXCOORD1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlatb3.xy = lessThan(vec4(0.200000003, 0.25, 0.0, 0.0), vs_TEXCOORD0.yyyy).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat18;
        hlslcc_movcTemp.x = (u_xlatb3.y) ? (-u_xlat18.x) : float(-1.0);
        hlslcc_movcTemp.y = (u_xlatb3.x) ? (-u_xlat18.y) : float(-1.0);
        u_xlat18 = hlslcc_movcTemp;
    }
    u_xlat18.x = u_xlat18.x / _ShoreRange;
    u_xlat18.x = u_xlat18.x * 1.44269502;
    u_xlat18.x = exp2(u_xlat18.x);
    u_xlat18.x = min(u_xlat18.x, 1.10000002);
    u_xlat3.x = u_xlat18.y / _DeepRange;
    u_xlat26 = u_xlat18.y / _ShoreRange1;
    u_xlat26 = u_xlat26 * 1.44269502;
    u_xlat26 = exp2(u_xlat26);
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat3.x = u_xlat3.x * 1.44269502;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat11.xyz = (-_DeepColor.xyz) + _ShallowColor.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat11.xyz + _DeepColor.xyz;
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_WaterIntensity) + u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD1.xy * vec2(-0.100000001, -0.100000001);
    u_xlat3.xy = u_xlat3.xy / vec2(_NormalScaleNew);
    u_xlat4 = _Time.yyyy * _NormalSpeed.xyxy;
    u_xlat19.xy = u_xlat4.zw * vec2(-0.0500000007, -0.0500000007);
    u_xlat4.xy = u_xlat4.xy * vec2(0.100000001, 0.100000001) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(2.0, 2.0) + u_xlat19.xy;
    u_xlat16_3.xyz = texture(_BumpTex, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_BumpTex, u_xlat4.xy).xyz;
    u_xlat16_6.z = u_xlat16_5.z * u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_5.xy + u_xlat16_3.xy;
    u_xlat16_5.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xy = u_xlat16_5.xx * u_xlat16_6.xy;
    u_xlat24 = _ReflectDistort * 0.00999999978;
    u_xlat2.xy = u_xlat16_5.xy * vec2(u_xlat24) + u_xlat2.xy;
    u_xlat3.xy = u_xlat16_5.xy * vec2(vec2(_UnderWaterDistort, _UnderWaterDistort));
    u_xlat19.xy = u_xlat2.xy + vec2(0.0, -0.200000003);
    u_xlat16_4.xyz = texture(_ReflectionTex, u_xlat2.xy).xyz;
    u_xlat16_7.xyz = texture(_ReflectionTex, u_xlat19.xy).xyz;
    u_xlat12.xyz = u_xlat16_4.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat16_4.xxx * u_xlat12.xyz + u_xlat16_7.xyz;
    u_xlat24 = u_xlat26 * -2.0 + 3.0;
    u_xlat2.x = u_xlat26 * u_xlat26;
    u_xlat24 = u_xlat24 * u_xlat2.x;
    u_xlat2.x = log2(u_xlat24);
    u_xlat2.x = u_xlat2.x * _ReflectPower;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat2.xxx + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x * _ReflectIntensity;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vs_TEXCOORD2.xyz;
    u_xlat2.x = u_xlat1.x * 0.5;
    u_xlat10 = (-u_xlat1.x) * 0.5 + vs_TEXCOORD4.y;
    u_xlat1.z = u_xlat10 * _ProjectionParams.x + u_xlat2.x;
    u_xlat2.xyw = u_xlat1.yzw / u_xlat1.xxx;
    u_xlat2.xy = u_xlat3.xy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat16_2.xyw = texture(_GrabTexture, u_xlat2.xy).xyz;
    u_xlat3.xyz = (-u_xlat0.xyz) + u_xlat16_2.xyw;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat2.xyw = u_xlat16_2.xyw * _ShoreColor.xyz + (-u_xlat0.xyz);
    u_xlat3.x = (-_ShoreEdgeWidth) + 1.0;
    u_xlat18.x = u_xlat18.x + (-u_xlat3.x);
    u_xlat3.x = (-u_xlat3.x) + 1.10000002;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat18.x = u_xlat18.x * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat18.x * -2.0 + 3.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat3.x;
    u_xlat24 = u_xlat24 * 2.0 + u_xlat18.x;
    u_xlat3.xyz = u_xlat18.xxx * _ShoreEdgeColor.xyz;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat2.xyw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_ShoreEdgeIntensity) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.w = vs_COLOR0.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _WaveASpeedXY;
uniform 	vec4 _WaveBSpeedXY;
uniform 	vec4 _WaveCSpeedXY;
uniform 	vec4 _WaterColor;
uniform 	float _WaveColorIntensity;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
float u_xlat7;
vec4 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat15;
vec2 u_xlat20;
float u_xlat24;
float u_xlat30;
float u_xlat31;
float u_xlat32;
float u_xlat34;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = 6.28318548 / _WaveASpeedXY.w;
    u_xlat10.x = 9.80000019 / u_xlat0.x;
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat20.x = dot(_WaveASpeedXY.xy, _WaveASpeedXY.xy);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat20.xy = u_xlat20.xx * _WaveASpeedXY.xy;
    u_xlat31 = dot(u_xlat20.xy, u_xlat1.xz);
    u_xlat10.x = (-u_xlat10.x) * _Time.y + u_xlat31;
    u_xlat10.x = u_xlat10.x * u_xlat0.x;
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3.x = cos(u_xlat10.x);
    u_xlat10.x = _WaveASpeedXY.z * 0.00999999978;
    u_xlat0.x = u_xlat10.x / u_xlat0.x;
    u_xlat31 = u_xlat3.x * u_xlat0.x;
    u_xlat4.y = u_xlat2.x * u_xlat0.x;
    u_xlat4.xz = u_xlat20.xy * vec2(u_xlat31);
    u_xlat0.x = dot(_WaveBSpeedXY.xy, _WaveBSpeedXY.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat12.xy = u_xlat0.xx * _WaveBSpeedXY.xy;
    u_xlat0.x = dot(u_xlat12.xy, u_xlat1.xz);
    u_xlat31 = 6.28318548 / _WaveBSpeedXY.w;
    u_xlat32 = 9.80000019 / u_xlat31;
    u_xlat32 = sqrt(u_xlat32);
    u_xlat0.x = (-u_xlat32) * _Time.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat31;
    u_xlat5 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat32 = _WaveBSpeedXY.z * 0.00999999978;
    u_xlat31 = u_xlat32 / u_xlat31;
    u_xlat13.x = u_xlat5 * u_xlat31;
    u_xlat6.y = u_xlat0.x * u_xlat31;
    u_xlat6.xz = u_xlat12.xy * u_xlat13.xx;
    u_xlat13.xyz = u_xlat4.xyz + u_xlat6.xyz;
    u_xlat31 = dot(_WaveCSpeedXY.xy, _WaveCSpeedXY.xy);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat4.xy = vec2(u_xlat31) * _WaveCSpeedXY.xy;
    u_xlat31 = dot(u_xlat4.xy, u_xlat1.xz);
    u_xlat24 = 6.28318548 / _WaveCSpeedXY.w;
    u_xlat34 = 9.80000019 / u_xlat24;
    u_xlat34 = sqrt(u_xlat34);
    u_xlat31 = (-u_xlat34) * _Time.y + u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat24;
    u_xlat6.x = sin(u_xlat31);
    u_xlat7 = cos(u_xlat31);
    u_xlat31 = _WaveCSpeedXY.z * 0.00999999978;
    u_xlat24 = u_xlat31 / u_xlat24;
    u_xlat34 = u_xlat7 * u_xlat24;
    u_xlat8.y = u_xlat6.x * u_xlat24;
    u_xlat8.xz = vec2(u_xlat34) * u_xlat4.xy;
    u_xlat13.xyz = u_xlat13.xyz + u_xlat8.xyz;
    u_xlat15.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat8 = u_xlat13.yyyy * _WaterColor;
    vs_TEXCOORD2 = u_xlat8 * vec4(_WaveColorIntensity);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = u_xlat15.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat15.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat15.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat8 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat8 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat8;
    u_xlat8 = u_xlat8 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat9 = u_xlat8.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat9 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat8.xxxx + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat8.zzzz + u_xlat9;
    u_xlat8 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat8.wwww + u_xlat9;
    gl_Position = u_xlat8;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = u_xlat2.x * u_xlat10.x;
    u_xlat10.x = u_xlat3.x * u_xlat10.x;
    u_xlat3.xy = u_xlat10.xx * u_xlat20.xy;
    u_xlat10.xyz = u_xlat20.xyy * (-u_xlat20.xxy);
    u_xlat9.xyz = u_xlat1.xxx * u_xlat10.xyz;
    u_xlat9.w = u_xlat3.x;
    u_xlat10.xyz = u_xlat9.wyx + vec3(0.0, 0.0, 1.0);
    u_xlat3.zw = u_xlat9.yz;
    u_xlat1.xyz = u_xlat3.wzy + vec3(1.0, 0.0, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat32;
    u_xlat2.x = u_xlat5 * u_xlat32;
    u_xlat3.xy = u_xlat2.xx * u_xlat12.xy;
    u_xlat2.xyz = u_xlat12.xyy * (-u_xlat12.xxy);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.w = u_xlat3.x;
    u_xlat0.xyz = u_xlat10.xyz + u_xlat2.wyx;
    u_xlat3.zw = u_xlat2.yz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.wzy;
    u_xlat30 = u_xlat6.x * u_xlat31;
    u_xlat31 = u_xlat7 * u_xlat31;
    u_xlat2.xy = vec2(u_xlat31) * u_xlat4.xy;
    u_xlat3.xyz = u_xlat4.xyy * (-u_xlat4.xxy);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz;
    u_xlat3.w = u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.wyx;
    u_xlat2.zw = u_xlat3.yz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.wzy;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 0.00100000005);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat30 = dot(u_xlat0, u_xlat0);
    u_xlat30 = inversesqrt(u_xlat30);
    vs_TEXCOORD3.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat0.x = u_xlat8.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat8.xw * vec2(0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat8.zw;
    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _WaterTex_ST;
uniform 	vec4 _WaveSpeed;
uniform 	float _NormalScaleNew;
uniform 	vec4 _NormalSpeed;
uniform 	float _NormalsStrength;
uniform 	float _DistortIntensity;
uniform 	vec4 _WaterColor;
uniform 	float _WaterIntensity;
uniform 	vec4 _DeepColor;
uniform 	vec4 _ShallowColor;
uniform 	float _DeepRange;
uniform 	vec3 _normalOffset;
uniform 	float _lightPower;
uniform 	float _ReflectDistort;
uniform 	float _ShoreRange1;
uniform 	float _ReflectPower;
uniform 	float _ReflectIntensity;
uniform 	float _UnderWaterDistort;
uniform 	vec4 _ShoreColor;
uniform 	float _ShoreEdgeWidth;
uniform 	float _ShoreRange;
uniform 	vec4 _ShoreEdgeColor;
uniform 	float _ShoreEdgeIntensity;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _BumpTex;
uniform lowp sampler2D _WaterTex;
uniform lowp sampler2D _ReflectionTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec2 u_xlat10_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
lowp vec3 u_xlat10_7;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
vec2 u_xlat18;
vec2 u_xlat19;
float u_xlat24;
float u_xlat26;
void main()
{
    u_xlat0.x = _CosTime.w * _WaveSpeed.z;
    u_xlat0.z = _SinTime.w * _WaveSpeed.w;
    u_xlat0.xy = u_xlat0.xz * vec2(1.20000005, 0.5);
    u_xlat16.xy = vs_TEXCOORD0.xy / vec2(_NormalScaleNew);
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16.xy = _SinTime.ww * _WaveSpeed.xy + u_xlat16.xy;
    u_xlat10_16.xy = texture2D(_BumpTex, u_xlat16.xy).xy;
    u_xlat10_0.xy = texture2D(_BumpTex, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat10_16.xy * vec2(2.0, 2.0) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-2.0, -2.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_NormalsStrength);
    u_xlat0.xy = u_xlat0.xy * _WaterTex_ST.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _WaterTex_ST.zw;
    u_xlat10_0.x = texture2D(_WaterTex, u_xlat0.xy).x;
    u_xlat0.x = log2(u_xlat10_0.x);
    u_xlat0.x = u_xlat0.x * _DistortIntensity;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _WaterColor.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat3.xyz = vs_TEXCOORD3.xyz + vec3(_normalOffset.x, _normalOffset.y, _normalOffset.z);
    u_xlat24 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 9.99999975e-05);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _lightPower;
    u_xlat24 = exp2(u_xlat24);
    u_xlat1.xyw = vs_TEXCOORD4.wxw + vec3(9.99999996e-12, 0.0, 9.99999996e-12);
    u_xlat2.xy = vs_TEXCOORD4.xy / u_xlat1.xx;
    u_xlat2.z = texture2D(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat3.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat4 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat3 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat18.x = u_xlat3.y * hlslcc_mtx4x4unity_CameraToWorld[1].y;
    u_xlat18.x = hlslcc_mtx4x4unity_CameraToWorld[0].y * u_xlat3.x + u_xlat18.x;
    u_xlat18.x = (-u_xlat3.z) * hlslcc_mtx4x4unity_CameraToWorld[2].y + u_xlat18.x;
    u_xlat18.x = u_xlat18.x + hlslcc_mtx4x4unity_CameraToWorld[3].y;
    u_xlat18.x = u_xlat18.x + 9.99999975e-06;
    u_xlat26 = vs_TEXCOORD1.y + 0.349999994;
    u_xlat18.y = (-u_xlat18.x) + u_xlat26;
    u_xlat18.y = clamp(u_xlat18.y, 0.0, 1.0);
    u_xlat18.x = (-u_xlat18.x) + vs_TEXCOORD1.y;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlatb3.xy = lessThan(vec4(0.200000003, 0.25, 0.0, 0.0), vs_TEXCOORD0.yyyy).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat18;
        hlslcc_movcTemp.x = (u_xlatb3.y) ? (-u_xlat18.x) : float(-1.0);
        hlslcc_movcTemp.y = (u_xlatb3.x) ? (-u_xlat18.y) : float(-1.0);
        u_xlat18 = hlslcc_movcTemp;
    }
    u_xlat18.x = u_xlat18.x / _ShoreRange;
    u_xlat18.x = u_xlat18.x * 1.44269502;
    u_xlat18.x = exp2(u_xlat18.x);
    u_xlat18.x = min(u_xlat18.x, 1.10000002);
    u_xlat3.x = u_xlat18.y / _DeepRange;
    u_xlat26 = u_xlat18.y / _ShoreRange1;
    u_xlat26 = u_xlat26 * 1.44269502;
    u_xlat26 = exp2(u_xlat26);
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat3.x = u_xlat3.x * 1.44269502;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat11.xyz = (-_DeepColor.xyz) + _ShallowColor.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat11.xyz + _DeepColor.xyz;
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_WaterIntensity) + u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD1.xy * vec2(-0.100000001, -0.100000001);
    u_xlat3.xy = u_xlat3.xy / vec2(_NormalScaleNew);
    u_xlat4 = _Time.yyyy * _NormalSpeed.xyxy;
    u_xlat19.xy = u_xlat4.zw * vec2(-0.0500000007, -0.0500000007);
    u_xlat4.xy = u_xlat4.xy * vec2(0.100000001, 0.100000001) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(2.0, 2.0) + u_xlat19.xy;
    u_xlat10_3.xyz = texture2D(_BumpTex, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10_3.xyz = texture2D(_BumpTex, u_xlat4.xy).xyz;
    u_xlat16_6.z = u_xlat16_5.z * u_xlat10_3.z;
    u_xlat16_6.xy = u_xlat16_5.xy + u_xlat10_3.xy;
    u_xlat16_5.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xy = u_xlat16_5.xx * u_xlat16_6.xy;
    u_xlat24 = _ReflectDistort * 0.00999999978;
    u_xlat2.xy = u_xlat16_5.xy * vec2(u_xlat24) + u_xlat2.xy;
    u_xlat3.xy = u_xlat16_5.xy * vec2(vec2(_UnderWaterDistort, _UnderWaterDistort));
    u_xlat19.xy = u_xlat2.xy + vec2(0.0, -0.200000003);
    u_xlat10_4.xyz = texture2D(_ReflectionTex, u_xlat2.xy).xyz;
    u_xlat10_7.xyz = texture2D(_ReflectionTex, u_xlat19.xy).xyz;
    u_xlat12.xyz = u_xlat10_4.xyz + (-u_xlat10_7.xyz);
    u_xlat4.xyz = u_xlat10_4.xxx * u_xlat12.xyz + u_xlat10_7.xyz;
    u_xlat24 = u_xlat26 * -2.0 + 3.0;
    u_xlat2.x = u_xlat26 * u_xlat26;
    u_xlat24 = u_xlat24 * u_xlat2.x;
    u_xlat2.x = log2(u_xlat24);
    u_xlat2.x = u_xlat2.x * _ReflectPower;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat2.xxx + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x * _ReflectIntensity;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vs_TEXCOORD2.xyz;
    u_xlat2.x = u_xlat1.x * 0.5;
    u_xlat10 = (-u_xlat1.x) * 0.5 + vs_TEXCOORD4.y;
    u_xlat1.z = u_xlat10 * _ProjectionParams.x + u_xlat2.x;
    u_xlat2.xyw = u_xlat1.yzw / u_xlat1.xxx;
    u_xlat2.xy = u_xlat3.xy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat10_2.xyw = texture2D(_GrabTexture, u_xlat2.xy).xyz;
    u_xlat3.xyz = (-u_xlat0.xyz) + u_xlat10_2.xyw;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat2.xyw = u_xlat10_2.xyw * _ShoreColor.xyz + (-u_xlat0.xyz);
    u_xlat3.x = (-_ShoreEdgeWidth) + 1.0;
    u_xlat18.x = u_xlat18.x + (-u_xlat3.x);
    u_xlat3.x = (-u_xlat3.x) + 1.10000002;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat18.x = u_xlat18.x * u_xlat3.x;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlat3.x = u_xlat18.x * -2.0 + 3.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat3.x;
    u_xlat24 = u_xlat24 * 2.0 + u_xlat18.x;
    u_xlat3.xyz = u_xlat18.xxx * _ShoreEdgeColor.xyz;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat2.xyw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_ShoreEdgeIntensity) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.w = vs_COLOR0.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _WaveASpeedXY;
uniform 	vec4 _WaveBSpeedXY;
uniform 	vec4 _WaveCSpeedXY;
uniform 	vec4 _WaterColor;
uniform 	float _WaveColorIntensity;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
float u_xlat7;
vec4 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat12;
vec3 u_xlat13;
vec3 u_xlat15;
vec2 u_xlat20;
float u_xlat24;
float u_xlat30;
float u_xlat31;
float u_xlat32;
float u_xlat34;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.x = 6.28318548 / _WaveASpeedXY.w;
    u_xlat10.x = 9.80000019 / u_xlat0.x;
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat1.xyz;
    u_xlat20.x = dot(_WaveASpeedXY.xy, _WaveASpeedXY.xy);
    u_xlat20.x = inversesqrt(u_xlat20.x);
    u_xlat20.xy = u_xlat20.xx * _WaveASpeedXY.xy;
    u_xlat31 = dot(u_xlat20.xy, u_xlat1.xz);
    u_xlat10.x = (-u_xlat10.x) * _Time.y + u_xlat31;
    u_xlat10.x = u_xlat10.x * u_xlat0.x;
    u_xlat2.x = sin(u_xlat10.x);
    u_xlat3.x = cos(u_xlat10.x);
    u_xlat10.x = _WaveASpeedXY.z * 0.00999999978;
    u_xlat0.x = u_xlat10.x / u_xlat0.x;
    u_xlat31 = u_xlat3.x * u_xlat0.x;
    u_xlat4.y = u_xlat2.x * u_xlat0.x;
    u_xlat4.xz = u_xlat20.xy * vec2(u_xlat31);
    u_xlat0.x = dot(_WaveBSpeedXY.xy, _WaveBSpeedXY.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat12.xy = u_xlat0.xx * _WaveBSpeedXY.xy;
    u_xlat0.x = dot(u_xlat12.xy, u_xlat1.xz);
    u_xlat31 = 6.28318548 / _WaveBSpeedXY.w;
    u_xlat32 = 9.80000019 / u_xlat31;
    u_xlat32 = sqrt(u_xlat32);
    u_xlat0.x = (-u_xlat32) * _Time.y + u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat31;
    u_xlat5 = cos(u_xlat0.x);
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat32 = _WaveBSpeedXY.z * 0.00999999978;
    u_xlat31 = u_xlat32 / u_xlat31;
    u_xlat13.x = u_xlat5 * u_xlat31;
    u_xlat6.y = u_xlat0.x * u_xlat31;
    u_xlat6.xz = u_xlat12.xy * u_xlat13.xx;
    u_xlat13.xyz = u_xlat4.xyz + u_xlat6.xyz;
    u_xlat31 = dot(_WaveCSpeedXY.xy, _WaveCSpeedXY.xy);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat4.xy = vec2(u_xlat31) * _WaveCSpeedXY.xy;
    u_xlat31 = dot(u_xlat4.xy, u_xlat1.xz);
    u_xlat24 = 6.28318548 / _WaveCSpeedXY.w;
    u_xlat34 = 9.80000019 / u_xlat24;
    u_xlat34 = sqrt(u_xlat34);
    u_xlat31 = (-u_xlat34) * _Time.y + u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat24;
    u_xlat6.x = sin(u_xlat31);
    u_xlat7 = cos(u_xlat31);
    u_xlat31 = _WaveCSpeedXY.z * 0.00999999978;
    u_xlat24 = u_xlat31 / u_xlat24;
    u_xlat34 = u_xlat7 * u_xlat24;
    u_xlat8.y = u_xlat6.x * u_xlat24;
    u_xlat8.xz = vec2(u_xlat34) * u_xlat4.xy;
    u_xlat13.xyz = u_xlat13.xyz + u_xlat8.xyz;
    u_xlat15.xyz = u_xlat1.xyz + u_xlat13.xyz;
    u_xlat8 = u_xlat13.yyyy * _WaterColor;
    vs_TEXCOORD2 = u_xlat8 * vec4(_WaveColorIntensity);
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat1.xyz = u_xlat15.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat15.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat15.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat8 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat8 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat8;
    u_xlat8 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat8;
    u_xlat8 = u_xlat8 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat9 = u_xlat8.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat9 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat8.xxxx + u_xlat9;
    u_xlat9 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat8.zzzz + u_xlat9;
    u_xlat8 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat8.wwww + u_xlat9;
    gl_Position = u_xlat8;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = u_xlat2.x * u_xlat10.x;
    u_xlat10.x = u_xlat3.x * u_xlat10.x;
    u_xlat3.xy = u_xlat10.xx * u_xlat20.xy;
    u_xlat10.xyz = u_xlat20.xyy * (-u_xlat20.xxy);
    u_xlat9.xyz = u_xlat1.xxx * u_xlat10.xyz;
    u_xlat9.w = u_xlat3.x;
    u_xlat10.xyz = u_xlat9.wyx + vec3(0.0, 0.0, 1.0);
    u_xlat3.zw = u_xlat9.yz;
    u_xlat1.xyz = u_xlat3.wzy + vec3(1.0, 0.0, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat32;
    u_xlat2.x = u_xlat5 * u_xlat32;
    u_xlat3.xy = u_xlat2.xx * u_xlat12.xy;
    u_xlat2.xyz = u_xlat12.xyy * (-u_xlat12.xxy);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.w = u_xlat3.x;
    u_xlat0.xyz = u_xlat10.xyz + u_xlat2.wyx;
    u_xlat3.zw = u_xlat2.yz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat3.wzy;
    u_xlat30 = u_xlat6.x * u_xlat31;
    u_xlat31 = u_xlat7 * u_xlat31;
    u_xlat2.xy = vec2(u_xlat31) * u_xlat4.xy;
    u_xlat3.xyz = u_xlat4.xyy * (-u_xlat4.xxy);
    u_xlat3.xyz = vec3(u_xlat30) * u_xlat3.xyz;
    u_xlat3.w = u_xlat2.x;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat3.wyx;
    u_xlat2.zw = u_xlat3.yz;
    u_xlat1.xyz = u_xlat1.xyz + u_xlat2.wzy;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.zxy * u_xlat0.yzx + (-u_xlat2.xyz);
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToObject[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 0.00100000005);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat30 = dot(u_xlat0, u_xlat0);
    u_xlat30 = inversesqrt(u_xlat30);
    vs_TEXCOORD3.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat0.x = u_xlat8.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat8.xw * vec2(0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat8.zw;
    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _SinTime;
uniform 	vec4 _CosTime;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 _WaterTex_ST;
uniform 	vec4 _WaveSpeed;
uniform 	float _NormalScaleNew;
uniform 	vec4 _NormalSpeed;
uniform 	float _NormalsStrength;
uniform 	float _DistortIntensity;
uniform 	vec4 _WaterColor;
uniform 	float _WaterIntensity;
uniform 	vec4 _DeepColor;
uniform 	vec4 _ShallowColor;
uniform 	float _DeepRange;
uniform 	vec3 _normalOffset;
uniform 	float _lightPower;
uniform 	float _ReflectDistort;
uniform 	float _ShoreRange1;
uniform 	float _ReflectPower;
uniform 	float _ReflectIntensity;
uniform 	float _UnderWaterDistort;
uniform 	vec4 _ShoreColor;
uniform 	float _ShoreEdgeWidth;
uniform 	float _ShoreRange;
uniform 	vec4 _ShoreEdgeColor;
uniform 	float _ShoreEdgeIntensity;
uniform highp sampler2D _CameraDepthTexture;
uniform lowp sampler2D _BumpTex;
uniform lowp sampler2D _WaterTex;
uniform lowp sampler2D _ReflectionTex;
uniform lowp sampler2D _GrabTexture;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec2 u_xlat10_0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec3 u_xlat10_3;
bvec2 u_xlatb3;
vec4 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
lowp vec3 u_xlat10_7;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat16;
lowp vec2 u_xlat10_16;
vec2 u_xlat18;
vec2 u_xlat19;
float u_xlat24;
float u_xlat26;
void main()
{
    u_xlat0.x = _CosTime.w * _WaveSpeed.z;
    u_xlat0.z = _SinTime.w * _WaveSpeed.w;
    u_xlat0.xy = u_xlat0.xz * vec2(1.20000005, 0.5);
    u_xlat16.xy = vs_TEXCOORD0.xy / vec2(_NormalScaleNew);
    u_xlat0.xy = u_xlat16.xy + u_xlat0.xy;
    u_xlat16.xy = _SinTime.ww * _WaveSpeed.xy + u_xlat16.xy;
    u_xlat10_16.xy = texture2D(_BumpTex, u_xlat16.xy).xy;
    u_xlat10_0.xy = texture2D(_BumpTex, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat0.xy = u_xlat10_16.xy * vec2(2.0, 2.0) + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-2.0, -2.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_NormalsStrength);
    u_xlat0.xy = u_xlat0.xy * _WaterTex_ST.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy + _WaterTex_ST.zw;
    u_xlat10_0.x = texture2D(_WaterTex, u_xlat0.xy).x;
    u_xlat0.x = log2(u_xlat10_0.x);
    u_xlat0.x = u_xlat0.x * _DistortIntensity;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _WaterColor.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat3.xyz = vs_TEXCOORD3.xyz + vec3(_normalOffset.x, _normalOffset.y, _normalOffset.z);
    u_xlat24 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 9.99999975e-05);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _lightPower;
    u_xlat24 = exp2(u_xlat24);
    u_xlat1.xyw = vs_TEXCOORD4.wxw + vec3(9.99999996e-12, 0.0, 9.99999996e-12);
    u_xlat2.xy = vs_TEXCOORD4.xy / u_xlat1.xx;
    u_xlat2.z = texture2D(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat3.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat4 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat3 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat3.xyz = u_xlat3.xyz / u_xlat3.www;
    u_xlat18.x = u_xlat3.y * hlslcc_mtx4x4unity_CameraToWorld[1].y;
    u_xlat18.x = hlslcc_mtx4x4unity_CameraToWorld[0].y * u_xlat3.x + u_xlat18.x;
    u_xlat18.x = (-u_xlat3.z) * hlslcc_mtx4x4unity_CameraToWorld[2].y + u_xlat18.x;
    u_xlat18.x = u_xlat18.x + hlslcc_mtx4x4unity_CameraToWorld[3].y;
    u_xlat18.x = u_xlat18.x + 9.99999975e-06;
    u_xlat26 = vs_TEXCOORD1.y + 0.349999994;
    u_xlat18.y = (-u_xlat18.x) + u_xlat26;
    u_xlat18.y = clamp(u_xlat18.y, 0.0, 1.0);
    u_xlat18.x = (-u_xlat18.x) + vs_TEXCOORD1.y;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlatb3.xy = lessThan(vec4(0.200000003, 0.25, 0.0, 0.0), vs_TEXCOORD0.yyyy).xy;
    {
        vec2 hlslcc_movcTemp = u_xlat18;
        hlslcc_movcTemp.x = (u_xlatb3.y) ? (-u_xlat18.x) : float(-1.0);
        hlslcc_movcTemp.y = (u_xlatb3.x) ? (-u_xlat18.y) : float(-1.0);
        u_xlat18 = hlslcc_movcTemp;
    }
    u_xlat18.x = u_xlat18.x / _ShoreRange;
    u_xlat18.x = u_xlat18.x * 1.44269502;
    u_xlat18.x = exp2(u_xlat18.x);
    u_xlat18.x = min(u_xlat18.x, 1.10000002);
    u_xlat3.x = u_xlat18.y / _DeepRange;
    u_xlat26 = u_xlat18.y / _ShoreRange1;
    u_xlat26 = u_xlat26 * 1.44269502;
    u_xlat26 = exp2(u_xlat26);
    u_xlat26 = min(u_xlat26, 1.0);
    u_xlat3.x = u_xlat3.x * 1.44269502;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat11.xyz = (-_DeepColor.xyz) + _ShallowColor.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat11.xyz + _DeepColor.xyz;
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_WaterIntensity) + u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD1.xy * vec2(-0.100000001, -0.100000001);
    u_xlat3.xy = u_xlat3.xy / vec2(_NormalScaleNew);
    u_xlat4 = _Time.yyyy * _NormalSpeed.xyxy;
    u_xlat19.xy = u_xlat4.zw * vec2(-0.0500000007, -0.0500000007);
    u_xlat4.xy = u_xlat4.xy * vec2(0.100000001, 0.100000001) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(2.0, 2.0) + u_xlat19.xy;
    u_xlat10_3.xyz = texture2D(_BumpTex, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat10_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10_3.xyz = texture2D(_BumpTex, u_xlat4.xy).xyz;
    u_xlat16_6.z = u_xlat16_5.z * u_xlat10_3.z;
    u_xlat16_6.xy = u_xlat16_5.xy + u_xlat10_3.xy;
    u_xlat16_5.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xy = u_xlat16_5.xx * u_xlat16_6.xy;
    u_xlat24 = _ReflectDistort * 0.00999999978;
    u_xlat2.xy = u_xlat16_5.xy * vec2(u_xlat24) + u_xlat2.xy;
    u_xlat3.xy = u_xlat16_5.xy * vec2(vec2(_UnderWaterDistort, _UnderWaterDistort));
    u_xlat19.xy = u_xlat2.xy + vec2(0.0, -0.200000003);
    u_xlat10_4.xyz = texture2D(_ReflectionTex, u_xlat2.xy).xyz;
    u_xlat10_7.xyz = texture2D(_ReflectionTex, u_xlat19.xy).xyz;
    u_xlat12.xyz = u_xlat10_4.xyz + (-u_xlat10_7.xyz);
    u_xlat4.xyz = u_xlat10_4.xxx * u_xlat12.xyz + u_xlat10_7.xyz;
    u_xlat24 = u_xlat26 * -2.0 + 3.0;
    u_xlat2.x = u_xlat26 * u_xlat26;
    u_xlat24 = u_xlat24 * u_xlat2.x;
    u_xlat2.x = log2(u_xlat24);
    u_xlat2.x = u_xlat2.x * _ReflectPower;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat2.xxx + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x * _ReflectIntensity;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vs_TEXCOORD2.xyz;
    u_xlat2.x = u_xlat1.x * 0.5;
    u_xlat10 = (-u_xlat1.x) * 0.5 + vs_TEXCOORD4.y;
    u_xlat1.z = u_xlat10 * _ProjectionParams.x + u_xlat2.x;
    u_xlat2.xyw = u_xlat1.yzw / u_xlat1.xxx;
    u_xlat2.xy = u_xlat3.xy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat10_2.xyw = texture2D(_GrabTexture, u_xlat2.xy).xyz;
    u_xlat3.xyz = (-u_xlat0.xyz) + u_xlat10_2.xyw;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat2.xyw = u_xlat10_2.xyw * _ShoreColor.xyz + (-u_xlat0.xyz);
    u_xlat3.x = (-_ShoreEdgeWidth) + 1.0;
    u_xlat18.x = u_xlat18.x + (-u_xlat3.x);
    u_xlat3.x = (-u_xlat3.x) + 1.10000002;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat18.x = u_xlat18.x * u_xlat3.x;
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
    u_xlat3.x = u_xlat18.x * -2.0 + 3.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat3.x;
    u_xlat24 = u_xlat24 * 2.0 + u_xlat18.x;
    u_xlat3.xyz = u_xlat18.xxx * _ShoreEdgeColor.xyz;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat2.xyw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_ShoreEdgeIntensity) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.w = vs_COLOR0.w;
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