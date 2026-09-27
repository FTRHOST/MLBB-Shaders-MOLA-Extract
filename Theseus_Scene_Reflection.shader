//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Scene/Reflection" {
Properties {

_cull ("剔除模式", Float) = 2.0

_renderingMode ("渲染模式", Float) = 0.0

_zwrite ("__zw", Float) = 1.0

_srcblend ("源混合", Float) = 1.0

_dstblend ("目标混合", Float) = 0.0

_srcblendalpha ("源透明", Float) = 1.0

_dstblendalpha ("目标混合", Float) = 0.0

_AlphaTex ("Alpha遮罩", 2D) = "white" { }

_ReflectionTex ("反射图", 2D) = "white" { }

_ReflectionColor ("反射颜色", Color) = (1,1,1,1)

[Toggle] _EnablePlaneReflectionTex ("使用假反射图", Float) = 0.0

_ReflectionOffset ("反射贴图坐标偏移", Vector) = (1,1,0,0)

_ReflectionCube ("反射Cube", Cube) = "_Skybox" { }

_CubeColor ("水的颜色", Color) = (1,1,1,1)

_CubeIntensity ("水的强度", Float) = 1.0

_WaterColorMap ("混合贴图", 2D) = "white" { }

_WaterColorMap2 ("混合贴图2(开新工艺后处理时用这张)", 2D) = "white" { }

_ReflectionPower ("混合比例", Range(0, 1)) = 1.0

_LargeWavesTexture ("波纹贴图（法线）", 2D) = "bump" { }

_LargeWavesTiling ("波纹重复度", Float) = 1.0

_LargeWavesSpeed ("波纹速度", Float) = -40.0

_LargeWavesNoise ("波纹扰动强度", Float) = 0.019999999552965164

_LargeWaveRefraction ("波纹折射", Range(0, 3)) = 1.5

_LongTilingDistance ("波纹重复度距离", Float) = 1500.0

_DistanceTilingFade ("波纹重复度距离衰减", Float) = 1.0

_LightDir ("自定义灯光方向", Vector) = (0,0,-1,1)

_LightColor ("自定义灯光颜色", Color) = (1,1,1,1)

_Specular ("高光强度", Float) = 0.0

_Gloss ("高光范围", Range(0, 1)) = 0.550000011920929

[Toggle] _UseFog ("开启雾效", Float) = 0.0

_FogColor ("雾效颜色", Color) = (1,1,1,1)

_FogVector ("FogVector", Vector) = (9999,1,0,0)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 ZWrite Off
 Cull Off
  GpuProgramID 48492
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
float u_xlat10;
mediump float u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * _LightDir.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat16_0.xyz = u_xlat1.xyz * vec3(u_xlat13) + u_xlat16_0.xyz;
    u_xlat16_12 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_12 = inversesqrt(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat16_0.x, 0.00100000005);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat16_0.x = _Gloss * 10.0 + 1.0;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat1.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_0.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb13 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10 = u_xlat2.x + -0.5;
    u_xlat10 = u_xlat10 * _ReflectionOffset.x + 0.5;
    u_xlat3.x = u_xlat10 + _ReflectionOffset.z;
    u_xlat3.y = (-u_xlat2.y) + _ReflectionOffset.w;
    u_xlat2.xy = (bool(u_xlatb13)) ? u_xlat3.xy : u_xlat2.xy;
    u_xlat16_2.xyz = texture(_ReflectionTex, u_xlat2.xy).xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * _ReflectionColor.xyz + u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat13 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_UseFog);
#else
    u_xlatb13 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb13)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_1 = texture(_AlphaTex, u_xlat16_0.xy).x;
    SV_Target0.w = u_xlat16_1 * _ReflectionColor.w;
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
float u_xlat10;
mediump float u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * _LightDir.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat16_0.xyz = u_xlat1.xyz * vec3(u_xlat13) + u_xlat16_0.xyz;
    u_xlat16_12 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_12 = inversesqrt(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat16_0.x, 0.00100000005);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat16_0.x = _Gloss * 10.0 + 1.0;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat1.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_0.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb13 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10 = u_xlat2.x + -0.5;
    u_xlat10 = u_xlat10 * _ReflectionOffset.x + 0.5;
    u_xlat3.x = u_xlat10 + _ReflectionOffset.z;
    u_xlat3.y = (-u_xlat2.y) + _ReflectionOffset.w;
    u_xlat2.xy = (bool(u_xlatb13)) ? u_xlat3.xy : u_xlat2.xy;
    u_xlat16_2.xyz = texture(_ReflectionTex, u_xlat2.xy).xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * _ReflectionColor.xyz + u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat13 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_UseFog);
#else
    u_xlatb13 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb13)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_1 = texture(_AlphaTex, u_xlat16_0.xy).x;
    SV_Target0.w = u_xlat16_1 * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_NORMALTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	mediump float _LargeWavesNoise;
uniform 	mediump float _LargeWaveRefraction;
uniform 	mediump float _LongTilingDistance;
uniform 	mediump float _DistanceTilingFade;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.y = float(1.0) / u_xlat0.x;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWavesTiling, _LargeWavesTiling));
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(1.66666687e-05, 1.66666687e-05);
    u_xlat16_0 = u_xlat16_1.xyxy * vec4(0.00100000005, 0.00100000005, 5.00000024e-05, 5.00000024e-05);
    u_xlat2.xy = vec2(_LargeWavesSpeed) / u_xlat16_0.xy;
    u_xlat16.x = _Time.x * 0.00999999978;
    u_xlat2.xy = u_xlat2.xy * u_xlat16.xx + vs_TEXCOORD0.xy;
    u_xlat16.xy = u_xlat16_15.xy * u_xlat2.xy;
    u_xlat0 = u_xlat16_0 * u_xlat2.xyxy;
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat16.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat16_22 = u_xlat2.x / _LongTilingDistance;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _DistanceTilingFade;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_22, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_4.x = u_xlat16_22 * _LargeWaveRefraction;
    u_xlat16_4.x = u_xlat16_4.x * -0.5 + _LargeWaveRefraction;
    u_xlat16_11 = _LargeWaveRefraction * 0.25 + (-u_xlat16_4.x);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11 + u_xlat16_4.x;
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat2.z = vs_TEXCOORD2.x;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_22) + vs_TEXCOORD3.yzx;
    u_xlat23 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat6.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD3.www;
    u_xlat2.y = u_xlat6.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat6.x = u_xlat3.y;
    u_xlat3.y = u_xlat6.z;
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat6.z = vs_TEXCOORD2.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat6.xyz);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWaveRefraction, _LargeWaveRefraction));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat16_15.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * _LightDir.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat23 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat16_4.xyz = u_xlat3.xyz * vec3(u_xlat23) + u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat16_15.x, 0.00100000005);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_15.x = _Gloss * 10.0 + 1.0;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat2.x = u_xlat2.x * u_xlat16_15.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat16_4.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_4.xyz;
    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat3.xy = u_xlat16_1.xy * vec2(_LargeWavesNoise) + u_xlat3.xy;
    u_xlat23 = u_xlat3.x + -0.5;
    u_xlat23 = u_xlat23 * _ReflectionOffset.x + 0.5;
    u_xlat6.x = u_xlat23 + _ReflectionOffset.z;
    u_xlat6.y = (-u_xlat3.y) + _ReflectionOffset.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb23 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat3.xy = (bool(u_xlatb23)) ? u_xlat6.xy : u_xlat3.xy;
    u_xlat16_3.xyz = texture(_ReflectionTex, u_xlat3.xy).xyz;
    u_xlat2.xyz = u_xlat16_3.xyz * _ReflectionColor.xyz + u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_UseFog);
#else
    u_xlatb23 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb23)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_2.x = texture(_AlphaTex, u_xlat16_1.xy).x;
    SV_Target0.w = u_xlat16_2.x * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_NORMALTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	mediump float _LargeWavesNoise;
uniform 	mediump float _LargeWaveRefraction;
uniform 	mediump float _LongTilingDistance;
uniform 	mediump float _DistanceTilingFade;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.y = float(1.0) / u_xlat0.x;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWavesTiling, _LargeWavesTiling));
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(1.66666687e-05, 1.66666687e-05);
    u_xlat16_0 = u_xlat16_1.xyxy * vec4(0.00100000005, 0.00100000005, 5.00000024e-05, 5.00000024e-05);
    u_xlat2.xy = vec2(_LargeWavesSpeed) / u_xlat16_0.xy;
    u_xlat16.x = _Time.x * 0.00999999978;
    u_xlat2.xy = u_xlat2.xy * u_xlat16.xx + vs_TEXCOORD0.xy;
    u_xlat16.xy = u_xlat16_15.xy * u_xlat2.xy;
    u_xlat0 = u_xlat16_0 * u_xlat2.xyxy;
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat16.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat16_22 = u_xlat2.x / _LongTilingDistance;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _DistanceTilingFade;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_22, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_4.x = u_xlat16_22 * _LargeWaveRefraction;
    u_xlat16_4.x = u_xlat16_4.x * -0.5 + _LargeWaveRefraction;
    u_xlat16_11 = _LargeWaveRefraction * 0.25 + (-u_xlat16_4.x);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11 + u_xlat16_4.x;
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat2.z = vs_TEXCOORD2.x;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_22) + vs_TEXCOORD3.yzx;
    u_xlat23 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat6.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD3.www;
    u_xlat2.y = u_xlat6.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat6.x = u_xlat3.y;
    u_xlat3.y = u_xlat6.z;
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat6.z = vs_TEXCOORD2.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat6.xyz);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWaveRefraction, _LargeWaveRefraction));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat16_15.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * _LightDir.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat23 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat16_4.xyz = u_xlat3.xyz * vec3(u_xlat23) + u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat16_15.x, 0.00100000005);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_15.x = _Gloss * 10.0 + 1.0;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat2.x = u_xlat2.x * u_xlat16_15.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat16_4.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_4.xyz;
    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat3.xy = u_xlat16_1.xy * vec2(_LargeWavesNoise) + u_xlat3.xy;
    u_xlat23 = u_xlat3.x + -0.5;
    u_xlat23 = u_xlat23 * _ReflectionOffset.x + 0.5;
    u_xlat6.x = u_xlat23 + _ReflectionOffset.z;
    u_xlat6.y = (-u_xlat3.y) + _ReflectionOffset.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb23 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat3.xy = (bool(u_xlatb23)) ? u_xlat6.xy : u_xlat3.xy;
    u_xlat16_3.xyz = texture(_ReflectionTex, u_xlat3.xy).xyz;
    u_xlat2.xyz = u_xlat16_3.xyz * _ReflectionColor.xyz + u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_UseFog);
#else
    u_xlatb23 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb23)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_2.x = texture(_AlphaTex, u_xlat16_1.xy).x;
    SV_Target0.w = u_xlat16_2.x * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_LERPTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _ReflectionPower;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WaterColorMap;
UNITY_LOCATION(2) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec2 u_xlat9;
mediump float u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * _LightDir.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat16_0.xyz = u_xlat1.xyz * vec3(u_xlat13) + u_xlat16_0.xyz;
    u_xlat16_12 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_12 = inversesqrt(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat16_0.x, 0.00100000005);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat16_0.x = _Gloss * 10.0 + 1.0;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat1.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.x = exp2(u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb5 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat9.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.x = u_xlat9.x + -0.5;
    u_xlat2.x = u_xlat2.x * _ReflectionOffset.x + 0.5;
    u_xlat2.x = u_xlat2.x + _ReflectionOffset.z;
    u_xlat2.y = (-u_xlat9.y) + _ReflectionOffset.w;
    u_xlat5.xy = (bool(u_xlatb5)) ? u_xlat2.xy : u_xlat9.xy;
    u_xlat16_5.xyz = texture(_ReflectionTex, u_xlat5.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * _ReflectionColor.xyz;
    u_xlat16_0 = texture(_WaterColorMap, vs_TEXCOORD0.xy);
    u_xlat5.xyz = (-u_xlat16_5.xyz) * _ReflectionColor.xyz + u_xlat16_0.xyz;
    u_xlat16_3.x = u_xlat16_0.w * _ReflectionPower;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_3.xyz + u_xlat5.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat13 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_UseFog);
#else
    u_xlatb13 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb13)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_1 = texture(_AlphaTex, u_xlat16_3.xy).x;
    SV_Target0.w = u_xlat16_1 * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_LERPTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _ReflectionPower;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WaterColorMap;
UNITY_LOCATION(2) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec2 u_xlat9;
mediump float u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * _LightDir.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat16_0.xyz = u_xlat1.xyz * vec3(u_xlat13) + u_xlat16_0.xyz;
    u_xlat16_12 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_12 = inversesqrt(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat16_0.x, 0.00100000005);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat16_0.x = _Gloss * 10.0 + 1.0;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat1.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.x = exp2(u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb5 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat9.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.x = u_xlat9.x + -0.5;
    u_xlat2.x = u_xlat2.x * _ReflectionOffset.x + 0.5;
    u_xlat2.x = u_xlat2.x + _ReflectionOffset.z;
    u_xlat2.y = (-u_xlat9.y) + _ReflectionOffset.w;
    u_xlat5.xy = (bool(u_xlatb5)) ? u_xlat2.xy : u_xlat9.xy;
    u_xlat16_5.xyz = texture(_ReflectionTex, u_xlat5.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * _ReflectionColor.xyz;
    u_xlat16_0 = texture(_WaterColorMap, vs_TEXCOORD0.xy);
    u_xlat5.xyz = (-u_xlat16_5.xyz) * _ReflectionColor.xyz + u_xlat16_0.xyz;
    u_xlat16_3.x = u_xlat16_0.w * _ReflectionPower;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_3.xyz + u_xlat5.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat13 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_UseFog);
#else
    u_xlatb13 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb13)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_1 = texture(_AlphaTex, u_xlat16_3.xy).x;
    SV_Target0.w = u_xlat16_1 * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_LERPTEX_ON" "_NORMALTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _ReflectionPower;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	mediump float _LargeWavesNoise;
uniform 	mediump float _LargeWaveRefraction;
uniform 	mediump float _LongTilingDistance;
uniform 	mediump float _DistanceTilingFade;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterColorMap;
UNITY_LOCATION(3) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.y = float(1.0) / u_xlat0.x;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWavesTiling, _LargeWavesTiling));
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(1.66666687e-05, 1.66666687e-05);
    u_xlat16_0 = u_xlat16_1.xyxy * vec4(0.00100000005, 0.00100000005, 5.00000024e-05, 5.00000024e-05);
    u_xlat2.xy = vec2(_LargeWavesSpeed) / u_xlat16_0.xy;
    u_xlat16.x = _Time.x * 0.00999999978;
    u_xlat2.xy = u_xlat2.xy * u_xlat16.xx + vs_TEXCOORD0.xy;
    u_xlat16.xy = u_xlat16_15.xy * u_xlat2.xy;
    u_xlat0 = u_xlat16_0 * u_xlat2.xyxy;
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat16.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat16_22 = u_xlat2.x / _LongTilingDistance;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _DistanceTilingFade;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_22, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_4.x = u_xlat16_22 * _LargeWaveRefraction;
    u_xlat16_4.x = u_xlat16_4.x * -0.5 + _LargeWaveRefraction;
    u_xlat16_11 = _LargeWaveRefraction * 0.25 + (-u_xlat16_4.x);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11 + u_xlat16_4.x;
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat2.z = vs_TEXCOORD2.x;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_22) + vs_TEXCOORD3.yzx;
    u_xlat23 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat6.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD3.www;
    u_xlat2.y = u_xlat6.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat6.x = u_xlat3.y;
    u_xlat3.y = u_xlat6.z;
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat6.z = vs_TEXCOORD2.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat6.xyz);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWaveRefraction, _LargeWaveRefraction));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat16_15.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * _LightDir.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat23 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat16_4.xyz = u_xlat3.xyz * vec3(u_xlat23) + u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat16_15.x, 0.00100000005);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_15.x = _Gloss * 10.0 + 1.0;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat2.x = u_xlat2.x * u_xlat16_15.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat9.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat9.xy = u_xlat16_1.xy * vec2(_LargeWavesNoise) + u_xlat9.xy;
    u_xlat23 = u_xlat9.x + -0.5;
    u_xlat23 = u_xlat23 * _ReflectionOffset.x + 0.5;
    u_xlat3.x = u_xlat23 + _ReflectionOffset.z;
    u_xlat3.y = (-u_xlat9.y) + _ReflectionOffset.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb23 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat9.xy = (bool(u_xlatb23)) ? u_xlat3.xy : u_xlat9.xy;
    u_xlat16_9.xyz = texture(_ReflectionTex, u_xlat9.xy).xyz;
    u_xlat3.xyz = u_xlat16_9.xyz * _ReflectionColor.xyz;
    u_xlat16_0 = texture(_WaterColorMap, vs_TEXCOORD0.xy);
    u_xlat9.xyz = (-u_xlat16_9.xyz) * _ReflectionColor.xyz + u_xlat16_0.xyz;
    u_xlat16_1.x = u_xlat16_0.w * _ReflectionPower;
    u_xlat9.xyz = u_xlat16_1.xxx * u_xlat9.xyz + u_xlat3.xyz;
    u_xlat16_1.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_1.xyz + u_xlat9.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_UseFog);
#else
    u_xlatb23 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb23)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_2.x = texture(_AlphaTex, u_xlat16_1.xy).x;
    SV_Target0.w = u_xlat16_2.x * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_LERPTEX_ON" "_NORMALTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _ReflectionPower;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	mediump float _LargeWavesNoise;
uniform 	mediump float _LargeWaveRefraction;
uniform 	mediump float _LongTilingDistance;
uniform 	mediump float _DistanceTilingFade;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterColorMap;
UNITY_LOCATION(3) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.y = float(1.0) / u_xlat0.x;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWavesTiling, _LargeWavesTiling));
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(1.66666687e-05, 1.66666687e-05);
    u_xlat16_0 = u_xlat16_1.xyxy * vec4(0.00100000005, 0.00100000005, 5.00000024e-05, 5.00000024e-05);
    u_xlat2.xy = vec2(_LargeWavesSpeed) / u_xlat16_0.xy;
    u_xlat16.x = _Time.x * 0.00999999978;
    u_xlat2.xy = u_xlat2.xy * u_xlat16.xx + vs_TEXCOORD0.xy;
    u_xlat16.xy = u_xlat16_15.xy * u_xlat2.xy;
    u_xlat0 = u_xlat16_0 * u_xlat2.xyxy;
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat16.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat16_22 = u_xlat2.x / _LongTilingDistance;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _DistanceTilingFade;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_22, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_4.x = u_xlat16_22 * _LargeWaveRefraction;
    u_xlat16_4.x = u_xlat16_4.x * -0.5 + _LargeWaveRefraction;
    u_xlat16_11 = _LargeWaveRefraction * 0.25 + (-u_xlat16_4.x);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11 + u_xlat16_4.x;
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat2.z = vs_TEXCOORD2.x;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_22) + vs_TEXCOORD3.yzx;
    u_xlat23 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat6.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD3.www;
    u_xlat2.y = u_xlat6.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat6.x = u_xlat3.y;
    u_xlat3.y = u_xlat6.z;
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat6.z = vs_TEXCOORD2.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat6.xyz);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWaveRefraction, _LargeWaveRefraction));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat16_15.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * _LightDir.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat23 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat16_4.xyz = u_xlat3.xyz * vec3(u_xlat23) + u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat16_15.x, 0.00100000005);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_15.x = _Gloss * 10.0 + 1.0;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat2.x = u_xlat2.x * u_xlat16_15.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat9.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat9.xy = u_xlat16_1.xy * vec2(_LargeWavesNoise) + u_xlat9.xy;
    u_xlat23 = u_xlat9.x + -0.5;
    u_xlat23 = u_xlat23 * _ReflectionOffset.x + 0.5;
    u_xlat3.x = u_xlat23 + _ReflectionOffset.z;
    u_xlat3.y = (-u_xlat9.y) + _ReflectionOffset.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb23 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat9.xy = (bool(u_xlatb23)) ? u_xlat3.xy : u_xlat9.xy;
    u_xlat16_9.xyz = texture(_ReflectionTex, u_xlat9.xy).xyz;
    u_xlat3.xyz = u_xlat16_9.xyz * _ReflectionColor.xyz;
    u_xlat16_0 = texture(_WaterColorMap, vs_TEXCOORD0.xy);
    u_xlat9.xyz = (-u_xlat16_9.xyz) * _ReflectionColor.xyz + u_xlat16_0.xyz;
    u_xlat16_1.x = u_xlat16_0.w * _ReflectionPower;
    u_xlat9.xyz = u_xlat16_1.xxx * u_xlat9.xyz + u_xlat3.xyz;
    u_xlat16_1.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_1.xyz + u_xlat9.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_UseFog);
#else
    u_xlatb23 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb23)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_2.x = texture(_AlphaTex, u_xlat16_1.xy).x;
    SV_Target0.w = u_xlat16_2.x * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_CUBEREF_ON" "_LERPTEX_ON" "_NORMALTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump float _ReflectionPower;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubeIntensity;
uniform 	mediump float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	mediump float _LargeWavesNoise;
uniform 	mediump float _LargeWaveRefraction;
uniform 	mediump float _LongTilingDistance;
uniform 	mediump float _DistanceTilingFade;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectionCube;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterColorMap;
UNITY_LOCATION(3) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.y = float(1.0) / u_xlat0.x;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(_LargeWavesTiling);
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(1.66666687e-05, 1.66666687e-05);
    u_xlat16_0 = u_xlat16_1.xyxy * vec4(0.00100000005, 0.00100000005, 5.00000024e-05, 5.00000024e-05);
    u_xlat2.xy = vec2(_LargeWavesSpeed) / u_xlat16_0.xy;
    u_xlat16.x = _Time.x * 0.00999999978;
    u_xlat2.xy = u_xlat2.xy * u_xlat16.xx + vs_TEXCOORD0.xy;
    u_xlat16.xy = u_xlat16_15.xy * u_xlat2.xy;
    u_xlat0 = u_xlat16_0 * u_xlat2.xyxy;
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat16.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat16_22 = u_xlat2.x / _LongTilingDistance;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _DistanceTilingFade;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_22, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_4.x = u_xlat16_22 * _LargeWaveRefraction;
    u_xlat16_4.x = u_xlat16_4.x * -0.5 + _LargeWaveRefraction;
    u_xlat16_11 = _LargeWaveRefraction * 0.25 + (-u_xlat16_4.x);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11 + u_xlat16_4.x;
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat2.z = vs_TEXCOORD2.x;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_22) + vs_TEXCOORD3.yzx;
    u_xlat23 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat6.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD3.www;
    u_xlat2.y = u_xlat6.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat6.x = u_xlat3.y;
    u_xlat3.y = u_xlat6.z;
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat6.z = vs_TEXCOORD2.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat6.xyz);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWaveRefraction, _LargeWaveRefraction));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat16_15.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat23 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz;
    u_xlat16_4.xyz = _LightDir.xyz * u_xlat16_15.xxx + u_xlat3.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat16_15.x, 0.00100000005);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_15.x = _Gloss * 10.0 + 1.0;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat2.x = u_xlat2.x * u_xlat16_15.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat16_15.x = dot((-u_xlat3.xyz), vs_TEXCOORD2.xyz);
    u_xlat16_15.x = u_xlat16_15.x + u_xlat16_15.x;
    u_xlat16_4.xyz = vs_TEXCOORD2.xyz * (-u_xlat16_15.xxx) + (-u_xlat3.xyz);
    u_xlat16_9.xyz = texture(_ReflectionCube, u_xlat16_4.xyz).xyz;
    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat3.xy = u_xlat16_1.xy * vec2(_LargeWavesNoise) + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_WaterColorMap, u_xlat3.xy).xyz;
    u_xlat9.xyz = u_xlat16_9.xyz * u_xlat16_3.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _CubeColor.xyz;
    u_xlat3.xyz = u_xlat9.xyz * vec3(vec3(_CubeIntensity, _CubeIntensity, _CubeIntensity));
    u_xlat16_0 = texture(_WaterColorMap, vs_TEXCOORD0.xy);
    u_xlat9.xyz = (-u_xlat9.xyz) * vec3(vec3(_CubeIntensity, _CubeIntensity, _CubeIntensity)) + u_xlat16_0.xyz;
    u_xlat16_1.x = u_xlat16_0.w * _ReflectionPower;
    u_xlat9.xyz = u_xlat16_1.xxx * u_xlat9.xyz + u_xlat3.xyz;
    u_xlat16_1.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_1.xyz + u_xlat9.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_UseFog);
#else
    u_xlatb23 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb23)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_2.x = texture(_AlphaTex, u_xlat16_1.xy).x;
    SV_Target0.w = u_xlat16_2.x * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_CUBEREF_ON" "_LERPTEX_ON" "_NORMALTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump float _ReflectionPower;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubeIntensity;
uniform 	mediump float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	mediump float _LargeWavesNoise;
uniform 	mediump float _LargeWaveRefraction;
uniform 	mediump float _LongTilingDistance;
uniform 	mediump float _DistanceTilingFade;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectionCube;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterColorMap;
UNITY_LOCATION(3) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.y = float(1.0) / u_xlat0.x;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(_LargeWavesTiling);
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(1.66666687e-05, 1.66666687e-05);
    u_xlat16_0 = u_xlat16_1.xyxy * vec4(0.00100000005, 0.00100000005, 5.00000024e-05, 5.00000024e-05);
    u_xlat2.xy = vec2(_LargeWavesSpeed) / u_xlat16_0.xy;
    u_xlat16.x = _Time.x * 0.00999999978;
    u_xlat2.xy = u_xlat2.xy * u_xlat16.xx + vs_TEXCOORD0.xy;
    u_xlat16.xy = u_xlat16_15.xy * u_xlat2.xy;
    u_xlat0 = u_xlat16_0 * u_xlat2.xyxy;
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat16.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat16_22 = u_xlat2.x / _LongTilingDistance;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _DistanceTilingFade;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_22, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_4.x = u_xlat16_22 * _LargeWaveRefraction;
    u_xlat16_4.x = u_xlat16_4.x * -0.5 + _LargeWaveRefraction;
    u_xlat16_11 = _LargeWaveRefraction * 0.25 + (-u_xlat16_4.x);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11 + u_xlat16_4.x;
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat2.z = vs_TEXCOORD2.x;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_22) + vs_TEXCOORD3.yzx;
    u_xlat23 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat6.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD3.www;
    u_xlat2.y = u_xlat6.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat6.x = u_xlat3.y;
    u_xlat3.y = u_xlat6.z;
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat6.z = vs_TEXCOORD2.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat6.xyz);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWaveRefraction, _LargeWaveRefraction));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat16_15.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat23 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz;
    u_xlat16_4.xyz = _LightDir.xyz * u_xlat16_15.xxx + u_xlat3.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat16_15.x, 0.00100000005);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_15.x = _Gloss * 10.0 + 1.0;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat2.x = u_xlat2.x * u_xlat16_15.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat16_15.x = dot((-u_xlat3.xyz), vs_TEXCOORD2.xyz);
    u_xlat16_15.x = u_xlat16_15.x + u_xlat16_15.x;
    u_xlat16_4.xyz = vs_TEXCOORD2.xyz * (-u_xlat16_15.xxx) + (-u_xlat3.xyz);
    u_xlat16_9.xyz = texture(_ReflectionCube, u_xlat16_4.xyz).xyz;
    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat3.xy = u_xlat16_1.xy * vec2(_LargeWavesNoise) + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_WaterColorMap, u_xlat3.xy).xyz;
    u_xlat9.xyz = u_xlat16_9.xyz * u_xlat16_3.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _CubeColor.xyz;
    u_xlat3.xyz = u_xlat9.xyz * vec3(vec3(_CubeIntensity, _CubeIntensity, _CubeIntensity));
    u_xlat16_0 = texture(_WaterColorMap, vs_TEXCOORD0.xy);
    u_xlat9.xyz = (-u_xlat9.xyz) * vec3(vec3(_CubeIntensity, _CubeIntensity, _CubeIntensity)) + u_xlat16_0.xyz;
    u_xlat16_1.x = u_xlat16_0.w * _ReflectionPower;
    u_xlat9.xyz = u_xlat16_1.xxx * u_xlat9.xyz + u_xlat3.xyz;
    u_xlat16_1.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_1.xyz + u_xlat9.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_UseFog);
#else
    u_xlatb23 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb23)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_2.x = texture(_AlphaTex, u_xlat16_1.xy).x;
    SV_Target0.w = u_xlat16_2.x * _ReflectionColor.w;
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
float u_xlat10;
mediump float u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * _LightDir.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat16_0.xyz = u_xlat1.xyz * vec3(u_xlat13) + u_xlat16_0.xyz;
    u_xlat16_12 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_12 = inversesqrt(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat16_0.x, 0.00100000005);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat16_0.x = _Gloss * 10.0 + 1.0;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat1.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_0.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb13 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10 = u_xlat2.x + -0.5;
    u_xlat10 = u_xlat10 * _ReflectionOffset.x + 0.5;
    u_xlat3.x = u_xlat10 + _ReflectionOffset.z;
    u_xlat3.y = (-u_xlat2.y) + _ReflectionOffset.w;
    u_xlat2.xy = (bool(u_xlatb13)) ? u_xlat3.xy : u_xlat2.xy;
    u_xlat16_2.xyz = texture(_ReflectionTex, u_xlat2.xy).xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * _ReflectionColor.xyz + u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat13 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_UseFog);
#else
    u_xlatb13 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb13)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_1 = texture(_AlphaTex, u_xlat16_0.xy).x;
    SV_Target0.w = u_xlat16_1 * _ReflectionColor.w;
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec2 u_xlat3;
float u_xlat10;
mediump float u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * _LightDir.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat16_0.xyz = u_xlat1.xyz * vec3(u_xlat13) + u_xlat16_0.xyz;
    u_xlat16_12 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_12 = inversesqrt(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat16_0.x, 0.00100000005);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat16_0.x = _Gloss * 10.0 + 1.0;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat1.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_0.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb13 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat2.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat10 = u_xlat2.x + -0.5;
    u_xlat10 = u_xlat10 * _ReflectionOffset.x + 0.5;
    u_xlat3.x = u_xlat10 + _ReflectionOffset.z;
    u_xlat3.y = (-u_xlat2.y) + _ReflectionOffset.w;
    u_xlat2.xy = (bool(u_xlatb13)) ? u_xlat3.xy : u_xlat2.xy;
    u_xlat16_2.xyz = texture(_ReflectionTex, u_xlat2.xy).xyz;
    u_xlat1.xyz = u_xlat16_2.xyz * _ReflectionColor.xyz + u_xlat1.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat13 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_UseFog);
#else
    u_xlatb13 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb13)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat16_0.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_1 = texture(_AlphaTex, u_xlat16_0.xy).x;
    SV_Target0.w = u_xlat16_1 * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_NORMALTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	mediump float _LargeWavesNoise;
uniform 	mediump float _LargeWaveRefraction;
uniform 	mediump float _LongTilingDistance;
uniform 	mediump float _DistanceTilingFade;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.y = float(1.0) / u_xlat0.x;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWavesTiling, _LargeWavesTiling));
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(1.66666687e-05, 1.66666687e-05);
    u_xlat16_0 = u_xlat16_1.xyxy * vec4(0.00100000005, 0.00100000005, 5.00000024e-05, 5.00000024e-05);
    u_xlat2.xy = vec2(_LargeWavesSpeed) / u_xlat16_0.xy;
    u_xlat16.x = _Time.x * 0.00999999978;
    u_xlat2.xy = u_xlat2.xy * u_xlat16.xx + vs_TEXCOORD0.xy;
    u_xlat16.xy = u_xlat16_15.xy * u_xlat2.xy;
    u_xlat0 = u_xlat16_0 * u_xlat2.xyxy;
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat16.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat16_22 = u_xlat2.x / _LongTilingDistance;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _DistanceTilingFade;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_22, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_4.x = u_xlat16_22 * _LargeWaveRefraction;
    u_xlat16_4.x = u_xlat16_4.x * -0.5 + _LargeWaveRefraction;
    u_xlat16_11 = _LargeWaveRefraction * 0.25 + (-u_xlat16_4.x);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11 + u_xlat16_4.x;
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat2.z = vs_TEXCOORD2.x;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_22) + vs_TEXCOORD3.yzx;
    u_xlat23 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat6.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD3.www;
    u_xlat2.y = u_xlat6.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat6.x = u_xlat3.y;
    u_xlat3.y = u_xlat6.z;
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat6.z = vs_TEXCOORD2.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat6.xyz);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWaveRefraction, _LargeWaveRefraction));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat16_15.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * _LightDir.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat23 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat16_4.xyz = u_xlat3.xyz * vec3(u_xlat23) + u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat16_15.x, 0.00100000005);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_15.x = _Gloss * 10.0 + 1.0;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat2.x = u_xlat2.x * u_xlat16_15.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat16_4.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_4.xyz;
    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat3.xy = u_xlat16_1.xy * vec2(_LargeWavesNoise) + u_xlat3.xy;
    u_xlat23 = u_xlat3.x + -0.5;
    u_xlat23 = u_xlat23 * _ReflectionOffset.x + 0.5;
    u_xlat6.x = u_xlat23 + _ReflectionOffset.z;
    u_xlat6.y = (-u_xlat3.y) + _ReflectionOffset.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb23 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat3.xy = (bool(u_xlatb23)) ? u_xlat6.xy : u_xlat3.xy;
    u_xlat16_3.xyz = texture(_ReflectionTex, u_xlat3.xy).xyz;
    u_xlat2.xyz = u_xlat16_3.xyz * _ReflectionColor.xyz + u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_UseFog);
#else
    u_xlatb23 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb23)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_2.x = texture(_AlphaTex, u_xlat16_1.xy).x;
    SV_Target0.w = u_xlat16_2.x * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_NORMALTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	mediump float _LargeWavesNoise;
uniform 	mediump float _LargeWaveRefraction;
uniform 	mediump float _LongTilingDistance;
uniform 	mediump float _DistanceTilingFade;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.y = float(1.0) / u_xlat0.x;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWavesTiling, _LargeWavesTiling));
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(1.66666687e-05, 1.66666687e-05);
    u_xlat16_0 = u_xlat16_1.xyxy * vec4(0.00100000005, 0.00100000005, 5.00000024e-05, 5.00000024e-05);
    u_xlat2.xy = vec2(_LargeWavesSpeed) / u_xlat16_0.xy;
    u_xlat16.x = _Time.x * 0.00999999978;
    u_xlat2.xy = u_xlat2.xy * u_xlat16.xx + vs_TEXCOORD0.xy;
    u_xlat16.xy = u_xlat16_15.xy * u_xlat2.xy;
    u_xlat0 = u_xlat16_0 * u_xlat2.xyxy;
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat16.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat16_22 = u_xlat2.x / _LongTilingDistance;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _DistanceTilingFade;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_22, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_4.x = u_xlat16_22 * _LargeWaveRefraction;
    u_xlat16_4.x = u_xlat16_4.x * -0.5 + _LargeWaveRefraction;
    u_xlat16_11 = _LargeWaveRefraction * 0.25 + (-u_xlat16_4.x);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11 + u_xlat16_4.x;
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat2.z = vs_TEXCOORD2.x;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_22) + vs_TEXCOORD3.yzx;
    u_xlat23 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat6.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD3.www;
    u_xlat2.y = u_xlat6.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat6.x = u_xlat3.y;
    u_xlat3.y = u_xlat6.z;
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat6.z = vs_TEXCOORD2.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat6.xyz);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWaveRefraction, _LargeWaveRefraction));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat16_15.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * _LightDir.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat23 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat16_4.xyz = u_xlat3.xyz * vec3(u_xlat23) + u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat16_15.x, 0.00100000005);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_15.x = _Gloss * 10.0 + 1.0;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat2.x = u_xlat2.x * u_xlat16_15.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat16_4.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_4.xyz;
    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat3.xy = u_xlat16_1.xy * vec2(_LargeWavesNoise) + u_xlat3.xy;
    u_xlat23 = u_xlat3.x + -0.5;
    u_xlat23 = u_xlat23 * _ReflectionOffset.x + 0.5;
    u_xlat6.x = u_xlat23 + _ReflectionOffset.z;
    u_xlat6.y = (-u_xlat3.y) + _ReflectionOffset.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb23 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat3.xy = (bool(u_xlatb23)) ? u_xlat6.xy : u_xlat3.xy;
    u_xlat16_3.xyz = texture(_ReflectionTex, u_xlat3.xy).xyz;
    u_xlat2.xyz = u_xlat16_3.xyz * _ReflectionColor.xyz + u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_UseFog);
#else
    u_xlatb23 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb23)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_2.x = texture(_AlphaTex, u_xlat16_1.xy).x;
    SV_Target0.w = u_xlat16_2.x * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_LERPTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _ReflectionPower;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WaterColorMap2;
UNITY_LOCATION(2) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec2 u_xlat9;
mediump float u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * _LightDir.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat16_0.xyz = u_xlat1.xyz * vec3(u_xlat13) + u_xlat16_0.xyz;
    u_xlat16_12 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_12 = inversesqrt(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat16_0.x, 0.00100000005);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat16_0.x = _Gloss * 10.0 + 1.0;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat1.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.x = exp2(u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb5 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat9.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.x = u_xlat9.x + -0.5;
    u_xlat2.x = u_xlat2.x * _ReflectionOffset.x + 0.5;
    u_xlat2.x = u_xlat2.x + _ReflectionOffset.z;
    u_xlat2.y = (-u_xlat9.y) + _ReflectionOffset.w;
    u_xlat5.xy = (bool(u_xlatb5)) ? u_xlat2.xy : u_xlat9.xy;
    u_xlat16_5.xyz = texture(_ReflectionTex, u_xlat5.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * _ReflectionColor.xyz;
    u_xlat16_0 = texture(_WaterColorMap2, vs_TEXCOORD0.xy);
    u_xlat5.xyz = (-u_xlat16_5.xyz) * _ReflectionColor.xyz + u_xlat16_0.xyz;
    u_xlat16_3.x = u_xlat16_0.w * _ReflectionPower;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_3.xyz + u_xlat5.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat13 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_UseFog);
#else
    u_xlatb13 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb13)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_1 = texture(_AlphaTex, u_xlat16_3.xy).x;
    SV_Target0.w = u_xlat16_1 * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_LERPTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _ReflectionPower;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WaterColorMap2;
UNITY_LOCATION(2) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
bool u_xlatb5;
vec2 u_xlat9;
mediump float u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
void main()
{
    u_xlat16_0.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * _LightDir.xyz;
    u_xlat1.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat16_0.xyz = u_xlat1.xyz * vec3(u_xlat13) + u_xlat16_0.xyz;
    u_xlat16_12 = dot(u_xlat16_0.xyz, u_xlat16_0.xyz);
    u_xlat16_12 = inversesqrt(u_xlat16_12);
    u_xlat16_0.xyz = vec3(u_xlat16_12) * u_xlat16_0.xyz;
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * vs_TEXCOORD2.xyz;
    u_xlat16_0.x = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat1.x = max(u_xlat16_0.x, 0.00100000005);
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat16_0.x = _Gloss * 10.0 + 1.0;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat1.x = u_xlat1.x * u_xlat16_0.x;
    u_xlat1.x = exp2(u_xlat1.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb5 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat9.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat2.x = u_xlat9.x + -0.5;
    u_xlat2.x = u_xlat2.x * _ReflectionOffset.x + 0.5;
    u_xlat2.x = u_xlat2.x + _ReflectionOffset.z;
    u_xlat2.y = (-u_xlat9.y) + _ReflectionOffset.w;
    u_xlat5.xy = (bool(u_xlatb5)) ? u_xlat2.xy : u_xlat9.xy;
    u_xlat16_5.xyz = texture(_ReflectionTex, u_xlat5.xy).xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * _ReflectionColor.xyz;
    u_xlat16_0 = texture(_WaterColorMap2, vs_TEXCOORD0.xy);
    u_xlat5.xyz = (-u_xlat16_5.xyz) * _ReflectionColor.xyz + u_xlat16_0.xyz;
    u_xlat16_3.x = u_xlat16_0.w * _ReflectionPower;
    u_xlat5.xyz = u_xlat16_3.xxx * u_xlat5.xyz + u_xlat2.xyz;
    u_xlat16_3.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_3.xyz + u_xlat5.xyz;
    u_xlat2.xyz = (-u_xlat1.xyz) + _FogColor.xyz;
    u_xlat13 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.5<_UseFog);
#else
    u_xlatb13 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb13)) ? u_xlat2.xyz : u_xlat1.xyz;
    u_xlat16_3.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_1 = texture(_AlphaTex, u_xlat16_3.xy).x;
    SV_Target0.w = u_xlat16_1 * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_LERPTEX_ON" "_NORMALTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _ReflectionPower;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	mediump float _LargeWavesNoise;
uniform 	mediump float _LargeWaveRefraction;
uniform 	mediump float _LongTilingDistance;
uniform 	mediump float _DistanceTilingFade;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterColorMap2;
UNITY_LOCATION(3) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.y = float(1.0) / u_xlat0.x;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWavesTiling, _LargeWavesTiling));
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(1.66666687e-05, 1.66666687e-05);
    u_xlat16_0 = u_xlat16_1.xyxy * vec4(0.00100000005, 0.00100000005, 5.00000024e-05, 5.00000024e-05);
    u_xlat2.xy = vec2(_LargeWavesSpeed) / u_xlat16_0.xy;
    u_xlat16.x = _Time.x * 0.00999999978;
    u_xlat2.xy = u_xlat2.xy * u_xlat16.xx + vs_TEXCOORD0.xy;
    u_xlat16.xy = u_xlat16_15.xy * u_xlat2.xy;
    u_xlat0 = u_xlat16_0 * u_xlat2.xyxy;
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat16.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat16_22 = u_xlat2.x / _LongTilingDistance;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _DistanceTilingFade;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_22, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_4.x = u_xlat16_22 * _LargeWaveRefraction;
    u_xlat16_4.x = u_xlat16_4.x * -0.5 + _LargeWaveRefraction;
    u_xlat16_11 = _LargeWaveRefraction * 0.25 + (-u_xlat16_4.x);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11 + u_xlat16_4.x;
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat2.z = vs_TEXCOORD2.x;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_22) + vs_TEXCOORD3.yzx;
    u_xlat23 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat6.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD3.www;
    u_xlat2.y = u_xlat6.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat6.x = u_xlat3.y;
    u_xlat3.y = u_xlat6.z;
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat6.z = vs_TEXCOORD2.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat6.xyz);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWaveRefraction, _LargeWaveRefraction));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat16_15.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * _LightDir.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat23 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat16_4.xyz = u_xlat3.xyz * vec3(u_xlat23) + u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat16_15.x, 0.00100000005);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_15.x = _Gloss * 10.0 + 1.0;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat2.x = u_xlat2.x * u_xlat16_15.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat9.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat9.xy = u_xlat16_1.xy * vec2(_LargeWavesNoise) + u_xlat9.xy;
    u_xlat23 = u_xlat9.x + -0.5;
    u_xlat23 = u_xlat23 * _ReflectionOffset.x + 0.5;
    u_xlat3.x = u_xlat23 + _ReflectionOffset.z;
    u_xlat3.y = (-u_xlat9.y) + _ReflectionOffset.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb23 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat9.xy = (bool(u_xlatb23)) ? u_xlat3.xy : u_xlat9.xy;
    u_xlat16_9.xyz = texture(_ReflectionTex, u_xlat9.xy).xyz;
    u_xlat3.xyz = u_xlat16_9.xyz * _ReflectionColor.xyz;
    u_xlat16_0 = texture(_WaterColorMap2, vs_TEXCOORD0.xy);
    u_xlat9.xyz = (-u_xlat16_9.xyz) * _ReflectionColor.xyz + u_xlat16_0.xyz;
    u_xlat16_1.x = u_xlat16_0.w * _ReflectionPower;
    u_xlat9.xyz = u_xlat16_1.xxx * u_xlat9.xyz + u_xlat3.xyz;
    u_xlat16_1.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_1.xyz + u_xlat9.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_UseFog);
#else
    u_xlatb23 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb23)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_2.x = texture(_AlphaTex, u_xlat16_1.xy).x;
    SV_Target0.w = u_xlat16_2.x * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_LERPTEX_ON" "_NORMALTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump vec4 _ReflectionOffset;
uniform 	mediump float _ReflectionPower;
uniform 	mediump float _EnablePlaneReflectionTex;
uniform 	mediump float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	mediump float _LargeWavesNoise;
uniform 	mediump float _LargeWaveRefraction;
uniform 	mediump float _LongTilingDistance;
uniform 	mediump float _DistanceTilingFade;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _ReflectionTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterColorMap2;
UNITY_LOCATION(3) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.y = float(1.0) / u_xlat0.x;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWavesTiling, _LargeWavesTiling));
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(1.66666687e-05, 1.66666687e-05);
    u_xlat16_0 = u_xlat16_1.xyxy * vec4(0.00100000005, 0.00100000005, 5.00000024e-05, 5.00000024e-05);
    u_xlat2.xy = vec2(_LargeWavesSpeed) / u_xlat16_0.xy;
    u_xlat16.x = _Time.x * 0.00999999978;
    u_xlat2.xy = u_xlat2.xy * u_xlat16.xx + vs_TEXCOORD0.xy;
    u_xlat16.xy = u_xlat16_15.xy * u_xlat2.xy;
    u_xlat0 = u_xlat16_0 * u_xlat2.xyxy;
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat16.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat16_22 = u_xlat2.x / _LongTilingDistance;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _DistanceTilingFade;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_22, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_4.x = u_xlat16_22 * _LargeWaveRefraction;
    u_xlat16_4.x = u_xlat16_4.x * -0.5 + _LargeWaveRefraction;
    u_xlat16_11 = _LargeWaveRefraction * 0.25 + (-u_xlat16_4.x);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11 + u_xlat16_4.x;
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat2.z = vs_TEXCOORD2.x;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_22) + vs_TEXCOORD3.yzx;
    u_xlat23 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat6.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD3.www;
    u_xlat2.y = u_xlat6.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat6.x = u_xlat3.y;
    u_xlat3.y = u_xlat6.z;
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat6.z = vs_TEXCOORD2.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat6.xyz);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWaveRefraction, _LargeWaveRefraction));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat16_15.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * _LightDir.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat23 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat16_4.xyz = u_xlat3.xyz * vec3(u_xlat23) + u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat16_15.x, 0.00100000005);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_15.x = _Gloss * 10.0 + 1.0;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat2.x = u_xlat2.x * u_xlat16_15.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat9.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat9.xy = u_xlat16_1.xy * vec2(_LargeWavesNoise) + u_xlat9.xy;
    u_xlat23 = u_xlat9.x + -0.5;
    u_xlat23 = u_xlat23 * _ReflectionOffset.x + 0.5;
    u_xlat3.x = u_xlat23 + _ReflectionOffset.z;
    u_xlat3.y = (-u_xlat9.y) + _ReflectionOffset.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_EnablePlaneReflectionTex);
#else
    u_xlatb23 = 0.5<_EnablePlaneReflectionTex;
#endif
    u_xlat9.xy = (bool(u_xlatb23)) ? u_xlat3.xy : u_xlat9.xy;
    u_xlat16_9.xyz = texture(_ReflectionTex, u_xlat9.xy).xyz;
    u_xlat3.xyz = u_xlat16_9.xyz * _ReflectionColor.xyz;
    u_xlat16_0 = texture(_WaterColorMap2, vs_TEXCOORD0.xy);
    u_xlat9.xyz = (-u_xlat16_9.xyz) * _ReflectionColor.xyz + u_xlat16_0.xyz;
    u_xlat16_1.x = u_xlat16_0.w * _ReflectionPower;
    u_xlat9.xyz = u_xlat16_1.xxx * u_xlat9.xyz + u_xlat3.xyz;
    u_xlat16_1.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_1.xyz + u_xlat9.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_UseFog);
#else
    u_xlatb23 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb23)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_2.x = texture(_AlphaTex, u_xlat16_1.xy).x;
    SV_Target0.w = u_xlat16_2.x * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUBEREF_ON" "_LERPTEX_ON" "_NORMALTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump float _ReflectionPower;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubeIntensity;
uniform 	mediump float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	mediump float _LargeWavesNoise;
uniform 	mediump float _LargeWaveRefraction;
uniform 	mediump float _LongTilingDistance;
uniform 	mediump float _DistanceTilingFade;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectionCube;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterColorMap2;
UNITY_LOCATION(3) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.y = float(1.0) / u_xlat0.x;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(_LargeWavesTiling);
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(1.66666687e-05, 1.66666687e-05);
    u_xlat16_0 = u_xlat16_1.xyxy * vec4(0.00100000005, 0.00100000005, 5.00000024e-05, 5.00000024e-05);
    u_xlat2.xy = vec2(_LargeWavesSpeed) / u_xlat16_0.xy;
    u_xlat16.x = _Time.x * 0.00999999978;
    u_xlat2.xy = u_xlat2.xy * u_xlat16.xx + vs_TEXCOORD0.xy;
    u_xlat16.xy = u_xlat16_15.xy * u_xlat2.xy;
    u_xlat0 = u_xlat16_0 * u_xlat2.xyxy;
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat16.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat16_22 = u_xlat2.x / _LongTilingDistance;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _DistanceTilingFade;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_22, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_4.x = u_xlat16_22 * _LargeWaveRefraction;
    u_xlat16_4.x = u_xlat16_4.x * -0.5 + _LargeWaveRefraction;
    u_xlat16_11 = _LargeWaveRefraction * 0.25 + (-u_xlat16_4.x);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11 + u_xlat16_4.x;
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat2.z = vs_TEXCOORD2.x;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_22) + vs_TEXCOORD3.yzx;
    u_xlat23 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat6.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD3.www;
    u_xlat2.y = u_xlat6.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat6.x = u_xlat3.y;
    u_xlat3.y = u_xlat6.z;
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat6.z = vs_TEXCOORD2.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat6.xyz);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWaveRefraction, _LargeWaveRefraction));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat16_15.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat23 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz;
    u_xlat16_4.xyz = _LightDir.xyz * u_xlat16_15.xxx + u_xlat3.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat16_15.x, 0.00100000005);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_15.x = _Gloss * 10.0 + 1.0;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat2.x = u_xlat2.x * u_xlat16_15.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat16_15.x = dot((-u_xlat3.xyz), vs_TEXCOORD2.xyz);
    u_xlat16_15.x = u_xlat16_15.x + u_xlat16_15.x;
    u_xlat16_4.xyz = vs_TEXCOORD2.xyz * (-u_xlat16_15.xxx) + (-u_xlat3.xyz);
    u_xlat16_9.xyz = texture(_ReflectionCube, u_xlat16_4.xyz).xyz;
    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat3.xy = u_xlat16_1.xy * vec2(_LargeWavesNoise) + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_WaterColorMap2, u_xlat3.xy).xyz;
    u_xlat9.xyz = u_xlat16_9.xyz * u_xlat16_3.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _CubeColor.xyz;
    u_xlat3.xyz = u_xlat9.xyz * vec3(vec3(_CubeIntensity, _CubeIntensity, _CubeIntensity));
    u_xlat16_0 = texture(_WaterColorMap2, vs_TEXCOORD0.xy);
    u_xlat9.xyz = (-u_xlat9.xyz) * vec3(vec3(_CubeIntensity, _CubeIntensity, _CubeIntensity)) + u_xlat16_0.xyz;
    u_xlat16_1.x = u_xlat16_0.w * _ReflectionPower;
    u_xlat9.xyz = u_xlat16_1.xxx * u_xlat9.xyz + u_xlat3.xyz;
    u_xlat16_1.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_1.xyz + u_xlat9.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_UseFog);
#else
    u_xlatb23 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb23)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_2.x = texture(_AlphaTex, u_xlat16_1.xy).x;
    SV_Target0.w = u_xlat16_2.x * _ReflectionColor.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUBEREF_ON" "_LERPTEX_ON" "_NORMALTEX_ON" }
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
uniform 	mediump vec2 _FogVector;
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
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec3 in_NORMAL0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump float u_xlat16_3;
float u_xlat12;
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
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_FogVector.x);
    u_xlat16_3 = max(_FogVector.y, 0.00100000005);
    vs_TEXCOORD1.w = u_xlat0.x / u_xlat16_3;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD1.w = min(max(vs_TEXCOORD1.w, 0.0), 1.0);
#else
    vs_TEXCOORD1.w = clamp(vs_TEXCOORD1.w, 0.0, 1.0);
#endif
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat0.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb0 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat0.x = (u_xlatb0) ? 1.0 : -1.0;
    vs_TEXCOORD3.w = u_xlat0.x * in_TANGENT0.w;
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
uniform 	mediump vec4 _ReflectionColor;
uniform 	mediump vec4 _AlphaTex_ST;
uniform 	mediump float _ReflectionPower;
uniform 	mediump vec3 _CubeColor;
uniform 	mediump float _CubeIntensity;
uniform 	mediump float _LargeWavesTiling;
uniform 	float _LargeWavesSpeed;
uniform 	mediump float _LargeWavesNoise;
uniform 	mediump float _LargeWaveRefraction;
uniform 	mediump float _LongTilingDistance;
uniform 	mediump float _DistanceTilingFade;
uniform 	mediump vec4 _LightDir;
uniform 	mediump vec3 _LightColor;
uniform 	mediump float _Specular;
uniform 	mediump float _Gloss;
uniform 	mediump float _UseFog;
uniform 	mediump vec4 _FogColor;
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
UNITY_LOCATION(0) uniform mediump sampler2D _LargeWavesTexture;
UNITY_LOCATION(1) uniform mediump samplerCube _ReflectionCube;
UNITY_LOCATION(2) uniform mediump sampler2D _WaterColorMap2;
UNITY_LOCATION(3) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_11;
mediump vec2 u_xlat16_15;
vec2 u_xlat16;
mediump float u_xlat16_22;
float u_xlat23;
bool u_xlatb23;
void main()
{
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].x;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].x;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].x;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_WorldToObject[0].z;
    u_xlat0.y = hlslcc_mtx4x4unity_WorldToObject[1].z;
    u_xlat0.z = hlslcc_mtx4x4unity_WorldToObject[2].z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat16_1.y = float(1.0) / u_xlat0.x;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(_LargeWavesTiling);
    u_xlat16_15.xy = u_xlat16_1.xy * vec2(1.66666687e-05, 1.66666687e-05);
    u_xlat16_0 = u_xlat16_1.xyxy * vec4(0.00100000005, 0.00100000005, 5.00000024e-05, 5.00000024e-05);
    u_xlat2.xy = vec2(_LargeWavesSpeed) / u_xlat16_0.xy;
    u_xlat16.x = _Time.x * 0.00999999978;
    u_xlat2.xy = u_xlat2.xy * u_xlat16.xx + vs_TEXCOORD0.xy;
    u_xlat16.xy = u_xlat16_15.xy * u_xlat2.xy;
    u_xlat0 = u_xlat16_0 * u_xlat2.xyxy;
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat16.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = texture(_LargeWavesTexture, u_xlat0.zw).xyz;
    u_xlat16_3.xyz = texture(_LargeWavesTexture, u_xlat0.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat2.xyz = vs_TEXCOORD1.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat16_22 = u_xlat2.x / _LongTilingDistance;
    u_xlat16_22 = log2(u_xlat16_22);
    u_xlat16_22 = u_xlat16_22 * _DistanceTilingFade;
    u_xlat16_22 = exp2(u_xlat16_22);
    u_xlat16_22 = min(u_xlat16_22, 1.0);
    u_xlat16_4.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-u_xlat16_4.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0, -0.0, -1.0);
    u_xlat16_4.x = u_xlat16_22 * _LargeWaveRefraction;
    u_xlat16_4.x = u_xlat16_4.x * -0.5 + _LargeWaveRefraction;
    u_xlat16_11 = _LargeWaveRefraction * 0.25 + (-u_xlat16_4.x);
    u_xlat16_22 = u_xlat16_22 * u_xlat16_11 + u_xlat16_4.x;
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz + vec3(0.0, 0.0, 1.0);
    u_xlat2.z = vs_TEXCOORD2.x;
    u_xlat16_22 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_22) + vs_TEXCOORD3.yzx;
    u_xlat23 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat16_4.xyz;
    u_xlat6.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat6.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD3.www;
    u_xlat2.y = u_xlat6.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat6.x = u_xlat3.y;
    u_xlat3.y = u_xlat6.z;
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat2.y = dot(u_xlat16_1.xyz, u_xlat3.xyz);
    u_xlat6.z = vs_TEXCOORD2.z;
    u_xlat2.z = dot(u_xlat16_1.xyz, u_xlat6.xyz);
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(vec2(_LargeWaveRefraction, _LargeWaveRefraction));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat23 = max(u_xlat23, 1.17549435e-38);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat2.xyz = vec3(u_xlat23) * u_xlat2.xyz;
    u_xlat16_15.x = dot(_LightDir.xyz, _LightDir.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat3.xyz = (-vs_TEXCOORD1.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat23 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz;
    u_xlat16_4.xyz = _LightDir.xyz * u_xlat16_15.xxx + u_xlat3.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_15.x = inversesqrt(u_xlat16_15.x);
    u_xlat16_4.xyz = u_xlat16_15.xxx * u_xlat16_4.xyz;
    u_xlat16_15.x = dot(u_xlat16_4.xyz, u_xlat2.xyz);
    u_xlat2.x = max(u_xlat16_15.x, 0.00100000005);
    u_xlat2.x = log2(u_xlat2.x);
    u_xlat16_15.x = _Gloss * 10.0 + 1.0;
    u_xlat16_15.x = exp2(u_xlat16_15.x);
    u_xlat2.x = u_xlat2.x * u_xlat16_15.x;
    u_xlat2.x = exp2(u_xlat2.x);
    u_xlat16_15.x = dot((-u_xlat3.xyz), vs_TEXCOORD2.xyz);
    u_xlat16_15.x = u_xlat16_15.x + u_xlat16_15.x;
    u_xlat16_4.xyz = vs_TEXCOORD2.xyz * (-u_xlat16_15.xxx) + (-u_xlat3.xyz);
    u_xlat16_9.xyz = texture(_ReflectionCube, u_xlat16_4.xyz).xyz;
    u_xlat3.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat3.xy = u_xlat16_1.xy * vec2(_LargeWavesNoise) + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_WaterColorMap2, u_xlat3.xy).xyz;
    u_xlat9.xyz = u_xlat16_9.xyz * u_xlat16_3.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _CubeColor.xyz;
    u_xlat3.xyz = u_xlat9.xyz * vec3(vec3(_CubeIntensity, _CubeIntensity, _CubeIntensity));
    u_xlat16_0 = texture(_WaterColorMap2, vs_TEXCOORD0.xy);
    u_xlat9.xyz = (-u_xlat9.xyz) * vec3(vec3(_CubeIntensity, _CubeIntensity, _CubeIntensity)) + u_xlat16_0.xyz;
    u_xlat16_1.x = u_xlat16_0.w * _ReflectionPower;
    u_xlat9.xyz = u_xlat16_1.xxx * u_xlat9.xyz + u_xlat3.xyz;
    u_xlat16_1.xyz = _LightColor.xyz * vec3(vec3(_Specular, _Specular, _Specular));
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_1.xyz + u_xlat9.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + _FogColor.xyz;
    u_xlat23 = vs_TEXCOORD1.w * _FogColor.w;
    u_xlat3.xyz = vec3(u_xlat23) * u_xlat3.xyz + u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(0.5<_UseFog);
#else
    u_xlatb23 = 0.5<_UseFog;
#endif
    SV_Target0.xyz = (bool(u_xlatb23)) ? u_xlat3.xyz : u_xlat2.xyz;
    u_xlat16_1.xy = vs_TEXCOORD0.xy * _AlphaTex_ST.xy + _AlphaTex_ST.zw;
    u_xlat16_2.x = texture(_AlphaTex, u_xlat16_1.xy).x;
    SV_Target0.w = u_xlat16_2.x * _ReflectionColor.w;
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
Local Keywords { "_NORMALTEX_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_NORMALTEX_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_LERPTEX_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_LERPTEX_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_CUBEREF_ON" "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_CUBEREF_ON" "_LERPTEX_ON" "_NORMALTEX_ON" }
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
Local Keywords { "_NORMALTEX_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_NORMALTEX_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_LERPTEX_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_LERPTEX_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUBEREF_ON" "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUBEREF_ON" "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_NORMALTEX_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_NORMALTEX_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_LERPTEX_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_LERPTEX_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_CUBEREF_ON" "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_CUBEREF_ON" "_LERPTEX_ON" "_NORMALTEX_ON" }
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
Local Keywords { "_NORMALTEX_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_NORMALTEX_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_LERPTEX_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_LERPTEX_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUBEREF_ON" "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_CUBEREF_ON" "_LERPTEX_ON" "_NORMALTEX_ON" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_Scene_ReflectionGUI"
}