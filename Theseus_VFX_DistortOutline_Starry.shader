//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/VFX/DistortOutline_Starry" {
Properties {

_OutlineWidth ("描边宽度", Range(0, 2)) = 1.0

_FresnelPower ("描边边缘透明范围", Range(0, 10)) = 1.0

_FresnelScale ("描边边缘透明强度", Float) = 1.0

_OutlineOffset ("描边XYZ偏移值", Vector) = (0,0,0,0)

_StarTex ("星空贴图", 2D) = "white" { }

_StarColor ("星空颜色", Color) = (1,1,1,1)

_WarpTex ("扭曲贴图", 2D) = "white" { }

_WarpMask ("扭曲遮罩", 2D) = "white" { }

_WarpIntensity ("扭曲强度", Range(0, 1)) = 1.0

_WarpSpeed ("扭曲速度", Vector) = (1,1,1,1)

_WPOTex ("描边波动贴图", 2D) = "white" { }

_WPOSpeed ("描边波动速度", Vector) = (1,1,1,1)

_WPOPower ("描边波动幅度", Range(0, 1)) = 0.0

_DissolveTex ("描边溶解纹理", 2D) = "white" { }

_DissolveEdgeHard ("描边溶解边缘硬度", Range(0, 0.5)) = 0.30000001192092896

_DissolveSpeed ("描边溶解速度", Vector) = (1,1,1,1)

_Cutoff ("描边溶解进度", Range(-1, 1)) = 0.0

}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Front
  GpuProgramID 2255
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
uniform 	vec4 _WPOSpeed;
uniform 	vec4 _WPOTex_ST;
uniform 	float _WPOPower;
uniform 	mediump float _OutlineWidth;
uniform 	mediump vec3 _OutlineOffset;
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
UNITY_LOCATION(4) uniform mediump sampler2D _WPOTex;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec3 u_xlat6;
float u_xlat7;
bool u_xlatb8;
vec2 u_xlat12;
float u_xlat18;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat1.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.z = 0.00999999978;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat1.xy * u_xlat0.xx + _OutlineOffset.xxyz.yz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixVP[1].xyw;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixVP[0].xyw * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixVP[2].xyw * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixVP[3].xyw * u_xlat1.www + u_xlat2.xyz;
    u_xlat3.x = float(0.5);
    u_xlat3.z = float(0.5);
    u_xlat3.y = _ProjectionParams.x;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat4.w = u_xlat4.y * 0.5;
    u_xlat12.xy = u_xlat4.zz + u_xlat4.xw;
    u_xlat12.xy = u_xlat12.xy / u_xlat2.zz;
    u_xlat12.xy = u_xlat12.xy * _WPOTex_ST.xy + _WPOTex_ST.zw;
    u_xlat12.xy = _Time.yy * _WPOSpeed.xy + u_xlat12.xy;
    u_xlat12.x = textureLod(_WPOTex, u_xlat12.xy, 0.0).x;
    u_xlat12.x = u_xlat12.x * 2.0 + -1.0;
    u_xlat12.x = u_xlat12.x * _WPOPower;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixV[3];
    u_xlat18 = u_xlat1.z / hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat2.x = float(1.0) / hlslcc_mtx4x4glstate_matrix_projection[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb8 = unity_OrthoParams.w==0.0;
#endif
    u_xlat12.y = (u_xlatb8) ? abs(u_xlat18) : abs(u_xlat2.x);
    u_xlat12.xy = u_xlat12.xy * vec2(0.100000001, 10.0);
    u_xlat18 = max(u_xlat12.y, 9.99999975e-05);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat16_5 = _OutlineWidth * 0.00999999978;
    u_xlat18 = u_xlat18 * u_xlat16_5;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat18) + u_xlat12.xx;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat6.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixInvV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[0].xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[3].xyz * u_xlat1.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.x = (-u_xlat0.w) + (-_OutlineOffset.xxyz.w);
    u_xlat7 = u_xlat1.x * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat7 = u_xlat0.w * u_xlat7;
    u_xlat1.x = u_xlat7 / (-u_xlat1.x);
    u_xlat7 = (-_OutlineOffset.xxyz.w) / _ProjectionParams.z;
    u_xlat7 = u_xlat0.z + u_xlat7;
    u_xlat0.z = (u_xlatb8) ? u_xlat1.x : u_xlat7;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xyw;
    gl_Position = u_xlat0;
    vs_TEXCOORD5.zw = u_xlat0.zw;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD2.xyz = vec3(0.0, 0.0, 0.0);
    u_xlat1.w = u_xlat1.y * 0.5;
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
uniform 	mediump vec4 _StarTex_ST;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump vec4 _WarpMask_ST;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _WarpSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DissolveEdgeHard;
uniform 	mediump vec4 _DissolveSpeed;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump sampler2D _StarTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WarpMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump float u_xlat16_2;
vec2 u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat0.x = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1000.0;
    u_xlat3.xy = u_xlat0.xx * _WarpSpeed.xy + _WarpTex_ST.zw;
    u_xlat0.xw = u_xlat0.xx * _DissolveSpeed.xy;
    u_xlat0.xw = u_xlat0.xw * _DissolveTex_ST.zw;
    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat3.xy = u_xlat1.xy * _WarpTex_ST.xy + u_xlat3.xy;
    u_xlat16_3 = texture(_WarpTex, u_xlat3.xy).x;
    u_xlat16_2 = u_xlat16_3 * 2.0 + -1.0;
    u_xlat16_2 = u_xlat16_2 * _WarpIntensity;
    u_xlat3.xy = u_xlat1.xy * _WarpMask_ST.xy + _WarpMask_ST.zw;
    u_xlat16_3 = texture(_WarpMask, u_xlat3.xy).x;
    u_xlat3.xy = vec2(u_xlat16_3) * vec2(u_xlat16_2) + u_xlat1.xy;
    u_xlat0.xw = u_xlat1.xy * _DissolveTex_ST.xy + u_xlat0.xw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xw).x;
    u_xlat16_2 = u_xlat16_0.x + _Cutoff;
    u_xlat16_2 = u_xlat16_2 + (-_DissolveEdgeHard);
    u_xlat0.xy = u_xlat3.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat16_0.xyz = texture(_StarTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_5.x = (-_DissolveEdgeHard) + 0.5;
    u_xlat16_5.x = float(1.0) / u_xlat16_5.x;
    u_xlat16_2 = u_xlat16_5.x * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_2 * -2.0 + 3.0;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_2;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_5.x;
    u_xlat16_2 = min(u_xlat16_2, 1.0);
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    u_xlat0.x = dot((-vs_TEXCOORD1.xyz), u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat16_5.x = max(_FresnelScale, 0.0);
    u_xlat16_5.x = u_xlat0.x * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_2 * u_xlat16_5.x;
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
uniform 	vec4 _WPOSpeed;
uniform 	vec4 _WPOTex_ST;
uniform 	float _WPOPower;
uniform 	mediump float _OutlineWidth;
uniform 	mediump vec3 _OutlineOffset;
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
UNITY_LOCATION(4) uniform mediump sampler2D _WPOTex;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec3 u_xlat6;
float u_xlat7;
bool u_xlatb8;
vec2 u_xlat12;
float u_xlat18;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat1.xy;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.z = 0.00999999978;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat1.xy * u_xlat0.xx + _OutlineOffset.xxyz.yz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2.xyz = u_xlat1.yyy * hlslcc_mtx4x4unity_MatrixVP[1].xyw;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixVP[0].xyw * u_xlat1.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixVP[2].xyw * u_xlat1.zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixVP[3].xyw * u_xlat1.www + u_xlat2.xyz;
    u_xlat3.x = float(0.5);
    u_xlat3.z = float(0.5);
    u_xlat3.y = _ProjectionParams.x;
    u_xlat4.xyz = u_xlat2.xyz * u_xlat3.xyz;
    u_xlat4.w = u_xlat4.y * 0.5;
    u_xlat12.xy = u_xlat4.zz + u_xlat4.xw;
    u_xlat12.xy = u_xlat12.xy / u_xlat2.zz;
    u_xlat12.xy = u_xlat12.xy * _WPOTex_ST.xy + _WPOTex_ST.zw;
    u_xlat12.xy = _Time.yy * _WPOSpeed.xy + u_xlat12.xy;
    u_xlat12.x = textureLod(_WPOTex, u_xlat12.xy, 0.0).x;
    u_xlat12.x = u_xlat12.x * 2.0 + -1.0;
    u_xlat12.x = u_xlat12.x * _WPOPower;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixV[3];
    u_xlat18 = u_xlat1.z / hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat2.x = float(1.0) / hlslcc_mtx4x4glstate_matrix_projection[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb8 = unity_OrthoParams.w==0.0;
#endif
    u_xlat12.y = (u_xlatb8) ? abs(u_xlat18) : abs(u_xlat2.x);
    u_xlat12.xy = u_xlat12.xy * vec2(0.100000001, 10.0);
    u_xlat18 = max(u_xlat12.y, 9.99999975e-05);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat16_5 = _OutlineWidth * 0.00999999978;
    u_xlat18 = u_xlat18 * u_xlat16_5;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat18) + u_xlat12.xx;
    u_xlat0.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat6.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixInvV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[0].xyz * u_xlat0.xxx + u_xlat6.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[3].xyz * u_xlat1.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.x = (-u_xlat0.w) + (-_OutlineOffset.xxyz.w);
    u_xlat7 = u_xlat1.x * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat7 = u_xlat0.w * u_xlat7;
    u_xlat1.x = u_xlat7 / (-u_xlat1.x);
    u_xlat7 = (-_OutlineOffset.xxyz.w) / _ProjectionParams.z;
    u_xlat7 = u_xlat0.z + u_xlat7;
    u_xlat0.z = (u_xlatb8) ? u_xlat1.x : u_xlat7;
    u_xlat1.xyz = u_xlat3.xyz * u_xlat0.xyw;
    gl_Position = u_xlat0;
    vs_TEXCOORD5.zw = u_xlat0.zw;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD2.xyz = vec3(0.0, 0.0, 0.0);
    u_xlat1.w = u_xlat1.y * 0.5;
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
uniform 	mediump vec4 _StarTex_ST;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelScale;
uniform 	mediump vec4 _WarpTex_ST;
uniform 	mediump vec4 _WarpMask_ST;
uniform 	mediump float _WarpIntensity;
uniform 	mediump vec4 _WarpSpeed;
uniform 	mediump vec4 _DissolveTex_ST;
uniform 	mediump float _DissolveEdgeHard;
uniform 	mediump vec4 _DissolveSpeed;
uniform 	mediump float _Cutoff;
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
UNITY_LOCATION(0) uniform mediump sampler2D _StarTex;
UNITY_LOCATION(1) uniform mediump sampler2D _WarpTex;
UNITY_LOCATION(2) uniform mediump sampler2D _WarpMask;
UNITY_LOCATION(3) uniform mediump sampler2D _DissolveTex;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec2 u_xlat1;
mediump float u_xlat16_2;
vec2 u_xlat3;
mediump float u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_5;
void main()
{
    u_xlat0.x = _Time.y * 0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat0.x>=(-u_xlat0.x));
#else
    u_xlatb3 = u_xlat0.x>=(-u_xlat0.x);
#endif
    u_xlat0.x = fract(abs(u_xlat0.x));
    u_xlat0.x = (u_xlatb3) ? u_xlat0.x : (-u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 1000.0;
    u_xlat3.xy = u_xlat0.xx * _WarpSpeed.xy + _WarpTex_ST.zw;
    u_xlat0.xw = u_xlat0.xx * _DissolveSpeed.xy;
    u_xlat0.xw = u_xlat0.xw * _DissolveTex_ST.zw;
    u_xlat1.xy = vs_TEXCOORD5.xy / vs_TEXCOORD5.ww;
    u_xlat3.xy = u_xlat1.xy * _WarpTex_ST.xy + u_xlat3.xy;
    u_xlat16_3 = texture(_WarpTex, u_xlat3.xy).x;
    u_xlat16_2 = u_xlat16_3 * 2.0 + -1.0;
    u_xlat16_2 = u_xlat16_2 * _WarpIntensity;
    u_xlat3.xy = u_xlat1.xy * _WarpMask_ST.xy + _WarpMask_ST.zw;
    u_xlat16_3 = texture(_WarpMask, u_xlat3.xy).x;
    u_xlat3.xy = vec2(u_xlat16_3) * vec2(u_xlat16_2) + u_xlat1.xy;
    u_xlat0.xw = u_xlat1.xy * _DissolveTex_ST.xy + u_xlat0.xw;
    u_xlat16_0.x = texture(_DissolveTex, u_xlat0.xw).x;
    u_xlat16_2 = u_xlat16_0.x + _Cutoff;
    u_xlat16_2 = u_xlat16_2 + (-_DissolveEdgeHard);
    u_xlat0.xy = u_xlat3.xy * _StarTex_ST.xy + _StarTex_ST.zw;
    u_xlat16_0.xyz = texture(_StarTex, u_xlat0.xy).xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_5.x = (-_DissolveEdgeHard) + 0.5;
    u_xlat16_5.x = float(1.0) / u_xlat16_5.x;
    u_xlat16_2 = u_xlat16_5.x * u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_5.x = u_xlat16_2 * -2.0 + 3.0;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_2;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_5.x;
    u_xlat16_2 = min(u_xlat16_2, 1.0);
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_5.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_5.x = inversesqrt(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat0.xyz * u_xlat16_5.xxx;
    u_xlat0.x = dot((-vs_TEXCOORD1.xyz), u_xlat16_5.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnelPower;
    u_xlat16_5.x = max(_FresnelScale, 0.0);
    u_xlat16_5.x = u_xlat0.x * u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat16_2 * u_xlat16_5.x;
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
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_MeshEffect_DistortOutline_StarryGUI"
}