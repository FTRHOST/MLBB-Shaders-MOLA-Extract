//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "PBR/Hero_Pbr_Show2.0_FireInside_Alpha" {
Properties {

_Intensity ("整体强度", Float) = 1.0

_Alpha ("正面不透明度", Range(0, 1)) = 1.0

_DirectionalLight_Color ("平行光颜色", Color) = (1,1,1,1)

_Ambient_Color ("环境光颜色", Color) = (0.5,0.5,0.5,1)

_AdditionalRefAlpha ("反射部分不透明度", Range(0, 10)) = 0.0

_MainTex ("MainTex", 2D) = "white" { }

_Normal ("法线贴图", 2D) = "bump" { }

_AO_Em_Sanshe ("R:AO G:边缘光 B:接受投影", 2D) = "white" { }

_AO_Intensity ("AO强度", Float) = 1.0

[Toggle] _EMISSION_ON ("自发光开关", Float) = 0.0

_EmissionTex ("自发光贴图(RGB)", 2D) = "black" { }

_Em_Intensity ("自发光强度", Float) = 1.0

_Em_Speed ("自发光呼吸速度", Float) = 0.0

_Metal_Intensity ("金属度强度", Float) = 1.0

_Rough_Intensity ("粗糙度强度", Float) = 1.0

[Space(10)] [Header(CubeMap)] _Cubemap ("Cubemap", Cube) = "_Skybox" { }

_Cube_Intensity ("Cube强度", Float) = 1.0

[Space(10)] [Header(Rim)] _Rim_Tex ("边缘光 R:扰动纹理 G:扰动遮罩 B:Ramp梯度", 2D) = "white" { }

_Rim_Ramp ("边缘光渐变Ramp，根据梯度图读取", 2D) = "white" { }

_Rim_Color ("边缘光颜色", Color) = (1,1,1,1)

_Rim_Intensity ("边缘光强度", Float) = 0.0

_Rim_X ("边缘光X轴偏移", Range(-1, 1)) = 0.0

_Rim_Y ("边缘光Y轴偏移", Range(-1, 1)) = 0.0

[Enum(1U,0,2U,1,3U,2)] _RimNoise_UV ("边缘光扰动纹理&遮罩UV选择", Float) = 1.0

_RimNoise_Speed ("XY:边缘光扰动流速 W:扰动强度", Vector) = (0,0,0,0)

[Space(8)] _Rim2_Threshold ("边缘光2阈值", Range(0, 255)) = 0.0

_Rim2_Color ("边缘光2颜色", Color) = (1,1,1,1)

_Rim2_Intensity ("边缘光2强度", Float) = 0.0

_Rim2_X ("边缘光2X轴偏移", Range(-1, 1)) = 0.0

_Rim2_Y ("边缘光2Y轴偏移", Range(-1, 1)) = 0.0

[Space(10)] [Header(LiuGuang)] [Toggle(_LG_ON)] _LG_ON ("流光开关", Float) = 0.0

[Toggle] _Use_2U ("流光纹理&遮罩使用2U", Float) = 0.0

[Toggle] _USE_UVMAP ("流光使用贴图自定义UV", Float) = 0.0

_LG_UVMap ("R:流光遮罩 GB:流光自定义UV贴图(GB=UV)", 2D) = "white" { }

_LG_Tex ("R:流光纹理 G:背面扰动纹理(↓下面用↓)", 2D) = "black" { }

_LG_Color ("流光颜色", Color) = (1,1,1,1)

_LG_Speed ("XY:流光流速 W:流光强度", Vector) = (0,0,0,1)

[Space(10)] [Header(Back)] [Enum(2U,0,Screen,1,PosWorld,2)] _BackUV ("背面纹理UV选择", Float) = 1.0

_Back_Color ("背面颜色", Color) = (1,1,1,1)

_Back_FresColor ("背面边缘颜色", Color) = (0,0,0,0.5)

_Back_FresPower ("背面边缘范围", Range(0.01, 10)) = 1.0

_Back_Tex ("背面纹理", 2D) = "black" { }

_Back_Speed ("XY:背面纹理流速 W:背面纹理强度", Vector) = (0,0,0,1)

_BackNoise_Speed ("XY:背面扰动纹理Tiling ZW:扰动流速", Vector) = (1,1,0,0)

_BackNoiseIntensity ("背面扰动强度", Float) = 0.0

}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Cull Front
  GpuProgramID 6459
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _BackUV;
uniform 	float _Back_FresPower;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat7;
float u_xlat9;
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
    u_xlat0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlatb6.xy = equal(vec4(_BackUV), vec4(1.0, 2.0, 1.0, 2.0)).xy;
    u_xlat0.xy = (u_xlatb6.x) ? u_xlat0.xy : in_TEXCOORD1.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yxzy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0].yxzy * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2].yxzy * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3].yxzy * in_POSITION0.wwww + u_xlat1;
    u_xlat2 = (-u_xlat1.zwwy) + _WorldSpaceCameraPos.zyyx;
    u_xlat6 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat2 = vec4(u_xlat6) * u_xlat2;
    u_xlat7.xy = u_xlat1.zw * u_xlat2.zw;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.xy + (-u_xlat7.xy);
    vs_TEXCOORD1.xy = (u_xlatb6.y) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.x = dot((-u_xlat0.zyx), u_xlat2.xyw);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Back_FresPower;
    vs_TEXCOORD1.w = exp2(u_xlat0.x);
    vs_TEXCOORD1.z = 0.0;
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
uniform 	vec4 _Back_Tex_ST;
uniform 	vec4 _BackNoise_Speed;
uniform 	vec4 _Back_Speed;
uniform 	float _BackNoiseIntensity;
uniform 	vec3 _Back_Color;
uniform 	vec4 _Back_FresColor;
UNITY_LOCATION(0) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(1) uniform mediump sampler2D _Back_Tex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec2 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * _BackNoise_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _BackNoise_Speed.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_LG_Tex, u_xlat0.xy).y;
    u_xlat2.xy = _Time.yy * _Back_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_BackNoiseIntensity) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _Back_Tex_ST.xy + _Back_Tex_ST.zw;
    u_xlat16_0.xyz = texture(_Back_Tex, u_xlat0.xy).xyz;
    u_xlat6 = (-vs_TEXCOORD1.w) + 1.0;
    u_xlat6 = u_xlat6 * _Back_FresColor.w;
    u_xlat1.xyz = _Back_FresColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Back_Speed.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Back_Color.x, _Back_Color.y, _Back_Color.z);
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _BackUV;
uniform 	float _Back_FresPower;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat7;
float u_xlat9;
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
    u_xlat0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlatb6.xy = equal(vec4(_BackUV), vec4(1.0, 2.0, 1.0, 2.0)).xy;
    u_xlat0.xy = (u_xlatb6.x) ? u_xlat0.xy : in_TEXCOORD1.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yxzy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0].yxzy * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2].yxzy * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3].yxzy * in_POSITION0.wwww + u_xlat1;
    u_xlat2 = (-u_xlat1.zwwy) + _WorldSpaceCameraPos.zyyx;
    u_xlat6 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat2 = vec4(u_xlat6) * u_xlat2;
    u_xlat7.xy = u_xlat1.zw * u_xlat2.zw;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.xy + (-u_xlat7.xy);
    vs_TEXCOORD1.xy = (u_xlatb6.y) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.x = dot((-u_xlat0.zyx), u_xlat2.xyw);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Back_FresPower;
    vs_TEXCOORD1.w = exp2(u_xlat0.x);
    vs_TEXCOORD1.z = 0.0;
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
uniform 	vec4 _Back_Tex_ST;
uniform 	vec4 _BackNoise_Speed;
uniform 	vec4 _Back_Speed;
uniform 	float _BackNoiseIntensity;
uniform 	vec3 _Back_Color;
uniform 	vec4 _Back_FresColor;
UNITY_LOCATION(0) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(1) uniform mediump sampler2D _Back_Tex;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
vec2 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * _BackNoise_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _BackNoise_Speed.xy + u_xlat0.xy;
    u_xlat16_0.x = texture(_LG_Tex, u_xlat0.xy).y;
    u_xlat2.xy = _Time.yy * _Back_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(_BackNoiseIntensity) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _Back_Tex_ST.xy + _Back_Tex_ST.zw;
    u_xlat16_0.xyz = texture(_Back_Tex, u_xlat0.xy).xyz;
    u_xlat6 = (-vs_TEXCOORD1.w) + 1.0;
    u_xlat6 = u_xlat6 * _Back_FresColor.w;
    u_xlat1.xyz = _Back_FresColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Back_Speed.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Back_Color.x, _Back_Color.y, _Back_Color.z);
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _BackUV;
uniform 	float _Back_FresPower;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat7;
float u_xlat9;
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
    u_xlat0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlatb6.xy = equal(vec4(_BackUV), vec4(1.0, 2.0, 1.0, 2.0)).xy;
    u_xlat0.xy = (u_xlatb6.x) ? u_xlat0.xy : in_TEXCOORD1.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yxzy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0].yxzy * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2].yxzy * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3].yxzy * in_POSITION0.wwww + u_xlat1;
    u_xlat2 = (-u_xlat1.zwwy) + _WorldSpaceCameraPos.zyyx;
    u_xlat6 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat2 = vec4(u_xlat6) * u_xlat2;
    u_xlat7.xy = u_xlat1.zw * u_xlat2.zw;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.xy + (-u_xlat7.xy);
    vs_TEXCOORD1.xy = (u_xlatb6.y) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.x = dot((-u_xlat0.zyx), u_xlat2.xyw);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Back_FresPower;
    vs_TEXCOORD1.w = exp2(u_xlat0.x);
    vs_TEXCOORD1.z = 0.0;
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
uniform 	vec4 _Back_Tex_ST;
uniform 	vec4 _BackNoise_Speed;
uniform 	vec4 _Back_Speed;
uniform 	float _BackNoiseIntensity;
uniform 	vec3 _Back_Color;
uniform 	vec4 _Back_FresColor;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Back_Tex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec2 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * _BackNoise_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _BackNoise_Speed.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_LG_Tex, u_xlat0.xy).y;
    u_xlat2.xy = _Time.yy * _Back_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat10_0.xx * vec2(_BackNoiseIntensity) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _Back_Tex_ST.xy + _Back_Tex_ST.zw;
    u_xlat10_0.xyz = texture2D(_Back_Tex, u_xlat0.xy).xyz;
    u_xlat6 = (-vs_TEXCOORD1.w) + 1.0;
    u_xlat6 = u_xlat6 * _Back_FresColor.w;
    u_xlat1.xyz = _Back_FresColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Back_Speed.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Back_Color.x, _Back_Color.y, _Back_Color.z);
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

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _BackUV;
uniform 	float _Back_FresPower;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec2 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
bvec2 u_xlatb6;
vec2 u_xlat7;
float u_xlat9;
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
    u_xlat0.xy = u_xlat1.zz + u_xlat1.xw;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlatb6.xy = equal(vec4(_BackUV), vec4(1.0, 2.0, 1.0, 2.0)).xy;
    u_xlat0.xy = (u_xlatb6.x) ? u_xlat0.xy : in_TEXCOORD1.xy;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1].yxzy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0].yxzy * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2].yxzy * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3].yxzy * in_POSITION0.wwww + u_xlat1;
    u_xlat2 = (-u_xlat1.zwwy) + _WorldSpaceCameraPos.zyyx;
    u_xlat6 = dot(u_xlat2.xzw, u_xlat2.xzw);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat2 = vec4(u_xlat6) * u_xlat2;
    u_xlat7.xy = u_xlat1.zw * u_xlat2.zw;
    u_xlat1.xy = u_xlat1.xy * u_xlat2.xy + (-u_xlat7.xy);
    vs_TEXCOORD1.xy = (u_xlatb6.y) ? u_xlat1.xy : u_xlat0.xy;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat0.x = dot((-u_xlat0.zyx), u_xlat2.xyw);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Back_FresPower;
    vs_TEXCOORD1.w = exp2(u_xlat0.x);
    vs_TEXCOORD1.z = 0.0;
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
uniform 	vec4 _Back_Tex_ST;
uniform 	vec4 _BackNoise_Speed;
uniform 	vec4 _Back_Speed;
uniform 	float _BackNoiseIntensity;
uniform 	vec3 _Back_Color;
uniform 	vec4 _Back_FresColor;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Back_Tex;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
vec2 u_xlat2;
float u_xlat6;
void main()
{
    u_xlat0.xy = _Time.yy * _BackNoise_Speed.zw;
    u_xlat0.xy = vs_TEXCOORD1.xy * _BackNoise_Speed.xy + u_xlat0.xy;
    u_xlat10_0.x = texture2D(_LG_Tex, u_xlat0.xy).y;
    u_xlat2.xy = _Time.yy * _Back_Speed.xy + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat10_0.xx * vec2(_BackNoiseIntensity) + u_xlat2.xy;
    u_xlat0.xy = u_xlat0.xy * _Back_Tex_ST.xy + _Back_Tex_ST.zw;
    u_xlat10_0.xyz = texture2D(_Back_Tex, u_xlat0.xy).xyz;
    u_xlat6 = (-vs_TEXCOORD1.w) + 1.0;
    u_xlat6 = u_xlat6 * _Back_FresColor.w;
    u_xlat1.xyz = _Back_FresColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = vec3(u_xlat6) * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Back_Speed.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Back_Color.x, _Back_Color.y, _Back_Color.z);
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
 Pass {
 Name "ForwardBase"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 96267
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
float u_xlat17;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat16_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat16_10.xyz;
    u_xlat9.xzw = u_xlat16_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat16_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_24 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_37 = texture(_Rim_Tex, u_xlat5.xy).x;
    u_xlat37 = u_xlat16_37 * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_Rim2_Threshold<u_xlat39);
#else
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
#endif
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = (-u_xlat37) * u_xlat16_24 + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat17 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat17;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat24 = (-u_xlat37) * u_xlat16_24 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat1.xyz = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat37 = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat5.x : u_xlat24;
    u_xlat16_15.xyz = texture(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat24 = u_xlat37 * u_xlat16_28.y;
    u_xlat15.xyz = u_xlat16_15.xyz * vec3(u_xlat24);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb24 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb24){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
        u_xlat37 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat37);
        u_xlat37 = _Time.y * _Em_Speed;
        u_xlat37 = sin(u_xlat37);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat37)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat5.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat37 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat37 = u_xlat37 * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat3.w = min(u_xlat37, 1.0);
    u_xlat4.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat16_2.www * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
float u_xlat17;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat16_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat16_10.xyz;
    u_xlat9.xzw = u_xlat16_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat16_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_24 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_37 = texture(_Rim_Tex, u_xlat5.xy).x;
    u_xlat37 = u_xlat16_37 * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_Rim2_Threshold<u_xlat39);
#else
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
#endif
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = (-u_xlat37) * u_xlat16_24 + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat17 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat17;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat24 = (-u_xlat37) * u_xlat16_24 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat1.xyz = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat37 = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat5.x : u_xlat24;
    u_xlat16_15.xyz = texture(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat24 = u_xlat37 * u_xlat16_28.y;
    u_xlat15.xyz = u_xlat16_15.xyz * vec3(u_xlat24);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb24 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb24){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
        u_xlat37 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat37);
        u_xlat37 = _Time.y * _Em_Speed;
        u_xlat37 = sin(u_xlat37);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat37)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat5.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat37 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat37 = u_xlat37 * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat3.w = min(u_xlat37, 1.0);
    u_xlat4.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat16_2.www * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat15;
lowp vec3 u_xlat10_15;
float u_xlat17;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat28;
lowp vec2 u_xlat10_28;
float u_xlat36;
float u_xlat37;
lowp float u_xlat10_37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_28.xy = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat10_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat10_10 = textureCubeLodEXT(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10_10.xyz;
    u_xlat9.xzw = u_xlat10_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat10_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_24 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_37 = texture2D(_Rim_Tex, u_xlat5.xy).x;
    u_xlat37 = u_xlat10_37 * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = (-u_xlat37) * u_xlat10_24 + u_xlat5.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat17 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat17;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat24 = (-u_xlat37) * u_xlat10_24 + u_xlat1.x;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat1.xyz = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat37 = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat5.x : u_xlat24;
    u_xlat10_15.xyz = texture2D(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat24 = u_xlat37 * u_xlat10_28.y;
    u_xlat15.xyz = u_xlat10_15.xyz * vec3(u_xlat24);
    u_xlatb24 = _EMISSION_ON==1.0;
    if(u_xlatb24){
        u_xlat10_0.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat5.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat5.xyz;
        u_xlat37 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat37);
        u_xlat37 = _Time.y * _Em_Speed;
        u_xlat37 = sin(u_xlat37);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat37)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat5.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat37 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat37 = u_xlat37 * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat3.w = min(u_xlat37, 1.0);
    u_xlat4.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat10_2.www * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat15;
lowp vec3 u_xlat10_15;
float u_xlat17;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat28;
lowp vec2 u_xlat10_28;
float u_xlat36;
float u_xlat37;
lowp float u_xlat10_37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_28.xy = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat10_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat10_10 = textureCubeLodEXT(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10_10.xyz;
    u_xlat9.xzw = u_xlat10_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat10_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_24 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_37 = texture2D(_Rim_Tex, u_xlat5.xy).x;
    u_xlat37 = u_xlat10_37 * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = (-u_xlat37) * u_xlat10_24 + u_xlat5.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat17 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat17;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat24 = (-u_xlat37) * u_xlat10_24 + u_xlat1.x;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat1.xyz = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat37 = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat5.x : u_xlat24;
    u_xlat10_15.xyz = texture2D(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat24 = u_xlat37 * u_xlat10_28.y;
    u_xlat15.xyz = u_xlat10_15.xyz * vec3(u_xlat24);
    u_xlatb24 = _EMISSION_ON==1.0;
    if(u_xlatb24){
        u_xlat10_0.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat5.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat5.xyz;
        u_xlat37 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat37);
        u_xlat37 = _Time.y * _Em_Speed;
        u_xlat37 = sin(u_xlat37);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat37)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat5.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat37 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat37 = u_xlat37 * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat3.w = min(u_xlat37, 1.0);
    u_xlat4.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat10_2.www * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
float u_xlat17;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat16_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat16_10.xyz;
    u_xlat9.xzw = u_xlat16_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat16_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_24 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_37 = texture(_Rim_Tex, u_xlat5.xy).x;
    u_xlat37 = u_xlat16_37 * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_Rim2_Threshold<u_xlat39);
#else
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
#endif
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = (-u_xlat37) * u_xlat16_24 + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat17 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat17;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat24 = (-u_xlat37) * u_xlat16_24 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat1.xyz = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat37 = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat5.x : u_xlat24;
    u_xlat16_15.xyz = texture(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat24 = u_xlat37 * u_xlat16_28.y;
    u_xlat15.xyz = u_xlat16_15.xyz * vec3(u_xlat24);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb24 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb24){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
        u_xlat37 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat37);
        u_xlat37 = _Time.y * _Em_Speed;
        u_xlat37 = sin(u_xlat37);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat37)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat5.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat37 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat37 = u_xlat37 * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat3.w = min(u_xlat37, 1.0);
    u_xlat4.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat16_2.www * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(6) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat15;
mediump vec3 u_xlat16_15;
float u_xlat17;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat16_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat16_10.xyz;
    u_xlat9.xzw = u_xlat16_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat16_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_24 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_37 = texture(_Rim_Tex, u_xlat5.xy).x;
    u_xlat37 = u_xlat16_37 * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_Rim2_Threshold<u_xlat39);
#else
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
#endif
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = (-u_xlat37) * u_xlat16_24 + u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat17 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat17;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat24 = (-u_xlat37) * u_xlat16_24 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat1.xyz = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat37 = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat5.x : u_xlat24;
    u_xlat16_15.xyz = texture(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat24 = u_xlat37 * u_xlat16_28.y;
    u_xlat15.xyz = u_xlat16_15.xyz * vec3(u_xlat24);
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb24 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb24){
        u_xlat16_0.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat5.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat5.xyz = u_xlat16_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat16_0.xyz * u_xlat5.xyz;
        u_xlat37 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat37);
        u_xlat37 = _Time.y * _Em_Speed;
        u_xlat37 = sin(u_xlat37);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat37)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat5.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat37 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat37 = u_xlat37 * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat3.w = min(u_xlat37, 1.0);
    u_xlat4.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat16_2.www * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat15;
lowp vec3 u_xlat10_15;
float u_xlat17;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat28;
lowp vec2 u_xlat10_28;
float u_xlat36;
float u_xlat37;
lowp float u_xlat10_37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_28.xy = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat10_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat10_10 = textureCubeLodEXT(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10_10.xyz;
    u_xlat9.xzw = u_xlat10_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat10_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_24 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_37 = texture2D(_Rim_Tex, u_xlat5.xy).x;
    u_xlat37 = u_xlat10_37 * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = (-u_xlat37) * u_xlat10_24 + u_xlat5.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat17 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat17;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat24 = (-u_xlat37) * u_xlat10_24 + u_xlat1.x;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat1.xyz = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat37 = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat5.x : u_xlat24;
    u_xlat10_15.xyz = texture2D(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat24 = u_xlat37 * u_xlat10_28.y;
    u_xlat15.xyz = u_xlat10_15.xyz * vec3(u_xlat24);
    u_xlatb24 = _EMISSION_ON==1.0;
    if(u_xlatb24){
        u_xlat10_0.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat5.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat5.xyz;
        u_xlat37 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat37);
        u_xlat37 = _Time.y * _Em_Speed;
        u_xlat37 = sin(u_xlat37);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat37)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat5.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat37 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat37 = u_xlat37 * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat3.w = min(u_xlat37, 1.0);
    u_xlat4.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat10_2.www * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat15;
lowp vec3 u_xlat10_15;
float u_xlat17;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat28;
lowp vec2 u_xlat10_28;
float u_xlat36;
float u_xlat37;
lowp float u_xlat10_37;
mediump float u_xlat16_38;
float u_xlat39;
bool u_xlatb39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_28.xy = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat10_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat10_10 = textureCubeLodEXT(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10_10.xyz;
    u_xlat9.xzw = u_xlat10_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat10_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_24 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_37 = texture2D(_Rim_Tex, u_xlat5.xy).x;
    u_xlat37 = u_xlat10_37 * _RimNoise_Speed.w;
    u_xlat39 = u_xlat15.y * 255.0;
    u_xlatb39 = _Rim2_Threshold<u_xlat39;
    u_xlat5.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat5.z = vs_TEXCOORD7.z;
    u_xlat5.x = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat5.x = max(u_xlat5.x, 0.0);
    u_xlat5.x = (-u_xlat37) * u_xlat10_24 + u_xlat5.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat17 = u_xlat5.x * -2.0 + 3.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat17;
    u_xlat5.x = min(u_xlat5.x, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat24 = (-u_xlat37) * u_xlat10_24 + u_xlat1.x;
    u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
    u_xlat1.x = u_xlat24 * -2.0 + 3.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = min(u_xlat24, 1.0);
    u_xlat1.xyz = (bool(u_xlatb39)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat37 = (u_xlatb39) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb39) ? u_xlat5.x : u_xlat24;
    u_xlat10_15.xyz = texture2D(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat24 = u_xlat37 * u_xlat10_28.y;
    u_xlat15.xyz = u_xlat10_15.xyz * vec3(u_xlat24);
    u_xlatb24 = _EMISSION_ON==1.0;
    if(u_xlatb24){
        u_xlat10_0.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat5.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat5.xyz = u_xlat10_0.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat0.xyz = u_xlat10_0.xyz * u_xlat5.xyz;
        u_xlat37 = max(_Em_Intensity, 0.0);
        u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat37);
        u_xlat37 = _Time.y * _Em_Speed;
        u_xlat37 = sin(u_xlat37);
        u_xlat0.xyz = (-u_xlat0.xyz) * abs(vec3(u_xlat37)) + u_xlat0.xyz;
    } else {
        u_xlat0.x = float(0.0);
        u_xlat0.y = float(0.0);
        u_xlat0.z = float(0.0);
    }
    u_xlat5.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat5.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat1.xyz + u_xlat4.xyz;
    u_xlat37 = dot(u_xlat1.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat37 = u_xlat37 * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat3.w = min(u_xlat37, 1.0);
    u_xlat4.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat4.xyz = u_xlat10_2.www * u_xlat4.xyz;
    u_xlat1.xyz = u_xlat4.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat3.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat3;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
vec3 u_xlat15;
float u_xlat17;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat29;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat16_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat16_10.xyz;
    u_xlat9.xzw = u_xlat16_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat16_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_USE_UVMAP==1.0);
#else
    u_xlatb24 = _USE_UVMAP==1.0;
#endif
    if(u_xlatb24){
        u_xlat5.xy = texture(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat5.xy = vs_TEXCOORD0.zw;
    }
    u_xlat5.xy = _Time.yy * _LG_Speed.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_24 = texture(_LG_Tex, u_xlat5.xy).x;
    u_xlat16_37 = texture(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat24 = u_xlat16_24 * u_xlat16_37;
    u_xlat24 = u_xlat24 * _LG_Speed.w;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_37 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_39 = texture(_Rim_Tex, u_xlat5.xy).x;
    u_xlat39 = u_xlat16_39 * _RimNoise_Speed.w;
    u_xlat5.x = u_xlat15.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_Rim2_Threshold<u_xlat5.x);
#else
    u_xlatb5 = _Rim2_Threshold<u_xlat5.x;
#endif
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat17 = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat17 = max(u_xlat17, 0.0);
    u_xlat17 = (-u_xlat39) * u_xlat16_37 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat29 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat29;
    u_xlat17 = min(u_xlat17, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat39) * u_xlat16_37 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat13.xyz = (bool(u_xlatb5)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat39 = (u_xlatb5) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb5) ? u_xlat17 : u_xlat1.x;
    u_xlat16_5.xyz = texture(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat1.x = u_xlat39 * u_xlat16_28.y;
    u_xlat15.xyz = u_xlat16_5.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb1 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb1){
        u_xlat16_5.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat10.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat10.xyz = u_xlat16_5.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat5.xyz = u_xlat16_5.xyz * u_xlat10.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat5.xyz = u_xlat5.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat5.xyz = (-u_xlat5.xyz) * abs(u_xlat0.xxx) + u_xlat5.xyz;
    } else {
        u_xlat5.x = float(0.0);
        u_xlat5.y = float(0.0);
        u_xlat5.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat8.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat13.xyz + u_xlat4.xyz;
    u_xlat0.xyz = vec3(u_xlat24) * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.x = u_xlat1.x * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat1.w = min(u_xlat1.x, 1.0);
    u_xlat3.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat3.xyz = u_xlat16_2.www * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
vec3 u_xlat15;
float u_xlat17;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat29;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat16_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat16_10.xyz;
    u_xlat9.xzw = u_xlat16_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat16_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_USE_UVMAP==1.0);
#else
    u_xlatb24 = _USE_UVMAP==1.0;
#endif
    if(u_xlatb24){
        u_xlat5.xy = texture(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat5.xy = vs_TEXCOORD0.zw;
    }
    u_xlat5.xy = _Time.yy * _LG_Speed.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_24 = texture(_LG_Tex, u_xlat5.xy).x;
    u_xlat16_37 = texture(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat24 = u_xlat16_24 * u_xlat16_37;
    u_xlat24 = u_xlat24 * _LG_Speed.w;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_37 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_39 = texture(_Rim_Tex, u_xlat5.xy).x;
    u_xlat39 = u_xlat16_39 * _RimNoise_Speed.w;
    u_xlat5.x = u_xlat15.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_Rim2_Threshold<u_xlat5.x);
#else
    u_xlatb5 = _Rim2_Threshold<u_xlat5.x;
#endif
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat17 = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat17 = max(u_xlat17, 0.0);
    u_xlat17 = (-u_xlat39) * u_xlat16_37 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat29 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat29;
    u_xlat17 = min(u_xlat17, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat39) * u_xlat16_37 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat13.xyz = (bool(u_xlatb5)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat39 = (u_xlatb5) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb5) ? u_xlat17 : u_xlat1.x;
    u_xlat16_5.xyz = texture(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat1.x = u_xlat39 * u_xlat16_28.y;
    u_xlat15.xyz = u_xlat16_5.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb1 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb1){
        u_xlat16_5.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat10.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat10.xyz = u_xlat16_5.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat5.xyz = u_xlat16_5.xyz * u_xlat10.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat5.xyz = u_xlat5.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat5.xyz = (-u_xlat5.xyz) * abs(u_xlat0.xxx) + u_xlat5.xyz;
    } else {
        u_xlat5.x = float(0.0);
        u_xlat5.y = float(0.0);
        u_xlat5.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat8.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat13.xyz + u_xlat4.xyz;
    u_xlat0.xyz = vec3(u_xlat24) * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.x = u_xlat1.x * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat1.w = min(u_xlat1.x, 1.0);
    u_xlat3.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat3.xyz = u_xlat16_2.www * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
vec3 u_xlat15;
float u_xlat17;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat28;
lowp vec2 u_xlat10_28;
float u_xlat29;
float u_xlat36;
float u_xlat37;
lowp float u_xlat10_37;
mediump float u_xlat16_38;
float u_xlat39;
lowp float u_xlat10_39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_28.xy = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat10_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat10_10 = textureCubeLodEXT(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10_10.xyz;
    u_xlat9.xzw = u_xlat10_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat10_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlatb24 = _USE_UVMAP==1.0;
    if(u_xlatb24){
        u_xlat5.xy = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat5.xy = vs_TEXCOORD0.zw;
    }
    u_xlat5.xy = _Time.yy * _LG_Speed.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_24 = texture2D(_LG_Tex, u_xlat5.xy).x;
    u_xlat10_37 = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat24 = u_xlat10_24 * u_xlat10_37;
    u_xlat24 = u_xlat24 * _LG_Speed.w;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_37 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_39 = texture2D(_Rim_Tex, u_xlat5.xy).x;
    u_xlat39 = u_xlat10_39 * _RimNoise_Speed.w;
    u_xlat5.x = u_xlat15.y * 255.0;
    u_xlatb5 = _Rim2_Threshold<u_xlat5.x;
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat17 = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat17 = max(u_xlat17, 0.0);
    u_xlat17 = (-u_xlat39) * u_xlat10_37 + u_xlat17;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat29 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat29;
    u_xlat17 = min(u_xlat17, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat39) * u_xlat10_37 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat13.x = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat13.xyz = (bool(u_xlatb5)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat39 = (u_xlatb5) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb5) ? u_xlat17 : u_xlat1.x;
    u_xlat10_5.xyz = texture2D(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat1.x = u_xlat39 * u_xlat10_28.y;
    u_xlat15.xyz = u_xlat10_5.xyz * u_xlat1.xxx;
    u_xlatb1 = _EMISSION_ON==1.0;
    if(u_xlatb1){
        u_xlat10_5.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat10.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat10.xyz = u_xlat10_5.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat5.xyz = u_xlat10_5.xyz * u_xlat10.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat5.xyz = u_xlat5.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat5.xyz = (-u_xlat5.xyz) * abs(u_xlat0.xxx) + u_xlat5.xyz;
    } else {
        u_xlat5.x = float(0.0);
        u_xlat5.y = float(0.0);
        u_xlat5.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat8.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat13.xyz + u_xlat4.xyz;
    u_xlat0.xyz = vec3(u_xlat24) * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.x = u_xlat1.x * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat1.w = min(u_xlat1.x, 1.0);
    u_xlat3.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat3.xyz = u_xlat10_2.www * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
vec3 u_xlat15;
float u_xlat17;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat28;
lowp vec2 u_xlat10_28;
float u_xlat29;
float u_xlat36;
float u_xlat37;
lowp float u_xlat10_37;
mediump float u_xlat16_38;
float u_xlat39;
lowp float u_xlat10_39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_28.xy = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat10_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat10_10 = textureCubeLodEXT(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10_10.xyz;
    u_xlat9.xzw = u_xlat10_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat10_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlatb24 = _USE_UVMAP==1.0;
    if(u_xlatb24){
        u_xlat5.xy = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat5.xy = vs_TEXCOORD0.zw;
    }
    u_xlat5.xy = _Time.yy * _LG_Speed.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_24 = texture2D(_LG_Tex, u_xlat5.xy).x;
    u_xlat10_37 = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat24 = u_xlat10_24 * u_xlat10_37;
    u_xlat24 = u_xlat24 * _LG_Speed.w;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_37 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_39 = texture2D(_Rim_Tex, u_xlat5.xy).x;
    u_xlat39 = u_xlat10_39 * _RimNoise_Speed.w;
    u_xlat5.x = u_xlat15.y * 255.0;
    u_xlatb5 = _Rim2_Threshold<u_xlat5.x;
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat17 = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat17 = max(u_xlat17, 0.0);
    u_xlat17 = (-u_xlat39) * u_xlat10_37 + u_xlat17;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat29 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat29;
    u_xlat17 = min(u_xlat17, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat39) * u_xlat10_37 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat13.x = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat13.xyz = (bool(u_xlatb5)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat39 = (u_xlatb5) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb5) ? u_xlat17 : u_xlat1.x;
    u_xlat10_5.xyz = texture2D(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat1.x = u_xlat39 * u_xlat10_28.y;
    u_xlat15.xyz = u_xlat10_5.xyz * u_xlat1.xxx;
    u_xlatb1 = _EMISSION_ON==1.0;
    if(u_xlatb1){
        u_xlat10_5.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat10.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat10.xyz = u_xlat10_5.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat5.xyz = u_xlat10_5.xyz * u_xlat10.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat5.xyz = u_xlat5.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat5.xyz = (-u_xlat5.xyz) * abs(u_xlat0.xxx) + u_xlat5.xyz;
    } else {
        u_xlat5.x = float(0.0);
        u_xlat5.y = float(0.0);
        u_xlat5.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat8.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat13.xyz + u_xlat4.xyz;
    u_xlat0.xyz = vec3(u_xlat24) * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.x = u_xlat1.x * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat1.w = min(u_xlat1.x, 1.0);
    u_xlat3.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat3.xyz = u_xlat10_2.www * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
vec3 u_xlat15;
float u_xlat17;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat29;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat16_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat16_10.xyz;
    u_xlat9.xzw = u_xlat16_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat16_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_USE_UVMAP==1.0);
#else
    u_xlatb24 = _USE_UVMAP==1.0;
#endif
    if(u_xlatb24){
        u_xlat5.xy = texture(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat5.xy = vs_TEXCOORD0.zw;
    }
    u_xlat5.xy = _Time.yy * _LG_Speed.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_24 = texture(_LG_Tex, u_xlat5.xy).x;
    u_xlat16_37 = texture(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat24 = u_xlat16_24 * u_xlat16_37;
    u_xlat24 = u_xlat24 * _LG_Speed.w;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_37 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_39 = texture(_Rim_Tex, u_xlat5.xy).x;
    u_xlat39 = u_xlat16_39 * _RimNoise_Speed.w;
    u_xlat5.x = u_xlat15.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_Rim2_Threshold<u_xlat5.x);
#else
    u_xlatb5 = _Rim2_Threshold<u_xlat5.x;
#endif
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat17 = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat17 = max(u_xlat17, 0.0);
    u_xlat17 = (-u_xlat39) * u_xlat16_37 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat29 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat29;
    u_xlat17 = min(u_xlat17, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat39) * u_xlat16_37 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat13.xyz = (bool(u_xlatb5)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat39 = (u_xlatb5) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb5) ? u_xlat17 : u_xlat1.x;
    u_xlat16_5.xyz = texture(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat1.x = u_xlat39 * u_xlat16_28.y;
    u_xlat15.xyz = u_xlat16_5.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb1 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb1){
        u_xlat16_5.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat10.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat10.xyz = u_xlat16_5.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat5.xyz = u_xlat16_5.xyz * u_xlat10.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat5.xyz = u_xlat5.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat5.xyz = (-u_xlat5.xyz) * abs(u_xlat0.xxx) + u_xlat5.xyz;
    } else {
        u_xlat5.x = float(0.0);
        u_xlat5.y = float(0.0);
        u_xlat5.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat8.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat13.xyz + u_xlat4.xyz;
    u_xlat0.xyz = vec3(u_xlat24) * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.x = u_xlat1.x * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat1.w = min(u_xlat1.x, 1.0);
    u_xlat3.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat3.xyz = u_xlat16_2.www * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out mediump vec3 vs_TEXCOORD6;
out mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(_Use_2U==1.0);
#else
    u_xlatb1.x = _Use_2U==1.0;
#endif
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
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
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
UNITY_LOCATION(0) uniform mediump sampler2D _Normal;
UNITY_LOCATION(1) uniform mediump sampler2D _Rim_Tex;
UNITY_LOCATION(2) uniform mediump sampler2D _AO_Em_Sanshe;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(4) uniform mediump samplerCube _Cubemap;
UNITY_LOCATION(5) uniform mediump sampler2D _LG_UVMap;
UNITY_LOCATION(6) uniform mediump sampler2D _LG_Tex;
UNITY_LOCATION(7) uniform mediump sampler2D _Rim_Ramp;
UNITY_LOCATION(8) uniform mediump sampler2D _EmissionTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in mediump vec3 vs_TEXCOORD6;
in mediump vec3 vs_TEXCOORD7;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
vec3 u_xlat15;
float u_xlat17;
float u_xlat24;
mediump float u_xlat16_24;
bool u_xlatb24;
float u_xlat28;
mediump vec2 u_xlat16_28;
float u_xlat29;
float u_xlat36;
float u_xlat37;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat39;
mediump float u_xlat16_39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat16_1.xyz = texture(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat36 = min(max(u_xlat36, 0.0), 1.0);
#else
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
#endif
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat16_28.xy = texture(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat16_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat39 = min(max(u_xlat39, 0.0), 1.0);
#else
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
#endif
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat16_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat16_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat16_10 = textureLod(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat16_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat16_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat16_10.xyz;
    u_xlat9.xzw = u_xlat16_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat16_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(_USE_UVMAP==1.0);
#else
    u_xlatb24 = _USE_UVMAP==1.0;
#endif
    if(u_xlatb24){
        u_xlat5.xy = texture(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat5.xy = vs_TEXCOORD0.zw;
    }
    u_xlat5.xy = _Time.yy * _LG_Speed.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat16_24 = texture(_LG_Tex, u_xlat5.xy).x;
    u_xlat16_37 = texture(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat24 = u_xlat16_24 * u_xlat16_37;
    u_xlat24 = u_xlat24 * _LG_Speed.w;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat16_37 = texture(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat16_39 = texture(_Rim_Tex, u_xlat5.xy).x;
    u_xlat39 = u_xlat16_39 * _RimNoise_Speed.w;
    u_xlat5.x = u_xlat15.y * 255.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_Rim2_Threshold<u_xlat5.x);
#else
    u_xlatb5 = _Rim2_Threshold<u_xlat5.x;
#endif
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat17 = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat17 = max(u_xlat17, 0.0);
    u_xlat17 = (-u_xlat39) * u_xlat16_37 + u_xlat17;
#ifdef UNITY_ADRENO_ES3
    u_xlat17 = min(max(u_xlat17, 0.0), 1.0);
#else
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
#endif
    u_xlat29 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat29;
    u_xlat17 = min(u_xlat17, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat39) * u_xlat16_37 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat13.xyz = (bool(u_xlatb5)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat39 = (u_xlatb5) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb5) ? u_xlat17 : u_xlat1.x;
    u_xlat16_5.xyz = texture(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat1.x = u_xlat39 * u_xlat16_28.y;
    u_xlat15.xyz = u_xlat16_5.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_EMISSION_ON==1.0);
#else
    u_xlatb1 = _EMISSION_ON==1.0;
#endif
    if(u_xlatb1){
        u_xlat16_5.xyz = texture(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat10.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat10.xyz = u_xlat16_5.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat5.xyz = u_xlat16_5.xyz * u_xlat10.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat5.xyz = u_xlat5.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat5.xyz = (-u_xlat5.xyz) * abs(u_xlat0.xxx) + u_xlat5.xyz;
    } else {
        u_xlat5.x = float(0.0);
        u_xlat5.y = float(0.0);
        u_xlat5.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat8.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat13.xyz + u_xlat4.xyz;
    u_xlat0.xyz = vec3(u_xlat24) * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.x = u_xlat1.x * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat1.w = min(u_xlat1.x, 1.0);
    u_xlat3.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat3.xyz = u_xlat16_2.www * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
vec3 u_xlat15;
float u_xlat17;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat28;
lowp vec2 u_xlat10_28;
float u_xlat29;
float u_xlat36;
float u_xlat37;
lowp float u_xlat10_37;
mediump float u_xlat16_38;
float u_xlat39;
lowp float u_xlat10_39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_28.xy = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat10_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat10_10 = textureCubeLodEXT(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10_10.xyz;
    u_xlat9.xzw = u_xlat10_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat10_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlatb24 = _USE_UVMAP==1.0;
    if(u_xlatb24){
        u_xlat5.xy = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat5.xy = vs_TEXCOORD0.zw;
    }
    u_xlat5.xy = _Time.yy * _LG_Speed.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_24 = texture2D(_LG_Tex, u_xlat5.xy).x;
    u_xlat10_37 = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat24 = u_xlat10_24 * u_xlat10_37;
    u_xlat24 = u_xlat24 * _LG_Speed.w;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_37 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_39 = texture2D(_Rim_Tex, u_xlat5.xy).x;
    u_xlat39 = u_xlat10_39 * _RimNoise_Speed.w;
    u_xlat5.x = u_xlat15.y * 255.0;
    u_xlatb5 = _Rim2_Threshold<u_xlat5.x;
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat17 = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat17 = max(u_xlat17, 0.0);
    u_xlat17 = (-u_xlat39) * u_xlat10_37 + u_xlat17;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat29 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat29;
    u_xlat17 = min(u_xlat17, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat39) * u_xlat10_37 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat13.x = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat13.xyz = (bool(u_xlatb5)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat39 = (u_xlatb5) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb5) ? u_xlat17 : u_xlat1.x;
    u_xlat10_5.xyz = texture2D(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat1.x = u_xlat39 * u_xlat10_28.y;
    u_xlat15.xyz = u_xlat10_5.xyz * u_xlat1.xxx;
    u_xlatb1 = _EMISSION_ON==1.0;
    if(u_xlatb1){
        u_xlat10_5.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat10.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat10.xyz = u_xlat10_5.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat5.xyz = u_xlat10_5.xyz * u_xlat10.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat5.xyz = u_xlat5.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat5.xyz = (-u_xlat5.xyz) * abs(u_xlat0.xxx) + u_xlat5.xyz;
    } else {
        u_xlat5.x = float(0.0);
        u_xlat5.y = float(0.0);
        u_xlat5.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat8.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat13.xyz + u_xlat4.xyz;
    u_xlat0.xyz = vec3(u_xlat24) * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.x = u_xlat1.x * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat1.w = min(u_xlat1.x, 1.0);
    u_xlat3.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat3.xyz = u_xlat10_2.www * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	mediump vec4 _WorldSpaceLightPos0;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _RimNoise_UV;
uniform 	float _Use_2U;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec2 in_TEXCOORD1;
attribute highp vec2 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
vec4 u_xlat0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlatb1.x = _Use_2U==1.0;
    vs_TEXCOORD0.zw = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlatb1.xy = equal(vec4(vec4(_RimNoise_UV, _RimNoise_UV, _RimNoise_UV, _RimNoise_UV)), vec4(1.0, 2.0, 0.0, 0.0)).xy;
    u_xlat1.xz = (u_xlatb1.x) ? in_TEXCOORD1.xy : in_TEXCOORD0.xy;
    vs_TEXCOORD1.xy = (u_xlatb1.y) ? in_TEXCOORD2.xy : u_xlat1.xz;
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD3.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat12 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    vs_TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlat1.xyz = u_xlat1.xyz * in_TANGENT0.www;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    vs_TEXCOORD5.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat12 = dot(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * _WorldSpaceLightPos0.xyz;
    vs_TEXCOORD6.xyz = u_xlat1.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD7.xyz = u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	float _Intensity;
uniform 	float _Alpha;
uniform 	float _AdditionalRefAlpha;
uniform 	vec4 _Ambient_Color;
uniform 	vec4 _MainTex_ST;
uniform 	float _AO_Intensity;
uniform 	float _EMISSION_ON;
uniform 	float _Em_Intensity;
uniform 	float _Em_Speed;
uniform 	float _Metal_Intensity;
uniform 	float _Rough_Intensity;
uniform 	float _Cube_Intensity;
uniform 	vec4 _DirectionalLight_Color;
uniform 	vec4 _Rim_Color;
uniform 	float _Rim_Intensity;
uniform 	float _Rim_X;
uniform 	float _Rim_Y;
uniform 	vec4 _Rim_Tex_ST;
uniform 	vec4 _RimNoise_Speed;
uniform 	float _Rim2_Threshold;
uniform 	vec4 _Rim2_Color;
uniform 	float _Rim2_Intensity;
uniform 	float _Rim2_X;
uniform 	float _Rim2_Y;
uniform 	float _USE_UVMAP;
uniform 	vec4 _LG_Tex_ST;
uniform 	vec4 _LG_Color;
uniform 	vec4 _LG_Speed;
uniform lowp sampler2D _Normal;
uniform lowp sampler2D _Rim_Tex;
uniform lowp sampler2D _AO_Em_Sanshe;
uniform lowp sampler2D _MainTex;
uniform lowp samplerCube _Cubemap;
uniform lowp sampler2D _LG_UVMap;
uniform lowp sampler2D _LG_Tex;
uniform lowp sampler2D _Rim_Ramp;
uniform lowp sampler2D _EmissionTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying mediump vec3 vs_TEXCOORD6;
varying mediump vec3 vs_TEXCOORD7;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
lowp vec3 u_xlat10_5;
bool u_xlatb5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
vec4 u_xlat9;
vec3 u_xlat10;
lowp vec4 u_xlat10_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat13;
vec3 u_xlat15;
float u_xlat17;
float u_xlat24;
lowp float u_xlat10_24;
bool u_xlatb24;
float u_xlat28;
lowp vec2 u_xlat10_28;
float u_xlat29;
float u_xlat36;
float u_xlat37;
lowp float u_xlat10_37;
mediump float u_xlat16_38;
float u_xlat39;
lowp float u_xlat10_39;
float u_xlat41;
float u_xlat42;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat10_1.xyz = texture2D(_Normal, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_2.yyy * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat16_2.xxx * vs_TEXCOORD4.xyz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_2.zzz * vs_TEXCOORD3.xyz + u_xlat1.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD6.xyz + vs_TEXCOORD7.xyz;
    u_xlat16_38 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_38 = inversesqrt(u_xlat16_38);
    u_xlat16_2.xyz = vec3(u_xlat16_38) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat1.xyz, vs_TEXCOORD7.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat36 = dot(u_xlat1.xyz, vs_TEXCOORD6.xyz);
    u_xlat36 = clamp(u_xlat36, 0.0, 1.0);
    u_xlat37 = dot(u_xlat16_2.xyz, vs_TEXCOORD6.xyz);
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat3.x = dot(u_xlat1.xyz, u_xlat16_2.xyz);
    u_xlat3.x = max(u_xlat3.x, 0.0);
    u_xlat15.y = texture2D(_Rim_Tex, u_xlat0.xy).z;
    u_xlat4.xy = vec2(_Metal_Intensity, _Rough_Intensity);
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat10_28.xy = texture2D(_AO_Em_Sanshe, u_xlat0.xy).xy;
    u_xlat39 = (-u_xlat10_28.x) + 1.0;
    u_xlat39 = u_xlat39 * _AO_Intensity;
    u_xlat39 = clamp(u_xlat39, 0.0, 1.0);
    u_xlat39 = (-u_xlat39) + 1.0;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat5.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat6.xyz = u_xlat10_2.xyz * u_xlat5.xyz;
    u_xlat28 = (-u_xlat4.x) + 1.0;
    u_xlat7.xyz = u_xlat6.xyz * vec3(u_xlat28);
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat37 = max(u_xlat37, 0.100000001);
    u_xlat41 = u_xlat4.y * u_xlat4.y;
    u_xlat42 = u_xlat4.y * u_xlat4.y + 0.5;
    u_xlat37 = u_xlat37 * u_xlat42;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat41 = u_xlat4.y * u_xlat41;
    u_xlat3.x = u_xlat3.x * u_xlat41 + (-u_xlat3.x);
    u_xlat3.x = u_xlat3.x + 1.0;
    u_xlat3.x = u_xlat3.x * u_xlat3.x;
    u_xlat37 = u_xlat37 * u_xlat3.x;
    u_xlat37 = u_xlat41 / u_xlat37;
    u_xlat37 = u_xlat37 * 0.25 + -9.99999975e-06;
    u_xlat37 = max(u_xlat37, 0.0);
    u_xlat37 = min(u_xlat37, 20.0);
    u_xlat5.xyz = u_xlat10_2.xyz * u_xlat5.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat8.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = vec3(u_xlat37) * u_xlat8.xyz;
    u_xlat9.xyz = vec3(u_xlat28) * _Ambient_Color.xyz;
    u_xlat6.xyz = u_xlat6.xyz * u_xlat9.xyz;
    u_xlat6.xyz = vec3(u_xlat39) * u_xlat6.xyz;
    u_xlat37 = dot((-vs_TEXCOORD7.xyz), u_xlat1.xyz);
    u_xlat37 = u_xlat37 + u_xlat37;
    u_xlat9.xyz = u_xlat1.xyz * (-vec3(u_xlat37)) + (-vs_TEXCOORD7.xyz);
    u_xlat37 = u_xlat4.y * 8.0;
    u_xlat10_10 = textureCubeLodEXT(_Cubemap, u_xlat9.xyz, u_xlat37);
    u_xlat9.xzw = u_xlat10_10.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat9.xzw = u_xlat10_10.xyz * u_xlat9.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat9.xzw = u_xlat9.xzw * u_xlat10_10.xyz;
    u_xlat9.xzw = u_xlat10_10.www * u_xlat9.xzw;
    u_xlat9.xzw = vec3(u_xlat39) * u_xlat9.xzw;
    u_xlat37 = u_xlat9.y * 0.200000003 + 0.800000012;
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat9.xzw;
    u_xlat37 = (-u_xlat4.y) + u_xlat4.x;
    u_xlat37 = u_xlat37 + 1.0;
    u_xlat37 = min(u_xlat37, 1.0);
    u_xlat3.x = u_xlat10_2.w * _Alpha;
    u_xlat5.xyz = u_xlat4.xxx * u_xlat5.xyz + vec3(-0.959999979, -0.959999979, -0.959999979);
    u_xlat5.xyz = u_xlat3.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat24 = (-u_xlat24) + 1.0;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat10.xyz = vec3(u_xlat37) + (-u_xlat5.xyz);
    u_xlat37 = (-u_xlat4.y) * 0.980000019 + 1.0;
    u_xlat4.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat4.xyz = vec3(u_xlat24) * u_xlat10.xyz + u_xlat4.xyz;
    u_xlatb24 = _USE_UVMAP==1.0;
    if(u_xlatb24){
        u_xlat5.xy = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).yz;
    } else {
        u_xlat5.xy = vs_TEXCOORD0.zw;
    }
    u_xlat5.xy = _Time.yy * _LG_Speed.xy + u_xlat5.xy;
    u_xlat5.xy = u_xlat5.xy * _LG_Tex_ST.xy + _LG_Tex_ST.zw;
    u_xlat10_24 = texture2D(_LG_Tex, u_xlat5.xy).x;
    u_xlat10_37 = texture2D(_LG_UVMap, vs_TEXCOORD0.zw).x;
    u_xlat24 = u_xlat10_24 * u_xlat10_37;
    u_xlat24 = u_xlat24 * _LG_Speed.w;
    u_xlat5.xy = _RimNoise_Speed.xy * _Time.yy + vs_TEXCOORD1.xy;
    u_xlat10_37 = texture2D(_Rim_Tex, vs_TEXCOORD1.xy).y;
    u_xlat5.xy = u_xlat5.xy * _Rim_Tex_ST.xy + _Rim_Tex_ST.zw;
    u_xlat10_39 = texture2D(_Rim_Tex, u_xlat5.xy).x;
    u_xlat39 = u_xlat10_39 * _RimNoise_Speed.w;
    u_xlat5.x = u_xlat15.y * 255.0;
    u_xlatb5 = _Rim2_Threshold<u_xlat5.x;
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim_X, _Rim_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat17 = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat17 = max(u_xlat17, 0.0);
    u_xlat17 = (-u_xlat39) * u_xlat10_37 + u_xlat17;
    u_xlat17 = clamp(u_xlat17, 0.0, 1.0);
    u_xlat29 = u_xlat17 * -2.0 + 3.0;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat17 = u_xlat17 * u_xlat29;
    u_xlat17 = min(u_xlat17, 1.0);
    u_xlat10.xy = vs_TEXCOORD7.xy + vec2(_Rim2_X, _Rim2_Y);
    u_xlat10.z = vs_TEXCOORD7.z;
    u_xlat1.x = dot(u_xlat1.xyz, u_xlat10.xyz);
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat1.x = (-u_xlat39) * u_xlat10_37 + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat13.x = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13.x;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat13.xyz = (bool(u_xlatb5)) ? _Rim_Color.xyz : _Rim2_Color.xyz;
    u_xlat39 = (u_xlatb5) ? _Rim_Intensity : _Rim2_Intensity;
    u_xlat15.x = (u_xlatb5) ? u_xlat17 : u_xlat1.x;
    u_xlat10_5.xyz = texture2D(_Rim_Ramp, u_xlat15.xy).xyz;
    u_xlat1.x = u_xlat39 * u_xlat10_28.y;
    u_xlat15.xyz = u_xlat10_5.xyz * u_xlat1.xxx;
    u_xlatb1 = _EMISSION_ON==1.0;
    if(u_xlatb1){
        u_xlat10_5.xyz = texture2D(_EmissionTex, u_xlat0.xy).xyz;
        u_xlat10.xyz = u_xlat10_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
        u_xlat10.xyz = u_xlat10_5.xyz * u_xlat10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
        u_xlat5.xyz = u_xlat10_5.xyz * u_xlat10.xyz;
        u_xlat0.x = max(_Em_Intensity, 0.0);
        u_xlat5.xyz = u_xlat5.xyz * u_xlat0.xxx;
        u_xlat0.x = _Time.y * _Em_Speed;
        u_xlat0.x = sin(u_xlat0.x);
        u_xlat5.xyz = (-u_xlat5.xyz) * abs(u_xlat0.xxx) + u_xlat5.xyz;
    } else {
        u_xlat5.x = float(0.0);
        u_xlat5.y = float(0.0);
        u_xlat5.z = float(0.0);
    }
    u_xlat8.xyz = u_xlat8.xyz * _DirectionalLight_Color.xyz;
    u_xlat4.xyz = u_xlat4.xyz * u_xlat9.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vec3(vec3(_Cube_Intensity, _Cube_Intensity, _Cube_Intensity));
    u_xlat4.xyz = u_xlat8.xyz * vec3(u_xlat36) + u_xlat4.xyz;
    u_xlat1.xyz = u_xlat15.xyz * u_xlat13.xyz + u_xlat4.xyz;
    u_xlat0.xyz = vec3(u_xlat24) * _LG_Color.xyz + u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat0.xyz, vec3(0.300000012, 0.589999974, 0.109999999));
    u_xlat1.x = u_xlat1.x * _AdditionalRefAlpha + u_xlat3.x;
    u_xlat1.w = min(u_xlat1.x, 1.0);
    u_xlat3.xyz = u_xlat7.xyz * _DirectionalLight_Color.xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat36) + u_xlat6.xyz;
    u_xlat3.xyz = u_xlat10_2.www * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat3.xyz * vec3(vec3(_Alpha, _Alpha, _Alpha)) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat5.xyz + u_xlat0.xyz;
    u_xlat16_11.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_11.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
Local Keywords { "_LG_ON" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  GpuProgramID 145077
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
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
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
attribute highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlatb2 = _DepthTextureMode<0.5;
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
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
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
in highp vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_DEPTH" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" "SHADOWS_CUBE" }
""
}
}
}
}
}