//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect_VX/VX_Crystal" {
Properties {

_ZWrite ("深度写入", Float) = 0.0

_ZTest ("深度测试", Float) = 4.0

_OpenCustom ("Custom_自定义曲线开关", Float) = 0.0

_Color ("Color", Color) = (1,1,1,1)

_NormalMap ("NormalMap", 2D) = "white" { }

_Normal_TiOf ("法线平铺与位移", Vector) = (1,1,0,0)

_Normal_SpdRot ("法线贴图速度XY角度ZW", Vector) = (0,0,0,0)

_RefractTex ("折射Cube", Cube) = "white" { }

_RefractColor ("折射颜色", Color) = (1,1,1,1)

_RefractIntensity ("折射强度", Range(0, 10)) = 1.0

_RefractTex_RoXRoYRoZRoV ("RefractTex_RoXRoYRoZRoV", Vector) = (0,0,0,0)

_ReflectTex ("反射Cube", Cube) = "white" { }

_ReflectColor ("反射颜色", Color) = (1,1,1,1)

_ReflectIntensity ("反射强度", Range(0, 10)) = 1.0

_ReflectTex_RoXRoYRoZ ("反射Rot", Vector) = (0,0,0,0)

[Toggle] _ScreenUVOn1 ("Mask使用屏幕UV", Float) = 0.0

_Mask ("Mask", 2D) = "white" { }

_Mask_VxVyRo ("Mask_VxVyRo", Vector) = (0,0,0,0)

_HSV_Vector ("_HSV_Vector", Vector) = (0,1,1,0)

_LeftColor ("左侧渐变色", Color) = (1,1,1,1)

_RightColor ("右侧渐变色", Color) = (1,1,1,1)

_SaturateWeights ("SaturateWeights", Vector) = (1,0,0,0)

_Stencil_Ref ("StencilRef", Float) = 0.0

_Stencil_Comp ("Stencil_Comp", Float) = 8.0

_PanelRect ("PanelRect", Vector) = (0,0,1,1)

_PanelClipInfo ("PanelClipInfo", Vector) = (1,1,1,1)

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 55358
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(2) uniform mediump samplerCube _RefractTex;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5 = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat16_2.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5 = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(2) uniform mediump samplerCube _RefractTex;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5 = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat16_2.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5 = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _NormalMap;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5 = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat10_2.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5 = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
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
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _NormalMap;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5 = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat10_2.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5 = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_VORONOI_NORMAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(1) uniform mediump samplerCube _RefractTex;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(u_xlat5.x<u_xlat4.x);
#else
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
#endif
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat16_1.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_VORONOI_NORMAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(1) uniform mediump samplerCube _RefractTex;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(u_xlat5.x<u_xlat4.x);
#else
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
#endif
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat16_1.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_VORONOI_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat10_1.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_VORONOI_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat10_1.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_MASK" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(2) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat16_2.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb24 = 0.5<_ScreenUVOn1;
#endif
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb24)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat24 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_MASK" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(2) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat16_2.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb24 = 0.5<_ScreenUVOn1;
#endif
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb24)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat24 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_MASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
uniform lowp sampler2D _NormalMap;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat10_2.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlatb24 = 0.5<_ScreenUVOn1;
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb24)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat24 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_MASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
uniform lowp sampler2D _NormalMap;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat10_2.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlatb24 = 0.5<_ScreenUVOn1;
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb24)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat24 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(1) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat14;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(u_xlat5.x<u_xlat4.x);
#else
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
#endif
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat16_1.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb0 = 0.5<_ScreenUVOn1;
#endif
    u_xlat7.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat7.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat14 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat14);
    u_xlat2.x = cos(u_xlat14);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(1) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat14;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(u_xlat5.x<u_xlat4.x);
#else
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
#endif
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat16_1.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb0 = 0.5<_ScreenUVOn1;
#endif
    u_xlat7.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat7.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat14 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat14);
    u_xlat2.x = cos(u_xlat14);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat14;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat10_1.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlatb0 = 0.5<_ScreenUVOn1;
    u_xlat7.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat7.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat14 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat14);
    u_xlat2.x = cos(u_xlat14);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat14;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat10_1.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlatb0 = 0.5<_ScreenUVOn1;
    u_xlat7.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat7.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat14 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat14);
    u_xlat2.x = cos(u_xlat14);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(2) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
float u_xlat12;
mediump vec2 u_xlat16_18;
float u_xlat30;
bool u_xlatb30;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat2.xyz;
    u_xlat30 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + (-u_xlat2.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat16_2.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb30 = 0.5<_ScreenUVOn1;
#endif
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb30)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_8.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_8.xxxx * u_xlat0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat12 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat10.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat10.x = u_xlat10.x / u_xlat12;
    u_xlat10.x = u_xlat10.x + u_xlat0.z;
    u_xlat16_8.x = abs(u_xlat10.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_8.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_18.x>=(-u_xlat16_18.x));
#else
    u_xlatb10 = u_xlat16_18.x>=(-u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb10)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_18.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat10.xyz = u_xlat16_18.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat12;
    u_xlat16_8.x = u_xlat2.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_8.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat10.xyz * u_xlat0.xxx;
    u_xlat16_8.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_38 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_38 = float(1.0) / u_xlat16_38;
    u_xlat16_9.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
    u_xlat16_9.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(2) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
float u_xlat12;
mediump vec2 u_xlat16_18;
float u_xlat30;
bool u_xlatb30;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat2.xyz;
    u_xlat30 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + (-u_xlat2.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat16_2.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb30 = 0.5<_ScreenUVOn1;
#endif
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb30)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_8.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_8.xxxx * u_xlat0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat12 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat10.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat10.x = u_xlat10.x / u_xlat12;
    u_xlat10.x = u_xlat10.x + u_xlat0.z;
    u_xlat16_8.x = abs(u_xlat10.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_8.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_18.x>=(-u_xlat16_18.x));
#else
    u_xlatb10 = u_xlat16_18.x>=(-u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb10)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_18.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat10.xyz = u_xlat16_18.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat12;
    u_xlat16_8.x = u_xlat2.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_8.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat10.xyz * u_xlat0.xxx;
    u_xlat16_8.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_38 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_38 = float(1.0) / u_xlat16_38;
    u_xlat16_9.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
    u_xlat16_9.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
uniform lowp sampler2D _NormalMap;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
float u_xlat12;
mediump vec2 u_xlat16_18;
float u_xlat30;
bool u_xlatb30;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat2.xyz;
    u_xlat30 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + (-u_xlat2.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat10_2.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlatb30 = 0.5<_ScreenUVOn1;
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb30)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_8.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_8.xxxx * u_xlat0 + u_xlat2;
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat12 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat10.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat10.x = u_xlat10.x / u_xlat12;
    u_xlat10.x = u_xlat10.x + u_xlat0.z;
    u_xlat16_8.x = abs(u_xlat10.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_8.x * 360.0;
    u_xlatb10 = u_xlat16_18.x>=(-u_xlat16_18.x);
    u_xlat16_18.xy = (bool(u_xlatb10)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_18.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat10.xyz = u_xlat16_18.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat12;
    u_xlat16_8.x = u_xlat2.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_8.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat10.xyz * u_xlat0.xxx;
    u_xlat16_8.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_38 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_38 = float(1.0) / u_xlat16_38;
    u_xlat16_9.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
    u_xlat16_9.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
uniform lowp sampler2D _NormalMap;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
float u_xlat12;
mediump vec2 u_xlat16_18;
float u_xlat30;
bool u_xlatb30;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat2.xyz;
    u_xlat30 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + (-u_xlat2.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat10_2.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlatb30 = 0.5<_ScreenUVOn1;
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb30)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_8.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_8.xxxx * u_xlat0 + u_xlat2;
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat12 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat10.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat10.x = u_xlat10.x / u_xlat12;
    u_xlat10.x = u_xlat10.x + u_xlat0.z;
    u_xlat16_8.x = abs(u_xlat10.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_8.x * 360.0;
    u_xlatb10 = u_xlat16_18.x>=(-u_xlat16_18.x);
    u_xlat16_18.xy = (bool(u_xlatb10)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_18.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat10.xyz = u_xlat16_18.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat12;
    u_xlat16_8.x = u_xlat2.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_8.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat10.xyz * u_xlat0.xxx;
    u_xlat16_8.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_38 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_38 = float(1.0) / u_xlat16_38;
    u_xlat16_9.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
    u_xlat16_9.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(1) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
mediump vec2 u_xlat16_14;
float u_xlat16;
int u_xlati17;
bool u_xlatb17;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat8.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat8.xy;
    u_xlat1.xy = floor(u_xlat8.xy);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat19.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat25 = dot(u_xlat19.xy, vec2(127.099998, 311.700012));
            u_xlat26 = dot(u_xlat19.xy, vec2(269.5, 183.300003));
            u_xlat13.x = sin(u_xlat25);
            u_xlat13.y = sin(u_xlat26);
            u_xlat19.xy = u_xlat13.xy * vec2(43758.5469, 43758.5469);
            u_xlat19.xy = fract(u_xlat19.xy);
            u_xlat19.xy = u_xlat19.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat19.xy = sin(u_xlat19.xy);
            u_xlat5.yz = u_xlat19.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat8.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat25 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat25 * 0.5;
#ifdef UNITY_ADRENO_ES3
            u_xlatb25 = !!(u_xlat5.x<u_xlat4.x);
#else
            u_xlatb25 = u_xlat5.x<u_xlat4.x;
#endif
            u_xlat4.xyz = (bool(u_xlatb25)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat8.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat16_1.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb0 = 0.5<_ScreenUVOn1;
#endif
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat8.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat16 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat16);
    u_xlat2.x = cos(u_xlat16);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_6.xxxx * u_xlat0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat24 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16 = u_xlat0.x + 1.00000001e-10;
    u_xlat16 = u_xlat1.x / u_xlat16;
    u_xlat16_6.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_14.x = u_xlat16_6.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_14.x>=(-u_xlat16_14.x));
#else
    u_xlatb8 = u_xlat16_14.x>=(-u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_6.x = u_xlat16_14.y * u_xlat16_6.x;
    u_xlat16_6.x = fract(u_xlat16_6.x);
    u_xlat16_22 = u_xlat16 * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_14.xxx * u_xlat16_6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = vec3(u_xlat16_22) * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_30 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_7.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_30 = float(1.0) / u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(1) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
mediump vec2 u_xlat16_14;
float u_xlat16;
int u_xlati17;
bool u_xlatb17;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat8.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat8.xy;
    u_xlat1.xy = floor(u_xlat8.xy);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat19.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat25 = dot(u_xlat19.xy, vec2(127.099998, 311.700012));
            u_xlat26 = dot(u_xlat19.xy, vec2(269.5, 183.300003));
            u_xlat13.x = sin(u_xlat25);
            u_xlat13.y = sin(u_xlat26);
            u_xlat19.xy = u_xlat13.xy * vec2(43758.5469, 43758.5469);
            u_xlat19.xy = fract(u_xlat19.xy);
            u_xlat19.xy = u_xlat19.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat19.xy = sin(u_xlat19.xy);
            u_xlat5.yz = u_xlat19.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat8.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat25 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat25 * 0.5;
#ifdef UNITY_ADRENO_ES3
            u_xlatb25 = !!(u_xlat5.x<u_xlat4.x);
#else
            u_xlatb25 = u_xlat5.x<u_xlat4.x;
#endif
            u_xlat4.xyz = (bool(u_xlatb25)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat8.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat16_1.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb0 = 0.5<_ScreenUVOn1;
#endif
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat8.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat16 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat16);
    u_xlat2.x = cos(u_xlat16);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_6.xxxx * u_xlat0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat24 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16 = u_xlat0.x + 1.00000001e-10;
    u_xlat16 = u_xlat1.x / u_xlat16;
    u_xlat16_6.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_14.x = u_xlat16_6.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_14.x>=(-u_xlat16_14.x));
#else
    u_xlatb8 = u_xlat16_14.x>=(-u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_6.x = u_xlat16_14.y * u_xlat16_6.x;
    u_xlat16_6.x = fract(u_xlat16_6.x);
    u_xlat16_22 = u_xlat16 * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_14.xxx * u_xlat16_6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = vec3(u_xlat16_22) * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_30 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_7.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_30 = float(1.0) / u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
mediump vec2 u_xlat16_14;
float u_xlat16;
int u_xlati17;
bool u_xlatb17;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat8.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat8.xy;
    u_xlat1.xy = floor(u_xlat8.xy);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat19.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat25 = dot(u_xlat19.xy, vec2(127.099998, 311.700012));
            u_xlat26 = dot(u_xlat19.xy, vec2(269.5, 183.300003));
            u_xlat13.x = sin(u_xlat25);
            u_xlat13.y = sin(u_xlat26);
            u_xlat19.xy = u_xlat13.xy * vec2(43758.5469, 43758.5469);
            u_xlat19.xy = fract(u_xlat19.xy);
            u_xlat19.xy = u_xlat19.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat19.xy = sin(u_xlat19.xy);
            u_xlat5.yz = u_xlat19.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat8.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat25 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat25 * 0.5;
            u_xlatb25 = u_xlat5.x<u_xlat4.x;
            u_xlat4.xyz = (bool(u_xlatb25)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat8.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat10_1.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlatb0 = 0.5<_ScreenUVOn1;
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat8.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat16 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat16);
    u_xlat2.x = cos(u_xlat16);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_6.xxxx * u_xlat0 + u_xlat2;
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat24 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16 = u_xlat0.x + 1.00000001e-10;
    u_xlat16 = u_xlat1.x / u_xlat16;
    u_xlat16_6.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_14.x = u_xlat16_6.x * 360.0;
    u_xlatb8 = u_xlat16_14.x>=(-u_xlat16_14.x);
    u_xlat16_14.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_6.x = u_xlat16_14.y * u_xlat16_6.x;
    u_xlat16_6.x = fract(u_xlat16_6.x);
    u_xlat16_22 = u_xlat16 * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_14.xxx * u_xlat16_6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = vec3(u_xlat16_22) * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_30 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_7.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_30 = float(1.0) / u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat1.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat13 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.yzx * u_xlat2.zxy;
    u_xlat1.xyz = u_xlat2.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlatb13 = unity_WorldTransformParams.w>=0.0;
    u_xlat13 = (u_xlatb13) ? 1.0 : -1.0;
    u_xlat13 = u_xlat13 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat13) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump float _OpenCustom;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
mediump vec2 u_xlat16_14;
float u_xlat16;
int u_xlati17;
bool u_xlatb17;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat8.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat8.xy;
    u_xlat1.xy = floor(u_xlat8.xy);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat19.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat25 = dot(u_xlat19.xy, vec2(127.099998, 311.700012));
            u_xlat26 = dot(u_xlat19.xy, vec2(269.5, 183.300003));
            u_xlat13.x = sin(u_xlat25);
            u_xlat13.y = sin(u_xlat26);
            u_xlat19.xy = u_xlat13.xy * vec2(43758.5469, 43758.5469);
            u_xlat19.xy = fract(u_xlat19.xy);
            u_xlat19.xy = u_xlat19.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat19.xy = sin(u_xlat19.xy);
            u_xlat5.yz = u_xlat19.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat8.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat25 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat25 * 0.5;
            u_xlatb25 = u_xlat5.x<u_xlat4.x;
            u_xlat4.xyz = (bool(u_xlatb25)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat8.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat10_1.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlatb0 = 0.5<_ScreenUVOn1;
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat8.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat16 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat16);
    u_xlat2.x = cos(u_xlat16);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_6.xxxx * u_xlat0 + u_xlat2;
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat24 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16 = u_xlat0.x + 1.00000001e-10;
    u_xlat16 = u_xlat1.x / u_xlat16;
    u_xlat16_6.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_14.x = u_xlat16_6.x * 360.0;
    u_xlatb8 = u_xlat16_14.x>=(-u_xlat16_14.x);
    u_xlat16_14.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_6.x = u_xlat16_14.y * u_xlat16_6.x;
    u_xlat16_6.x = fract(u_xlat16_6.x);
    u_xlat16_22 = u_xlat16 * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_14.xxx * u_xlat16_6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = vec3(u_xlat16_22) * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_30 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_7.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_30 = float(1.0) / u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + _LeftColor.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(2) uniform mediump samplerCube _RefractTex;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec2 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5 = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat16_2.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5 = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_1.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(2) uniform mediump samplerCube _RefractTex;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec2 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5 = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat16_2.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5 = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_1.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _NormalMap;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5 = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat10_2.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5 = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_1.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _NormalMap;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5 = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat10_2.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5 = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_1.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_VORONOI_NORMAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(1) uniform mediump samplerCube _RefractTex;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec2 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(u_xlat5.x<u_xlat4.x);
#else
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
#endif
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat16_1.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_6.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_VORONOI_NORMAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(1) uniform mediump samplerCube _RefractTex;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec2 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(u_xlat5.x<u_xlat4.x);
#else
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
#endif
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat16_1.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_6.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_VORONOI_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat10_1.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_6.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_VORONOI_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat10_1.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_6.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(2) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump vec2 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat16_2.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb24 = 0.5<_ScreenUVOn1;
#endif
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb24)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat24 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_1.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(2) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump vec2 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat16_2.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb24 = 0.5<_ScreenUVOn1;
#endif
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb24)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat24 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_1.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.xy = min(max(u_xlat16_1.xy, 0.0), 1.0);
#else
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
#endif
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
uniform lowp sampler2D _NormalMap;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat10_2.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlatb24 = 0.5<_ScreenUVOn1;
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb24)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat24 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_1.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
uniform lowp sampler2D _NormalMap;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec3 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
float u_xlat24;
bool u_xlatb24;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat24 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat2.xyz = vec3(u_xlat24) * u_xlat2.xyz;
    u_xlat24 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat24 = u_xlat24 + u_xlat24;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat24)) + (-u_xlat2.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat10_2.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlatb24 = 0.5<_ScreenUVOn1;
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb24)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat24 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat24);
    u_xlat4.x = cos(u_xlat24);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_1.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_1.xy = u_xlat16_1.xy + u_xlat16_1.xy;
    u_xlat16_1.xy = abs(u_xlat16_1.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_1.xy = clamp(u_xlat16_1.xy, 0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_1.y, u_xlat16_1.x);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(1) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump vec2 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat14;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(u_xlat5.x<u_xlat4.x);
#else
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
#endif
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat16_1.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb0 = 0.5<_ScreenUVOn1;
#endif
    u_xlat7.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat7.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat14 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat14);
    u_xlat2.x = cos(u_xlat14);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_6.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(1) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump vec2 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat14;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(u_xlat5.x<u_xlat4.x);
#else
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
#endif
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat16_1.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb0 = 0.5<_ScreenUVOn1;
#endif
    u_xlat7.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat7.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat14 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat14);
    u_xlat2.x = cos(u_xlat14);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_6.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xy = min(max(u_xlat16_6.xy, 0.0), 1.0);
#else
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
#endif
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat14;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat10_1.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlatb0 = 0.5<_ScreenUVOn1;
    u_xlat7.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat7.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat14 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat14);
    u_xlat2.x = cos(u_xlat14);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_6.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
vec3 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat12;
float u_xlat14;
int u_xlati15;
bool u_xlatb15;
vec2 u_xlat17;
float u_xlat21;
int u_xlati21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat7.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat7.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat7.xy;
    u_xlat1.xy = floor(u_xlat7.xy);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat17.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat22 = dot(u_xlat17.xy, vec2(127.099998, 311.700012));
            u_xlat23 = dot(u_xlat17.xy, vec2(269.5, 183.300003));
            u_xlat12.x = sin(u_xlat22);
            u_xlat12.y = sin(u_xlat23);
            u_xlat17.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
            u_xlat17.xy = fract(u_xlat17.xy);
            u_xlat17.xy = u_xlat17.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat17.xy = sin(u_xlat17.xy);
            u_xlat5.yz = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat7.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat22 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat22 * 0.5;
            u_xlatb22 = u_xlat5.x<u_xlat4.x;
            u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat7.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat7.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat7.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat10_1.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlatb0 = 0.5<_ScreenUVOn1;
    u_xlat7.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat7.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat14 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat14);
    u_xlat2.x = cos(u_xlat14);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat0.xyz = u_xlat0.xyz * _Color.www;
    u_xlat16_6.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_6.xy = u_xlat16_6.xy + u_xlat16_6.xy;
    u_xlat16_6.xy = abs(u_xlat16_6.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_6.xy = clamp(u_xlat16_6.xy, 0.0, 1.0);
    u_xlat16_6.x = max(u_xlat16_6.y, u_xlat16_6.x);
    u_xlat16_6.x = (-u_xlat16_6.x) + 1.0;
    SV_Target0.xyz = u_xlat0.xyz * u_xlat16_6.xxx;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(2) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump vec2 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
float u_xlat12;
mediump vec2 u_xlat16_18;
float u_xlat30;
bool u_xlatb30;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat2.xyz;
    u_xlat30 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + (-u_xlat2.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat16_2.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb30 = 0.5<_ScreenUVOn1;
#endif
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb30)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_8.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_8.xxxx * u_xlat0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat12 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat10.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat10.x = u_xlat10.x / u_xlat12;
    u_xlat10.x = u_xlat10.x + u_xlat0.z;
    u_xlat16_8.x = abs(u_xlat10.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_8.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_18.x>=(-u_xlat16_18.x));
#else
    u_xlatb10 = u_xlat16_18.x>=(-u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb10)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_18.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat10.xyz = u_xlat16_18.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat12;
    u_xlat16_8.x = u_xlat2.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_8.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat10.xyz * u_xlat0.xxx;
    u_xlat16_8.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_38 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_38 = float(1.0) / u_xlat16_38;
    u_xlat16_9.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
    u_xlat16_9.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz + _LeftColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_9.xy = u_xlat16_9.xy + u_xlat16_9.xy;
    u_xlat16_9.xy = abs(u_xlat16_9.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xy = min(max(u_xlat16_9.xy, 0.0), 1.0);
#else
    u_xlat16_9.xy = clamp(u_xlat16_9.xy, 0.0, 1.0);
#endif
    u_xlat16_38 = max(u_xlat16_9.y, u_xlat16_9.x);
    u_xlat16_38 = (-u_xlat16_38) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_38) * u_xlat16_8.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(2) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(3) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump vec2 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
float u_xlat12;
mediump vec2 u_xlat16_18;
float u_xlat30;
bool u_xlatb30;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat2.xyz;
    u_xlat30 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + (-u_xlat2.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat16_2.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat16_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb30 = 0.5<_ScreenUVOn1;
#endif
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb30)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat16_2.xyz = texture(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_8.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_8.xxxx * u_xlat0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat12 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat10.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat10.x = u_xlat10.x / u_xlat12;
    u_xlat10.x = u_xlat10.x + u_xlat0.z;
    u_xlat16_8.x = abs(u_xlat10.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_8.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat16_18.x>=(-u_xlat16_18.x));
#else
    u_xlatb10 = u_xlat16_18.x>=(-u_xlat16_18.x);
#endif
    u_xlat16_18.xy = (bool(u_xlatb10)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_18.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat10.xyz = u_xlat16_18.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xyz = min(max(u_xlat10.xyz, 0.0), 1.0);
#else
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
#endif
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat12;
    u_xlat16_8.x = u_xlat2.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_8.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat10.xyz * u_xlat0.xxx;
    u_xlat16_8.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_38 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_38 = float(1.0) / u_xlat16_38;
    u_xlat16_9.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38 = min(max(u_xlat16_38, 0.0), 1.0);
#else
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
#endif
    u_xlat16_9.x = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
    u_xlat16_9.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz + _LeftColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_9.xy = u_xlat16_9.xy + u_xlat16_9.xy;
    u_xlat16_9.xy = abs(u_xlat16_9.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xy = min(max(u_xlat16_9.xy, 0.0), 1.0);
#else
    u_xlat16_9.xy = clamp(u_xlat16_9.xy, 0.0, 1.0);
#endif
    u_xlat16_38 = max(u_xlat16_9.y, u_xlat16_9.x);
    u_xlat16_38 = (-u_xlat16_38) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_38) * u_xlat16_8.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
uniform lowp sampler2D _NormalMap;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
float u_xlat12;
mediump vec2 u_xlat16_18;
float u_xlat30;
bool u_xlatb30;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat2.xyz;
    u_xlat30 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + (-u_xlat2.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat10_2.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlatb30 = 0.5<_ScreenUVOn1;
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb30)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_8.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_8.xxxx * u_xlat0 + u_xlat2;
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat12 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat10.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat10.x = u_xlat10.x / u_xlat12;
    u_xlat10.x = u_xlat10.x + u_xlat0.z;
    u_xlat16_8.x = abs(u_xlat10.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_8.x * 360.0;
    u_xlatb10 = u_xlat16_18.x>=(-u_xlat16_18.x);
    u_xlat16_18.xy = (bool(u_xlatb10)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_18.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat10.xyz = u_xlat16_18.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat12;
    u_xlat16_8.x = u_xlat2.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_8.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat10.xyz * u_xlat0.xxx;
    u_xlat16_8.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_38 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_38 = float(1.0) / u_xlat16_38;
    u_xlat16_9.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
    u_xlat16_9.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz + _LeftColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_9.xy = u_xlat16_9.xy + u_xlat16_9.xy;
    u_xlat16_9.xy = abs(u_xlat16_9.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_9.xy = clamp(u_xlat16_9.xy, 0.0, 1.0);
    u_xlat16_38 = max(u_xlat16_9.y, u_xlat16_9.x);
    u_xlat16_38 = (-u_xlat16_38) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_38) * u_xlat16_8.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
uniform lowp sampler2D _NormalMap;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
lowp vec3 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
bool u_xlatb10;
float u_xlat12;
mediump vec2 u_xlat16_18;
float u_xlat30;
bool u_xlatb30;
mediump float u_xlat16_38;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat0.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat0.xy;
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat0.xyz = u_xlat16_1.yyy * vs_TEXCOORD4.xyz;
    u_xlat0.xyz = vs_TEXCOORD2.xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = vs_TEXCOORD3.xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat30 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat2.xyz = vec3(u_xlat30) * u_xlat2.xyz;
    u_xlat30 = dot((-u_xlat2.xyz), u_xlat0.xyz);
    u_xlat30 = u_xlat30 + u_xlat30;
    u_xlat0.xyz = u_xlat0.xyz * (-vec3(u_xlat30)) + (-u_xlat2.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = inversesqrt(u_xlat30);
    u_xlat0.xyz = vec3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = sin(u_xlat2.y);
    u_xlat5.x = cos(u_xlat2.y);
    u_xlat6.x = (-u_xlat2.x);
    u_xlat6.y = u_xlat3.x;
    u_xlat6.z = u_xlat2.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat6.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat6.xy);
    u_xlat3.z = u_xlat4.x;
    u_xlat3.y = u_xlat5.x;
    u_xlat3.x = (-u_xlat4.x);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat3.xy);
    u_xlat2.x = dot(u_xlat0.xw, u_xlat3.yz);
    u_xlat10_2.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _ReflectColor.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(_ReflectIntensity);
    u_xlat3.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat4.x = cos(u_xlat3.x);
    u_xlat3.x = sin(u_xlat3.x);
    u_xlat5.x = sin(u_xlat3.y);
    u_xlat6.x = cos(u_xlat3.y);
    u_xlat7.x = (-u_xlat3.x);
    u_xlat7.y = u_xlat4.x;
    u_xlat7.z = u_xlat3.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat7.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat7.xy);
    u_xlat4.z = u_xlat5.x;
    u_xlat4.y = u_xlat6.x;
    u_xlat4.x = (-u_xlat5.x);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat4.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat4.yz);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlatb30 = 0.5<_ScreenUVOn1;
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.xy = (bool(u_xlatb30)) ? u_xlat2.xy : vs_TEXCOORD0.xy;
    u_xlat2.xy = u_xlat2.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat2.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat2.xy;
    u_xlat2.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat2.xy;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat30 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat3.x = sin(u_xlat30);
    u_xlat4.x = cos(u_xlat30);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4.x;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat2.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat2.xy, u_xlat5.yz);
    u_xlat2.xy = u_xlat3.xy + vec2(0.5, 0.5);
    u_xlat10_2.xyz = texture2D(_Mask, u_xlat2.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_8.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_8.xxxx * u_xlat0 + u_xlat2;
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat12 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat10.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat10.x = u_xlat10.x / u_xlat12;
    u_xlat10.x = u_xlat10.x + u_xlat0.z;
    u_xlat16_8.x = abs(u_xlat10.x) + _HSV_Vector.x;
    u_xlat16_18.x = u_xlat16_8.x * 360.0;
    u_xlatb10 = u_xlat16_18.x>=(-u_xlat16_18.x);
    u_xlat16_18.xy = (bool(u_xlatb10)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_8.x = u_xlat16_18.y * u_xlat16_8.x;
    u_xlat16_8.x = fract(u_xlat16_8.x);
    u_xlat10.xyz = u_xlat16_18.xxx * u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat10.xyz = fract(u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat10.xyz = abs(u_xlat10.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.xyz = clamp(u_xlat10.xyz, 0.0, 1.0);
    u_xlat10.xyz = u_xlat10.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat12;
    u_xlat16_8.x = u_xlat2.x * _HSV_Vector.y;
    u_xlat10.xyz = u_xlat16_8.xxx * u_xlat10.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat10.xyz * u_xlat0.xxx;
    u_xlat16_8.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_38 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_38 = float(1.0) / u_xlat16_38;
    u_xlat16_9.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
    u_xlat16_38 = clamp(u_xlat16_38, 0.0, 1.0);
    u_xlat16_9.x = u_xlat16_38 * -2.0 + 3.0;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_38;
    u_xlat16_38 = u_xlat16_38 * u_xlat16_9.x;
    u_xlat16_9.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_9.xyz = vec3(u_xlat16_38) * u_xlat16_9.xyz + _LeftColor.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16_9.xyz;
    u_xlat16_9.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_9.xy = u_xlat16_9.xy + u_xlat16_9.xy;
    u_xlat16_9.xy = abs(u_xlat16_9.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_9.xy = clamp(u_xlat16_9.xy, 0.0, 1.0);
    u_xlat16_38 = max(u_xlat16_9.y, u_xlat16_9.x);
    u_xlat16_38 = (-u_xlat16_38) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_38) * u_xlat16_8.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(1) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump vec2 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
mediump vec2 u_xlat16_14;
float u_xlat16;
int u_xlati17;
bool u_xlatb17;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat8.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat8.xy;
    u_xlat1.xy = floor(u_xlat8.xy);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat19.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat25 = dot(u_xlat19.xy, vec2(127.099998, 311.700012));
            u_xlat26 = dot(u_xlat19.xy, vec2(269.5, 183.300003));
            u_xlat13.x = sin(u_xlat25);
            u_xlat13.y = sin(u_xlat26);
            u_xlat19.xy = u_xlat13.xy * vec2(43758.5469, 43758.5469);
            u_xlat19.xy = fract(u_xlat19.xy);
            u_xlat19.xy = u_xlat19.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat19.xy = sin(u_xlat19.xy);
            u_xlat5.yz = u_xlat19.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat8.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat25 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat25 * 0.5;
#ifdef UNITY_ADRENO_ES3
            u_xlatb25 = !!(u_xlat5.x<u_xlat4.x);
#else
            u_xlatb25 = u_xlat5.x<u_xlat4.x;
#endif
            u_xlat4.xyz = (bool(u_xlatb25)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat8.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat16_1.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb0 = 0.5<_ScreenUVOn1;
#endif
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat8.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat16 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat16);
    u_xlat2.x = cos(u_xlat16);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_6.xxxx * u_xlat0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat24 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16 = u_xlat0.x + 1.00000001e-10;
    u_xlat16 = u_xlat1.x / u_xlat16;
    u_xlat16_6.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_14.x = u_xlat16_6.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_14.x>=(-u_xlat16_14.x));
#else
    u_xlatb8 = u_xlat16_14.x>=(-u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_6.x = u_xlat16_14.y * u_xlat16_6.x;
    u_xlat16_6.x = fract(u_xlat16_6.x);
    u_xlat16_22 = u_xlat16 * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_14.xxx * u_xlat16_6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = vec3(u_xlat16_22) * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_30 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_7.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_30 = float(1.0) / u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + _LeftColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_30 = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_30 = (-u_xlat16_30) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_30) * u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
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
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec4 vs_TEXCOORD5;
out mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
UNITY_LOCATION(0) uniform mediump samplerCube _ReflectTex;
UNITY_LOCATION(1) uniform mediump samplerCube _RefractTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec4 vs_TEXCOORD5;
in mediump vec2 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
mediump vec2 u_xlat16_14;
float u_xlat16;
int u_xlati17;
bool u_xlatb17;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat8.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat8.xy;
    u_xlat1.xy = floor(u_xlat8.xy);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = int(0xFFFFFFFFu) ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = int(0xFFFFFFFFu) ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat19.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat25 = dot(u_xlat19.xy, vec2(127.099998, 311.700012));
            u_xlat26 = dot(u_xlat19.xy, vec2(269.5, 183.300003));
            u_xlat13.x = sin(u_xlat25);
            u_xlat13.y = sin(u_xlat26);
            u_xlat19.xy = u_xlat13.xy * vec2(43758.5469, 43758.5469);
            u_xlat19.xy = fract(u_xlat19.xy);
            u_xlat19.xy = u_xlat19.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat19.xy = sin(u_xlat19.xy);
            u_xlat5.yz = u_xlat19.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat8.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat25 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat25 * 0.5;
#ifdef UNITY_ADRENO_ES3
            u_xlatb25 = !!(u_xlat5.x<u_xlat4.x);
#else
            u_xlatb25 = u_xlat5.x<u_xlat4.x;
#endif
            u_xlat4.xyz = (bool(u_xlatb25)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat8.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat16_1.xyz = texture(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat16_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat16_0.xyz = texture(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_ScreenUVOn1);
#else
    u_xlatb0 = 0.5<_ScreenUVOn1;
#endif
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat8.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat16 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat16);
    u_xlat2.x = cos(u_xlat16);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat16_0.xyz = texture(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_6.xxxx * u_xlat0 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.w>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat24 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16 = u_xlat0.x + 1.00000001e-10;
    u_xlat16 = u_xlat1.x / u_xlat16;
    u_xlat16_6.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_14.x = u_xlat16_6.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat16_14.x>=(-u_xlat16_14.x));
#else
    u_xlatb8 = u_xlat16_14.x>=(-u_xlat16_14.x);
#endif
    u_xlat16_14.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_6.x = u_xlat16_14.y * u_xlat16_6.x;
    u_xlat16_6.x = fract(u_xlat16_6.x);
    u_xlat16_22 = u_xlat16 * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_14.xxx * u_xlat16_6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = vec3(u_xlat16_22) * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_30 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_7.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_30 = float(1.0) / u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30 = min(max(u_xlat16_30, 0.0), 1.0);
#else
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
#endif
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + _LeftColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_7.xy = min(max(u_xlat16_7.xy, 0.0), 1.0);
#else
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
#endif
    u_xlat16_30 = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_30 = (-u_xlat16_30) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_30) * u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
mediump vec2 u_xlat16_14;
float u_xlat16;
int u_xlati17;
bool u_xlatb17;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat8.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat8.xy;
    u_xlat1.xy = floor(u_xlat8.xy);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat19.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat25 = dot(u_xlat19.xy, vec2(127.099998, 311.700012));
            u_xlat26 = dot(u_xlat19.xy, vec2(269.5, 183.300003));
            u_xlat13.x = sin(u_xlat25);
            u_xlat13.y = sin(u_xlat26);
            u_xlat19.xy = u_xlat13.xy * vec2(43758.5469, 43758.5469);
            u_xlat19.xy = fract(u_xlat19.xy);
            u_xlat19.xy = u_xlat19.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat19.xy = sin(u_xlat19.xy);
            u_xlat5.yz = u_xlat19.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat8.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat25 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat25 * 0.5;
            u_xlatb25 = u_xlat5.x<u_xlat4.x;
            u_xlat4.xyz = (bool(u_xlatb25)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat8.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat10_1.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlatb0 = 0.5<_ScreenUVOn1;
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat8.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat16 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat16);
    u_xlat2.x = cos(u_xlat16);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_6.xxxx * u_xlat0 + u_xlat2;
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat24 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16 = u_xlat0.x + 1.00000001e-10;
    u_xlat16 = u_xlat1.x / u_xlat16;
    u_xlat16_6.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_14.x = u_xlat16_6.x * 360.0;
    u_xlatb8 = u_xlat16_14.x>=(-u_xlat16_14.x);
    u_xlat16_14.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_6.x = u_xlat16_14.y * u_xlat16_6.x;
    u_xlat16_6.x = fract(u_xlat16_6.x);
    u_xlat16_22 = u_xlat16 * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_14.xxx * u_xlat16_6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = vec3(u_xlat16_22) * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_30 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_7.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_30 = float(1.0) / u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + _LeftColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_30 = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_30 = (-u_xlat16_30) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_30) * u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TANGENT0;
attribute highp vec3 in_NORMAL0;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD6.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat2.zxy;
    u_xlat0.xyz = u_xlat2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD4.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD5.zw = u_xlat1.zw;
    vs_TEXCOORD5.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _HSV_Vector;
uniform 	mediump vec4 _SaturateWeights;
uniform 	mediump vec4 _LeftColor;
uniform 	mediump vec4 _RightColor;
uniform 	mediump vec4 _RefractColor;
uniform 	float _RefractIntensity;
uniform 	vec4 _Normal_SpdRot;
uniform 	vec4 _Normal_TiOf;
uniform 	vec4 _RefractTex_RoXRoYRoZRoV;
uniform 	mediump vec4 _ReflectColor;
uniform 	float _ReflectIntensity;
uniform 	vec4 _ReflectTex_RoXRoYRoZ;
uniform 	mediump vec4 _Color;
uniform 	vec3 _Mask_VxVyRo;
uniform 	float _ScreenUVOn1;
uniform 	vec4 _Mask_ST;
uniform 	mediump vec4 _PanelClipInfo;
uniform 	mediump float _OpenCustom;
uniform lowp samplerCube _ReflectTex;
uniform lowp samplerCube _RefractTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec4 vs_TEXCOORD5;
varying mediump vec2 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
bool u_xlatb8;
vec2 u_xlat13;
mediump vec2 u_xlat16_14;
float u_xlat16;
int u_xlati17;
bool u_xlatb17;
vec2 u_xlat19;
mediump float u_xlat16_22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
bool u_xlatb25;
float u_xlat26;
mediump float u_xlat16_30;
void main()
{
    u_xlat0.x = _Time.y * _Normal_SpdRot.w + _Normal_SpdRot.z;
    u_xlat8.xy = vs_TEXCOORD0.xy * _Normal_TiOf.xy + _Normal_TiOf.zw;
    u_xlat8.xy = _Time.yy * _Normal_SpdRot.xy + u_xlat8.xy;
    u_xlat1.xy = floor(u_xlat8.xy);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat2.x = float(0.0);
    u_xlat2.y = float(0.0);
    u_xlat2.z = float(8.0);
    for(int u_xlati_loop_1 = -1 ; u_xlati_loop_1<=1 ; u_xlati_loop_1++)
    {
        u_xlat3.y = float(u_xlati_loop_1);
        u_xlat4.xyz = u_xlat2.zxy;
        for(int u_xlati_loop_2 = -1 ; u_xlati_loop_2<=1 ; u_xlati_loop_2++)
        {
            u_xlat3.x = float(u_xlati_loop_2);
            u_xlat19.xy = u_xlat1.xy + u_xlat3.xy;
            u_xlat25 = dot(u_xlat19.xy, vec2(127.099998, 311.700012));
            u_xlat26 = dot(u_xlat19.xy, vec2(269.5, 183.300003));
            u_xlat13.x = sin(u_xlat25);
            u_xlat13.y = sin(u_xlat26);
            u_xlat19.xy = u_xlat13.xy * vec2(43758.5469, 43758.5469);
            u_xlat19.xy = fract(u_xlat19.xy);
            u_xlat19.xy = u_xlat19.xy * vec2(6.28310013, 6.28310013) + u_xlat0.xx;
            u_xlat19.xy = sin(u_xlat19.xy);
            u_xlat5.yz = u_xlat19.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
            u_xlat3.xz = u_xlat8.xy + (-u_xlat3.xy);
            u_xlat3.xz = (-u_xlat5.yz) + u_xlat3.xz;
            u_xlat25 = dot(u_xlat3.xz, u_xlat3.xz);
            u_xlat5.x = u_xlat25 * 0.5;
            u_xlatb25 = u_xlat5.x<u_xlat4.x;
            u_xlat4.xyz = (bool(u_xlatb25)) ? u_xlat5.xyz : u_xlat4.xyz;
        }
        u_xlat2.xyz = u_xlat4.yzx;
    }
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat8.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat1.xxx;
    u_xlat1.xyz = u_xlat2.yyy * vs_TEXCOORD4.xyz;
    u_xlat1.xyz = vs_TEXCOORD2.xyz * u_xlat2.xxx + u_xlat1.xyz;
    u_xlat1.xyz = vs_TEXCOORD3.xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.x = dot((-u_xlat8.xyz), u_xlat1.xyz);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.xyz = u_xlat1.xyz * (-u_xlat0.xxx) + (-u_xlat8.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat1.xy = _Time.yy * _ReflectTex_RoXRoYRoZ.zw + _ReflectTex_RoXRoYRoZ.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat2.x = cos(u_xlat1.x);
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat2.y = dot(u_xlat0.yz, u_xlat3.yz);
    u_xlat0.w = dot(u_xlat0.yz, u_xlat3.xy);
    u_xlat3.x = cos(u_xlat1.y);
    u_xlat1.x = sin(u_xlat1.y);
    u_xlat4.x = (-u_xlat1.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat1.x;
    u_xlat2.x = dot(u_xlat0.xw, u_xlat4.yz);
    u_xlat2.z = dot(u_xlat0.xw, u_xlat4.xy);
    u_xlat10_1.xyz = textureCube(_ReflectTex, u_xlat2.xyz).xyz;
    u_xlat1.xyz = u_xlat10_1.xyz * _ReflectColor.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(_ReflectIntensity);
    u_xlat2.xy = _Time.yy * _RefractTex_RoXRoYRoZRoV.zw + _RefractTex_RoXRoYRoZRoV.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0174532942, 0.0174532942);
    u_xlat3.x = cos(u_xlat2.x);
    u_xlat2.x = sin(u_xlat2.x);
    u_xlat4.x = (-u_xlat2.x);
    u_xlat4.y = u_xlat3.x;
    u_xlat4.z = u_xlat2.x;
    u_xlat3.y = dot(u_xlat0.yz, u_xlat4.yz);
    u_xlat0.y = dot(u_xlat0.yz, u_xlat4.xy);
    u_xlat4.x = cos(u_xlat2.y);
    u_xlat2.x = sin(u_xlat2.y);
    u_xlat5.x = (-u_xlat2.x);
    u_xlat5.y = u_xlat4.x;
    u_xlat5.z = u_xlat2.x;
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat3.z = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat10_0.xyz = textureCube(_RefractTex, u_xlat3.xyz).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _RefractColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_RefractIntensity);
    u_xlat16_6.xyz = u_xlat1.xyz * u_xlat0.xyz;
    u_xlatb0 = 0.5<_ScreenUVOn1;
    u_xlat8.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat8.xy : vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat0.xy = _Time.yy * _Mask_VxVyRo.xxyz.yz + u_xlat0.xy;
    u_xlat0.xy = vec2(_OpenCustom) * vs_TEXCOORD0.zw + u_xlat0.xy;
    u_xlat16 = _Mask_VxVyRo.xxyz.w * 0.0174532942;
    u_xlat1.x = sin(u_xlat16);
    u_xlat2.x = cos(u_xlat16);
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat3.x = (-u_xlat1.x);
    u_xlat3.y = u_xlat2.x;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat0.xy = u_xlat1.xy + vec2(0.5, 0.5);
    u_xlat10_0.xyz = texture2D(_Mask, u_xlat0.xy).xyz;
    u_xlat1.xyz = u_xlat16_6.xyz * vs_COLOR0.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.www;
    u_xlat1.xyw = u_xlat0.yzx * _Color.www;
    u_xlatb0 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_6.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat1.yx;
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat0.xy = u_xlat0.yz * _Color.ww + (-u_xlat2.xy);
    u_xlat0.z = float(1.0);
    u_xlat0.w = float(-1.0);
    u_xlat0 = u_xlat16_6.xxxx * u_xlat0 + u_xlat2;
    u_xlatb2 = u_xlat1.w>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat1.wyx;
    u_xlat0 = (-u_xlat1) + u_xlat0;
    u_xlat0 = u_xlat2.xxxx * u_xlat0 + u_xlat1;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat24 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat8.x = u_xlat8.x / u_xlat24;
    u_xlat8.x = u_xlat8.x + u_xlat0.z;
    u_xlat16 = u_xlat0.x + 1.00000001e-10;
    u_xlat16 = u_xlat1.x / u_xlat16;
    u_xlat16_6.x = abs(u_xlat8.x) + _HSV_Vector.x;
    u_xlat16_14.x = u_xlat16_6.x * 360.0;
    u_xlatb8 = u_xlat16_14.x>=(-u_xlat16_14.x);
    u_xlat16_14.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_6.x = u_xlat16_14.y * u_xlat16_6.x;
    u_xlat16_6.x = fract(u_xlat16_6.x);
    u_xlat16_22 = u_xlat16 * _HSV_Vector.y;
    u_xlat8.xyz = u_xlat16_14.xxx * u_xlat16_6.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = vec3(u_xlat16_22) * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat0.xxx;
    u_xlat16_6.xyz = u_xlat0.xyz * _HSV_Vector.zzz;
    u_xlat16_30 = (-_SaturateWeights.z) + _SaturateWeights.w;
    u_xlat16_7.x = vs_TEXCOORD0.x + (-_SaturateWeights.z);
    u_xlat16_30 = float(1.0) / u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_30 = clamp(u_xlat16_30, 0.0, 1.0);
    u_xlat16_7.x = u_xlat16_30 * -2.0 + 3.0;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_30;
    u_xlat16_30 = u_xlat16_30 * u_xlat16_7.x;
    u_xlat16_7.xyz = (-_LeftColor.xyz) + _RightColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_30) * u_xlat16_7.xyz + _LeftColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz;
    u_xlat16_7.xy = vs_TEXCOORD6.xy + vec2(-0.5, -0.5);
    u_xlat16_7.xy = u_xlat16_7.xy + u_xlat16_7.xy;
    u_xlat16_7.xy = abs(u_xlat16_7.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_7.xy = clamp(u_xlat16_7.xy, 0.0, 1.0);
    u_xlat16_30 = max(u_xlat16_7.y, u_xlat16_7.x);
    u_xlat16_30 = (-u_xlat16_30) + 1.0;
    SV_Target0.xyz = vec3(u_xlat16_30) * u_xlat16_6.xyz;
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
Local Keywords { "_VORONOI_NORMAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_VORONOI_NORMAL" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_VORONOI_NORMAL" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_VORONOI_NORMAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_MASK" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_MASK" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_MASK" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_MASK" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_VORONOI_NORMAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_VORONOI_NORMAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_VORONOI_NORMAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_VORONOI_NORMAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
Local Keywords { "_COLOUR_ON" "_USE_MASK" "_VORONOI_NORMAL" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.VX_CrystalGUI"
}