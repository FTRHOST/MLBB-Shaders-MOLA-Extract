//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Fur/Lit/Advanced 10Layer V2" {
Properties {

_Intensity ("Intensity", Float) = 1.0

_Color ("Color (RGB)", Color) = (1,1,1,1)

_LerpColor ("LerpColor (RGB)", Color) = (1,1,1,1)

_MainTex ("Albedo (RGB)", 2D) = "white" { }

_FurStep ("Fur Step（毛发层阶梯）", Range(0.001, 10)) = 1.0

_FurLength ("Fur Length（毛发长度）", Range(0.0002, 1)) = 0.4339999854564667

_Gravity ("Gravity (XYZ)（重力）", Vector) = (0,0,0,0)

_Wind ("Wind (XYZ), Speed (W)（风力）", Vector) = (-0.39,-0.29,0.08,0)

_UVoffset ("UV偏移：XY=UV偏移", Vector) = (5,6.26,0,0)

_NoiseTex ("NoiseTex (R)（噪声图）", 2D) = "white" { }

_NoiseTexUV ("NoiseTexUV（噪声图UV）", Vector) = (4,8,1,0)

_FurMask ("FurMask（毛发遮罩强度）", Float) = 4.0

_FurMaskTex ("FurMask (R)（毛发遮罩图）", 2D) = "white" { }

_OcclusionColor ("OcclusionColor (遮蔽颜色)", Color) = (0,0,0,0)

_FresnelLV ("FresnelLV（菲尼尔强度）", Float) = 4.0

_DirLightColor ("DirLightColor（模拟灯光颜色）", Color) = (1,1,1,1)

_FurDirLightExposure ("FurDirLightExposure（模拟灯光强度）", Float) = 2.2200000286102295

_LightFilter ("LightFilter（模拟平行光毛发穿透）", Float) = 0.8799999952316284

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+10" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+10" "RenderType" = "Transparent" }
  GpuProgramID 60937
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.00999999978;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.00999999978 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.00999999978 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
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
uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.00999999978;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.00999999978 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.00999999978 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.00999999978;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.00999999978 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.00999999978 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.00999999978;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.00999999978 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.00999999978 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
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
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+10" "RenderType" = "Transparent" }
  GpuProgramID 72929
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0199999996;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0199999996 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0199999996 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0199999996;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0199999996;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0199999996 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0199999996 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0199999996;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0199999996;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0199999996 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0199999996 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0199999996;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0199999996;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0199999996 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0199999996 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0199999996;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+10" "RenderType" = "Transparent" }
  GpuProgramID 152300
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0299999993;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0299999993 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0299999993 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0299999993;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0299999993;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0299999993 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0299999993 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0299999993;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0299999993;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0299999993 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0299999993 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0299999993;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0299999993;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0299999993 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0299999993 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0299999993;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+10" "RenderType" = "Transparent" }
  GpuProgramID 218813
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0399999991;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0399999991 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0399999991 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0399999991;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0399999991;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0399999991 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0399999991 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0399999991;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0399999991;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0399999991 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0399999991 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0399999991;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0399999991;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0399999991 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0399999991 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0399999991;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+10" "RenderType" = "Transparent" }
  GpuProgramID 296428
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0500000007;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0500000007 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0500000007 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0500000007;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0500000007;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0500000007 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0500000007 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0500000007;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0500000007;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0500000007 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0500000007 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0500000007;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0500000007;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0500000007 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0500000007 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0500000007;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+10" "RenderType" = "Transparent" }
  GpuProgramID 359350
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0599999987;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0599999987 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0599999987 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0599999987;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0599999987;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0599999987 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0599999987 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0599999987;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0599999987;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0599999987 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0599999987 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0599999987;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0599999987;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0599999987 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0599999987 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0599999987;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+10" "RenderType" = "Transparent" }
  GpuProgramID 440668
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0700000003;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0700000003 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0700000003 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0700000003;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0700000003;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0700000003 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0700000003 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0700000003;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0700000003;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0700000003 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0700000003 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0700000003;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0700000003;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0700000003 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0700000003 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0700000003;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+10" "RenderType" = "Transparent" }
  GpuProgramID 509924
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0799999982;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0799999982 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0799999982 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0799999982;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0799999982;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0799999982 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0799999982 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0799999982;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0799999982;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0799999982 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0799999982 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0799999982;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0799999982;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0799999982 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0799999982 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0799999982;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+10" "RenderType" = "Transparent" }
  GpuProgramID 559970
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0900000036;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0900000036 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0900000036 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0900000036;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0900000036;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0900000036 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0900000036 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0900000036;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0900000036;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0900000036 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0900000036 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0900000036;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.0900000036;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.0900000036 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.0900000036 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.0900000036;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent+10" "RenderType" = "Transparent" }
  GpuProgramID 617377
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.100000001;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.100000001 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.100000001 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.100000001;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
in highp vec4 in_POSITION0;
in mediump vec3 in_NORMAL0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.100000001;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.100000001 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
#ifdef UNITY_ADRENO_ES3
    u_xlat7 = min(max(u_xlat7, 0.0), 1.0);
#else
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.100000001 + u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
UNITY_LOCATION(0) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FurMaskTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump float u_xlat16_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat16_0 = texture(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.100000001;
    u_xlat16_4 = u_xlat16_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat16_3 = texture(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat16_3 * 2.0 + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat16_2.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.100000001;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.100000001 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.100000001 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.100000001;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _FurLength;
uniform 	mediump float _FurStep;
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _Gravity;
uniform 	mediump vec4 _Wind;
uniform 	vec4 _UVoffset;
uniform 	vec4 _NoiseTex_ST;
uniform 	vec4 _NoiseTexUV;
uniform 	mediump vec4 _OcclusionColor;
uniform 	float _FresnelLV;
uniform 	vec4 _FurMaskTex_ST;
uniform 	vec3 _DirLightColor;
uniform 	mediump float _FurDirLightExposure;
uniform 	mediump float _LightFilter;
attribute highp vec4 in_POSITION0;
attribute mediump vec3 in_NORMAL0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump float u_xlat16_11;
vec2 u_xlat15;
float u_xlat21;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat21 = dot(_Wind.xyz, u_xlat0.xyz);
    u_xlat21 = _Time.x * _Wind.w + u_xlat21;
    u_xlat21 = sin(u_xlat21);
    u_xlat21 = u_xlat21 + 1.0;
    u_xlat1.xyz = vec3(u_xlat21) * _Wind.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = in_COLOR0.w;
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat21);
    u_xlat16_4.x = _FurStep * 0.100000001;
    u_xlat21 = u_xlat16_4.x * _FurLength;
    u_xlat0.xyz = u_xlat3.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat0.xyz = _Gravity.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_4.xxx + u_xlat0.xyz;
    u_xlat1.xy = u_xlat16_4.xx * _UVoffset.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.100000001, 0.100000001);
    u_xlat3 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat3;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    gl_Position = u_xlat3 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat15.xy = vec2(1.0, 1.0) / _NoiseTexUV.xy;
    u_xlat3.xy = u_xlat1.xy * u_xlat15.xy + u_xlat16_4.xy;
    u_xlat15.xy = in_TEXCOORD0.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat3.zw = u_xlat15.xy * _NoiseTexUV.xy + u_xlat1.xy;
    vs_TEXCOORD0 = u_xlat3;
    u_xlat1.xy = in_TEXCOORD0.xy * _FurMaskTex_ST.xy + _FurMaskTex_ST.zw;
    vs_TEXCOORD1.xy = u_xlat1.xy;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_4.x = _FurStep * 0.100000001 + 0.5;
    u_xlat16_11 = u_xlat0.x * u_xlat16_4.x;
    u_xlat16_11 = u_xlat16_11 * u_xlat16_11;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_NORMAL0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_NORMAL0.zzz + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * _WorldSpaceLightPos0.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7 = u_xlat0.y * 0.25 + 0.349999994;
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x + _LightFilter;
    u_xlat0.x = _FurStep * 0.100000001 + u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat16_5.xyz = vec3(u_xlat7) * _OcclusionColor.xyz;
    u_xlat16_6.xyz = (-_OcclusionColor.xyz) * vec3(u_xlat7) + vec3(u_xlat7);
    u_xlat7 = u_xlat7 * _FresnelLV;
    u_xlat16_4.xzw = u_xlat16_4.xxx * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat1.xyz = _DirLightColor.xyz * vec3(_FurDirLightExposure);
    u_xlat16_4.xzw = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_4.xzw;
    vs_COLOR0.xyz = vec3(u_xlat16_11) * vec3(u_xlat7) + u_xlat16_4.xzw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _FurStep;
uniform 	vec4 _LerpColor;
uniform 	float _FurMask;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _FurMaskTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
lowp vec3 u_xlat10_2;
lowp float u_xlat10_3;
mediump float u_xlat16_4;
void main()
{
    u_xlat10_0 = texture2D(_FurMaskTex, vs_TEXCOORD1.xy).x;
    u_xlat16_1.x = _FurStep * 0.100000001;
    u_xlat16_4 = u_xlat10_0 * u_xlat16_1.x;
    u_xlat0.x = u_xlat16_4 * _FurMask;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = u_xlat16_1.x * u_xlat16_1.x + u_xlat0.x;
    u_xlat10_3 = texture2D(_NoiseTex, vs_TEXCOORD0.zw).x;
    SV_Target0.w = u_xlat10_3 * 2.0 + (-u_xlat0.x);
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
    u_xlat0.xyz = (-_Color.xyz) + _LerpColor.xyz;
    u_xlat0.xyz = u_xlat16_1.xxx * u_xlat0.xyz + _Color.xyz;
    u_xlat10_2.xyz = texture2D(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
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