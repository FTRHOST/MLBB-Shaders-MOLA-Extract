//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Scene/StaticWater_Ripple" {
Properties {

[ModuleBegin(0)] _ModuleBegin_Base ("基础设置", Float) = 0.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("剔除模式", Float) = 0.0

[ModuleEnd] _ACESLutTex ("ACES Lut", 2D) = "white" { }

[ModuleBegin(0)] _ModuleBegin_WaterColor ("水体颜色设置", Float) = 0.0

_WaterColor ("浅水颜色", Color) = (0.1,0.25,0.3,0.85)

[ModuleEnd] _WaterDeepColor ("深水颜色", Color) = (0.02,0.08,0.12,1)

[ModuleBegin(0)] _ModuleBegin_Lighting ("光照/反射设置", Float) = 0.0

_LightDir ("光照方向", Vector) = (1,1,0,0)

_LightColor ("光照颜色", Color) = (1,0.95,0.8,1)

_SpecularColor ("高光颜色", Color) = (1,0.95,0.8,1)

_ReflectionTex ("反射贴图", 2D) = "black" { }

[ModuleEnd] [Vector4Split(Range, Range, Range, Range)] _LightingParams ("光照反射参数 ## 光泽度(8, 256) | 高光强度(0, 5) | 反射强度(0, 5) | 反射扰动(0, 0.2)", Vector) = (128,1.5,0.35,0)

[ModuleBegin(_MODULE_NORMAL_ON)] _ModuleBegin_Normal ("法线/流动设置", Float) = 0.0

_NormalMap ("法线贴图", 2D) = "bump" { }

[Vector4Split(Range, Float, Float, Range)] _NormalParams ("法线流动参数 ## 法线强度(0, 3) | 法线平铺 | 流动速度 | 颜色混合(0, 1)", Vector) = (0.6,3,0.05,0.5)

[ModuleEnd] [Vector4Split(Float, Float, Float, Float)] _FlowDirParams ("流动方向 ## 第一层U方向 | 第一层V方向  | 第二层U方向 | 第二层V方向", Vector) = (1,0.3,-0.4,1)

[ModuleBegin(_MODULE_RIPPLE_ON)] _ModuleBegin_Ripple ("交互涟漪（脚本驱动）", Float) = 0.0

[Vector4Split(Range, Range, Range, Range)] _RippleParams1 ("涟漪参数1 ## 扩散速度(1, 8) | 法线强度(0, 2) | 空间频率(1, 20) | 衰减半径(1, 15)", Vector) = (3,0.4,8,5)

[ModuleEnd] [Vector4Split(Range, Range, Range, Float)] _RippleParams2 ("涟漪参数2 ## 前沿速度(1, 10) | 前沿软化(0.1, 3) | 速度衰减(0, 1) | 未用", Vector) = (4,1,0.4,0)

}
SubShader {
 LOD 200
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 200
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 3602
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
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_4.x = u_xlat15 * in_TANGENT0.w;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_4.xxx;
    vs_TEXCOORD4.xyz = u_xlat16_4.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	vec4 _LightingParams;
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat18;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD5.xyz;
    u_xlat18 = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * _LightDir.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat16_2.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _LightingParams.x;
    u_xlat18 = exp2(u_xlat18);
    u_xlat16_4.xyz = _LightColor.zxy * _SpecularColor.zxy;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightingParams.yyy;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat6.xyz = _WaterColor.zxy + (-_WaterDeepColor.zxy);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + _WaterDeepColor.zxy;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat18 * 0.5 + 0.5;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat16_2.xyz = _WaterColor.zxy * _LightColor.zxy;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat3.xy * _LightingParams.ww + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_0.xyz = texture(_ReflectionTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * _LightingParams.zzz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat18 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat18);
    u_xlat1.x = u_xlat18 * 0.0625 + u_xlat1.y;
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_6.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _WaterColor.w;
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
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_4.x = u_xlat15 * in_TANGENT0.w;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_4.xxx;
    vs_TEXCOORD4.xyz = u_xlat16_4.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	vec4 _LightingParams;
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
float u_xlat18;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD5.xyz;
    u_xlat18 = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * _LightDir.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat16_2.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _LightingParams.x;
    u_xlat18 = exp2(u_xlat18);
    u_xlat16_4.xyz = _LightColor.zxy * _SpecularColor.zxy;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightingParams.yyy;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat6.xyz = _WaterColor.zxy + (-_WaterDeepColor.zxy);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + _WaterDeepColor.zxy;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat18 * 0.5 + 0.5;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat16_2.xyz = _WaterColor.zxy * _LightColor.zxy;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat3.xy * _LightingParams.ww + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_0.xyz = texture(_ReflectionTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.zxy * _LightingParams.zzz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat18 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat18);
    u_xlat1.x = u_xlat18 * 0.0625 + u_xlat1.y;
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_6.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _WaterColor.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_4.x = u_xlat15 * in_TANGENT0.w;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_4.xxx;
    vs_TEXCOORD4.xyz = u_xlat16_4.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	vec4 _LightingParams;
uniform lowp sampler2D _ReflectionTex;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat18;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD5.xyz;
    u_xlat18 = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * _LightDir.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat16_2.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _LightingParams.x;
    u_xlat18 = exp2(u_xlat18);
    u_xlat16_4.xyz = _LightColor.xyz * _SpecularColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightingParams.yyy;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat6.xyz = _WaterColor.xyz + (-_WaterDeepColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + _WaterDeepColor.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat18 * 0.5 + 0.5;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat16_2.xyz = _WaterColor.xyz * _LightColor.xyz;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat3.xy * _LightingParams.ww + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat10_0.xyz = texture2D(_ReflectionTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _LightingParams.zzz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _WaterColor.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_4.x = u_xlat15 * in_TANGENT0.w;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_4.xxx;
    vs_TEXCOORD4.xyz = u_xlat16_4.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	vec4 _LightingParams;
uniform lowp sampler2D _ReflectionTex;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat18;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD5.xyz;
    u_xlat18 = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * _LightDir.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat16_2.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _LightingParams.x;
    u_xlat18 = exp2(u_xlat18);
    u_xlat16_4.xyz = _LightColor.xyz * _SpecularColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightingParams.yyy;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat6.xyz = _WaterColor.xyz + (-_WaterDeepColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + _WaterDeepColor.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat18 * 0.5 + 0.5;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat16_2.xyz = _WaterColor.xyz * _LightColor.xyz;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat3.xy * _LightingParams.ww + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat10_0.xyz = texture2D(_ReflectionTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat10_0.xyz * _LightingParams.zzz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _WaterColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
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
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_4.x = u_xlat15 * in_TANGENT0.w;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_4.xxx;
    vs_TEXCOORD4.xyz = u_xlat16_4.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	vec4 _NormalParams;
uniform 	vec4 _FlowDirParams;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	vec4 _LightingParams;
uniform 	vec4 _RippleParams1;
uniform 	vec4 _RippleParams2;
uniform 	vec4 _RippleCenters[8];
uniform 	float _RippleStartTimes[8];
uniform 	float _RippleLifeFades[8];
uniform 	int _RippleCount;
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
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec2 u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
float u_xlat14;
vec2 u_xlat16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
bool u_xlatb22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
float u_xlat29;
float u_xlat30;
void main()
{
    u_xlat0.x = dot(_FlowDirParams.xy, _FlowDirParams.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16.x = dot(_FlowDirParams.zw, _FlowDirParams.zw);
    u_xlat0.z = inversesqrt(u_xlat16.x);
    u_xlat0 = u_xlat0.xxzz * _FlowDirParams;
    u_xlat1.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb9 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb9) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _NormalParams.z;
    u_xlat9.xy = vs_TEXCOORD0.xy * _NormalParams.yy;
    u_xlat1.xw = u_xlat1.xx * vec2(3600.0, 2520.0);
    u_xlat0 = u_xlat0 * u_xlat1.xxww;
    u_xlat0 = fract(u_xlat0);
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalParams.yy + u_xlat0.xy;
    u_xlat16.xy = u_xlat9.xy * vec2(1.35000002, 1.35000002) + u_xlat0.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat16.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * _NormalParams.xx;
    u_xlat16_4.xy = u_xlat16_2.xy * _NormalParams.xx + u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_2.z * u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_3.z = u_xlat16_2.x * u_xlat16_4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<_RippleCount);
#else
    u_xlatb0 = 0<_RippleCount;
#endif
    if(u_xlatb0){
        u_xlat0.xy = max(_RippleParams1.xw, vec2(0.00100000005, 0.00100000005));
        u_xlat1.xyz = max(_RippleParams2.xyz, vec3(0.00100000005, 0.00100000005, 0.0));
        u_xlat16.x = u_xlat1.z / u_xlat0.x;
        u_xlat16_10.x = float(0.0);
        u_xlat16_10.y = float(0.0);
        for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_RippleCount ; u_xlati_loop_1++)
        {
            u_xlat17 = _Time.y + (-_RippleStartTimes[u_xlati_loop_1]);
            u_xlat5.xy = vs_TEXCOORD1.xz + (-_RippleCenters[u_xlati_loop_1].xy);
            u_xlat25 = dot(u_xlat5.xy, u_xlat5.xy);
            u_xlat25 = sqrt(u_xlat25);
            u_xlat25 = u_xlat25 + 9.99999975e-05;
            u_xlat5.xy = u_xlat5.xy / vec2(u_xlat25);
            u_xlat21 = u_xlat17 * u_xlat1.x + (-u_xlat25);
            u_xlat21 = u_xlat21 / u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
            u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
            u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
            u_xlat29 = u_xlat25 / u_xlat0.y;
            u_xlat29 = (-u_xlat29) + 1.0;
            u_xlat29 = max(u_xlat29, 0.0);
            u_xlat6.x = u_xlat25 + u_xlat25;
            u_xlat6.x = min(u_xlat6.x, 1.0);
            u_xlat14 = u_xlat16.x * u_xlat25;
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(9.99999975e-05<u_xlat14);
#else
            u_xlatb22 = 9.99999975e-05<u_xlat14;
#endif
            u_xlat30 = u_xlat16.x * u_xlat25 + 1.0;
            u_xlat30 = log2(u_xlat30);
            u_xlat30 = u_xlat30 * 0.693147182;
            u_xlat30 = u_xlat30 / u_xlat14;
            u_xlat14 = (-u_xlat14) * 0.5 + 1.0;
            u_xlat14 = (u_xlatb22) ? u_xlat30 : u_xlat14;
            u_xlat25 = u_xlat25 * _RippleParams1.z;
            u_xlat17 = u_xlat0.x * u_xlat17;
            u_xlat17 = u_xlat25 * u_xlat14 + (-u_xlat17);
            u_xlat17 = cos(u_xlat17);
            u_xlat17 = u_xlat29 * u_xlat17;
            u_xlat17 = u_xlat6.x * u_xlat17;
            u_xlat17 = u_xlat21 * u_xlat17;
            u_xlat17 = u_xlat17 * _RippleLifeFades[u_xlati_loop_1];
            u_xlat16_10.xy = u_xlat5.xy * vec2(u_xlat17) + u_xlat16_10.xy;
        }
        u_xlat16_10.xy = u_xlat16_10.xy * _RippleParams1.yy;
    } else {
        u_xlat16_10.x = float(0.0);
        u_xlat16_10.y = float(0.0);
    }
    u_xlat16_3.xy = u_xlat16_4.xy * u_xlat16_2.xx + u_xlat16_10.xy;
    u_xlat16_2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * vs_TEXCOORD4.xyz;
    u_xlat24 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * vs_TEXCOORD2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.yyy;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_2.zzz * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * _LightDir.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat24 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx + u_xlat5.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat16_10.xyz);
    u_xlat24 = u_xlat24 * 0.5 + 0.5;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat16_2.xyz = _WaterColor.zxy * _LightColor.zxy;
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _LightingParams.x;
    u_xlat24 = exp2(u_xlat24);
    u_xlat16_2.xyz = _LightColor.zxy * _SpecularColor.zxy;
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightingParams.yyy;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat0.xy * _LightingParams.ww + u_xlat7.xy;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat7.xy = min(u_xlat7.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_7.xyz = texture(_ReflectionTex, u_xlat7.xy).xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2 = _WaterColor + (-_WaterDeepColor);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.zxy + _WaterDeepColor.zxy;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_7.zxy * _LightingParams.zzz + u_xlat16_3.xyz;
    u_xlat1.w = _NormalParams.w * u_xlat2.w + _WaterDeepColor.w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat24 * 0.0625 + u_xlat2.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat8.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat8.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat8.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz + u_xlat16_5.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
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
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_4.x = u_xlat15 * in_TANGENT0.w;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_4.xxx;
    vs_TEXCOORD4.xyz = u_xlat16_4.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	vec4 _NormalParams;
uniform 	vec4 _FlowDirParams;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	vec4 _LightingParams;
uniform 	vec4 _RippleParams1;
uniform 	vec4 _RippleParams2;
uniform 	vec4 _RippleCenters[8];
uniform 	float _RippleStartTimes[8];
uniform 	float _RippleLifeFades[8];
uniform 	int _RippleCount;
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
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _ACESLutTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump vec3 u_xlat16_6;
vec2 u_xlat7;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec2 u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
float u_xlat14;
vec2 u_xlat16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
bool u_xlatb22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
float u_xlat29;
float u_xlat30;
void main()
{
    u_xlat0.x = dot(_FlowDirParams.xy, _FlowDirParams.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16.x = dot(_FlowDirParams.zw, _FlowDirParams.zw);
    u_xlat0.z = inversesqrt(u_xlat16.x);
    u_xlat0 = u_xlat0.xxzz * _FlowDirParams;
    u_xlat1.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb9 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb9) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _NormalParams.z;
    u_xlat9.xy = vs_TEXCOORD0.xy * _NormalParams.yy;
    u_xlat1.xw = u_xlat1.xx * vec2(3600.0, 2520.0);
    u_xlat0 = u_xlat0 * u_xlat1.xxww;
    u_xlat0 = fract(u_xlat0);
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalParams.yy + u_xlat0.xy;
    u_xlat16.xy = u_xlat9.xy * vec2(1.35000002, 1.35000002) + u_xlat0.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat16.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * _NormalParams.xx;
    u_xlat16_4.xy = u_xlat16_2.xy * _NormalParams.xx + u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_2.z * u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_3.z = u_xlat16_2.x * u_xlat16_4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<_RippleCount);
#else
    u_xlatb0 = 0<_RippleCount;
#endif
    if(u_xlatb0){
        u_xlat0.xy = max(_RippleParams1.xw, vec2(0.00100000005, 0.00100000005));
        u_xlat1.xyz = max(_RippleParams2.xyz, vec3(0.00100000005, 0.00100000005, 0.0));
        u_xlat16.x = u_xlat1.z / u_xlat0.x;
        u_xlat16_10.x = float(0.0);
        u_xlat16_10.y = float(0.0);
        for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_RippleCount ; u_xlati_loop_1++)
        {
            u_xlat17 = _Time.y + (-_RippleStartTimes[u_xlati_loop_1]);
            u_xlat5.xy = vs_TEXCOORD1.xz + (-_RippleCenters[u_xlati_loop_1].xy);
            u_xlat25 = dot(u_xlat5.xy, u_xlat5.xy);
            u_xlat25 = sqrt(u_xlat25);
            u_xlat25 = u_xlat25 + 9.99999975e-05;
            u_xlat5.xy = u_xlat5.xy / vec2(u_xlat25);
            u_xlat21 = u_xlat17 * u_xlat1.x + (-u_xlat25);
            u_xlat21 = u_xlat21 / u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
            u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
            u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
            u_xlat29 = u_xlat25 / u_xlat0.y;
            u_xlat29 = (-u_xlat29) + 1.0;
            u_xlat29 = max(u_xlat29, 0.0);
            u_xlat6.x = u_xlat25 + u_xlat25;
            u_xlat6.x = min(u_xlat6.x, 1.0);
            u_xlat14 = u_xlat16.x * u_xlat25;
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(9.99999975e-05<u_xlat14);
#else
            u_xlatb22 = 9.99999975e-05<u_xlat14;
#endif
            u_xlat30 = u_xlat16.x * u_xlat25 + 1.0;
            u_xlat30 = log2(u_xlat30);
            u_xlat30 = u_xlat30 * 0.693147182;
            u_xlat30 = u_xlat30 / u_xlat14;
            u_xlat14 = (-u_xlat14) * 0.5 + 1.0;
            u_xlat14 = (u_xlatb22) ? u_xlat30 : u_xlat14;
            u_xlat25 = u_xlat25 * _RippleParams1.z;
            u_xlat17 = u_xlat0.x * u_xlat17;
            u_xlat17 = u_xlat25 * u_xlat14 + (-u_xlat17);
            u_xlat17 = cos(u_xlat17);
            u_xlat17 = u_xlat29 * u_xlat17;
            u_xlat17 = u_xlat6.x * u_xlat17;
            u_xlat17 = u_xlat21 * u_xlat17;
            u_xlat17 = u_xlat17 * _RippleLifeFades[u_xlati_loop_1];
            u_xlat16_10.xy = u_xlat5.xy * vec2(u_xlat17) + u_xlat16_10.xy;
        }
        u_xlat16_10.xy = u_xlat16_10.xy * _RippleParams1.yy;
    } else {
        u_xlat16_10.x = float(0.0);
        u_xlat16_10.y = float(0.0);
    }
    u_xlat16_3.xy = u_xlat16_4.xy * u_xlat16_2.xx + u_xlat16_10.xy;
    u_xlat16_2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * vs_TEXCOORD4.xyz;
    u_xlat24 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * vs_TEXCOORD2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.yyy;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_2.zzz * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * _LightDir.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat24 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx + u_xlat5.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat16_10.xyz);
    u_xlat24 = u_xlat24 * 0.5 + 0.5;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat16_2.xyz = _WaterColor.zxy * _LightColor.zxy;
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _LightingParams.x;
    u_xlat24 = exp2(u_xlat24);
    u_xlat16_2.xyz = _LightColor.zxy * _SpecularColor.zxy;
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightingParams.yyy;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat0.xy * _LightingParams.ww + u_xlat7.xy;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat7.xy = min(u_xlat7.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_7.xyz = texture(_ReflectionTex, u_xlat7.xy).xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat8.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2 = _WaterColor + (-_WaterDeepColor);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.zxy + _WaterDeepColor.zxy;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_7.zxy * _LightingParams.zzz + u_xlat16_3.xyz;
    u_xlat1.w = _NormalParams.w * u_xlat2.w + _WaterDeepColor.w;
    u_xlat0.xyz = u_xlat0.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat2.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat24 = floor(u_xlat2.x);
    u_xlat2.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat24 * 0.0625 + u_xlat2.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat2.xz, 0.0).xyz;
    u_xlat8.xy = u_xlat2.xw + vec2(0.0625, 0.03125);
    u_xlat16_6.xyz = textureLod(_ACESLutTex, u_xlat8.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat24);
    u_xlat8.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat0.xxx * u_xlat8.xyz + u_xlat16_5.xyz;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_4.x = u_xlat15 * in_TANGENT0.w;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_4.xxx;
    vs_TEXCOORD4.xyz = u_xlat16_4.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	vec4 _NormalParams;
uniform 	vec4 _FlowDirParams;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	vec4 _LightingParams;
uniform 	vec4 _RippleParams1;
uniform 	vec4 _RippleParams2;
uniform 	vec4 _RippleCenters[8];
uniform 	float _RippleStartTimes[8];
uniform 	float _RippleLifeFades[8];
uniform 	int _RippleCount;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _ReflectionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
lowp vec3 u_xlat10_7;
float u_xlat8;
vec2 u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
float u_xlat14;
vec2 u_xlat16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
bool u_xlatb22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
float u_xlat29;
float u_xlat30;
#define UNITY_DYNAMIC_INDEX_ES2 0





float _RippleStartTimesDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _RippleStartTimes[i];
#else
#define d_ar _RippleStartTimes
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7];
    return d_ar[0];
#undef d_ar
#endif
}


vec4 _RippleCentersDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _RippleCenters[i];
#else
#define d_ar _RippleCenters
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7];
    return d_ar[0];
#undef d_ar
#endif
}


float _RippleLifeFadesDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _RippleLifeFades[i];
#else
#define d_ar _RippleLifeFades
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat0.x = dot(_FlowDirParams.xy, _FlowDirParams.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16.x = dot(_FlowDirParams.zw, _FlowDirParams.zw);
    u_xlat0.z = inversesqrt(u_xlat16.x);
    u_xlat0 = u_xlat0.xxzz * _FlowDirParams;
    u_xlat1.x = _Time.y * 0.000277777785;
    u_xlatb9 = u_xlat1.x>=(-u_xlat1.x);
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb9) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _NormalParams.z;
    u_xlat9.xy = vs_TEXCOORD0.xy * _NormalParams.yy;
    u_xlat1.xw = u_xlat1.xx * vec2(3600.0, 2520.0);
    u_xlat0 = u_xlat0 * u_xlat1.xxww;
    u_xlat0 = fract(u_xlat0);
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalParams.yy + u_xlat0.xy;
    u_xlat16.xy = u_xlat9.xy * vec2(1.35000002, 1.35000002) + u_xlat0.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat16.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * _NormalParams.xx;
    u_xlat16_4.xy = u_xlat16_2.xy * _NormalParams.xx + u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_2.z * u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_3.z = u_xlat16_2.x * u_xlat16_4.z;
    u_xlatb0 = 0<_RippleCount;
    if(u_xlatb0){
        u_xlat0.xy = max(_RippleParams1.xw, vec2(0.00100000005, 0.00100000005));
        u_xlat1.xyz = max(_RippleParams2.xyz, vec3(0.00100000005, 0.00100000005, 0.0));
        u_xlat16.x = u_xlat1.z / u_xlat0.x;
        u_xlat16_10.x = float(0.0);
        u_xlat16_10.y = float(0.0);
        for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_RippleCount ; u_xlati_loop_1++)
        {
            u_xlat17 = _Time.y + (-_RippleStartTimesDynamicIndex(u_xlati_loop_1));
            u_xlat5.xy = vs_TEXCOORD1.xz + (-_RippleCentersDynamicIndex(u_xlati_loop_1).xy);
            u_xlat25 = dot(u_xlat5.xy, u_xlat5.xy);
            u_xlat25 = sqrt(u_xlat25);
            u_xlat25 = u_xlat25 + 9.99999975e-05;
            u_xlat5.xy = u_xlat5.xy / vec2(u_xlat25);
            u_xlat21 = u_xlat17 * u_xlat1.x + (-u_xlat25);
            u_xlat21 = u_xlat21 / u_xlat1.y;
            u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
            u_xlat29 = u_xlat25 / u_xlat0.y;
            u_xlat29 = (-u_xlat29) + 1.0;
            u_xlat29 = max(u_xlat29, 0.0);
            u_xlat6.x = u_xlat25 + u_xlat25;
            u_xlat6.x = min(u_xlat6.x, 1.0);
            u_xlat14 = u_xlat16.x * u_xlat25;
            u_xlatb22 = 9.99999975e-05<u_xlat14;
            u_xlat30 = u_xlat16.x * u_xlat25 + 1.0;
            u_xlat30 = log2(u_xlat30);
            u_xlat30 = u_xlat30 * 0.693147182;
            u_xlat30 = u_xlat30 / u_xlat14;
            u_xlat14 = (-u_xlat14) * 0.5 + 1.0;
            u_xlat14 = (u_xlatb22) ? u_xlat30 : u_xlat14;
            u_xlat25 = u_xlat25 * _RippleParams1.z;
            u_xlat17 = u_xlat0.x * u_xlat17;
            u_xlat17 = u_xlat25 * u_xlat14 + (-u_xlat17);
            u_xlat17 = cos(u_xlat17);
            u_xlat17 = u_xlat29 * u_xlat17;
            u_xlat17 = u_xlat6.x * u_xlat17;
            u_xlat17 = u_xlat21 * u_xlat17;
            u_xlat17 = u_xlat17 * _RippleLifeFadesDynamicIndex(u_xlati_loop_1);
            u_xlat16_10.xy = u_xlat5.xy * vec2(u_xlat17) + u_xlat16_10.xy;
        }
        u_xlat16_10.xy = u_xlat16_10.xy * _RippleParams1.yy;
    } else {
        u_xlat16_10.x = float(0.0);
        u_xlat16_10.y = float(0.0);
    }
    u_xlat16_3.xy = u_xlat16_4.xy * u_xlat16_2.xx + u_xlat16_10.xy;
    u_xlat16_2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * vs_TEXCOORD4.xyz;
    u_xlat24 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * vs_TEXCOORD2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.yyy;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_2.zzz * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * _LightDir.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat24 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx + u_xlat5.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat16_10.xyz);
    u_xlat24 = u_xlat24 * 0.5 + 0.5;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat16_2.xyz = _WaterColor.xyz * _LightColor.xyz;
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _LightingParams.x;
    u_xlat24 = exp2(u_xlat24);
    u_xlat16_2.xyz = _LightColor.xyz * _SpecularColor.xyz;
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightingParams.yyy;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat0.xy * _LightingParams.ww + u_xlat7.xy;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat7.xy = min(u_xlat7.xy, vec2(0.999000013, 0.999000013));
    u_xlat10_7.xyz = texture2D(_ReflectionTex, u_xlat7.xy).xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8 = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2 = _WaterColor + (-_WaterDeepColor);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + _WaterDeepColor.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_7.xyz * _LightingParams.zzz + u_xlat16_3.xyz;
    u_xlat0.w = _NormalParams.w * u_xlat2.w + _WaterDeepColor.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_TANGENT0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_4.x = u_xlat15 * in_TANGENT0.w;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_4.xxx;
    vs_TEXCOORD4.xyz = u_xlat16_4.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	vec4 _NormalParams;
uniform 	vec4 _FlowDirParams;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	vec4 _LightingParams;
uniform 	vec4 _RippleParams1;
uniform 	vec4 _RippleParams2;
uniform 	vec4 _RippleCenters[8];
uniform 	float _RippleStartTimes[8];
uniform 	float _RippleLifeFades[8];
uniform 	int _RippleCount;
uniform lowp sampler2D _NormalMap;
uniform lowp sampler2D _ReflectionTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying highp vec3 vs_TEXCOORD2;
varying highp vec3 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying highp vec3 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
lowp vec3 u_xlat10_7;
float u_xlat8;
vec2 u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
float u_xlat14;
vec2 u_xlat16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
bool u_xlatb22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
float u_xlat29;
float u_xlat30;
#define UNITY_DYNAMIC_INDEX_ES2 0





float _RippleStartTimesDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _RippleStartTimes[i];
#else
#define d_ar _RippleStartTimes
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7];
    return d_ar[0];
#undef d_ar
#endif
}


vec4 _RippleCentersDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _RippleCenters[i];
#else
#define d_ar _RippleCenters
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7];
    return d_ar[0];
#undef d_ar
#endif
}


float _RippleLifeFadesDynamicIndex(int i){
#if UNITY_DYNAMIC_INDEX_ES2
    return _RippleLifeFades[i];
#else
#define d_ar _RippleLifeFades
    if (i <= 0) return d_ar[0]; else if (i == 1) return d_ar[1]; else if (i == 2) return d_ar[2]; else if (i == 3) return d_ar[3]; else if (i == 4) return d_ar[4]; else if (i == 5) return d_ar[5]; else if (i == 6) return d_ar[6]; else if (i == 7) return d_ar[7];
    return d_ar[0];
#undef d_ar
#endif
}

void main()
{
    u_xlat0.x = dot(_FlowDirParams.xy, _FlowDirParams.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16.x = dot(_FlowDirParams.zw, _FlowDirParams.zw);
    u_xlat0.z = inversesqrt(u_xlat16.x);
    u_xlat0 = u_xlat0.xxzz * _FlowDirParams;
    u_xlat1.x = _Time.y * 0.000277777785;
    u_xlatb9 = u_xlat1.x>=(-u_xlat1.x);
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb9) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _NormalParams.z;
    u_xlat9.xy = vs_TEXCOORD0.xy * _NormalParams.yy;
    u_xlat1.xw = u_xlat1.xx * vec2(3600.0, 2520.0);
    u_xlat0 = u_xlat0 * u_xlat1.xxww;
    u_xlat0 = fract(u_xlat0);
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalParams.yy + u_xlat0.xy;
    u_xlat16.xy = u_xlat9.xy * vec2(1.35000002, 1.35000002) + u_xlat0.zw;
    u_xlat10_1.xyz = texture2D(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10_0.xyz = texture2D(_NormalMap, u_xlat16.xy).xyz;
    u_xlat16_3.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * _NormalParams.xx;
    u_xlat16_4.xy = u_xlat16_2.xy * _NormalParams.xx + u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_2.z * u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_3.z = u_xlat16_2.x * u_xlat16_4.z;
    u_xlatb0 = 0<_RippleCount;
    if(u_xlatb0){
        u_xlat0.xy = max(_RippleParams1.xw, vec2(0.00100000005, 0.00100000005));
        u_xlat1.xyz = max(_RippleParams2.xyz, vec3(0.00100000005, 0.00100000005, 0.0));
        u_xlat16.x = u_xlat1.z / u_xlat0.x;
        u_xlat16_10.x = float(0.0);
        u_xlat16_10.y = float(0.0);
        for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_RippleCount ; u_xlati_loop_1++)
        {
            u_xlat17 = _Time.y + (-_RippleStartTimesDynamicIndex(u_xlati_loop_1));
            u_xlat5.xy = vs_TEXCOORD1.xz + (-_RippleCentersDynamicIndex(u_xlati_loop_1).xy);
            u_xlat25 = dot(u_xlat5.xy, u_xlat5.xy);
            u_xlat25 = sqrt(u_xlat25);
            u_xlat25 = u_xlat25 + 9.99999975e-05;
            u_xlat5.xy = u_xlat5.xy / vec2(u_xlat25);
            u_xlat21 = u_xlat17 * u_xlat1.x + (-u_xlat25);
            u_xlat21 = u_xlat21 / u_xlat1.y;
            u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
            u_xlat29 = u_xlat25 / u_xlat0.y;
            u_xlat29 = (-u_xlat29) + 1.0;
            u_xlat29 = max(u_xlat29, 0.0);
            u_xlat6.x = u_xlat25 + u_xlat25;
            u_xlat6.x = min(u_xlat6.x, 1.0);
            u_xlat14 = u_xlat16.x * u_xlat25;
            u_xlatb22 = 9.99999975e-05<u_xlat14;
            u_xlat30 = u_xlat16.x * u_xlat25 + 1.0;
            u_xlat30 = log2(u_xlat30);
            u_xlat30 = u_xlat30 * 0.693147182;
            u_xlat30 = u_xlat30 / u_xlat14;
            u_xlat14 = (-u_xlat14) * 0.5 + 1.0;
            u_xlat14 = (u_xlatb22) ? u_xlat30 : u_xlat14;
            u_xlat25 = u_xlat25 * _RippleParams1.z;
            u_xlat17 = u_xlat0.x * u_xlat17;
            u_xlat17 = u_xlat25 * u_xlat14 + (-u_xlat17);
            u_xlat17 = cos(u_xlat17);
            u_xlat17 = u_xlat29 * u_xlat17;
            u_xlat17 = u_xlat6.x * u_xlat17;
            u_xlat17 = u_xlat21 * u_xlat17;
            u_xlat17 = u_xlat17 * _RippleLifeFadesDynamicIndex(u_xlati_loop_1);
            u_xlat16_10.xy = u_xlat5.xy * vec2(u_xlat17) + u_xlat16_10.xy;
        }
        u_xlat16_10.xy = u_xlat16_10.xy * _RippleParams1.yy;
    } else {
        u_xlat16_10.x = float(0.0);
        u_xlat16_10.y = float(0.0);
    }
    u_xlat16_3.xy = u_xlat16_4.xy * u_xlat16_2.xx + u_xlat16_10.xy;
    u_xlat16_2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * vs_TEXCOORD4.xyz;
    u_xlat24 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * vs_TEXCOORD2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.yyy;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_2.zzz * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * _LightDir.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat24 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx + u_xlat5.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat16_10.xyz);
    u_xlat24 = u_xlat24 * 0.5 + 0.5;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat16_2.xyz = _WaterColor.xyz * _LightColor.xyz;
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _LightingParams.x;
    u_xlat24 = exp2(u_xlat24);
    u_xlat16_2.xyz = _LightColor.xyz * _SpecularColor.xyz;
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightingParams.yyy;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat0.xy * _LightingParams.ww + u_xlat7.xy;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat7.xy = min(u_xlat7.xy, vec2(0.999000013, 0.999000013));
    u_xlat10_7.xyz = texture2D(_ReflectionTex, u_xlat7.xy).xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8 = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2 = _WaterColor + (-_WaterDeepColor);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + _WaterDeepColor.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat10_7.xyz * _LightingParams.zzz + u_xlat16_3.xyz;
    u_xlat0.w = _NormalParams.w * u_xlat2.w + _WaterDeepColor.w;
    SV_Target0 = u_xlat0;
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
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_4.x = u_xlat15 * in_TANGENT0.w;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_4.xxx;
    vs_TEXCOORD4.xyz = u_xlat16_4.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	vec4 _LightingParams;
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat18;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD5.xyz;
    u_xlat18 = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * _LightDir.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat16_2.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _LightingParams.x;
    u_xlat18 = exp2(u_xlat18);
    u_xlat16_4.xyz = _LightColor.xyz * _SpecularColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightingParams.yyy;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat6.xyz = _WaterColor.xyz + (-_WaterDeepColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + _WaterDeepColor.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat18 * 0.5 + 0.5;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat16_2.xyz = _WaterColor.xyz * _LightColor.xyz;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat3.xy * _LightingParams.ww + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_0.xyz = texture(_ReflectionTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _LightingParams.zzz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _WaterColor.w;
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
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_4.x = u_xlat15 * in_TANGENT0.w;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_4.xxx;
    vs_TEXCOORD4.xyz = u_xlat16_4.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	vec4 _LightingParams;
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat18;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD5.xyz;
    u_xlat18 = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * _LightDir.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat3.xyz = u_xlat1.xyz * u_xlat16_2.xxx + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat18 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * vs_TEXCOORD2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat18 = log2(u_xlat18);
    u_xlat18 = u_xlat18 * _LightingParams.x;
    u_xlat18 = exp2(u_xlat18);
    u_xlat16_4.xyz = _LightColor.xyz * _SpecularColor.xyz;
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat16_4.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightingParams.yyy;
    u_xlat0.x = dot(u_xlat3.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat6.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat6.xyz = _WaterColor.xyz + (-_WaterDeepColor.xyz);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat6.xyz + _WaterDeepColor.xyz;
    u_xlat18 = dot(u_xlat3.xyz, u_xlat16_2.xyz);
    u_xlat18 = u_xlat18 * 0.5 + 0.5;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat16_2.xyz = _WaterColor.xyz * _LightColor.xyz;
    u_xlat5.xyz = vec3(u_xlat18) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat5.xyz + u_xlat1.xyz;
    u_xlat0.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat3.xy * _LightingParams.ww + u_xlat0.xy;
    u_xlat0.xy = max(u_xlat0.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat0.xy = min(u_xlat0.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_0.xyz = texture(_ReflectionTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * _LightingParams.zzz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = _WaterColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
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
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_4.x = u_xlat15 * in_TANGENT0.w;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_4.xxx;
    vs_TEXCOORD4.xyz = u_xlat16_4.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	vec4 _NormalParams;
uniform 	vec4 _FlowDirParams;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	vec4 _LightingParams;
uniform 	vec4 _RippleParams1;
uniform 	vec4 _RippleParams2;
uniform 	vec4 _RippleCenters[8];
uniform 	float _RippleStartTimes[8];
uniform 	float _RippleLifeFades[8];
uniform 	int _RippleCount;
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
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
mediump vec3 u_xlat16_7;
float u_xlat8;
vec2 u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
float u_xlat14;
vec2 u_xlat16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
bool u_xlatb22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
float u_xlat29;
float u_xlat30;
void main()
{
    u_xlat0.x = dot(_FlowDirParams.xy, _FlowDirParams.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16.x = dot(_FlowDirParams.zw, _FlowDirParams.zw);
    u_xlat0.z = inversesqrt(u_xlat16.x);
    u_xlat0 = u_xlat0.xxzz * _FlowDirParams;
    u_xlat1.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb9 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb9) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _NormalParams.z;
    u_xlat9.xy = vs_TEXCOORD0.xy * _NormalParams.yy;
    u_xlat1.xw = u_xlat1.xx * vec2(3600.0, 2520.0);
    u_xlat0 = u_xlat0 * u_xlat1.xxww;
    u_xlat0 = fract(u_xlat0);
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalParams.yy + u_xlat0.xy;
    u_xlat16.xy = u_xlat9.xy * vec2(1.35000002, 1.35000002) + u_xlat0.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat16.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * _NormalParams.xx;
    u_xlat16_4.xy = u_xlat16_2.xy * _NormalParams.xx + u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_2.z * u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_3.z = u_xlat16_2.x * u_xlat16_4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<_RippleCount);
#else
    u_xlatb0 = 0<_RippleCount;
#endif
    if(u_xlatb0){
        u_xlat0.xy = max(_RippleParams1.xw, vec2(0.00100000005, 0.00100000005));
        u_xlat1.xyz = max(_RippleParams2.xyz, vec3(0.00100000005, 0.00100000005, 0.0));
        u_xlat16.x = u_xlat1.z / u_xlat0.x;
        u_xlat16_10.x = float(0.0);
        u_xlat16_10.y = float(0.0);
        for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_RippleCount ; u_xlati_loop_1++)
        {
            u_xlat17 = _Time.y + (-_RippleStartTimes[u_xlati_loop_1]);
            u_xlat5.xy = vs_TEXCOORD1.xz + (-_RippleCenters[u_xlati_loop_1].xy);
            u_xlat25 = dot(u_xlat5.xy, u_xlat5.xy);
            u_xlat25 = sqrt(u_xlat25);
            u_xlat25 = u_xlat25 + 9.99999975e-05;
            u_xlat5.xy = u_xlat5.xy / vec2(u_xlat25);
            u_xlat21 = u_xlat17 * u_xlat1.x + (-u_xlat25);
            u_xlat21 = u_xlat21 / u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
            u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
            u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
            u_xlat29 = u_xlat25 / u_xlat0.y;
            u_xlat29 = (-u_xlat29) + 1.0;
            u_xlat29 = max(u_xlat29, 0.0);
            u_xlat6.x = u_xlat25 + u_xlat25;
            u_xlat6.x = min(u_xlat6.x, 1.0);
            u_xlat14 = u_xlat16.x * u_xlat25;
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(9.99999975e-05<u_xlat14);
#else
            u_xlatb22 = 9.99999975e-05<u_xlat14;
#endif
            u_xlat30 = u_xlat16.x * u_xlat25 + 1.0;
            u_xlat30 = log2(u_xlat30);
            u_xlat30 = u_xlat30 * 0.693147182;
            u_xlat30 = u_xlat30 / u_xlat14;
            u_xlat14 = (-u_xlat14) * 0.5 + 1.0;
            u_xlat14 = (u_xlatb22) ? u_xlat30 : u_xlat14;
            u_xlat25 = u_xlat25 * _RippleParams1.z;
            u_xlat17 = u_xlat0.x * u_xlat17;
            u_xlat17 = u_xlat25 * u_xlat14 + (-u_xlat17);
            u_xlat17 = cos(u_xlat17);
            u_xlat17 = u_xlat29 * u_xlat17;
            u_xlat17 = u_xlat6.x * u_xlat17;
            u_xlat17 = u_xlat21 * u_xlat17;
            u_xlat17 = u_xlat17 * _RippleLifeFades[u_xlati_loop_1];
            u_xlat16_10.xy = u_xlat5.xy * vec2(u_xlat17) + u_xlat16_10.xy;
        }
        u_xlat16_10.xy = u_xlat16_10.xy * _RippleParams1.yy;
    } else {
        u_xlat16_10.x = float(0.0);
        u_xlat16_10.y = float(0.0);
    }
    u_xlat16_3.xy = u_xlat16_4.xy * u_xlat16_2.xx + u_xlat16_10.xy;
    u_xlat16_2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * vs_TEXCOORD4.xyz;
    u_xlat24 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * vs_TEXCOORD2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.yyy;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_2.zzz * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * _LightDir.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat24 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx + u_xlat5.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat16_10.xyz);
    u_xlat24 = u_xlat24 * 0.5 + 0.5;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat16_2.xyz = _WaterColor.xyz * _LightColor.xyz;
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _LightingParams.x;
    u_xlat24 = exp2(u_xlat24);
    u_xlat16_2.xyz = _LightColor.xyz * _SpecularColor.xyz;
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightingParams.yyy;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat0.xy * _LightingParams.ww + u_xlat7.xy;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat7.xy = min(u_xlat7.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_7.xyz = texture(_ReflectionTex, u_xlat7.xy).xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8 = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2 = _WaterColor + (-_WaterDeepColor);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + _WaterDeepColor.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * _LightingParams.zzz + u_xlat16_3.xyz;
    u_xlat0.w = _NormalParams.w * u_xlat2.w + _WaterDeepColor.w;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
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
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out highp vec3 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD5.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat15 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat15 = max(u_xlat15, 1.17549435e-38);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat2.xyz = vec3(u_xlat15) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat2.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat2.zxy + (-u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb15 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat15 = (u_xlatb15) ? 1.0 : -1.0;
    u_xlat16_4.x = u_xlat15 * in_TANGENT0.w;
    u_xlat16_4.xyz = u_xlat0.xyz * u_xlat16_4.xxx;
    vs_TEXCOORD4.xyz = u_xlat16_4.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat1.zw;
    vs_TEXCOORD6.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _WaterColor;
uniform 	mediump vec4 _WaterDeepColor;
uniform 	vec4 _NormalParams;
uniform 	vec4 _FlowDirParams;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec4 _LightColor;
uniform 	mediump vec4 _SpecularColor;
uniform 	vec4 _LightingParams;
uniform 	vec4 _RippleParams1;
uniform 	vec4 _RippleParams2;
uniform 	vec4 _RippleCenters[8];
uniform 	float _RippleStartTimes[8];
uniform 	float _RippleLifeFades[8];
uniform 	int _RippleCount;
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
UNITY_LOCATION(0) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in highp vec3 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec2 u_xlat7;
mediump vec3 u_xlat16_7;
float u_xlat8;
vec2 u_xlat9;
bool u_xlatb9;
mediump vec3 u_xlat16_10;
float u_xlat14;
vec2 u_xlat16;
float u_xlat17;
bool u_xlatb17;
float u_xlat21;
bool u_xlatb22;
float u_xlat24;
int u_xlati24;
float u_xlat25;
float u_xlat29;
float u_xlat30;
void main()
{
    u_xlat0.x = dot(_FlowDirParams.xy, _FlowDirParams.xy);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat16.x = dot(_FlowDirParams.zw, _FlowDirParams.zw);
    u_xlat0.z = inversesqrt(u_xlat16.x);
    u_xlat0 = u_xlat0.xxzz * _FlowDirParams;
    u_xlat1.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlat1.x>=(-u_xlat1.x));
#else
    u_xlatb9 = u_xlat1.x>=(-u_xlat1.x);
#endif
    u_xlat1.x = fract(abs(u_xlat1.x));
    u_xlat1.x = (u_xlatb9) ? u_xlat1.x : (-u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _NormalParams.z;
    u_xlat9.xy = vs_TEXCOORD0.xy * _NormalParams.yy;
    u_xlat1.xw = u_xlat1.xx * vec2(3600.0, 2520.0);
    u_xlat0 = u_xlat0 * u_xlat1.xxww;
    u_xlat0 = fract(u_xlat0);
    u_xlat0.xy = vs_TEXCOORD0.xy * _NormalParams.yy + u_xlat0.xy;
    u_xlat16.xy = u_xlat9.xy * vec2(1.35000002, 1.35000002) + u_xlat0.zw;
    u_xlat16_1.xyz = texture(_NormalMap, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0.xyz = texture(_NormalMap, u_xlat16.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xy = u_xlat16_3.xy * _NormalParams.xx;
    u_xlat16_4.xy = u_xlat16_2.xy * _NormalParams.xx + u_xlat16_3.xy;
    u_xlat16_4.z = u_xlat16_2.z * u_xlat16_3.z;
    u_xlat16_2.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_3.z = u_xlat16_2.x * u_xlat16_4.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<_RippleCount);
#else
    u_xlatb0 = 0<_RippleCount;
#endif
    if(u_xlatb0){
        u_xlat0.xy = max(_RippleParams1.xw, vec2(0.00100000005, 0.00100000005));
        u_xlat1.xyz = max(_RippleParams2.xyz, vec3(0.00100000005, 0.00100000005, 0.0));
        u_xlat16.x = u_xlat1.z / u_xlat0.x;
        u_xlat16_10.x = float(0.0);
        u_xlat16_10.y = float(0.0);
        for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<_RippleCount ; u_xlati_loop_1++)
        {
            u_xlat17 = _Time.y + (-_RippleStartTimes[u_xlati_loop_1]);
            u_xlat5.xy = vs_TEXCOORD1.xz + (-_RippleCenters[u_xlati_loop_1].xy);
            u_xlat25 = dot(u_xlat5.xy, u_xlat5.xy);
            u_xlat25 = sqrt(u_xlat25);
            u_xlat25 = u_xlat25 + 9.99999975e-05;
            u_xlat5.xy = u_xlat5.xy / vec2(u_xlat25);
            u_xlat21 = u_xlat17 * u_xlat1.x + (-u_xlat25);
            u_xlat21 = u_xlat21 / u_xlat1.y;
#ifdef UNITY_ADRENO_ES3
            u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
            u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
            u_xlat29 = u_xlat25 / u_xlat0.y;
            u_xlat29 = (-u_xlat29) + 1.0;
            u_xlat29 = max(u_xlat29, 0.0);
            u_xlat6.x = u_xlat25 + u_xlat25;
            u_xlat6.x = min(u_xlat6.x, 1.0);
            u_xlat14 = u_xlat16.x * u_xlat25;
#ifdef UNITY_ADRENO_ES3
            u_xlatb22 = !!(9.99999975e-05<u_xlat14);
#else
            u_xlatb22 = 9.99999975e-05<u_xlat14;
#endif
            u_xlat30 = u_xlat16.x * u_xlat25 + 1.0;
            u_xlat30 = log2(u_xlat30);
            u_xlat30 = u_xlat30 * 0.693147182;
            u_xlat30 = u_xlat30 / u_xlat14;
            u_xlat14 = (-u_xlat14) * 0.5 + 1.0;
            u_xlat14 = (u_xlatb22) ? u_xlat30 : u_xlat14;
            u_xlat25 = u_xlat25 * _RippleParams1.z;
            u_xlat17 = u_xlat0.x * u_xlat17;
            u_xlat17 = u_xlat25 * u_xlat14 + (-u_xlat17);
            u_xlat17 = cos(u_xlat17);
            u_xlat17 = u_xlat29 * u_xlat17;
            u_xlat17 = u_xlat6.x * u_xlat17;
            u_xlat17 = u_xlat21 * u_xlat17;
            u_xlat17 = u_xlat17 * _RippleLifeFades[u_xlati_loop_1];
            u_xlat16_10.xy = u_xlat5.xy * vec2(u_xlat17) + u_xlat16_10.xy;
        }
        u_xlat16_10.xy = u_xlat16_10.xy * _RippleParams1.yy;
    } else {
        u_xlat16_10.x = float(0.0);
        u_xlat16_10.y = float(0.0);
    }
    u_xlat16_3.xy = u_xlat16_4.xy * u_xlat16_2.xx + u_xlat16_10.xy;
    u_xlat16_2.x = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD3.xyz;
    u_xlat24 = dot(vs_TEXCOORD4.xyz, vs_TEXCOORD4.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * vs_TEXCOORD4.xyz;
    u_xlat24 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * vs_TEXCOORD2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.yyy;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_2.zzz * u_xlat5.xyz + u_xlat0.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat24 = max(u_xlat24, 1.17549435e-38);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * _LightDir.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_2.xxx;
    u_xlat24 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat5.xyz = vec3(u_xlat24) * vs_TEXCOORD5.xyz;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_2.xxx + u_xlat5.xyz;
    u_xlat24 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat16_10.xyz);
    u_xlat24 = u_xlat24 * 0.5 + 0.5;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat16_2.xyz = _WaterColor.xyz * _LightColor.xyz;
    u_xlat6.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat24 = log2(u_xlat24);
    u_xlat24 = u_xlat24 * _LightingParams.x;
    u_xlat24 = exp2(u_xlat24);
    u_xlat16_2.xyz = _LightColor.xyz * _SpecularColor.xyz;
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat16_2.xyz;
    u_xlat1.xyz = u_xlat1.xyz * _LightingParams.yyy;
    u_xlat7.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat7.xy = u_xlat0.xy * _LightingParams.ww + u_xlat7.xy;
    u_xlat7.xy = max(u_xlat7.xy, vec2(0.00100000005, 0.00100000005));
    u_xlat7.xy = min(u_xlat7.xy, vec2(0.999000013, 0.999000013));
    u_xlat16_7.xyz = texture(_ReflectionTex, u_xlat7.xy).xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat8 = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat8 * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat2 = _WaterColor + (-_WaterDeepColor);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + _WaterDeepColor.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat6.xyz + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * _LightingParams.zzz + u_xlat16_3.xyz;
    u_xlat0.w = _NormalParams.w * u_xlat2.w + _WaterDeepColor.w;
    SV_Target0 = u_xlat0;
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
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
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
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
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
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_MODULE_NORMAL_ON" "_MODULE_RIPPLE_ON" }
""
}
}
}
}
CustomEditor "TheseusEditor.TheseusModuleShaderGUIBase"
}