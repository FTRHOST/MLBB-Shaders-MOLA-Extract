//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Scene/Heroshow/HeroShow_Water" {
Properties {

[Header(Waves)] _LargeWavesTexture ("波纹贴图（法线）", 2D) = "bump" { }

_LargeWavesTiling ("波纹重复度", Float) = 0.30000001192092896

_LargeWavesSpeed ("波纹速度", Float) = -40.0

_LargeWaveRefraction ("波纹折射", Range(0, 3)) = 1.5

_LongTilingDistance ("波纹重复度距离", Float) = 1500.0

_DistanceTilingFade ("波纹重复度距离衰减", Float) = 1.0

_WaterColorMap ("水面色彩图", 2D) = "white" { }

[Header(Reflection)] _ReflectionTex ("反射图", 2D) = "white" { }

[MaterialToggle] _EnablePlaneReflectionTex ("假反射贴图打开", Float) = 0.0

_ReflectionOffset ("反射贴图坐标偏移", Vector) = (1,1,0,0)

_WaterReflectionMaskMap ("水面反射遮罩图", 2D) = "white" { }

_ReflectionPower ("反射强度", Range(0, 1)) = 1.0

_CustomLightDir ("自定义灯光", Vector) = (1,1,1,0)

_DirLightColor ("灯光颜色", Color) = (1,1,1,1)

_Specular ("Specular", Float) = 1.0

_Gloss ("Gloss", Range(0, 1)) = 0.550000011920929

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Pass {
 Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Cull Off
  GpuProgramID 49623
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat10;
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
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat10 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat3.xyz;
    vs_TEXCOORD3.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat10 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat10;
    vs_TEXCOORD5.z = (-u_xlat10);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.w = u_xlat0.w;
    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _ReflectionOffset;
uniform 	float _ReflectionPower;
uniform 	float _EnablePlaneReflectionTex;
uniform 	float _LongTilingDistance;
uniform 	float _DistanceTilingFade;
uniform 	vec4 _CustomLightDir;
uniform 	vec4 _DirLightColor;
uniform 	float _Specular;
uniform 	float _Gloss;
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterColorMap;
UNITY_LOCATION(3) uniform mediump sampler2D _WaterReflectionMaskMap;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat8;
vec2 u_xlat14;
float u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
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
    u_xlat15 = _Time.x * 0.00999999978;
    u_xlat2 = u_xlat2 * vec4(u_xlat15) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.zw;
    u_xlat16_1.xyz = texture(_LargeWavesTexture, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0 = u_xlat0 * vec4(5.00000024e-05, 5.00000024e-05, 1.66666687e-05, 1.66666687e-05);
    u_xlat16_1.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = (-u_xlat16_3.xyz) + u_xlat16_5.xyz;
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 / _LongTilingDistance;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _DistanceTilingFade;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat1.x = u_xlat21 * _LargeWaveRefraction;
    u_xlat1.x = u_xlat1.x * -0.5 + _LargeWaveRefraction;
    u_xlat8 = _LargeWaveRefraction * 0.25 + (-u_xlat1.x);
    u_xlat21 = u_xlat21 * u_xlat8 + u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat0.xy = u_xlat0.xy * vec2(_LargeWaveRefraction);
    u_xlat14.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat1.xyz;
    u_xlat14.x = dot(_CustomLightDir.xyz, _CustomLightDir.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat2.xyz = u_xlat14.xxx * _CustomLightDir.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat2.xyz = u_xlat6.xyz * u_xlat14.xxx + u_xlat2.xyz;
    u_xlat14.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat2.xyz = u_xlat14.xxx * u_xlat2.xyz;
    u_xlat14.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat21 = max(u_xlat14.x, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat1.x = _Gloss * 10.0 + 1.0;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _DirLightColor.xyz;
    u_xlat2.xyz = _DirLightColor.xyz * vec3(_Specular);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat14.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat6.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat14.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = u_xlat0.xy * vec2(0.0199999996, 0.0199999996) + u_xlat14.xy;
    u_xlat14.x = u_xlat0.x + -0.5;
    u_xlat14.x = u_xlat14.x * _ReflectionOffset.x + _ReflectionOffset.z;
    u_xlat2.x = u_xlat14.x + 0.5;
    u_xlat2.y = (-u_xlat0.y) + _ReflectionOffset.w;
    u_xlat14.xy = (-u_xlat0.xy) + u_xlat2.xy;
    u_xlat0.xy = vec2(vec2(_EnablePlaneReflectionTex, _EnablePlaneReflectionTex)) * u_xlat14.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_ReflectionTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = texture(_WaterColorMap, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_2.xyz);
    u_xlat16_21 = texture(_WaterReflectionMaskMap, vs_TEXCOORD0.xy).x;
    u_xlat21 = u_xlat16_21 * _ReflectionPower;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat1.xyz + u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat10;
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
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat10 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat3.xyz;
    vs_TEXCOORD3.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat10 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat10;
    vs_TEXCOORD5.z = (-u_xlat10);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.w = u_xlat0.w;
    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _ReflectionOffset;
uniform 	float _ReflectionPower;
uniform 	float _EnablePlaneReflectionTex;
uniform 	float _LongTilingDistance;
uniform 	float _DistanceTilingFade;
uniform 	vec4 _CustomLightDir;
uniform 	vec4 _DirLightColor;
uniform 	float _Specular;
uniform 	float _Gloss;
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterColorMap;
UNITY_LOCATION(3) uniform mediump sampler2D _WaterReflectionMaskMap;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat8;
vec2 u_xlat14;
float u_xlat15;
float u_xlat21;
mediump float u_xlat16_21;
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
    u_xlat15 = _Time.x * 0.00999999978;
    u_xlat2 = u_xlat2 * vec4(u_xlat15) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.zw;
    u_xlat16_1.xyz = texture(_LargeWavesTexture, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0 = u_xlat0 * vec4(5.00000024e-05, 5.00000024e-05, 1.66666687e-05, 1.66666687e-05);
    u_xlat16_1.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = (-u_xlat16_3.xyz) + u_xlat16_5.xyz;
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 / _LongTilingDistance;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _DistanceTilingFade;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat1.x = u_xlat21 * _LargeWaveRefraction;
    u_xlat1.x = u_xlat1.x * -0.5 + _LargeWaveRefraction;
    u_xlat8 = _LargeWaveRefraction * 0.25 + (-u_xlat1.x);
    u_xlat21 = u_xlat21 * u_xlat8 + u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat0.xy = u_xlat0.xy * vec2(_LargeWaveRefraction);
    u_xlat14.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat1.xyz;
    u_xlat14.x = dot(_CustomLightDir.xyz, _CustomLightDir.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat2.xyz = u_xlat14.xxx * _CustomLightDir.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat2.xyz = u_xlat6.xyz * u_xlat14.xxx + u_xlat2.xyz;
    u_xlat14.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat2.xyz = u_xlat14.xxx * u_xlat2.xyz;
    u_xlat14.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat21 = max(u_xlat14.x, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat1.x = _Gloss * 10.0 + 1.0;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _DirLightColor.xyz;
    u_xlat2.xyz = _DirLightColor.xyz * vec3(_Specular);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat14.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat6.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat14.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = u_xlat0.xy * vec2(0.0199999996, 0.0199999996) + u_xlat14.xy;
    u_xlat14.x = u_xlat0.x + -0.5;
    u_xlat14.x = u_xlat14.x * _ReflectionOffset.x + _ReflectionOffset.z;
    u_xlat2.x = u_xlat14.x + 0.5;
    u_xlat2.y = (-u_xlat0.y) + _ReflectionOffset.w;
    u_xlat14.xy = (-u_xlat0.xy) + u_xlat2.xy;
    u_xlat0.xy = vec2(vec2(_EnablePlaneReflectionTex, _EnablePlaneReflectionTex)) * u_xlat14.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_ReflectionTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = texture(_WaterColorMap, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz + (-u_xlat16_2.xyz);
    u_xlat16_21 = texture(_WaterReflectionMaskMap, vs_TEXCOORD0.xy).x;
    u_xlat21 = u_xlat16_21 * _ReflectionPower;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat1.xyz + u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat10;
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
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat10 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat3.xyz;
    vs_TEXCOORD3.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat10 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat10;
    vs_TEXCOORD5.z = (-u_xlat10);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.w = u_xlat0.w;
    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _ReflectionOffset;
uniform 	float _ReflectionPower;
uniform 	float _EnablePlaneReflectionTex;
uniform 	float _LongTilingDistance;
uniform 	float _DistanceTilingFade;
uniform 	vec4 _CustomLightDir;
uniform 	vec4 _DirLightColor;
uniform 	float _Specular;
uniform 	float _Gloss;
uniform lowp sampler2D _LargeWavesTexture;
uniform lowp sampler2D _ReflectionTex;
uniform lowp sampler2D _WaterColorMap;
uniform lowp sampler2D _WaterReflectionMaskMap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat8;
vec2 u_xlat14;
float u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
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
    u_xlat15 = _Time.x * 0.00999999978;
    u_xlat2 = u_xlat2 * vec4(u_xlat15) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.zw;
    u_xlat10_1.xyz = texture2D(_LargeWavesTexture, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0 = u_xlat0 * vec4(5.00000024e-05, 5.00000024e-05, 1.66666687e-05, 1.66666687e-05);
    u_xlat10_1.xyz = texture2D(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = (-u_xlat16_3.xyz) + u_xlat16_5.xyz;
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 / _LongTilingDistance;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _DistanceTilingFade;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat1.x = u_xlat21 * _LargeWaveRefraction;
    u_xlat1.x = u_xlat1.x * -0.5 + _LargeWaveRefraction;
    u_xlat8 = _LargeWaveRefraction * 0.25 + (-u_xlat1.x);
    u_xlat21 = u_xlat21 * u_xlat8 + u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat0.xy = u_xlat0.xy * vec2(_LargeWaveRefraction);
    u_xlat14.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat1.xyz;
    u_xlat14.x = dot(_CustomLightDir.xyz, _CustomLightDir.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat2.xyz = u_xlat14.xxx * _CustomLightDir.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat2.xyz = u_xlat6.xyz * u_xlat14.xxx + u_xlat2.xyz;
    u_xlat14.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat2.xyz = u_xlat14.xxx * u_xlat2.xyz;
    u_xlat14.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat21 = max(u_xlat14.x, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat1.x = _Gloss * 10.0 + 1.0;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _DirLightColor.xyz;
    u_xlat2.xyz = _DirLightColor.xyz * vec3(_Specular);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat14.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat6.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat14.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = u_xlat0.xy * vec2(0.0199999996, 0.0199999996) + u_xlat14.xy;
    u_xlat14.x = u_xlat0.x + -0.5;
    u_xlat14.x = u_xlat14.x * _ReflectionOffset.x + _ReflectionOffset.z;
    u_xlat2.x = u_xlat14.x + 0.5;
    u_xlat2.y = (-u_xlat0.y) + _ReflectionOffset.w;
    u_xlat14.xy = (-u_xlat0.xy) + u_xlat2.xy;
    u_xlat0.xy = vec2(vec2(_EnablePlaneReflectionTex, _EnablePlaneReflectionTex)) * u_xlat14.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_ReflectionTex, u_xlat0.xy).xyz;
    u_xlat10_2.xyz = texture2D(_WaterColorMap, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat10_2.xyz);
    u_xlat10_21 = texture2D(_WaterReflectionMaskMap, vs_TEXCOORD0.xy).x;
    u_xlat21 = u_xlat10_21 * _ReflectionPower;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + u_xlat10_2.xyz;
    SV_Target0.xyz = u_xlat1.xyz + u_xlat0.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat10;
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
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat2.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat2.xyz;
    u_xlat3.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat3.xyz;
    u_xlat10 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat3.xyz = vec3(u_xlat10) * u_xlat3.xyz;
    vs_TEXCOORD3.xyz = u_xlat3.xyz;
    u_xlat4.xyz = u_xlat2.zxy * u_xlat3.yzx;
    u_xlat2.xyz = u_xlat2.yzx * u_xlat3.zxy + (-u_xlat4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * in_TANGENT0.www;
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    vs_TEXCOORD4.xyz = vec3(u_xlat10) * u_xlat2.xyz;
    u_xlat10 = u_xlat1.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat10 = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat1.x + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat1.z + u_xlat10;
    u_xlat10 = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat1.w + u_xlat10;
    vs_TEXCOORD5.z = (-u_xlat10);
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.w = u_xlat0.w;
    vs_TEXCOORD5.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec4 _ReflectionOffset;
uniform 	float _ReflectionPower;
uniform 	float _EnablePlaneReflectionTex;
uniform 	float _LongTilingDistance;
uniform 	float _DistanceTilingFade;
uniform 	vec4 _CustomLightDir;
uniform 	vec4 _DirLightColor;
uniform 	float _Specular;
uniform 	float _Gloss;
uniform lowp sampler2D _LargeWavesTexture;
uniform lowp sampler2D _ReflectionTex;
uniform lowp sampler2D _WaterColorMap;
uniform lowp sampler2D _WaterReflectionMaskMap;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
float u_xlat8;
vec2 u_xlat14;
float u_xlat15;
float u_xlat21;
lowp float u_xlat10_21;
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
    u_xlat15 = _Time.x * 0.00999999978;
    u_xlat2 = u_xlat2 * vec4(u_xlat15) + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.zw;
    u_xlat10_1.xyz = texture2D(_LargeWavesTexture, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0 = u_xlat0 * vec4(5.00000024e-05, 5.00000024e-05, 1.66666687e-05, 1.66666687e-05);
    u_xlat10_1.xyz = texture2D(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_4.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = (-u_xlat16_3.xyz) + u_xlat16_5.xyz;
    u_xlat1.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 / _LongTilingDistance;
    u_xlat21 = log2(u_xlat21);
    u_xlat21 = u_xlat21 * _DistanceTilingFade;
    u_xlat21 = exp2(u_xlat21);
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + u_xlat16_3.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat1.x = u_xlat21 * _LargeWaveRefraction;
    u_xlat1.x = u_xlat1.x * -0.5 + _LargeWaveRefraction;
    u_xlat8 = _LargeWaveRefraction * 0.25 + (-u_xlat1.x);
    u_xlat21 = u_xlat21 * u_xlat8 + u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat1.xyz = u_xlat0.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.zzz * vs_TEXCOORD2.xyz + u_xlat1.xyz;
    u_xlat0.xy = u_xlat0.xy * vec2(_LargeWaveRefraction);
    u_xlat14.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat1.xyz = u_xlat14.xxx * u_xlat1.xyz;
    u_xlat14.x = dot(_CustomLightDir.xyz, _CustomLightDir.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat2.xyz = u_xlat14.xxx * _CustomLightDir.xyz;
    u_xlat6.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat14.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat2.xyz = u_xlat6.xyz * u_xlat14.xxx + u_xlat2.xyz;
    u_xlat14.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat2.xyz = u_xlat14.xxx * u_xlat2.xyz;
    u_xlat14.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat21 = max(u_xlat14.x, 0.0);
    u_xlat21 = log2(u_xlat21);
    u_xlat1.x = _Gloss * 10.0 + 1.0;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat21 = u_xlat21 * u_xlat1.x;
    u_xlat21 = exp2(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _DirLightColor.xyz;
    u_xlat2.xyz = _DirLightColor.xyz * vec3(_Specular);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat2.xyz;
    u_xlat6.xyz = u_xlat14.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat6.xyz * u_xlat2.xyz + u_xlat1.xyz;
    u_xlat14.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = u_xlat0.xy * vec2(0.0199999996, 0.0199999996) + u_xlat14.xy;
    u_xlat14.x = u_xlat0.x + -0.5;
    u_xlat14.x = u_xlat14.x * _ReflectionOffset.x + _ReflectionOffset.z;
    u_xlat2.x = u_xlat14.x + 0.5;
    u_xlat2.y = (-u_xlat0.y) + _ReflectionOffset.w;
    u_xlat14.xy = (-u_xlat0.xy) + u_xlat2.xy;
    u_xlat0.xy = vec2(vec2(_EnablePlaneReflectionTex, _EnablePlaneReflectionTex)) * u_xlat14.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_ReflectionTex, u_xlat0.xy).xyz;
    u_xlat10_2.xyz = texture2D(_WaterColorMap, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz + (-u_xlat10_2.xyz);
    u_xlat10_21 = texture2D(_WaterReflectionMaskMap, vs_TEXCOORD0.xy).x;
    u_xlat21 = u_xlat10_21 * _ReflectionPower;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz + u_xlat10_2.xyz;
    SV_Target0.xyz = u_xlat1.xyz + u_xlat0.xyz;
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