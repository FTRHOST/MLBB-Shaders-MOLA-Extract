//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Scene/ToonWater_Old" {
Properties {

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_RefTex ("反射图", 2D) = "white" { }

_lightPower ("灯光次幂", Float) = 0.0

_normalOffset ("灯光法线偏移", Vector) = (0,0,0,0)

_ShallowColor ("浅水区颜色", Color) = (0,0,0,0)

_ShallowColor_HDR ("浅水区颜色(后处理)", Color) = (0,0,0,0)

_Float13 ("浅水区颜色强度", Float) = 1.0

_DeepColor ("深水区颜色", Color) = (0,0,0,0)

_DeepColor_HDR ("深水区颜色(后处理)", Color) = (0,0,0,0)

_Float12 ("深水区颜色强度", Float) = 0.0

_DeepRange ("浅水区域", Range(0.001, 100)) = 0.0

_ReflectDistort ("反射扰动", Float) = 0.0

_ReflectPower ("反射次幂", Float) = 0.0

_ReflectPower_HDR ("反射次幂(后处理)", Float) = 0.0

_ReflectIntensity ("反射强度", Range(0, 1)) = 0.0

_NormalScale ("水面法线扰动缩放值", Float) = 0.0

_NormalSpeed ("水面法线扰动速度", Vector) = (0,0,0,0)

_UnderWaterDistort ("水底扰动强度", Float) = 0.0

_ShoreRange1 ("岸边范围", Range(0.001, 100)) = 0.0

_ShoreColor ("岸边颜色", Color) = (0,0,0,0)

_ShoreColor_HDR ("岸边颜色(后处理)", Color) = (0,0,0,0)

_ShoreRange ("白边范围", Range(0.001, 100)) = 0.0

_ShoreEdgeColor ("白边颜色", Color) = (0,0,0,0)

_ShoreEdgeColor_HDR ("白边颜色(后处理)", Color) = (0,0,0,0)

_ShoreEdgeWidth ("白边宽度", Range(0, 1)) = 0.0

_ShoreEdgeIntensity ("白边颜色强度", Float) = 0.0

_NormalScaleNew ("水面法线贴图缩放值", Range(0.001, 10)) = 0.0

_BumpTex ("水面法线贴图", 2D) = "white" { }

_WaterTex ("水波纹贴图", 2D) = "white" { }

_NormalsStrength ("水波纹扰动强度", Float) = 0.0

_WaveSpeed ("水波纹速度", Vector) = (0,0,0,0)

_WaterColor ("水波纹颜色", Color) = (0,0,0,0)

_WaterColor_HDR ("水波纹颜色(后处理)", Color) = (0,0,0,0)

_WaterIntensity ("水波纹颜色强度", Float) = 0.0

_DistortIntensity ("水波纹扰动次幂", Float) = 0.0

_WaveColorIntensity ("WaveColorIntensity", Float) = 0.0

_WaveASpeedXY ("波浪1速度", Vector) = (0,0,0,0)

_WaveBSpeedXY ("波浪2速度", Vector) = (0,0,0,0)

_WaveCSpeedXY ("波浪3速度", Vector) = (0,0,0,0)

}
SubShader {
 Tags { "QUEUE" = "AlphaTest" "RenderType" = "AlphaTest" }
 GrabPass {
}
 Pass {
  Tags { "QUEUE" = "AlphaTest" "RenderType" = "AlphaTest" }
 ZWrite Off
  GpuProgramID 62409
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
uniform 	vec4 _WaveASpeedXY;
uniform 	vec4 _WaveBSpeedXY;
uniform 	vec4 _WaveCSpeedXY;
uniform 	mediump vec4 _WaterColor;
uniform 	float _WaveColorIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(3) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec3 u_xlat1;
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
    u_xlat8 = u_xlat8 * vec4(vec4(_WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity));
    vs_TEXCOORD2 = u_xlat8;
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
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
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
uniform 	vec4 _WaterTex_ST;
uniform 	vec4 _WaveSpeed;
uniform 	float _NormalScaleNew;
uniform 	vec4 _NormalSpeed;
uniform 	float _NormalsStrength;
uniform 	float _DistortIntensity;
uniform 	mediump vec4 _WaterColor;
uniform 	float _WaterIntensity;
uniform 	mediump vec4 _DeepColor;
uniform 	mediump vec4 _ShallowColor;
uniform 	float _DeepRange;
uniform 	vec3 _normalOffset;
uniform 	float _lightPower;
uniform 	float _ReflectDistort;
uniform 	float _ShoreRange1;
uniform 	float _ReflectPower;
uniform 	float _ReflectIntensity;
uniform 	float _UnderWaterDistort;
uniform 	mediump vec4 _ShoreColor;
uniform 	float _ShoreEdgeWidth;
uniform 	float _ShoreRange;
uniform 	mediump vec4 _ShoreEdgeColor;
uniform 	float _ShoreEdgeIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerCameraRare {
#endif
	UNITY_UNIFORM vec4 unity_CameraWorldClipPlanes[6];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BumpTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(2) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(3) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(4) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat18;
vec2 u_xlat19;
float u_xlat24;
float u_xlat26;
void main()
{
    u_xlat0.x = _WaveSpeed.z * _CosTime.w;
    u_xlat0.z = _WaveSpeed.w * _SinTime.w;
    u_xlat0.xy = u_xlat0.xz * vec2(1.20000005, 0.5);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = _SinTime.ww * _WaveSpeed.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_1.xy + u_xlat16_0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-2.0, -2.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_NormalsStrength) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _WaterTex_ST.xy + _WaterTex_ST.zw;
    u_xlat16_0.x = texture(_WaterTex, u_xlat0.xy).x;
    u_xlat0.x = log2(u_xlat16_0.x);
    u_xlat0.x = u_xlat0.x * _DistortIntensity;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _WaterColor.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = vs_TEXCOORD3.xyz + vec3(_normalOffset.x, _normalOffset.y, _normalOffset.z);
    u_xlat24 = dot(u_xlat2.xyz, u_xlat16_1.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 9.99999975e-05);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _lightPower;
    u_xlat24 = exp2(u_xlat24);
    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat2.z = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat3.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat3.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat18.x = u_xlat3.y * hlslcc_mtx4x4unity_CameraToWorld[1].y;
    u_xlat18.x = hlslcc_mtx4x4unity_CameraToWorld[0].y * u_xlat3.x + u_xlat18.x;
    u_xlat18.x = (-u_xlat3.z) * hlslcc_mtx4x4unity_CameraToWorld[2].y + u_xlat18.x;
    u_xlat18.x = u_xlat18.x + hlslcc_mtx4x4unity_CameraToWorld[3].y;
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
    u_xlat3.x = u_xlat18.y / _DeepRange;
    u_xlat26 = u_xlat18.y / _ShoreRange1;
    u_xlat26 = u_xlat26 * 1.44269502;
    u_xlat18.y = exp2(u_xlat26);
    u_xlat18.xy = min(u_xlat18.xy, vec2(1.10000002, 1.0));
    u_xlat3.x = u_xlat3.x * 1.44269502;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat11.xyz = (-_DeepColor.xyz) + _ShallowColor.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat11.xyz + _DeepColor.xyz;
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_WaterIntensity) + u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD1.xy * vec2(-0.100000001, -0.100000001);
    u_xlat3.xy = u_xlat3.xy / vec2(_NormalScaleNew);
    u_xlat1 = _NormalSpeed.xyxy * _Time.yyyy;
    u_xlat19.xy = u_xlat1.zw * vec2(0.0500000007, 0.0500000007);
    u_xlat4.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(2.0, 2.0) + (-u_xlat19.xy);
    u_xlat16_3.xyz = texture(_BumpTex, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_BumpTex, u_xlat4.xy).xyz;
    u_xlat16_6.z = u_xlat16_5.z * u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_5.xy + u_xlat16_3.xy;
    u_xlat16_5.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xy = u_xlat16_5.xx * u_xlat16_6.xy;
    u_xlat3.xy = u_xlat16_5.xy * vec2(_ReflectDistort);
    u_xlat19.xy = u_xlat16_5.xy * vec2(vec2(_UnderWaterDistort, _UnderWaterDistort));
    u_xlat2.xy = u_xlat3.xy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
    u_xlat3.xy = u_xlat2.xy + vec2(-0.0, -0.200000003);
    u_xlat16_4.xyz = texture(_ReflectionTex, u_xlat2.xy).xyz;
    u_xlat16_7.xyz = texture(_ReflectionTex, u_xlat3.xy).xyz;
    u_xlat12.xyz = u_xlat16_4.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat16_4.xxx * u_xlat12.xyz + u_xlat16_7.xyz;
    u_xlat24 = u_xlat18.y * -2.0 + 3.0;
    u_xlat2.x = u_xlat18.y * u_xlat18.y;
    u_xlat24 = u_xlat24 * u_xlat2.x;
    u_xlat2.x = log2(u_xlat24);
    u_xlat2.x = u_xlat2.x * _ReflectPower;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat2.xxx + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x * _ReflectIntensity;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vs_TEXCOORD2.xyz;
    u_xlat2.x = vs_TEXCOORD4.w * 0.5;
    u_xlat10 = (-vs_TEXCOORD4.w) * 0.5 + vs_TEXCOORD4.y;
    u_xlat4.y = u_xlat10 * _ProjectionParams.x + u_xlat2.x;
    u_xlat4.xz = vs_TEXCOORD4.xw;
    u_xlat2.xyw = u_xlat4.xyz / vs_TEXCOORD4.www;
    u_xlat2.xy = u_xlat19.xy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
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
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = vs_COLOR0.w;
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
uniform 	vec4 _WaveASpeedXY;
uniform 	vec4 _WaveBSpeedXY;
uniform 	vec4 _WaveCSpeedXY;
uniform 	mediump vec4 _WaterColor;
uniform 	float _WaveColorIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(3) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec3 u_xlat1;
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
    u_xlat8 = u_xlat8 * vec4(vec4(_WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity));
    vs_TEXCOORD2 = u_xlat8;
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
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
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
uniform 	vec4 _WaterTex_ST;
uniform 	vec4 _WaveSpeed;
uniform 	float _NormalScaleNew;
uniform 	vec4 _NormalSpeed;
uniform 	float _NormalsStrength;
uniform 	float _DistortIntensity;
uniform 	mediump vec4 _WaterColor;
uniform 	float _WaterIntensity;
uniform 	mediump vec4 _DeepColor;
uniform 	mediump vec4 _ShallowColor;
uniform 	float _DeepRange;
uniform 	vec3 _normalOffset;
uniform 	float _lightPower;
uniform 	float _ReflectDistort;
uniform 	float _ShoreRange1;
uniform 	float _ReflectPower;
uniform 	float _ReflectIntensity;
uniform 	float _UnderWaterDistort;
uniform 	mediump vec4 _ShoreColor;
uniform 	float _ShoreEdgeWidth;
uniform 	float _ShoreRange;
uniform 	mediump vec4 _ShoreEdgeColor;
uniform 	float _ShoreEdgeIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerCameraRare {
#endif
	UNITY_UNIFORM vec4 unity_CameraWorldClipPlanes[6];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BumpTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(2) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(3) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(4) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat18;
vec2 u_xlat19;
float u_xlat24;
float u_xlat26;
void main()
{
    u_xlat0.x = _WaveSpeed.z * _CosTime.w;
    u_xlat0.z = _WaveSpeed.w * _SinTime.w;
    u_xlat0.xy = u_xlat0.xz * vec2(1.20000005, 0.5);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = _SinTime.ww * _WaveSpeed.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_1.xy + u_xlat16_0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-2.0, -2.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_NormalsStrength) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _WaterTex_ST.xy + _WaterTex_ST.zw;
    u_xlat16_0.x = texture(_WaterTex, u_xlat0.xy).x;
    u_xlat0.x = log2(u_xlat16_0.x);
    u_xlat0.x = u_xlat0.x * _DistortIntensity;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _WaterColor.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = vs_TEXCOORD3.xyz + vec3(_normalOffset.x, _normalOffset.y, _normalOffset.z);
    u_xlat24 = dot(u_xlat2.xyz, u_xlat16_1.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 9.99999975e-05);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _lightPower;
    u_xlat24 = exp2(u_xlat24);
    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat2.z = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat3.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat3.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat18.x = u_xlat3.y * hlslcc_mtx4x4unity_CameraToWorld[1].y;
    u_xlat18.x = hlslcc_mtx4x4unity_CameraToWorld[0].y * u_xlat3.x + u_xlat18.x;
    u_xlat18.x = (-u_xlat3.z) * hlslcc_mtx4x4unity_CameraToWorld[2].y + u_xlat18.x;
    u_xlat18.x = u_xlat18.x + hlslcc_mtx4x4unity_CameraToWorld[3].y;
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
    u_xlat3.x = u_xlat18.y / _DeepRange;
    u_xlat26 = u_xlat18.y / _ShoreRange1;
    u_xlat26 = u_xlat26 * 1.44269502;
    u_xlat18.y = exp2(u_xlat26);
    u_xlat18.xy = min(u_xlat18.xy, vec2(1.10000002, 1.0));
    u_xlat3.x = u_xlat3.x * 1.44269502;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat11.xyz = (-_DeepColor.xyz) + _ShallowColor.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat11.xyz + _DeepColor.xyz;
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_WaterIntensity) + u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD1.xy * vec2(-0.100000001, -0.100000001);
    u_xlat3.xy = u_xlat3.xy / vec2(_NormalScaleNew);
    u_xlat1 = _NormalSpeed.xyxy * _Time.yyyy;
    u_xlat19.xy = u_xlat1.zw * vec2(0.0500000007, 0.0500000007);
    u_xlat4.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(2.0, 2.0) + (-u_xlat19.xy);
    u_xlat16_3.xyz = texture(_BumpTex, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_BumpTex, u_xlat4.xy).xyz;
    u_xlat16_6.z = u_xlat16_5.z * u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_5.xy + u_xlat16_3.xy;
    u_xlat16_5.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xy = u_xlat16_5.xx * u_xlat16_6.xy;
    u_xlat3.xy = u_xlat16_5.xy * vec2(_ReflectDistort);
    u_xlat19.xy = u_xlat16_5.xy * vec2(vec2(_UnderWaterDistort, _UnderWaterDistort));
    u_xlat2.xy = u_xlat3.xy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
    u_xlat3.xy = u_xlat2.xy + vec2(-0.0, -0.200000003);
    u_xlat16_4.xyz = texture(_ReflectionTex, u_xlat2.xy).xyz;
    u_xlat16_7.xyz = texture(_ReflectionTex, u_xlat3.xy).xyz;
    u_xlat12.xyz = u_xlat16_4.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat16_4.xxx * u_xlat12.xyz + u_xlat16_7.xyz;
    u_xlat24 = u_xlat18.y * -2.0 + 3.0;
    u_xlat2.x = u_xlat18.y * u_xlat18.y;
    u_xlat24 = u_xlat24 * u_xlat2.x;
    u_xlat2.x = log2(u_xlat24);
    u_xlat2.x = u_xlat2.x * _ReflectPower;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat2.xxx + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x * _ReflectIntensity;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vs_TEXCOORD2.xyz;
    u_xlat2.x = vs_TEXCOORD4.w * 0.5;
    u_xlat10 = (-vs_TEXCOORD4.w) * 0.5 + vs_TEXCOORD4.y;
    u_xlat4.y = u_xlat10 * _ProjectionParams.x + u_xlat2.x;
    u_xlat4.xz = vs_TEXCOORD4.xw;
    u_xlat2.xyw = u_xlat4.xyz / vs_TEXCOORD4.www;
    u_xlat2.xy = u_xlat19.xy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
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
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_QUALITY_LOW" }
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
uniform 	vec4 _WaveASpeedXY;
uniform 	vec4 _WaveBSpeedXY;
uniform 	vec4 _WaveCSpeedXY;
uniform 	mediump vec4 _WaterColor;
uniform 	float _WaveColorIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec3 u_xlat1;
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
    u_xlat8 = u_xlat8 * vec4(vec4(_WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity));
    vs_TEXCOORD2 = u_xlat8;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat8.wwww + u_xlat9;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = u_xlat2.x * u_xlat10.x;
    u_xlat10.x = u_xlat3.x * u_xlat10.x;
    u_xlat3.xy = u_xlat10.xx * u_xlat20.xy;
    u_xlat10.xyz = u_xlat20.xyy * (-u_xlat20.xxy);
    u_xlat8.xyz = u_xlat1.xxx * u_xlat10.xyz;
    u_xlat8.w = u_xlat3.x;
    u_xlat10.xyz = u_xlat8.wyx + vec3(0.0, 0.0, 1.0);
    u_xlat3.zw = u_xlat8.yz;
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
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    vs_TEXCOORD3.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _WaterTex_ST;
uniform 	vec4 _WaveSpeed;
uniform 	float _NormalScaleNew;
uniform 	float _NormalsStrength;
uniform 	float _DistortIntensity;
uniform 	mediump vec4 _WaterColor;
uniform 	float _WaterIntensity;
uniform 	mediump vec4 _DeepColor;
uniform 	mediump vec4 _ShallowColor;
uniform 	float _DeepRange;
uniform 	vec3 _normalOffset;
uniform 	float _lightPower;
uniform 	mediump vec4 _RefTex_ST;
uniform 	float _ShoreRange1;
uniform 	float _ReflectPower;
uniform 	float _ReflectIntensity;
uniform 	mediump vec4 _ShoreColor;
uniform 	float _ShoreEdgeWidth;
uniform 	float _ShoreRange;
uniform 	mediump vec4 _ShoreEdgeColor;
uniform 	float _ShoreEdgeIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BumpTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(2) uniform mediump sampler2D _RefTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat6;
float u_xlat12;
float u_xlat14;
void main()
{
    u_xlat0.x = _WaveSpeed.z * _CosTime.w;
    u_xlat0.z = _WaveSpeed.w * _SinTime.w;
    u_xlat0.xy = u_xlat0.xz * vec2(1.20000005, 0.5);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = _SinTime.ww * _WaveSpeed.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_1.xy + u_xlat16_0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-2.0, -2.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_NormalsStrength) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _WaterTex_ST.xy + _WaterTex_ST.zw;
    u_xlat16_0.x = texture(_WaterTex, u_xlat0.xy).x;
    u_xlat0.x = log2(u_xlat16_0.x);
    u_xlat0.x = u_xlat0.x * _DistortIntensity;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _WaterColor.zxy;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = vs_TEXCOORD3.xyz + vec3(_normalOffset.x, _normalOffset.y, _normalOffset.z);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat16_1.xyz);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _lightPower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat2.x = (-vs_COLOR0.x) / _DeepRange;
    u_xlat2.x = u_xlat2.x * 1.44269502;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat6.xyz = (-_DeepColor.zxy) + _ShallowColor.zxy;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat6.xyz + _DeepColor.zxy;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_WaterIntensity) + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat2.xy = u_xlat2.xy * _RefTex_ST.xy + _RefTex_ST.zw;
    u_xlat16_2.xyz = texture(_RefTex, u_xlat2.xy).xyz;
    u_xlat12 = (-vs_COLOR0.x) / _ShoreRange1;
    u_xlat12 = u_xlat12 * 1.44269502;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat14 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat14;
    u_xlat14 = log2(u_xlat12);
    u_xlat14 = u_xlat14 * _ReflectPower;
    u_xlat14 = exp2(u_xlat14);
    u_xlat2.xyz = u_xlat16_2.zxy * vec3(u_xlat14) + (-u_xlat0.xyz);
    u_xlat14 = u_xlat14 * _ReflectIntensity;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vs_TEXCOORD2.zxy;
    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) + _ShoreColor.zxy;
    u_xlat14 = (-vs_COLOR0.x) / _ShoreRange;
    u_xlat14 = u_xlat14 * 1.44269502;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = min(u_xlat14, 1.10000002);
    u_xlat3.x = (-_ShoreEdgeWidth) + 1.0;
    u_xlat14 = u_xlat14 + (-u_xlat3.x);
    u_xlat3.x = (-u_xlat3.x) + 1.10000002;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat14 = u_xlat14 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat14 * -2.0 + 3.0;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat14 = u_xlat14 * u_xlat3.x;
    u_xlat12 = u_xlat12 * 2.0 + u_xlat14;
    u_xlat3.xyz = vec3(u_xlat14) * _ShoreEdgeColor.zxy;
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_ShoreEdgeIntensity) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat12 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat12);
    u_xlat1.x = u_xlat12 * 0.0625 + u_xlat1.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_4.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_QUALITY_LOW" }
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
uniform 	vec4 _WaveASpeedXY;
uniform 	vec4 _WaveBSpeedXY;
uniform 	vec4 _WaveCSpeedXY;
uniform 	mediump vec4 _WaterColor;
uniform 	float _WaveColorIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec3 u_xlat1;
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
    u_xlat8 = u_xlat8 * vec4(vec4(_WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity));
    vs_TEXCOORD2 = u_xlat8;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat8.wwww + u_xlat9;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = u_xlat2.x * u_xlat10.x;
    u_xlat10.x = u_xlat3.x * u_xlat10.x;
    u_xlat3.xy = u_xlat10.xx * u_xlat20.xy;
    u_xlat10.xyz = u_xlat20.xyy * (-u_xlat20.xxy);
    u_xlat8.xyz = u_xlat1.xxx * u_xlat10.xyz;
    u_xlat8.w = u_xlat3.x;
    u_xlat10.xyz = u_xlat8.wyx + vec3(0.0, 0.0, 1.0);
    u_xlat3.zw = u_xlat8.yz;
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
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    vs_TEXCOORD3.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec4 _WaterTex_ST;
uniform 	vec4 _WaveSpeed;
uniform 	float _NormalScaleNew;
uniform 	float _NormalsStrength;
uniform 	float _DistortIntensity;
uniform 	mediump vec4 _WaterColor;
uniform 	float _WaterIntensity;
uniform 	mediump vec4 _DeepColor;
uniform 	mediump vec4 _ShallowColor;
uniform 	float _DeepRange;
uniform 	vec3 _normalOffset;
uniform 	float _lightPower;
uniform 	mediump vec4 _RefTex_ST;
uniform 	float _ShoreRange1;
uniform 	float _ReflectPower;
uniform 	float _ReflectIntensity;
uniform 	mediump vec4 _ShoreColor;
uniform 	float _ShoreEdgeWidth;
uniform 	float _ShoreRange;
uniform 	mediump vec4 _ShoreEdgeColor;
uniform 	float _ShoreEdgeIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BumpTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(2) uniform mediump sampler2D _RefTex;
UNITY_LOCATION(3) uniform mediump sampler2D _ACESLutTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat6;
float u_xlat12;
float u_xlat14;
void main()
{
    u_xlat0.x = _WaveSpeed.z * _CosTime.w;
    u_xlat0.z = _WaveSpeed.w * _SinTime.w;
    u_xlat0.xy = u_xlat0.xz * vec2(1.20000005, 0.5);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = _SinTime.ww * _WaveSpeed.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_1.xy + u_xlat16_0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-2.0, -2.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_NormalsStrength) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _WaterTex_ST.xy + _WaterTex_ST.zw;
    u_xlat16_0.x = texture(_WaterTex, u_xlat0.xy).x;
    u_xlat0.x = log2(u_xlat16_0.x);
    u_xlat0.x = u_xlat0.x * _DistortIntensity;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _WaterColor.zxy;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = vs_TEXCOORD3.xyz + vec3(_normalOffset.x, _normalOffset.y, _normalOffset.z);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat16_1.xyz);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _lightPower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat2.x = (-vs_COLOR0.x) / _DeepRange;
    u_xlat2.x = u_xlat2.x * 1.44269502;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat6.xyz = (-_DeepColor.zxy) + _ShallowColor.zxy;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat6.xyz + _DeepColor.zxy;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_WaterIntensity) + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat2.xy = u_xlat2.xy * _RefTex_ST.xy + _RefTex_ST.zw;
    u_xlat16_2.xyz = texture(_RefTex, u_xlat2.xy).xyz;
    u_xlat12 = (-vs_COLOR0.x) / _ShoreRange1;
    u_xlat12 = u_xlat12 * 1.44269502;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat14 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat14;
    u_xlat14 = log2(u_xlat12);
    u_xlat14 = u_xlat14 * _ReflectPower;
    u_xlat14 = exp2(u_xlat14);
    u_xlat2.xyz = u_xlat16_2.zxy * vec3(u_xlat14) + (-u_xlat0.xyz);
    u_xlat14 = u_xlat14 * _ReflectIntensity;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vs_TEXCOORD2.zxy;
    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) + _ShoreColor.zxy;
    u_xlat14 = (-vs_COLOR0.x) / _ShoreRange;
    u_xlat14 = u_xlat14 * 1.44269502;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = min(u_xlat14, 1.10000002);
    u_xlat3.x = (-_ShoreEdgeWidth) + 1.0;
    u_xlat14 = u_xlat14 + (-u_xlat3.x);
    u_xlat3.x = (-u_xlat3.x) + 1.10000002;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat14 = u_xlat14 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat14 * -2.0 + 3.0;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat14 = u_xlat14 * u_xlat3.x;
    u_xlat12 = u_xlat12 * 2.0 + u_xlat14;
    u_xlat3.xyz = vec3(u_xlat14) * _ShoreEdgeColor.zxy;
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_ShoreEdgeIntensity) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
    u_xlat0.xyz = min(u_xlat0.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat12 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat12);
    u_xlat1.x = u_xlat12 * 0.0625 + u_xlat1.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_4.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = vs_COLOR0.w;
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
uniform 	vec4 _WaveASpeedXY;
uniform 	vec4 _WaveBSpeedXY;
uniform 	vec4 _WaveCSpeedXY;
uniform 	mediump vec4 _WaterColor_HDR;
uniform 	float _WaveColorIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(3) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec3 u_xlat1;
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
    u_xlat8 = u_xlat13.yyyy * _WaterColor_HDR;
    u_xlat8 = u_xlat8 * vec4(vec4(_WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity));
    vs_TEXCOORD2 = u_xlat8;
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
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
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
uniform 	vec4 _WaterTex_ST;
uniform 	vec4 _WaveSpeed;
uniform 	float _NormalScaleNew;
uniform 	vec4 _NormalSpeed;
uniform 	float _NormalsStrength;
uniform 	float _DistortIntensity;
uniform 	mediump vec4 _WaterColor_HDR;
uniform 	float _WaterIntensity;
uniform 	mediump vec4 _DeepColor_HDR;
uniform 	mediump vec4 _ShallowColor_HDR;
uniform 	float _DeepRange;
uniform 	vec3 _normalOffset;
uniform 	float _lightPower;
uniform 	float _ReflectDistort;
uniform 	float _ShoreRange1;
uniform 	float _ReflectPower_HDR;
uniform 	float _ReflectIntensity;
uniform 	float _UnderWaterDistort;
uniform 	mediump vec4 _ShoreColor_HDR;
uniform 	float _ShoreEdgeWidth;
uniform 	float _ShoreRange;
uniform 	mediump vec4 _ShoreEdgeColor_HDR;
uniform 	float _ShoreEdgeIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerCameraRare {
#endif
	UNITY_UNIFORM vec4 unity_CameraWorldClipPlanes[6];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BumpTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(2) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(3) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(4) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat18;
vec2 u_xlat19;
float u_xlat24;
float u_xlat26;
void main()
{
    u_xlat0.x = _WaveSpeed.z * _CosTime.w;
    u_xlat0.z = _WaveSpeed.w * _SinTime.w;
    u_xlat0.xy = u_xlat0.xz * vec2(1.20000005, 0.5);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = _SinTime.ww * _WaveSpeed.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_1.xy + u_xlat16_0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-2.0, -2.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_NormalsStrength) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _WaterTex_ST.xy + _WaterTex_ST.zw;
    u_xlat16_0.x = texture(_WaterTex, u_xlat0.xy).x;
    u_xlat0.x = log2(u_xlat16_0.x);
    u_xlat0.x = u_xlat0.x * _DistortIntensity;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _WaterColor_HDR.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = vs_TEXCOORD3.xyz + vec3(_normalOffset.x, _normalOffset.y, _normalOffset.z);
    u_xlat24 = dot(u_xlat2.xyz, u_xlat16_1.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 9.99999975e-05);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _lightPower;
    u_xlat24 = exp2(u_xlat24);
    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat2.z = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat3.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat3.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat18.x = u_xlat3.y * hlslcc_mtx4x4unity_CameraToWorld[1].y;
    u_xlat18.x = hlslcc_mtx4x4unity_CameraToWorld[0].y * u_xlat3.x + u_xlat18.x;
    u_xlat18.x = (-u_xlat3.z) * hlslcc_mtx4x4unity_CameraToWorld[2].y + u_xlat18.x;
    u_xlat18.x = u_xlat18.x + hlslcc_mtx4x4unity_CameraToWorld[3].y;
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
    u_xlat3.x = u_xlat18.y / _DeepRange;
    u_xlat26 = u_xlat18.y / _ShoreRange1;
    u_xlat26 = u_xlat26 * 1.44269502;
    u_xlat18.y = exp2(u_xlat26);
    u_xlat18.xy = min(u_xlat18.xy, vec2(1.10000002, 1.0));
    u_xlat3.x = u_xlat3.x * 1.44269502;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat11.xyz = (-_DeepColor_HDR.xyz) + _ShallowColor_HDR.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat11.xyz + _DeepColor_HDR.xyz;
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_WaterIntensity) + u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD1.xy * vec2(-0.100000001, -0.100000001);
    u_xlat3.xy = u_xlat3.xy / vec2(_NormalScaleNew);
    u_xlat1 = _NormalSpeed.xyxy * _Time.yyyy;
    u_xlat19.xy = u_xlat1.zw * vec2(0.0500000007, 0.0500000007);
    u_xlat4.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(2.0, 2.0) + (-u_xlat19.xy);
    u_xlat16_3.xyz = texture(_BumpTex, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_BumpTex, u_xlat4.xy).xyz;
    u_xlat16_6.z = u_xlat16_5.z * u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_5.xy + u_xlat16_3.xy;
    u_xlat16_5.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xy = u_xlat16_5.xx * u_xlat16_6.xy;
    u_xlat3.xy = u_xlat16_5.xy * vec2(_ReflectDistort);
    u_xlat19.xy = u_xlat16_5.xy * vec2(vec2(_UnderWaterDistort, _UnderWaterDistort));
    u_xlat2.xy = u_xlat3.xy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
    u_xlat3.xy = u_xlat2.xy + vec2(-0.0, -0.200000003);
    u_xlat16_4.xyz = texture(_ReflectionTex, u_xlat2.xy).xyz;
    u_xlat16_7.xyz = texture(_ReflectionTex, u_xlat3.xy).xyz;
    u_xlat12.xyz = u_xlat16_4.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat16_4.xxx * u_xlat12.xyz + u_xlat16_7.xyz;
    u_xlat24 = u_xlat18.y * -2.0 + 3.0;
    u_xlat2.x = u_xlat18.y * u_xlat18.y;
    u_xlat24 = u_xlat24 * u_xlat2.x;
    u_xlat2.x = log2(u_xlat24);
    u_xlat2.x = u_xlat2.x * _ReflectPower_HDR;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat2.xxx + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x * _ReflectIntensity;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vs_TEXCOORD2.xyz;
    u_xlat2.x = vs_TEXCOORD4.w * 0.5;
    u_xlat10 = (-vs_TEXCOORD4.w) * 0.5 + vs_TEXCOORD4.y;
    u_xlat4.y = u_xlat10 * _ProjectionParams.x + u_xlat2.x;
    u_xlat4.xz = vs_TEXCOORD4.xw;
    u_xlat2.xyw = u_xlat4.xyz / vs_TEXCOORD4.www;
    u_xlat2.xy = u_xlat19.xy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat16_2.xyw = texture(_GrabTexture, u_xlat2.xy).xyz;
    u_xlat3.xyz = (-u_xlat0.xyz) + u_xlat16_2.xyw;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat2.xyw = u_xlat16_2.xyw * _ShoreColor_HDR.xyz + (-u_xlat0.xyz);
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
    u_xlat3.xyz = u_xlat18.xxx * _ShoreEdgeColor_HDR.xyz;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat2.xyw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_ShoreEdgeIntensity) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = vs_COLOR0.w;
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
uniform 	vec4 _WaveASpeedXY;
uniform 	vec4 _WaveBSpeedXY;
uniform 	vec4 _WaveCSpeedXY;
uniform 	mediump vec4 _WaterColor_HDR;
uniform 	float _WaveColorIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(3) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec3 u_xlat1;
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
    u_xlat8 = u_xlat13.yyyy * _WaterColor_HDR;
    u_xlat8 = u_xlat8 * vec4(vec4(_WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity));
    vs_TEXCOORD2 = u_xlat8;
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
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
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
uniform 	vec4 _WaterTex_ST;
uniform 	vec4 _WaveSpeed;
uniform 	float _NormalScaleNew;
uniform 	vec4 _NormalSpeed;
uniform 	float _NormalsStrength;
uniform 	float _DistortIntensity;
uniform 	mediump vec4 _WaterColor_HDR;
uniform 	float _WaterIntensity;
uniform 	mediump vec4 _DeepColor_HDR;
uniform 	mediump vec4 _ShallowColor_HDR;
uniform 	float _DeepRange;
uniform 	vec3 _normalOffset;
uniform 	float _lightPower;
uniform 	float _ReflectDistort;
uniform 	float _ShoreRange1;
uniform 	float _ReflectPower_HDR;
uniform 	float _ReflectIntensity;
uniform 	float _UnderWaterDistort;
uniform 	mediump vec4 _ShoreColor_HDR;
uniform 	float _ShoreEdgeWidth;
uniform 	float _ShoreRange;
uniform 	mediump vec4 _ShoreEdgeColor_HDR;
uniform 	float _ShoreEdgeIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerCameraRare {
#endif
	UNITY_UNIFORM vec4 unity_CameraWorldClipPlanes[6];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraInvProjection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BumpTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(2) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(3) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(4) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec2 u_xlat18;
vec2 u_xlat19;
float u_xlat24;
float u_xlat26;
void main()
{
    u_xlat0.x = _WaveSpeed.z * _CosTime.w;
    u_xlat0.z = _WaveSpeed.w * _SinTime.w;
    u_xlat0.xy = u_xlat0.xz * vec2(1.20000005, 0.5);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = _SinTime.ww * _WaveSpeed.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_1.xy + u_xlat16_0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-2.0, -2.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_NormalsStrength) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _WaterTex_ST.xy + _WaterTex_ST.zw;
    u_xlat16_0.x = texture(_WaterTex, u_xlat0.xy).x;
    u_xlat0.x = log2(u_xlat16_0.x);
    u_xlat0.x = u_xlat0.x * _DistortIntensity;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _WaterColor_HDR.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = vs_TEXCOORD3.xyz + vec3(_normalOffset.x, _normalOffset.y, _normalOffset.z);
    u_xlat24 = dot(u_xlat2.xyz, u_xlat16_1.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 9.99999975e-05);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _lightPower;
    u_xlat24 = exp2(u_xlat24);
    u_xlat2.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat2.z = texture(_CameraDepthTexture, u_xlat2.xy).x;
    u_xlat3.xyz = u_xlat2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1 = u_xlat3.yyyy * hlslcc_mtx4x4unity_CameraInvProjection[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[0] * u_xlat3.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_CameraInvProjection[2] * u_xlat3.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_CameraInvProjection[3];
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat18.x = u_xlat3.y * hlslcc_mtx4x4unity_CameraToWorld[1].y;
    u_xlat18.x = hlslcc_mtx4x4unity_CameraToWorld[0].y * u_xlat3.x + u_xlat18.x;
    u_xlat18.x = (-u_xlat3.z) * hlslcc_mtx4x4unity_CameraToWorld[2].y + u_xlat18.x;
    u_xlat18.x = u_xlat18.x + hlslcc_mtx4x4unity_CameraToWorld[3].y;
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
    u_xlat3.x = u_xlat18.y / _DeepRange;
    u_xlat26 = u_xlat18.y / _ShoreRange1;
    u_xlat26 = u_xlat26 * 1.44269502;
    u_xlat18.y = exp2(u_xlat26);
    u_xlat18.xy = min(u_xlat18.xy, vec2(1.10000002, 1.0));
    u_xlat3.x = u_xlat3.x * 1.44269502;
    u_xlat3.x = exp2(u_xlat3.x);
    u_xlat3.x = min(u_xlat3.x, 1.0);
    u_xlat11.xyz = (-_DeepColor_HDR.xyz) + _ShallowColor_HDR.xyz;
    u_xlat3.xyz = u_xlat3.xxx * u_xlat11.xyz + _DeepColor_HDR.xyz;
    u_xlat3.xyz = vec3(u_xlat24) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_WaterIntensity) + u_xlat3.xyz;
    u_xlat3.xy = vs_TEXCOORD1.xy * vec2(-0.100000001, -0.100000001);
    u_xlat3.xy = u_xlat3.xy / vec2(_NormalScaleNew);
    u_xlat1 = _NormalSpeed.xyxy * _Time.yyyy;
    u_xlat19.xy = u_xlat1.zw * vec2(0.0500000007, 0.0500000007);
    u_xlat4.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001) + u_xlat3.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(2.0, 2.0) + (-u_xlat19.xy);
    u_xlat16_3.xyz = texture(_BumpTex, u_xlat3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = texture(_BumpTex, u_xlat4.xy).xyz;
    u_xlat16_6.z = u_xlat16_5.z * u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_5.xy + u_xlat16_3.xy;
    u_xlat16_5.x = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xy = u_xlat16_5.xx * u_xlat16_6.xy;
    u_xlat3.xy = u_xlat16_5.xy * vec2(_ReflectDistort);
    u_xlat19.xy = u_xlat16_5.xy * vec2(vec2(_UnderWaterDistort, _UnderWaterDistort));
    u_xlat2.xy = u_xlat3.xy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
    u_xlat3.xy = u_xlat2.xy + vec2(-0.0, -0.200000003);
    u_xlat16_4.xyz = texture(_ReflectionTex, u_xlat2.xy).xyz;
    u_xlat16_7.xyz = texture(_ReflectionTex, u_xlat3.xy).xyz;
    u_xlat12.xyz = u_xlat16_4.xyz + (-u_xlat16_7.xyz);
    u_xlat4.xyz = u_xlat16_4.xxx * u_xlat12.xyz + u_xlat16_7.xyz;
    u_xlat24 = u_xlat18.y * -2.0 + 3.0;
    u_xlat2.x = u_xlat18.y * u_xlat18.y;
    u_xlat24 = u_xlat24 * u_xlat2.x;
    u_xlat2.x = log2(u_xlat24);
    u_xlat2.x = u_xlat2.x * _ReflectPower_HDR;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat4.xyz = u_xlat4.xyz * u_xlat2.xxx + (-u_xlat0.xyz);
    u_xlat2.x = u_xlat2.x * _ReflectIntensity;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat4.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vs_TEXCOORD2.xyz;
    u_xlat2.x = vs_TEXCOORD4.w * 0.5;
    u_xlat10 = (-vs_TEXCOORD4.w) * 0.5 + vs_TEXCOORD4.y;
    u_xlat4.y = u_xlat10 * _ProjectionParams.x + u_xlat2.x;
    u_xlat4.xz = vs_TEXCOORD4.xw;
    u_xlat2.xyw = u_xlat4.xyz / vs_TEXCOORD4.www;
    u_xlat2.xy = u_xlat19.xy * vec2(0.00999999978, 0.00999999978) + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy / u_xlat2.ww;
    u_xlat16_2.xyw = texture(_GrabTexture, u_xlat2.xy).xyz;
    u_xlat3.xyz = (-u_xlat0.xyz) + u_xlat16_2.xyw;
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat3.xyz + u_xlat0.xyz;
    u_xlat2.xyw = u_xlat16_2.xyw * _ShoreColor_HDR.xyz + (-u_xlat0.xyz);
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
    u_xlat3.xyz = u_xlat18.xxx * _ShoreEdgeColor_HDR.xyz;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat2.xyw + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_ShoreEdgeIntensity) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_QUALITY_LOW" }
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
uniform 	vec4 _WaveASpeedXY;
uniform 	vec4 _WaveBSpeedXY;
uniform 	vec4 _WaveCSpeedXY;
uniform 	mediump vec4 _WaterColor_HDR;
uniform 	float _WaveColorIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec3 u_xlat1;
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
    u_xlat8 = u_xlat13.yyyy * _WaterColor_HDR;
    u_xlat8 = u_xlat8 * vec4(vec4(_WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity));
    vs_TEXCOORD2 = u_xlat8;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat8.wwww + u_xlat9;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = u_xlat2.x * u_xlat10.x;
    u_xlat10.x = u_xlat3.x * u_xlat10.x;
    u_xlat3.xy = u_xlat10.xx * u_xlat20.xy;
    u_xlat10.xyz = u_xlat20.xyy * (-u_xlat20.xxy);
    u_xlat8.xyz = u_xlat1.xxx * u_xlat10.xyz;
    u_xlat8.w = u_xlat3.x;
    u_xlat10.xyz = u_xlat8.wyx + vec3(0.0, 0.0, 1.0);
    u_xlat3.zw = u_xlat8.yz;
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
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    vs_TEXCOORD3.xyz = vec3(u_xlat30) * u_xlat0.xyz;
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
uniform 	vec4 _WaterTex_ST;
uniform 	vec4 _WaveSpeed;
uniform 	float _NormalScaleNew;
uniform 	float _NormalsStrength;
uniform 	float _DistortIntensity;
uniform 	mediump vec4 _WaterColor_HDR;
uniform 	float _WaterIntensity;
uniform 	mediump vec4 _DeepColor;
uniform 	mediump vec4 _ShallowColor;
uniform 	float _DeepRange;
uniform 	vec3 _normalOffset;
uniform 	float _lightPower;
uniform 	mediump vec4 _RefTex_ST;
uniform 	float _ShoreRange1;
uniform 	float _ReflectPower_HDR;
uniform 	float _ReflectIntensity;
uniform 	mediump vec4 _ShoreColor_HDR;
uniform 	float _ShoreEdgeWidth;
uniform 	float _ShoreRange;
uniform 	mediump vec4 _ShoreEdgeColor_HDR;
uniform 	float _ShoreEdgeIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BumpTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(2) uniform mediump sampler2D _RefTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat6;
float u_xlat12;
float u_xlat14;
void main()
{
    u_xlat0.x = _WaveSpeed.z * _CosTime.w;
    u_xlat0.z = _WaveSpeed.w * _SinTime.w;
    u_xlat0.xy = u_xlat0.xz * vec2(1.20000005, 0.5);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = _SinTime.ww * _WaveSpeed.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_1.xy + u_xlat16_0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-2.0, -2.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_NormalsStrength) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _WaterTex_ST.xy + _WaterTex_ST.zw;
    u_xlat16_0.x = texture(_WaterTex, u_xlat0.xy).x;
    u_xlat0.x = log2(u_xlat16_0.x);
    u_xlat0.x = u_xlat0.x * _DistortIntensity;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _WaterColor_HDR.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = vs_TEXCOORD3.xyz + vec3(_normalOffset.x, _normalOffset.y, _normalOffset.z);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat16_1.xyz);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _lightPower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat2.x = (-vs_COLOR0.x) / _DeepRange;
    u_xlat2.x = u_xlat2.x * 1.44269502;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat6.xyz = (-_DeepColor.xyz) + _ShallowColor.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat6.xyz + _DeepColor.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_WaterIntensity) + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat2.xy = u_xlat2.xy * _RefTex_ST.xy + _RefTex_ST.zw;
    u_xlat16_2.xyz = texture(_RefTex, u_xlat2.xy).xyz;
    u_xlat12 = (-vs_COLOR0.x) / _ShoreRange1;
    u_xlat12 = u_xlat12 * 1.44269502;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat14 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat14;
    u_xlat14 = log2(u_xlat12);
    u_xlat14 = u_xlat14 * _ReflectPower_HDR;
    u_xlat14 = exp2(u_xlat14);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14) + (-u_xlat0.xyz);
    u_xlat14 = u_xlat14 * _ReflectIntensity;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vs_TEXCOORD2.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) + _ShoreColor_HDR.xyz;
    u_xlat14 = (-vs_COLOR0.x) / _ShoreRange;
    u_xlat14 = u_xlat14 * 1.44269502;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = min(u_xlat14, 1.10000002);
    u_xlat3.x = (-_ShoreEdgeWidth) + 1.0;
    u_xlat14 = u_xlat14 + (-u_xlat3.x);
    u_xlat3.x = (-u_xlat3.x) + 1.10000002;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat14 = u_xlat14 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat14 * -2.0 + 3.0;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat14 = u_xlat14 * u_xlat3.x;
    u_xlat12 = u_xlat12 * 2.0 + u_xlat14;
    u_xlat3.xyz = vec3(u_xlat14) * _ShoreEdgeColor_HDR.xyz;
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_ShoreEdgeIntensity) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_QUALITY_LOW" }
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
uniform 	vec4 _WaveASpeedXY;
uniform 	vec4 _WaveBSpeedXY;
uniform 	vec4 _WaveCSpeedXY;
uniform 	mediump vec4 _WaterColor_HDR;
uniform 	float _WaveColorIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec3 u_xlat1;
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
    u_xlat8 = u_xlat13.yyyy * _WaterColor_HDR;
    u_xlat8 = u_xlat8 * vec4(vec4(_WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity, _WaveColorIntensity));
    vs_TEXCOORD2 = u_xlat8;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat8.wwww + u_xlat9;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.x = u_xlat2.x * u_xlat10.x;
    u_xlat10.x = u_xlat3.x * u_xlat10.x;
    u_xlat3.xy = u_xlat10.xx * u_xlat20.xy;
    u_xlat10.xyz = u_xlat20.xyy * (-u_xlat20.xxy);
    u_xlat8.xyz = u_xlat1.xxx * u_xlat10.xyz;
    u_xlat8.w = u_xlat3.x;
    u_xlat10.xyz = u_xlat8.wyx + vec3(0.0, 0.0, 1.0);
    u_xlat3.zw = u_xlat8.yz;
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
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    vs_TEXCOORD3.xyz = vec3(u_xlat30) * u_xlat0.xyz;
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
uniform 	vec4 _WaterTex_ST;
uniform 	vec4 _WaveSpeed;
uniform 	float _NormalScaleNew;
uniform 	float _NormalsStrength;
uniform 	float _DistortIntensity;
uniform 	mediump vec4 _WaterColor_HDR;
uniform 	float _WaterIntensity;
uniform 	mediump vec4 _DeepColor;
uniform 	mediump vec4 _ShallowColor;
uniform 	float _DeepRange;
uniform 	vec3 _normalOffset;
uniform 	float _lightPower;
uniform 	mediump vec4 _RefTex_ST;
uniform 	float _ShoreRange1;
uniform 	float _ReflectPower_HDR;
uniform 	float _ReflectIntensity;
uniform 	mediump vec4 _ShoreColor_HDR;
uniform 	float _ShoreEdgeWidth;
uniform 	float _ShoreRange;
uniform 	mediump vec4 _ShoreEdgeColor_HDR;
uniform 	float _ShoreEdgeIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _BumpTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WaterTex;
UNITY_LOCATION(2) uniform mediump sampler2D _RefTex;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat6;
float u_xlat12;
float u_xlat14;
void main()
{
    u_xlat0.x = _WaveSpeed.z * _CosTime.w;
    u_xlat0.z = _WaveSpeed.w * _SinTime.w;
    u_xlat0.xy = u_xlat0.xz * vec2(1.20000005, 0.5);
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = _SinTime.ww * _WaveSpeed.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy / vec2(_NormalScaleNew);
    u_xlat16_0.xy = texture(_BumpTex, u_xlat0.xy).xy;
    u_xlat0.xy = u_xlat16_1.xy + u_xlat16_0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-2.0, -2.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_NormalsStrength) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _WaterTex_ST.xy + _WaterTex_ST.zw;
    u_xlat16_0.x = texture(_WaterTex, u_xlat0.xy).x;
    u_xlat0.x = log2(u_xlat16_0.x);
    u_xlat0.x = u_xlat0.x * _DistortIntensity;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * _WaterColor_HDR.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat2.xyz = vs_TEXCOORD3.xyz + vec3(_normalOffset.x, _normalOffset.y, _normalOffset.z);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat16_1.xyz);
    u_xlat12 = (-u_xlat12) + 1.0;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat12 = log2(u_xlat12);
    u_xlat12 = u_xlat12 * _lightPower;
    u_xlat12 = exp2(u_xlat12);
    u_xlat2.x = (-vs_COLOR0.x) / _DeepRange;
    u_xlat2.x = u_xlat2.x * 1.44269502;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat2.x = min(u_xlat2.x, 1.0);
    u_xlat6.xyz = (-_DeepColor.xyz) + _ShallowColor.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat6.xyz + _DeepColor.xyz;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_WaterIntensity) + u_xlat2.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(1.0, -1.0) + vec2(0.0, 1.0);
    u_xlat2.xy = u_xlat2.xy * _RefTex_ST.xy + _RefTex_ST.zw;
    u_xlat16_2.xyz = texture(_RefTex, u_xlat2.xy).xyz;
    u_xlat12 = (-vs_COLOR0.x) / _ShoreRange1;
    u_xlat12 = u_xlat12 * 1.44269502;
    u_xlat12 = exp2(u_xlat12);
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat14 = u_xlat12 * -2.0 + 3.0;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat12 * u_xlat14;
    u_xlat14 = log2(u_xlat12);
    u_xlat14 = u_xlat14 * _ReflectPower_HDR;
    u_xlat14 = exp2(u_xlat14);
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat14) + (-u_xlat0.xyz);
    u_xlat14 = u_xlat14 * _ReflectIntensity;
    u_xlat0.xyz = vec3(u_xlat14) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vs_TEXCOORD2.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat2.xyz = (-u_xlat0.xyz) + _ShoreColor_HDR.xyz;
    u_xlat14 = (-vs_COLOR0.x) / _ShoreRange;
    u_xlat14 = u_xlat14 * 1.44269502;
    u_xlat14 = exp2(u_xlat14);
    u_xlat14 = min(u_xlat14, 1.10000002);
    u_xlat3.x = (-_ShoreEdgeWidth) + 1.0;
    u_xlat14 = u_xlat14 + (-u_xlat3.x);
    u_xlat3.x = (-u_xlat3.x) + 1.10000002;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat14 = u_xlat14 * u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat14 = min(max(u_xlat14, 0.0), 1.0);
#else
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat14 * -2.0 + 3.0;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat14 = u_xlat14 * u_xlat3.x;
    u_xlat12 = u_xlat12 * 2.0 + u_xlat14;
    u_xlat3.xyz = vec3(u_xlat14) * _ShoreEdgeColor_HDR.xyz;
    u_xlat12 = min(u_xlat12, 1.0);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(_ShoreEdgeIntensity) + u_xlat0.xyz;
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_1.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    SV_Target0.w = vs_COLOR0.w;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_QUALITY_LOW" }
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
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_QUALITY_LOW" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_QUALITY_LOW" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_Scene_ToonWater_OldGUI"
}