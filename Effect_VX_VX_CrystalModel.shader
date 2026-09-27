//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effect_VX/VX_Crystal(Model)" {
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

_FresVector ("反射Fresnel", Vector) = (0,1,3,0)

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
 Name "BackFace(Pass1)"
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Front
  GpuProgramID 31623
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
}
}
 Pass {
 Name "FrontFace(Pass2)"
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
  GpuProgramID 84874
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
uniform 	mediump vec3 _FresVector;
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
mediump vec3 u_xlat16_9;
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
    u_xlat24 = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat24);
    u_xlat16_1.x = u_xlat16_1.x * _FresVector.z;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = _FresVector.y * u_xlat16_1.x + _FresVector.x;
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
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_1.x = u_xlat16_1.x + 1.0;
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
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
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
uniform 	mediump vec3 _FresVector;
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
mediump vec3 u_xlat16_9;
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
    u_xlat24 = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat24);
    u_xlat16_1.x = u_xlat16_1.x * _FresVector.z;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = _FresVector.y * u_xlat16_1.x + _FresVector.x;
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
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_1.x = u_xlat16_1.x + 1.0;
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
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
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
uniform 	mediump vec3 _FresVector;
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
mediump vec3 u_xlat16_9;
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
    u_xlat24 = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat24);
    u_xlat16_1.x = u_xlat16_1.x * _FresVector.z;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = _FresVector.y * u_xlat16_1.x + _FresVector.x;
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
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_1.x = u_xlat16_1.x + 1.0;
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
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
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
uniform 	mediump vec3 _FresVector;
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
mediump vec3 u_xlat16_9;
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
    u_xlat24 = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat24);
    u_xlat16_1.x = u_xlat16_1.x * _FresVector.z;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = _FresVector.y * u_xlat16_1.x + _FresVector.x;
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
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_1.x = u_xlat16_1.x + 1.0;
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
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
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
uniform 	mediump vec3 _FresVector;
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
mediump vec3 u_xlat16_9;
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
    u_xlat24 = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat24);
    u_xlat16_1.x = u_xlat16_1.x * _FresVector.z;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = _FresVector.y * u_xlat16_1.x + _FresVector.x;
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
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_1.x = u_xlat16_1.x + 1.0;
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
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
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
uniform 	mediump vec3 _FresVector;
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
mediump vec3 u_xlat16_9;
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
    u_xlat24 = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat24);
    u_xlat16_1.x = u_xlat16_1.x * _FresVector.z;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = _FresVector.y * u_xlat16_1.x + _FresVector.x;
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
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_1.x = u_xlat16_1.x + 1.0;
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
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
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
uniform 	mediump vec3 _FresVector;
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
mediump vec3 u_xlat16_9;
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
    u_xlat24 = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat24);
    u_xlat16_1.x = u_xlat16_1.x * _FresVector.z;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = _FresVector.y * u_xlat16_1.x + _FresVector.x;
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
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_1.x = u_xlat16_1.x + 1.0;
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
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
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
uniform 	mediump vec3 _FresVector;
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
mediump vec3 u_xlat16_9;
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
    u_xlat24 = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat16_1.x = log2(u_xlat24);
    u_xlat16_1.x = u_xlat16_1.x * _FresVector.z;
    u_xlat16_1.x = exp2(u_xlat16_1.x);
    u_xlat16_1.x = _FresVector.y * u_xlat16_1.x + _FresVector.x;
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
    u_xlat16_9.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_1.x = u_xlat16_1.x + 1.0;
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
    u_xlat16_9.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat16_9.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat16_9.xyz;
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
}
}
}
CustomEditor "CodeGenShaderGUI.VX_Crystal_ModelGUI"
}