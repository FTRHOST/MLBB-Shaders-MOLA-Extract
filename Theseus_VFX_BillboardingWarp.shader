//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/VFX/BillboardingWarp" {
Properties {

_OutlineZOffset ("Z偏移值", Range(0, 3)) = 0.0

_VerticalBillboarding ("锁定Y轴", Range(0, 1)) = 1.0

_MainMap ("颜色贴图", 2D) = "white" { }

_OutlineColor1 ("第一层颜色", Color) = (1,1,1,1)

_OutlineColor2 ("第二层颜色", Color) = (1,1,1,1)

_FlowColorSpeed ("流动颜色速度", Vector) = (1,1,1,1)

_NoiseMap ("扭曲贴图", 2D) = "white" { }

_ShapeMap ("外形贴图", 2D) = "white" { }

_FlowDissolveSpeed ("流动扰动速度", Vector) = (1,1,1,1)

_Distort ("扭曲强度", Range(-2, 2)) = 0.0

}
SubShader {
 Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "DisableBatching" = "true" "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Off
  GpuProgramID 37276
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
uniform 	float _VerticalBillboarding;
uniform 	mediump float _OutlineZOffset;
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
out highp vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat3;
float u_xlat4;
bool u_xlatb7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.yzw = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat1.x = u_xlat1.z * _VerticalBillboarding;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.999000013<u_xlat1.x);
#else
    u_xlatb9 = 0.999000013<u_xlat1.x;
#endif
    u_xlat2.xyz = (bool(u_xlatb9)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat0.xy = u_xlat1.wy * u_xlat2.zx;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat1.xwy + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.wyx;
    u_xlat2.xyz = u_xlat1.xwy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.yxw * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = (-u_xlat0.w) + (-_OutlineZOffset);
    u_xlat4 = u_xlat1.x * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat4 = u_xlat0.w * u_xlat4;
    u_xlat1.x = u_xlat4 / (-u_xlat1.x);
    u_xlat4 = (-_OutlineZOffset) / _ProjectionParams.z;
    u_xlat4 = u_xlat0.z + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb7 = unity_OrthoParams.w==0.0;
#endif
    u_xlat0.z = (u_xlatb7) ? u_xlat1.x : u_xlat4;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD3 = in_POSITION0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat3 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat3 * 0.5;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _MainMap_ST;
uniform 	vec4 _NoiseMap_ST;
uniform 	vec4 _ShapeMap_ST;
uniform 	mediump vec4 _OutlineColor1;
uniform 	mediump vec4 _OutlineColor2;
uniform 	mediump vec2 _FlowColorSpeed;
uniform 	vec4 _FlowDissolveSpeed;
uniform 	mediump float _Distort;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainMap;
UNITY_LOCATION(1) uniform mediump sampler2D _ShapeMap;
UNITY_LOCATION(2) uniform mediump sampler2D _NoiseMap;
in highp vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy * _MainMap_ST.xy + _MainMap_ST.zw;
    u_xlat0.xy = _FlowColorSpeed.xy * _Time.yy + u_xlat0.xy;
    u_xlat16_0 = texture(_MainMap, u_xlat0.xy).x;
    u_xlat16_1.xyz = (-_OutlineColor1.xyz) + _OutlineColor2.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_0) * u_xlat16_1.xyz + _OutlineColor1.xyz;
    u_xlat0.xy = _FlowDissolveSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_NoiseMap, u_xlat0.xy).x;
    u_xlat0.y = u_xlat16_0 * _Distort;
    u_xlat4.xy = vs_TEXCOORD0.xy * _ShapeMap_ST.xy + _ShapeMap_ST.zw;
    u_xlat0.x = 0.0;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat4.xy;
    u_xlat16_0 = texture(_ShapeMap, u_xlat0.xy).x;
    u_xlat16_1.xyz = vec3(u_xlat16_0) * u_xlat16_1.xyz;
    u_xlat2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat1.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.x = min(abs(vs_TEXCOORD3.y), 1.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat1.w = u_xlat16_0 * u_xlat2.x;
    SV_Target0 = u_xlat1;
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
uniform 	float _VerticalBillboarding;
uniform 	mediump float _OutlineZOffset;
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
out highp vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat3;
float u_xlat4;
bool u_xlatb7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.yzw = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat1.x = u_xlat1.z * _VerticalBillboarding;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.999000013<u_xlat1.x);
#else
    u_xlatb9 = 0.999000013<u_xlat1.x;
#endif
    u_xlat2.xyz = (bool(u_xlatb9)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat0.xy = u_xlat1.wy * u_xlat2.zx;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat1.xwy + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.wyx;
    u_xlat2.xyz = u_xlat1.xwy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.yxw * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = (-u_xlat0.w) + (-_OutlineZOffset);
    u_xlat4 = u_xlat1.x * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat4 = u_xlat0.w * u_xlat4;
    u_xlat1.x = u_xlat4 / (-u_xlat1.x);
    u_xlat4 = (-_OutlineZOffset) / _ProjectionParams.z;
    u_xlat4 = u_xlat0.z + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb7 = unity_OrthoParams.w==0.0;
#endif
    u_xlat0.z = (u_xlatb7) ? u_xlat1.x : u_xlat4;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD3 = in_POSITION0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat3 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat3 * 0.5;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _MainMap_ST;
uniform 	vec4 _NoiseMap_ST;
uniform 	vec4 _ShapeMap_ST;
uniform 	mediump vec4 _OutlineColor1;
uniform 	mediump vec4 _OutlineColor2;
uniform 	mediump vec2 _FlowColorSpeed;
uniform 	vec4 _FlowDissolveSpeed;
uniform 	mediump float _Distort;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainMap;
UNITY_LOCATION(1) uniform mediump sampler2D _ShapeMap;
UNITY_LOCATION(2) uniform mediump sampler2D _NoiseMap;
in highp vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy * _MainMap_ST.xy + _MainMap_ST.zw;
    u_xlat0.xy = _FlowColorSpeed.xy * _Time.yy + u_xlat0.xy;
    u_xlat16_0 = texture(_MainMap, u_xlat0.xy).x;
    u_xlat16_1.xyz = (-_OutlineColor1.xyz) + _OutlineColor2.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_0) * u_xlat16_1.xyz + _OutlineColor1.xyz;
    u_xlat0.xy = _FlowDissolveSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_NoiseMap, u_xlat0.xy).x;
    u_xlat0.y = u_xlat16_0 * _Distort;
    u_xlat4.xy = vs_TEXCOORD0.xy * _ShapeMap_ST.xy + _ShapeMap_ST.zw;
    u_xlat0.x = 0.0;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat4.xy;
    u_xlat16_0 = texture(_ShapeMap, u_xlat0.xy).x;
    u_xlat16_1.xyz = vec3(u_xlat16_0) * u_xlat16_1.xyz;
    u_xlat2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat1.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat2.x = min(abs(vs_TEXCOORD3.y), 1.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat1.w = u_xlat16_0 * u_xlat2.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _VerticalBillboarding;
uniform 	mediump float _OutlineZOffset;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat3;
float u_xlat4;
bool u_xlatb7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.yzw = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat1.x = u_xlat1.z * _VerticalBillboarding;
    u_xlatb9 = 0.999000013<u_xlat1.x;
    u_xlat2.xyz = (bool(u_xlatb9)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat0.xy = u_xlat1.wy * u_xlat2.zx;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat1.xwy + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.wyx;
    u_xlat2.xyz = u_xlat1.xwy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.yxw * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = (-u_xlat0.w) + (-_OutlineZOffset);
    u_xlat4 = u_xlat1.x * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat4 = u_xlat0.w * u_xlat4;
    u_xlat1.x = u_xlat4 / (-u_xlat1.x);
    u_xlat4 = (-_OutlineZOffset) / _ProjectionParams.z;
    u_xlat4 = u_xlat0.z + u_xlat4;
    u_xlatb7 = unity_OrthoParams.w==0.0;
    u_xlat0.z = (u_xlatb7) ? u_xlat1.x : u_xlat4;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD3 = in_POSITION0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat3 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat3 * 0.5;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _MainMap_ST;
uniform 	vec4 _NoiseMap_ST;
uniform 	vec4 _ShapeMap_ST;
uniform 	mediump vec4 _OutlineColor1;
uniform 	mediump vec4 _OutlineColor2;
uniform 	mediump vec2 _FlowColorSpeed;
uniform 	vec4 _FlowDissolveSpeed;
uniform 	mediump float _Distort;
uniform lowp sampler2D _MainMap;
uniform lowp sampler2D _ShapeMap;
uniform lowp sampler2D _NoiseMap;
varying highp vec4 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy * _MainMap_ST.xy + _MainMap_ST.zw;
    u_xlat0.xy = _FlowColorSpeed.xy * _Time.yy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_MainMap, u_xlat0.xy).x;
    u_xlat16_1.xyz = (-_OutlineColor1.xyz) + _OutlineColor2.xyz;
    u_xlat16_1.xyz = vec3(u_xlat10_0) * u_xlat16_1.xyz + _OutlineColor1.xyz;
    u_xlat0.xy = _Time.yy * _FlowDissolveSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_NoiseMap, u_xlat0.xy).x;
    u_xlat0.y = u_xlat10_0 * _Distort;
    u_xlat4.xy = vs_TEXCOORD0.xy * _ShapeMap_ST.xy + _ShapeMap_ST.zw;
    u_xlat0.x = 0.0;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat4.xy;
    u_xlat10_0 = texture2D(_ShapeMap, u_xlat0.xy).x;
    u_xlat16_1.xyz = vec3(u_xlat10_0) * u_xlat16_1.xyz;
    u_xlat2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat1.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat2.x = min(abs(vs_TEXCOORD3.y), 1.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat1.w = u_xlat10_0 * u_xlat2.x;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _VerticalBillboarding;
uniform 	mediump float _OutlineZOffset;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat3;
float u_xlat4;
bool u_xlatb7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.yzw = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat1.x = u_xlat1.z * _VerticalBillboarding;
    u_xlatb9 = 0.999000013<u_xlat1.x;
    u_xlat2.xyz = (bool(u_xlatb9)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat0.xy = u_xlat1.wy * u_xlat2.zx;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat1.xwy + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.wyx;
    u_xlat2.xyz = u_xlat1.xwy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.yxw * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = (-u_xlat0.w) + (-_OutlineZOffset);
    u_xlat4 = u_xlat1.x * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat4 = u_xlat0.w * u_xlat4;
    u_xlat1.x = u_xlat4 / (-u_xlat1.x);
    u_xlat4 = (-_OutlineZOffset) / _ProjectionParams.z;
    u_xlat4 = u_xlat0.z + u_xlat4;
    u_xlatb7 = unity_OrthoParams.w==0.0;
    u_xlat0.z = (u_xlatb7) ? u_xlat1.x : u_xlat4;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD3 = in_POSITION0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat3 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat3 * 0.5;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _MainMap_ST;
uniform 	vec4 _NoiseMap_ST;
uniform 	vec4 _ShapeMap_ST;
uniform 	mediump vec4 _OutlineColor1;
uniform 	mediump vec4 _OutlineColor2;
uniform 	mediump vec2 _FlowColorSpeed;
uniform 	vec4 _FlowDissolveSpeed;
uniform 	mediump float _Distort;
uniform lowp sampler2D _MainMap;
uniform lowp sampler2D _ShapeMap;
uniform lowp sampler2D _NoiseMap;
varying highp vec4 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy * _MainMap_ST.xy + _MainMap_ST.zw;
    u_xlat0.xy = _FlowColorSpeed.xy * _Time.yy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_MainMap, u_xlat0.xy).x;
    u_xlat16_1.xyz = (-_OutlineColor1.xyz) + _OutlineColor2.xyz;
    u_xlat16_1.xyz = vec3(u_xlat10_0) * u_xlat16_1.xyz + _OutlineColor1.xyz;
    u_xlat0.xy = _Time.yy * _FlowDissolveSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_NoiseMap, u_xlat0.xy).x;
    u_xlat0.y = u_xlat10_0 * _Distort;
    u_xlat4.xy = vs_TEXCOORD0.xy * _ShapeMap_ST.xy + _ShapeMap_ST.zw;
    u_xlat0.x = 0.0;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat4.xy;
    u_xlat10_0 = texture2D(_ShapeMap, u_xlat0.xy).x;
    u_xlat16_1.xyz = vec3(u_xlat10_0) * u_xlat16_1.xyz;
    u_xlat2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat1.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    u_xlat2.x = min(abs(vs_TEXCOORD3.y), 1.0);
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat1.w = u_xlat10_0 * u_xlat2.x;
    SV_Target0 = u_xlat1;
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
uniform 	float _VerticalBillboarding;
uniform 	mediump float _OutlineZOffset;
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
out highp vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat3;
float u_xlat4;
bool u_xlatb7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.yzw = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat1.x = u_xlat1.z * _VerticalBillboarding;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.999000013<u_xlat1.x);
#else
    u_xlatb9 = 0.999000013<u_xlat1.x;
#endif
    u_xlat2.xyz = (bool(u_xlatb9)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat0.xy = u_xlat1.wy * u_xlat2.zx;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat1.xwy + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.wyx;
    u_xlat2.xyz = u_xlat1.xwy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.yxw * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = (-u_xlat0.w) + (-_OutlineZOffset);
    u_xlat4 = u_xlat1.x * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat4 = u_xlat0.w * u_xlat4;
    u_xlat1.x = u_xlat4 / (-u_xlat1.x);
    u_xlat4 = (-_OutlineZOffset) / _ProjectionParams.z;
    u_xlat4 = u_xlat0.z + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb7 = unity_OrthoParams.w==0.0;
#endif
    u_xlat0.z = (u_xlatb7) ? u_xlat1.x : u_xlat4;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD3 = in_POSITION0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat3 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat3 * 0.5;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _MainMap_ST;
uniform 	vec4 _NoiseMap_ST;
uniform 	vec4 _ShapeMap_ST;
uniform 	mediump vec4 _OutlineColor1;
uniform 	mediump vec4 _OutlineColor2;
uniform 	mediump vec2 _FlowColorSpeed;
uniform 	vec4 _FlowDissolveSpeed;
uniform 	mediump float _Distort;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainMap;
UNITY_LOCATION(1) uniform mediump sampler2D _ShapeMap;
UNITY_LOCATION(2) uniform mediump sampler2D _NoiseMap;
in highp vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
float u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy * _MainMap_ST.xy + _MainMap_ST.zw;
    u_xlat0.xy = _FlowColorSpeed.xy * _Time.yy + u_xlat0.xy;
    u_xlat16_0 = texture(_MainMap, u_xlat0.xy).x;
    u_xlat16_1.xyz = (-_OutlineColor1.xyz) + _OutlineColor2.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_0) * u_xlat16_1.xyz + _OutlineColor1.xyz;
    u_xlat0.xy = _FlowDissolveSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_NoiseMap, u_xlat0.xy).x;
    u_xlat0.y = u_xlat16_0 * _Distort;
    u_xlat4.xy = vs_TEXCOORD0.xy * _ShapeMap_ST.xy + _ShapeMap_ST.zw;
    u_xlat0.x = 0.0;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat4.xy;
    u_xlat16_0 = texture(_ShapeMap, u_xlat0.xy).x;
    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_1.xyz;
    u_xlat2 = min(abs(vs_TEXCOORD3.y), 1.0);
    u_xlat2 = (-u_xlat2) + 1.0;
    u_xlat0.x = u_xlat16_0 * u_xlat2;
    SV_Target0.w = u_xlat0.x;
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
uniform 	float _VerticalBillboarding;
uniform 	mediump float _OutlineZOffset;
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
out highp vec4 vs_TEXCOORD3;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat3;
float u_xlat4;
bool u_xlatb7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.yzw = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat1.x = u_xlat1.z * _VerticalBillboarding;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(0.999000013<u_xlat1.x);
#else
    u_xlatb9 = 0.999000013<u_xlat1.x;
#endif
    u_xlat2.xyz = (bool(u_xlatb9)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat0.xy = u_xlat1.wy * u_xlat2.zx;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat1.xwy + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.wyx;
    u_xlat2.xyz = u_xlat1.xwy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.yxw * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = (-u_xlat0.w) + (-_OutlineZOffset);
    u_xlat4 = u_xlat1.x * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat4 = u_xlat0.w * u_xlat4;
    u_xlat1.x = u_xlat4 / (-u_xlat1.x);
    u_xlat4 = (-_OutlineZOffset) / _ProjectionParams.z;
    u_xlat4 = u_xlat0.z + u_xlat4;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb7 = unity_OrthoParams.w==0.0;
#endif
    u_xlat0.z = (u_xlatb7) ? u_xlat1.x : u_xlat4;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD3 = in_POSITION0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat3 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat3 * 0.5;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _MainMap_ST;
uniform 	vec4 _NoiseMap_ST;
uniform 	vec4 _ShapeMap_ST;
uniform 	mediump vec4 _OutlineColor1;
uniform 	mediump vec4 _OutlineColor2;
uniform 	mediump vec2 _FlowColorSpeed;
uniform 	vec4 _FlowDissolveSpeed;
uniform 	mediump float _Distort;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainMap;
UNITY_LOCATION(1) uniform mediump sampler2D _ShapeMap;
UNITY_LOCATION(2) uniform mediump sampler2D _NoiseMap;
in highp vec4 vs_TEXCOORD3;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
mediump vec3 u_xlat16_1;
float u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy * _MainMap_ST.xy + _MainMap_ST.zw;
    u_xlat0.xy = _FlowColorSpeed.xy * _Time.yy + u_xlat0.xy;
    u_xlat16_0 = texture(_MainMap, u_xlat0.xy).x;
    u_xlat16_1.xyz = (-_OutlineColor1.xyz) + _OutlineColor2.xyz;
    u_xlat16_1.xyz = vec3(u_xlat16_0) * u_xlat16_1.xyz + _OutlineColor1.xyz;
    u_xlat0.xy = _FlowDissolveSpeed.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat16_0 = texture(_NoiseMap, u_xlat0.xy).x;
    u_xlat0.y = u_xlat16_0 * _Distort;
    u_xlat4.xy = vs_TEXCOORD0.xy * _ShapeMap_ST.xy + _ShapeMap_ST.zw;
    u_xlat0.x = 0.0;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat4.xy;
    u_xlat16_0 = texture(_ShapeMap, u_xlat0.xy).x;
    SV_Target0.xyz = vec3(u_xlat16_0) * u_xlat16_1.xyz;
    u_xlat2 = min(abs(vs_TEXCOORD3.y), 1.0);
    u_xlat2 = (-u_xlat2) + 1.0;
    u_xlat0.x = u_xlat16_0 * u_xlat2;
    SV_Target0.w = u_xlat0.x;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _VerticalBillboarding;
uniform 	mediump float _OutlineZOffset;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat3;
float u_xlat4;
bool u_xlatb7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.yzw = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat1.x = u_xlat1.z * _VerticalBillboarding;
    u_xlatb9 = 0.999000013<u_xlat1.x;
    u_xlat2.xyz = (bool(u_xlatb9)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat0.xy = u_xlat1.wy * u_xlat2.zx;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat1.xwy + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.wyx;
    u_xlat2.xyz = u_xlat1.xwy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.yxw * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = (-u_xlat0.w) + (-_OutlineZOffset);
    u_xlat4 = u_xlat1.x * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat4 = u_xlat0.w * u_xlat4;
    u_xlat1.x = u_xlat4 / (-u_xlat1.x);
    u_xlat4 = (-_OutlineZOffset) / _ProjectionParams.z;
    u_xlat4 = u_xlat0.z + u_xlat4;
    u_xlatb7 = unity_OrthoParams.w==0.0;
    u_xlat0.z = (u_xlatb7) ? u_xlat1.x : u_xlat4;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD3 = in_POSITION0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat3 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat3 * 0.5;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _MainMap_ST;
uniform 	vec4 _NoiseMap_ST;
uniform 	vec4 _ShapeMap_ST;
uniform 	mediump vec4 _OutlineColor1;
uniform 	mediump vec4 _OutlineColor2;
uniform 	mediump vec2 _FlowColorSpeed;
uniform 	vec4 _FlowDissolveSpeed;
uniform 	mediump float _Distort;
uniform lowp sampler2D _MainMap;
uniform lowp sampler2D _ShapeMap;
uniform lowp sampler2D _NoiseMap;
varying highp vec4 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy * _MainMap_ST.xy + _MainMap_ST.zw;
    u_xlat0.xy = _FlowColorSpeed.xy * _Time.yy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_MainMap, u_xlat0.xy).x;
    u_xlat16_1.xyz = (-_OutlineColor1.xyz) + _OutlineColor2.xyz;
    u_xlat16_1.xyz = vec3(u_xlat10_0) * u_xlat16_1.xyz + _OutlineColor1.xyz;
    u_xlat0.xy = _Time.yy * _FlowDissolveSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_NoiseMap, u_xlat0.xy).x;
    u_xlat0.y = u_xlat10_0 * _Distort;
    u_xlat4.xy = vs_TEXCOORD0.xy * _ShapeMap_ST.xy + _ShapeMap_ST.zw;
    u_xlat0.x = 0.0;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat4.xy;
    u_xlat10_0 = texture2D(_ShapeMap, u_xlat0.xy).x;
    SV_Target0.xyz = vec3(u_xlat10_0) * u_xlat16_1.xyz;
    u_xlat2 = min(abs(vs_TEXCOORD3.y), 1.0);
    u_xlat2 = (-u_xlat2) + 1.0;
    u_xlat0.x = u_xlat10_0 * u_xlat2;
    SV_Target0.w = u_xlat0.x;
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
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _VerticalBillboarding;
uniform 	mediump float _OutlineZOffset;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat3;
float u_xlat4;
bool u_xlatb7;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.z = 0.0;
    u_xlat1.xyz = _WorldSpaceCameraPos.yyy * hlslcc_mtx4x4unity_WorldToObject[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * _WorldSpaceCameraPos.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * _WorldSpaceCameraPos.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_WorldToObject[3].xyz;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.yzw = vec3(u_xlat9) * u_xlat1.xyz;
    u_xlat1.x = u_xlat1.z * _VerticalBillboarding;
    u_xlatb9 = 0.999000013<u_xlat1.x;
    u_xlat2.xyz = (bool(u_xlatb9)) ? vec3(1.0, 0.0, 0.0) : vec3(0.0, 0.0, 1.0);
    u_xlat0.xy = u_xlat1.wy * u_xlat2.zx;
    u_xlat0.xyz = (-u_xlat2.xyz) * u_xlat1.xwy + u_xlat0.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.wyx;
    u_xlat2.xyz = u_xlat1.xwy * u_xlat0.zxy + (-u_xlat2.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat1.yxw * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = (-u_xlat0.w) + (-_OutlineZOffset);
    u_xlat4 = u_xlat1.x * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat4 = u_xlat0.w * u_xlat4;
    u_xlat1.x = u_xlat4 / (-u_xlat1.x);
    u_xlat4 = (-_OutlineZOffset) / _ProjectionParams.z;
    u_xlat4 = u_xlat0.z + u_xlat4;
    u_xlatb7 = unity_OrthoParams.w==0.0;
    u_xlat0.z = (u_xlatb7) ? u_xlat1.x : u_xlat4;
    gl_Position = u_xlat0;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD3 = in_POSITION0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat3 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat3 * 0.5;
    vs_TEXCOORD1.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	vec4 _MainMap_ST;
uniform 	vec4 _NoiseMap_ST;
uniform 	vec4 _ShapeMap_ST;
uniform 	mediump vec4 _OutlineColor1;
uniform 	mediump vec4 _OutlineColor2;
uniform 	mediump vec2 _FlowColorSpeed;
uniform 	vec4 _FlowDissolveSpeed;
uniform 	mediump float _Distort;
uniform lowp sampler2D _MainMap;
uniform lowp sampler2D _ShapeMap;
uniform lowp sampler2D _NoiseMap;
varying highp vec4 vs_TEXCOORD3;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
mediump vec3 u_xlat16_1;
float u_xlat2;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy * _MainMap_ST.xy + _MainMap_ST.zw;
    u_xlat0.xy = _FlowColorSpeed.xy * _Time.yy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_MainMap, u_xlat0.xy).x;
    u_xlat16_1.xyz = (-_OutlineColor1.xyz) + _OutlineColor2.xyz;
    u_xlat16_1.xyz = vec3(u_xlat10_0) * u_xlat16_1.xyz + _OutlineColor1.xyz;
    u_xlat0.xy = _Time.yy * _FlowDissolveSpeed.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat4.xy = vs_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat10_0 = texture2D(_NoiseMap, u_xlat0.xy).x;
    u_xlat0.y = u_xlat10_0 * _Distort;
    u_xlat4.xy = vs_TEXCOORD0.xy * _ShapeMap_ST.xy + _ShapeMap_ST.zw;
    u_xlat0.x = 0.0;
    u_xlat0.xy = (-u_xlat0.xy) + u_xlat4.xy;
    u_xlat10_0 = texture2D(_ShapeMap, u_xlat0.xy).x;
    SV_Target0.xyz = vec3(u_xlat10_0) * u_xlat16_1.xyz;
    u_xlat2 = min(abs(vs_TEXCOORD3.y), 1.0);
    u_xlat2 = (-u_xlat2) + 1.0;
    u_xlat0.x = u_xlat10_0 * u_xlat2;
    SV_Target0.w = u_xlat0.x;
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
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
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
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_MeshEffect_BillboardingWarpGUI"
}