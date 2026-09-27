//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Scene/Heroshow/HeroShow_Water_Low" {
Properties {

[Header(Waves)] _LargeWavesTexture ("波纹贴图（法线）", 2D) = "bump" { }

_LargeWavesTiling ("波纹重复度", Float) = 0.30000001192092896

_LargeWavesSpeed ("波纹速度", Float) = -40.0

_LargeWaveRefraction ("波纹折射", Range(0, 3)) = 1.5

_LongTilingDistance ("波纹重复度距离", Float) = 1500.0

_DistanceTilingFade ("波纹重复度距离衰减", Float) = 1.0

_WavePower ("波纹强度", Float) = 1.0

_WaterColorMap ("水面色彩图", 2D) = "white" { }

_WaterColor ("水的颜色", Color) = (1,1,1,1)

_WaterColorIntancity ("水的颜色强度", Float) = 1.0

[Header(Reflection)] _Cubemap ("天空盒反射贴图", Cube) = "_Skybox" { }

_WaterReflectionMaskMap ("水面反射遮罩图", 2D) = "white" { }

_ReflectionMaskOffset ("反射遮罩矫正", Range(0, 1)) = 1.0

_ReflectionPower ("反射强度", Range(0, 1)) = 1.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Pass {
 Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Cull Off
  GpuProgramID 18618
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat6 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat6;
    vs_TEXCOORD3.z = (-u_xlat6);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.w = u_xlat0.w;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	float _LargeWaveRefraction;
uniform 	float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	vec4 _WaterColor;
uniform 	float _WavePower;
uniform 	float _WaterColorIntancity;
uniform 	float _ReflectionPower;
uniform 	float _DistanceTilingFade;
uniform 	float _LongTilingDistance;
uniform 	float _ReflectionMaskOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterColorMap;
UNITY_LOCATION(3) uniform mediump sampler2D _WaterReflectionMaskMap;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat10;
mediump vec2 u_xlat16_10;
float u_xlat11;
mediump vec2 u_xlat16_13;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xz = vec2(1.0, 1.0) / u_xlat0.xx;
    u_xlat1.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat0.yw = vec2(1.0, 1.0) / u_xlat1.xx;
    u_xlat0 = u_xlat0 * vec4(vec4(_LargeWavesTiling, _LargeWavesTiling, _LargeWavesTiling, _LargeWavesTiling));
    u_xlat1.xy = u_xlat0.zw * vec2(0.00100000005, 0.00100000005);
    u_xlat2 = vec4(vec4(_LargeWavesSpeed, _LargeWavesSpeed, _LargeWavesSpeed, _LargeWavesSpeed)) / u_xlat1.xyxy;
    u_xlat11 = _Time.x * 0.00999999978;
    u_xlat2 = u_xlat2 * vec4(u_xlat11) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.zw;
    u_xlat16_1.xy = texture(_LargeWavesTexture, u_xlat1.xy).xy;
    u_xlat16_3.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0 = u_xlat0 * vec4(5.00000024e-05, 5.00000024e-05, 1.66666687e-05, 1.66666687e-05);
    u_xlat16_0.xy = texture(_LargeWavesTexture, u_xlat0.xy).xy;
    u_xlat16_10.xy = texture(_LargeWavesTexture, u_xlat0.zw).xy;
    u_xlat16_13.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_4.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = (-u_xlat16_3.xy) + u_xlat16_4.xy;
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = u_xlat10.x / _LongTilingDistance;
    u_xlat10.x = log2(u_xlat10.x);
    u_xlat10.x = u_xlat10.x * _DistanceTilingFade;
    u_xlat10.x = exp2(u_xlat10.x);
    u_xlat10.x = min(u_xlat10.x, 1.0);
    u_xlat0.xy = u_xlat10.xx * u_xlat0.xy + u_xlat16_3.xy;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat16_13.xy;
    u_xlat0.xy = u_xlat10.xx * u_xlat1.xy + u_xlat0.xy;
    u_xlat15 = u_xlat10.x * _LargeWaveRefraction;
    u_xlat15 = u_xlat15 * -0.5 + _LargeWaveRefraction;
    u_xlat1.x = _LargeWaveRefraction * 0.25 + (-u_xlat15);
    u_xlat10.x = u_xlat10.x * u_xlat1.x + u_xlat15;
    u_xlat0.xy = u_xlat0.xy * u_xlat10.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_LargeWaveRefraction);
    u_xlat10.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat0.xy = u_xlat0.xy * vec2(_WavePower) + u_xlat10.xy;
    u_xlat16_0.xyz = texture(_WaterColorMap, u_xlat0.xy).xyz;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * vs_TEXCOORD2.xyz;
    u_xlat15 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat15)) + (-u_xlat1.xyz);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_WaterColorIntancity, _WaterColorIntancity, _WaterColorIntancity));
    u_xlat16_1.xyz = texture(_WaterColorMap, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * _WaterColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_15 = texture(_WaterReflectionMaskMap, vs_TEXCOORD0.xy).x;
    u_xlat15 = u_xlat16_15 + _ReflectionMaskOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 * _ReflectionPower;
    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat16_1.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat6 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat6;
    vs_TEXCOORD3.z = (-u_xlat6);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.w = u_xlat0.w;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	float _LargeWaveRefraction;
uniform 	float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	vec4 _WaterColor;
uniform 	float _WavePower;
uniform 	float _WaterColorIntancity;
uniform 	float _ReflectionPower;
uniform 	float _DistanceTilingFade;
uniform 	float _LongTilingDistance;
uniform 	float _ReflectionMaskOffset;
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterColorMap;
UNITY_LOCATION(3) uniform mediump sampler2D _WaterReflectionMaskMap;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat10;
mediump vec2 u_xlat16_10;
float u_xlat11;
mediump vec2 u_xlat16_13;
float u_xlat15;
mediump float u_xlat16_15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xz = vec2(1.0, 1.0) / u_xlat0.xx;
    u_xlat1.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat0.yw = vec2(1.0, 1.0) / u_xlat1.xx;
    u_xlat0 = u_xlat0 * vec4(vec4(_LargeWavesTiling, _LargeWavesTiling, _LargeWavesTiling, _LargeWavesTiling));
    u_xlat1.xy = u_xlat0.zw * vec2(0.00100000005, 0.00100000005);
    u_xlat2 = vec4(vec4(_LargeWavesSpeed, _LargeWavesSpeed, _LargeWavesSpeed, _LargeWavesSpeed)) / u_xlat1.xyxy;
    u_xlat11 = _Time.x * 0.00999999978;
    u_xlat2 = u_xlat2 * vec4(u_xlat11) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.zw;
    u_xlat16_1.xy = texture(_LargeWavesTexture, u_xlat1.xy).xy;
    u_xlat16_3.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0 = u_xlat0 * vec4(5.00000024e-05, 5.00000024e-05, 1.66666687e-05, 1.66666687e-05);
    u_xlat16_0.xy = texture(_LargeWavesTexture, u_xlat0.xy).xy;
    u_xlat16_10.xy = texture(_LargeWavesTexture, u_xlat0.zw).xy;
    u_xlat16_13.xy = u_xlat16_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_4.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = (-u_xlat16_3.xy) + u_xlat16_4.xy;
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = u_xlat10.x / _LongTilingDistance;
    u_xlat10.x = log2(u_xlat10.x);
    u_xlat10.x = u_xlat10.x * _DistanceTilingFade;
    u_xlat10.x = exp2(u_xlat10.x);
    u_xlat10.x = min(u_xlat10.x, 1.0);
    u_xlat0.xy = u_xlat10.xx * u_xlat0.xy + u_xlat16_3.xy;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat16_13.xy;
    u_xlat0.xy = u_xlat10.xx * u_xlat1.xy + u_xlat0.xy;
    u_xlat15 = u_xlat10.x * _LargeWaveRefraction;
    u_xlat15 = u_xlat15 * -0.5 + _LargeWaveRefraction;
    u_xlat1.x = _LargeWaveRefraction * 0.25 + (-u_xlat15);
    u_xlat10.x = u_xlat10.x * u_xlat1.x + u_xlat15;
    u_xlat0.xy = u_xlat0.xy * u_xlat10.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_LargeWaveRefraction);
    u_xlat10.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat0.xy = u_xlat0.xy * vec2(_WavePower) + u_xlat10.xy;
    u_xlat16_0.xyz = texture(_WaterColorMap, u_xlat0.xy).xyz;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * vs_TEXCOORD2.xyz;
    u_xlat15 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat15)) + (-u_xlat1.xyz);
    u_xlat16_1.xyz = texture(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_WaterColorIntancity, _WaterColorIntancity, _WaterColorIntancity));
    u_xlat16_1.xyz = texture(_WaterColorMap, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * _WaterColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_15 = texture(_WaterReflectionMaskMap, vs_TEXCOORD0.xy).x;
    u_xlat15 = u_xlat16_15 + _ReflectionMaskOffset;
#ifdef UNITY_ADRENO_ES3
    u_xlat15 = min(max(u_xlat15, 0.0), 1.0);
#else
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
#endif
    u_xlat15 = u_xlat15 * _ReflectionPower;
    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat16_1.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat6 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat6;
    vs_TEXCOORD3.z = (-u_xlat6);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.w = u_xlat0.w;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	float _LargeWaveRefraction;
uniform 	float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	vec4 _WaterColor;
uniform 	float _WavePower;
uniform 	float _WaterColorIntancity;
uniform 	float _ReflectionPower;
uniform 	float _DistanceTilingFade;
uniform 	float _LongTilingDistance;
uniform 	float _ReflectionMaskOffset;
uniform lowp sampler2D _LargeWavesTexture;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _WaterColorMap;
uniform lowp sampler2D _WaterReflectionMaskMap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat10;
lowp vec2 u_xlat10_10;
float u_xlat11;
mediump vec2 u_xlat16_13;
float u_xlat15;
lowp float u_xlat10_15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xz = vec2(1.0, 1.0) / u_xlat0.xx;
    u_xlat1.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat0.yw = vec2(1.0, 1.0) / u_xlat1.xx;
    u_xlat0 = u_xlat0 * vec4(vec4(_LargeWavesTiling, _LargeWavesTiling, _LargeWavesTiling, _LargeWavesTiling));
    u_xlat1.xy = u_xlat0.zw * vec2(0.00100000005, 0.00100000005);
    u_xlat2 = vec4(vec4(_LargeWavesSpeed, _LargeWavesSpeed, _LargeWavesSpeed, _LargeWavesSpeed)) / u_xlat1.xyxy;
    u_xlat11 = _Time.x * 0.00999999978;
    u_xlat2 = u_xlat2 * vec4(u_xlat11) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.zw;
    u_xlat10_1.xy = texture2D(_LargeWavesTexture, u_xlat1.xy).xy;
    u_xlat16_3.xy = u_xlat10_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0 = u_xlat0 * vec4(5.00000024e-05, 5.00000024e-05, 1.66666687e-05, 1.66666687e-05);
    u_xlat10_0.xy = texture2D(_LargeWavesTexture, u_xlat0.xy).xy;
    u_xlat10_10.xy = texture2D(_LargeWavesTexture, u_xlat0.zw).xy;
    u_xlat16_13.xy = u_xlat10_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_4.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = (-u_xlat16_3.xy) + u_xlat16_4.xy;
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = u_xlat10.x / _LongTilingDistance;
    u_xlat10.x = log2(u_xlat10.x);
    u_xlat10.x = u_xlat10.x * _DistanceTilingFade;
    u_xlat10.x = exp2(u_xlat10.x);
    u_xlat10.x = min(u_xlat10.x, 1.0);
    u_xlat0.xy = u_xlat10.xx * u_xlat0.xy + u_xlat16_3.xy;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat16_13.xy;
    u_xlat0.xy = u_xlat10.xx * u_xlat1.xy + u_xlat0.xy;
    u_xlat15 = u_xlat10.x * _LargeWaveRefraction;
    u_xlat15 = u_xlat15 * -0.5 + _LargeWaveRefraction;
    u_xlat1.x = _LargeWaveRefraction * 0.25 + (-u_xlat15);
    u_xlat10.x = u_xlat10.x * u_xlat1.x + u_xlat15;
    u_xlat0.xy = u_xlat0.xy * u_xlat10.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_LargeWaveRefraction);
    u_xlat10.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat0.xy = u_xlat0.xy * vec2(_WavePower) + u_xlat10.xy;
    u_xlat10_0.xyz = texture2D(_WaterColorMap, u_xlat0.xy).xyz;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * vs_TEXCOORD2.xyz;
    u_xlat15 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat15)) + (-u_xlat1.xyz);
    u_xlat10_1.xyz = textureCube(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_WaterColorIntancity, _WaterColorIntancity, _WaterColorIntancity));
    u_xlat10_1.xyz = texture2D(_WaterColorMap, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * _WaterColor.xyz + (-u_xlat10_1.xyz);
    u_xlat10_15 = texture2D(_WaterReflectionMaskMap, vs_TEXCOORD0.xy).x;
    u_xlat15 = u_xlat10_15 + _ReflectionMaskOffset;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat15 = u_xlat15 * _ReflectionPower;
    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat10_1.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat2.xyz = in_NORMAL0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_NORMAL0.xxx + u_xlat2.xyz;
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_NORMAL0.zzz + u_xlat2.xyz;
    u_xlat6 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat6;
    vs_TEXCOORD3.z = (-u_xlat6);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.w = u_xlat0.w;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	float _LargeWaveRefraction;
uniform 	float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	vec4 _WaterColor;
uniform 	float _WavePower;
uniform 	float _WaterColorIntancity;
uniform 	float _ReflectionPower;
uniform 	float _DistanceTilingFade;
uniform 	float _LongTilingDistance;
uniform 	float _ReflectionMaskOffset;
uniform lowp sampler2D _LargeWavesTexture;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _WaterColorMap;
uniform lowp sampler2D _WaterReflectionMaskMap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
mediump vec2 u_xlat16_4;
vec2 u_xlat10;
lowp vec2 u_xlat10_10;
float u_xlat11;
mediump vec2 u_xlat16_13;
float u_xlat15;
lowp float u_xlat10_15;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.xz = vec2(1.0, 1.0) / u_xlat0.xx;
    u_xlat1.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat0.yw = vec2(1.0, 1.0) / u_xlat1.xx;
    u_xlat0 = u_xlat0 * vec4(vec4(_LargeWavesTiling, _LargeWavesTiling, _LargeWavesTiling, _LargeWavesTiling));
    u_xlat1.xy = u_xlat0.zw * vec2(0.00100000005, 0.00100000005);
    u_xlat2 = vec4(vec4(_LargeWavesSpeed, _LargeWavesSpeed, _LargeWavesSpeed, _LargeWavesSpeed)) / u_xlat1.xyxy;
    u_xlat11 = _Time.x * 0.00999999978;
    u_xlat2 = u_xlat2 * vec4(u_xlat11) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.zw;
    u_xlat10_1.xy = texture2D(_LargeWavesTexture, u_xlat1.xy).xy;
    u_xlat16_3.xy = u_xlat10_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0 = u_xlat0 * vec4(5.00000024e-05, 5.00000024e-05, 1.66666687e-05, 1.66666687e-05);
    u_xlat10_0.xy = texture2D(_LargeWavesTexture, u_xlat0.xy).xy;
    u_xlat10_10.xy = texture2D(_LargeWavesTexture, u_xlat0.zw).xy;
    u_xlat16_13.xy = u_xlat10_10.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_4.xy = u_xlat10_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = (-u_xlat16_3.xy) + u_xlat16_4.xy;
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat10.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat10.x = u_xlat10.x / _LongTilingDistance;
    u_xlat10.x = log2(u_xlat10.x);
    u_xlat10.x = u_xlat10.x * _DistanceTilingFade;
    u_xlat10.x = exp2(u_xlat10.x);
    u_xlat10.x = min(u_xlat10.x, 1.0);
    u_xlat0.xy = u_xlat10.xx * u_xlat0.xy + u_xlat16_3.xy;
    u_xlat1.xy = (-u_xlat0.xy) + u_xlat16_13.xy;
    u_xlat0.xy = u_xlat10.xx * u_xlat1.xy + u_xlat0.xy;
    u_xlat15 = u_xlat10.x * _LargeWaveRefraction;
    u_xlat15 = u_xlat15 * -0.5 + _LargeWaveRefraction;
    u_xlat1.x = _LargeWaveRefraction * 0.25 + (-u_xlat15);
    u_xlat10.x = u_xlat10.x * u_xlat1.x + u_xlat15;
    u_xlat0.xy = u_xlat0.xy * u_xlat10.xx;
    u_xlat0.xy = u_xlat0.xy * vec2(_LargeWaveRefraction);
    u_xlat10.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat0.xy = u_xlat0.xy * vec2(_WavePower) + u_xlat10.xy;
    u_xlat10_0.xyz = texture2D(_WaterColorMap, u_xlat0.xy).xyz;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    u_xlat15 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * vs_TEXCOORD2.xyz;
    u_xlat15 = dot((-u_xlat1.xyz), u_xlat2.xyz);
    u_xlat15 = u_xlat15 + u_xlat15;
    u_xlat1.xyz = u_xlat2.xyz * (-vec3(u_xlat15)) + (-u_xlat1.xyz);
    u_xlat10_1.xyz = textureCube(_Cubemap, u_xlat1.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(vec3(_WaterColorIntancity, _WaterColorIntancity, _WaterColorIntancity));
    u_xlat10_1.xyz = texture2D(_WaterColorMap, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * _WaterColor.xyz + (-u_xlat10_1.xyz);
    u_xlat10_15 = texture2D(_WaterReflectionMaskMap, vs_TEXCOORD0.xy).x;
    u_xlat15 = u_xlat10_15 + _ReflectionMaskOffset;
    u_xlat15 = clamp(u_xlat15, 0.0, 1.0);
    u_xlat15 = u_xlat15 * _ReflectionPower;
    SV_Target0.xyz = vec3(u_xlat15) * u_xlat0.xyz + u_xlat10_1.xyz;
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