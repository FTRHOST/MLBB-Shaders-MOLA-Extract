//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/VFX/ParticleEffect_Refraction" {
Properties {

[Toggle(_REQUIRE_CUSTOMDATA)] _REQUIRE_CUSTOMDATA ("开启CustomData", Float) = 0.0

[Space(5)] [Header(Costom1.XYZW)] [Space(10)] _FlowSpeed ("流动速度: 遮罩1XY,遮罩2XY", Vector) = (0,0,0,0)

[Header(Costom2.XYZ)] [Space(10)] _IOR ("折射率", Range(-1, 1)) = -0.15000000596046448

_NormalScale ("法线范围", Range(0.01, 1)) = 0.0

_NormalInfluenceIntensity ("法线影响折射强度", Range(0, 2)) = 0.0

[Space(20)] _Color ("整体颜色", Color) = (0,0,0,1)

_normalMap ("normalMap", 2D) = "bump" { }

_RefractionMask ("折射遮罩", 2D) = "white" { }

_RefractionMask2 ("折射遮罩2", 2D) = "white" { }

_AlphaMask ("Alpha遮罩", 2D) = "white" { }

_NoiseTex ("Noise贴图", 2D) = "white" { }

_NoiseXStrength ("扭曲强度U", Range(-10, 10)) = 0.0

_NoiseYStrength ("扭曲强度V", Range(-10, 10)) = 0.0

_GChannel ("xy:扰动Tiling zw:扰动速度", Vector) = (0,0,0,0)

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

[Enum(Off, 0, On, 1)] _MLZWrite ("ZWrite", Float) = 0.0

[Enum(On, 0,Off, 4)] _MLZTest ("总是最前", Float) = 4.0

}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 GrabPass {
 "_GrabTexture"
}
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 18871
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _RefractionMask;
UNITY_LOCATION(3) uniform mediump sampler2D _RefractionMask2;
UNITY_LOCATION(4) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(5) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_9;
vec2 u_xlat15;
mediump float u_xlat16_15;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.x = max(_NormalScale, 0.00999999978);
    u_xlat16_1.xyz = texture(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_0.xx * u_xlat16_7.xy;
    u_xlat16_0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.z = vs_TEXCOORD2.z;
    u_xlat16_21 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_21) + vs_TEXCOORD3.yzx;
    u_xlat22 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat22 = max(u_xlat22, 1.17549435e-38);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat4.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vs_TEXCOORD3.www;
    u_xlat1.y = u_xlat4.z;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.z = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat5.x = u_xlat3.z;
    u_xlat5.y = u_xlat4.x;
    u_xlat3.y = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD2.x;
    u_xlat1.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat1.y = dot(u_xlat16_0.xyz, u_xlat3.xyz);
    u_xlat15.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15.x = max(u_xlat15.x, 1.17549435e-38);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat1.xy = u_xlat15.xx * u_xlat1.xy;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat3.xyz;
    u_xlat16_21 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_2.xyz = vec3(u_xlat16_21) * vs_TEXCOORD2.xyz;
    u_xlat15.x = dot(u_xlat16_0.xyz, u_xlat16_2.xyz);
    u_xlat22 = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat3.x = _IOR * _IOR;
    u_xlat22 = (-u_xlat3.x) * u_xlat22 + 1.0;
    u_xlat3.x = sqrt(u_xlat22);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=0.0);
#else
    u_xlatb22 = u_xlat22>=0.0;
#endif
    u_xlat15.x = _IOR * u_xlat15.x + u_xlat3.x;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat15.xxx;
    u_xlat3.xyz = vec3(_IOR) * u_xlat16_0.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = bool(u_xlatb22) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
    u_xlat4.y = dot(vs_TEXCOORD4.xyz, u_xlat3.xyz);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_NormalInfluenceIntensity, _NormalInfluenceIntensity)) + u_xlat4.xy;
    u_xlat15.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat15.x>=(-u_xlat15.x));
#else
    u_xlatb22 = u_xlat15.x>=(-u_xlat15.x);
#endif
    u_xlat15.x = fract(abs(u_xlat15.x));
    u_xlat15.x = (u_xlatb22) ? u_xlat15.x : (-u_xlat15.x);
    u_xlat15.x = u_xlat15.x * 3600.0;
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_0.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat0 = u_xlat15.xxxx * _FlowSpeed + u_xlat16_0;
    u_xlat15.xy = _GChannel.zw * _Time.yy;
    u_xlat15.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat15.xy;
    u_xlat16_15 = texture(_NoiseTex, u_xlat15.xy).y;
    u_xlat0 = vec4(u_xlat16_15) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat0;
    u_xlat16_22 = texture(_RefractionMask, u_xlat0.xy).x;
    u_xlat16_3 = texture(_RefractionMask2, u_xlat0.zw).x;
    u_xlat16_2.x = u_xlat16_22 * u_xlat16_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_2.xx + u_xlat3.xy;
    u_xlat16_1.xyw = texture(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat16_9.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz + u_xlat16_1.xyw;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat1.xy = vec2(u_xlat16_15) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_2.xy;
    u_xlat16_1.x = texture(_AlphaMask, u_xlat1.xy).x;
    u_xlat16_2.x = vs_TEXCOORD5.w;
    u_xlat16_2.x = u_xlat16_2.x * _Color.w;
    u_xlat0.w = u_xlat16_1.x * u_xlat16_2.x;
    SV_Target0 = u_xlat0;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _RefractionMask;
UNITY_LOCATION(3) uniform mediump sampler2D _RefractionMask2;
UNITY_LOCATION(4) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(5) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_9;
vec2 u_xlat15;
mediump float u_xlat16_15;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.x = max(_NormalScale, 0.00999999978);
    u_xlat16_1.xyz = texture(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_0.xx * u_xlat16_7.xy;
    u_xlat16_0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.z = vs_TEXCOORD2.z;
    u_xlat16_21 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_21) + vs_TEXCOORD3.yzx;
    u_xlat22 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat22 = max(u_xlat22, 1.17549435e-38);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat4.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vs_TEXCOORD3.www;
    u_xlat1.y = u_xlat4.z;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.z = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat5.x = u_xlat3.z;
    u_xlat5.y = u_xlat4.x;
    u_xlat3.y = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD2.x;
    u_xlat1.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat1.y = dot(u_xlat16_0.xyz, u_xlat3.xyz);
    u_xlat15.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15.x = max(u_xlat15.x, 1.17549435e-38);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat1.xy = u_xlat15.xx * u_xlat1.xy;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat3.xyz;
    u_xlat16_21 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_2.xyz = vec3(u_xlat16_21) * vs_TEXCOORD2.xyz;
    u_xlat15.x = dot(u_xlat16_0.xyz, u_xlat16_2.xyz);
    u_xlat22 = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat3.x = _IOR * _IOR;
    u_xlat22 = (-u_xlat3.x) * u_xlat22 + 1.0;
    u_xlat3.x = sqrt(u_xlat22);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=0.0);
#else
    u_xlatb22 = u_xlat22>=0.0;
#endif
    u_xlat15.x = _IOR * u_xlat15.x + u_xlat3.x;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat15.xxx;
    u_xlat3.xyz = vec3(_IOR) * u_xlat16_0.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = bool(u_xlatb22) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
    u_xlat4.y = dot(vs_TEXCOORD4.xyz, u_xlat3.xyz);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_NormalInfluenceIntensity, _NormalInfluenceIntensity)) + u_xlat4.xy;
    u_xlat15.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat15.x>=(-u_xlat15.x));
#else
    u_xlatb22 = u_xlat15.x>=(-u_xlat15.x);
#endif
    u_xlat15.x = fract(abs(u_xlat15.x));
    u_xlat15.x = (u_xlatb22) ? u_xlat15.x : (-u_xlat15.x);
    u_xlat15.x = u_xlat15.x * 3600.0;
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_0.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat0 = u_xlat15.xxxx * _FlowSpeed + u_xlat16_0;
    u_xlat15.xy = _GChannel.zw * _Time.yy;
    u_xlat15.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat15.xy;
    u_xlat16_15 = texture(_NoiseTex, u_xlat15.xy).y;
    u_xlat0 = vec4(u_xlat16_15) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat0;
    u_xlat16_22 = texture(_RefractionMask, u_xlat0.xy).x;
    u_xlat16_3 = texture(_RefractionMask2, u_xlat0.zw).x;
    u_xlat16_2.x = u_xlat16_22 * u_xlat16_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_2.xx + u_xlat3.xy;
    u_xlat16_1.xyw = texture(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat16_9.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz + u_xlat16_1.xyw;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat1.xy = vec2(u_xlat16_15) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_2.xy;
    u_xlat16_1.x = texture(_AlphaMask, u_xlat1.xy).x;
    u_xlat16_2.x = vs_TEXCOORD5.w;
    u_xlat16_2.x = u_xlat16_2.x * _Color.w;
    u_xlat0.w = u_xlat16_1.x * u_xlat16_2.x;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _normalMap;
uniform lowp sampler2D _RefractionMask;
uniform lowp sampler2D _RefractionMask2;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _AlphaMask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_9;
vec2 u_xlat15;
lowp float u_xlat10_15;
mediump float u_xlat16_21;
float u_xlat22;
lowp float u_xlat10_22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.x = max(_NormalScale, 0.00999999978);
    u_xlat10_1.xyz = texture2D(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_0.xx * u_xlat16_7.xy;
    u_xlat16_0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.z = vs_TEXCOORD2.z;
    u_xlat16_21 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_21) + vs_TEXCOORD3.yzx;
    u_xlat22 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat22 = max(u_xlat22, 1.17549435e-38);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat4.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vs_TEXCOORD3.www;
    u_xlat1.y = u_xlat4.z;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.z = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat5.x = u_xlat3.z;
    u_xlat5.y = u_xlat4.x;
    u_xlat3.y = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD2.x;
    u_xlat1.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat1.y = dot(u_xlat16_0.xyz, u_xlat3.xyz);
    u_xlat15.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15.x = max(u_xlat15.x, 1.17549435e-38);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat1.xy = u_xlat15.xx * u_xlat1.xy;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat3.xyz;
    u_xlat16_21 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_2.xyz = vec3(u_xlat16_21) * vs_TEXCOORD2.xyz;
    u_xlat15.x = dot(u_xlat16_0.xyz, u_xlat16_2.xyz);
    u_xlat22 = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat3.x = _IOR * _IOR;
    u_xlat22 = (-u_xlat3.x) * u_xlat22 + 1.0;
    u_xlat3.x = sqrt(u_xlat22);
    u_xlatb22 = u_xlat22>=0.0;
    u_xlat15.x = _IOR * u_xlat15.x + u_xlat3.x;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat15.xxx;
    u_xlat3.xyz = vec3(_IOR) * u_xlat16_0.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = bool(u_xlatb22) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
    u_xlat4.y = dot(vs_TEXCOORD4.xyz, u_xlat3.xyz);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_NormalInfluenceIntensity, _NormalInfluenceIntensity)) + u_xlat4.xy;
    u_xlat15.x = _Time.y * 0.000277777785;
    u_xlatb22 = u_xlat15.x>=(-u_xlat15.x);
    u_xlat15.x = fract(abs(u_xlat15.x));
    u_xlat15.x = (u_xlatb22) ? u_xlat15.x : (-u_xlat15.x);
    u_xlat15.x = u_xlat15.x * 3600.0;
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_0.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat0 = u_xlat15.xxxx * _FlowSpeed + u_xlat16_0;
    u_xlat15.xy = _Time.yy * _GChannel.zw;
    u_xlat15.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat15.xy;
    u_xlat10_15 = texture2D(_NoiseTex, u_xlat15.xy).y;
    u_xlat0 = vec4(u_xlat10_15) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat0;
    u_xlat10_22 = texture2D(_RefractionMask, u_xlat0.xy).x;
    u_xlat10_3 = texture2D(_RefractionMask2, u_xlat0.zw).x;
    u_xlat16_2.x = u_xlat10_22 * u_xlat10_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_2.xx + u_xlat3.xy;
    u_xlat10_1.xyw = texture2D(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat16_9.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz + u_xlat10_1.xyw;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat1.xy = vec2(u_xlat10_15) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_2.xy;
    u_xlat10_1.x = texture2D(_AlphaMask, u_xlat1.xy).x;
    u_xlat16_2.x = vs_TEXCOORD5.w;
    u_xlat16_2.x = u_xlat16_2.x * _Color.w;
    u_xlat0.w = u_xlat10_1.x * u_xlat16_2.x;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _normalMap;
uniform lowp sampler2D _RefractionMask;
uniform lowp sampler2D _RefractionMask2;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _AlphaMask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_9;
vec2 u_xlat15;
lowp float u_xlat10_15;
mediump float u_xlat16_21;
float u_xlat22;
lowp float u_xlat10_22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.x = max(_NormalScale, 0.00999999978);
    u_xlat10_1.xyz = texture2D(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_0.xx * u_xlat16_7.xy;
    u_xlat16_0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.z = vs_TEXCOORD2.z;
    u_xlat16_21 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_21) + vs_TEXCOORD3.yzx;
    u_xlat22 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat22 = max(u_xlat22, 1.17549435e-38);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat4.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vs_TEXCOORD3.www;
    u_xlat1.y = u_xlat4.z;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.z = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat5.x = u_xlat3.z;
    u_xlat5.y = u_xlat4.x;
    u_xlat3.y = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD2.x;
    u_xlat1.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat1.y = dot(u_xlat16_0.xyz, u_xlat3.xyz);
    u_xlat15.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15.x = max(u_xlat15.x, 1.17549435e-38);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat1.xy = u_xlat15.xx * u_xlat1.xy;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat3.xyz;
    u_xlat16_21 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_2.xyz = vec3(u_xlat16_21) * vs_TEXCOORD2.xyz;
    u_xlat15.x = dot(u_xlat16_0.xyz, u_xlat16_2.xyz);
    u_xlat22 = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat3.x = _IOR * _IOR;
    u_xlat22 = (-u_xlat3.x) * u_xlat22 + 1.0;
    u_xlat3.x = sqrt(u_xlat22);
    u_xlatb22 = u_xlat22>=0.0;
    u_xlat15.x = _IOR * u_xlat15.x + u_xlat3.x;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat15.xxx;
    u_xlat3.xyz = vec3(_IOR) * u_xlat16_0.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = bool(u_xlatb22) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
    u_xlat4.y = dot(vs_TEXCOORD4.xyz, u_xlat3.xyz);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_NormalInfluenceIntensity, _NormalInfluenceIntensity)) + u_xlat4.xy;
    u_xlat15.x = _Time.y * 0.000277777785;
    u_xlatb22 = u_xlat15.x>=(-u_xlat15.x);
    u_xlat15.x = fract(abs(u_xlat15.x));
    u_xlat15.x = (u_xlatb22) ? u_xlat15.x : (-u_xlat15.x);
    u_xlat15.x = u_xlat15.x * 3600.0;
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_0.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat0 = u_xlat15.xxxx * _FlowSpeed + u_xlat16_0;
    u_xlat15.xy = _Time.yy * _GChannel.zw;
    u_xlat15.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat15.xy;
    u_xlat10_15 = texture2D(_NoiseTex, u_xlat15.xy).y;
    u_xlat0 = vec4(u_xlat10_15) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat0;
    u_xlat10_22 = texture2D(_RefractionMask, u_xlat0.xy).x;
    u_xlat10_3 = texture2D(_RefractionMask2, u_xlat0.zw).x;
    u_xlat16_2.x = u_xlat10_22 * u_xlat10_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_2.xx + u_xlat3.xy;
    u_xlat10_1.xyw = texture2D(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat16_9.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz + u_xlat10_1.xyw;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat1.xy = vec2(u_xlat10_15) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_2.xy;
    u_xlat10_1.x = texture2D(_AlphaMask, u_xlat1.xy).x;
    u_xlat16_2.x = vs_TEXCOORD5.w;
    u_xlat16_2.x = u_xlat16_2.x * _Color.w;
    u_xlat0.w = u_xlat10_1.x * u_xlat16_2.x;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_REQUIRE_CUSTOMDATA" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
out mediump vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
    vs_TEXCOORD7 = in_TEXCOORD1;
    vs_TEXCOORD8 = in_TEXCOORD2;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _RefractionMask;
UNITY_LOCATION(3) uniform mediump sampler2D _RefractionMask2;
UNITY_LOCATION(4) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(5) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in mediump vec4 vs_TEXCOORD7;
in mediump vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_12;
vec2 u_xlat14;
mediump float u_xlat16_14;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD2.yzx) * u_xlat16_1.xxx + vs_TEXCOORD3.yzx;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD2.zxy;
    u_xlat3.xyz = vs_TEXCOORD2.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vs_TEXCOORD3.www;
    u_xlat0.y = u_xlat3.z;
    u_xlat0.x = u_xlat2.y;
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vs_TEXCOORD8.xyz + vec3(_IOR, _NormalScale, _NormalInfluenceIntensity);
    u_xlat16_22 = max(u_xlat16_5.y, 0.00999999978);
    u_xlat16_1.xy = vec2(u_xlat16_22) * u_xlat16_1.xy;
    u_xlat16_22 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat2.z;
    u_xlat4.y = u_xlat3.x;
    u_xlat2.y = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD2.x;
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat2.z = vs_TEXCOORD2.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat14.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat14.x = max(u_xlat14.x, 1.17549435e-38);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat0.xy = u_xlat14.xx * u_xlat0.xy;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_22 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_6.xyz = vec3(u_xlat16_22) * vs_TEXCOORD2.xyz;
    u_xlat14.x = dot(u_xlat16_1.xyz, u_xlat16_6.xyz);
    u_xlat21 = (-u_xlat14.x) * u_xlat14.x + 1.0;
    u_xlat2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat21 = (-u_xlat2.x) * u_xlat21 + 1.0;
    u_xlat2.x = sqrt(u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21>=0.0);
#else
    u_xlatb21 = u_xlat21>=0.0;
#endif
    u_xlat14.x = u_xlat16_5.x * u_xlat14.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat14.xxx;
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat16_1.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = bool(u_xlatb21) ? u_xlat2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat3.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat3.y = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat14.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb21 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : (-u_xlat14.x);
    u_xlat14.x = u_xlat14.x * 3600.0;
    u_xlat16_1 = vs_TEXCOORD7 + _FlowSpeed;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_2.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat1 = u_xlat14.xxxx * u_xlat16_1 + u_xlat16_2;
    u_xlat14.xy = _GChannel.zw * _Time.yy;
    u_xlat14.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat14.xy;
    u_xlat16_14 = texture(_NoiseTex, u_xlat14.xy).y;
    u_xlat1 = vec4(u_xlat16_14) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat1;
    u_xlat16_21 = texture(_RefractionMask, u_xlat1.xy).x;
    u_xlat16_3 = texture(_RefractionMask2, u_xlat1.zw).x;
    u_xlat16_5.x = u_xlat16_21 * u_xlat16_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat16_0.xyw = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_12.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat16_0.xyw;
    u_xlat16_5.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat0.xy = vec2(u_xlat16_14) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_5.xy;
    u_xlat16_0.x = texture(_AlphaMask, u_xlat0.xy).x;
    u_xlat16_5.x = vs_TEXCOORD5.w;
    u_xlat16_5.x = u_xlat16_5.x * _Color.w;
    u_xlat1.w = u_xlat16_0.x * u_xlat16_5.x;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_REQUIRE_CUSTOMDATA" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
out mediump vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
    vs_TEXCOORD7 = in_TEXCOORD1;
    vs_TEXCOORD8 = in_TEXCOORD2;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _RefractionMask;
UNITY_LOCATION(3) uniform mediump sampler2D _RefractionMask2;
UNITY_LOCATION(4) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(5) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in mediump vec4 vs_TEXCOORD7;
in mediump vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_12;
vec2 u_xlat14;
mediump float u_xlat16_14;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD2.yzx) * u_xlat16_1.xxx + vs_TEXCOORD3.yzx;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD2.zxy;
    u_xlat3.xyz = vs_TEXCOORD2.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vs_TEXCOORD3.www;
    u_xlat0.y = u_xlat3.z;
    u_xlat0.x = u_xlat2.y;
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vs_TEXCOORD8.xyz + vec3(_IOR, _NormalScale, _NormalInfluenceIntensity);
    u_xlat16_22 = max(u_xlat16_5.y, 0.00999999978);
    u_xlat16_1.xy = vec2(u_xlat16_22) * u_xlat16_1.xy;
    u_xlat16_22 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat2.z;
    u_xlat4.y = u_xlat3.x;
    u_xlat2.y = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD2.x;
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat2.z = vs_TEXCOORD2.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat14.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat14.x = max(u_xlat14.x, 1.17549435e-38);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat0.xy = u_xlat14.xx * u_xlat0.xy;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_22 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_6.xyz = vec3(u_xlat16_22) * vs_TEXCOORD2.xyz;
    u_xlat14.x = dot(u_xlat16_1.xyz, u_xlat16_6.xyz);
    u_xlat21 = (-u_xlat14.x) * u_xlat14.x + 1.0;
    u_xlat2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat21 = (-u_xlat2.x) * u_xlat21 + 1.0;
    u_xlat2.x = sqrt(u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21>=0.0);
#else
    u_xlatb21 = u_xlat21>=0.0;
#endif
    u_xlat14.x = u_xlat16_5.x * u_xlat14.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat14.xxx;
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat16_1.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = bool(u_xlatb21) ? u_xlat2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat3.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat3.y = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat14.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb21 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : (-u_xlat14.x);
    u_xlat14.x = u_xlat14.x * 3600.0;
    u_xlat16_1 = vs_TEXCOORD7 + _FlowSpeed;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_2.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat1 = u_xlat14.xxxx * u_xlat16_1 + u_xlat16_2;
    u_xlat14.xy = _GChannel.zw * _Time.yy;
    u_xlat14.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat14.xy;
    u_xlat16_14 = texture(_NoiseTex, u_xlat14.xy).y;
    u_xlat1 = vec4(u_xlat16_14) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat1;
    u_xlat16_21 = texture(_RefractionMask, u_xlat1.xy).x;
    u_xlat16_3 = texture(_RefractionMask2, u_xlat1.zw).x;
    u_xlat16_5.x = u_xlat16_21 * u_xlat16_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat16_0.xyw = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_12.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat16_0.xyw;
    u_xlat16_5.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat0.xy = vec2(u_xlat16_14) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_5.xy;
    u_xlat16_0.x = texture(_AlphaMask, u_xlat0.xy).x;
    u_xlat16_5.x = vs_TEXCOORD5.w;
    u_xlat16_5.x = u_xlat16_5.x * _Color.w;
    u_xlat1.w = u_xlat16_0.x * u_xlat16_5.x;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_REQUIRE_CUSTOMDATA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_TEXCOORD7;
varying mediump vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
    vs_TEXCOORD7 = in_TEXCOORD1;
    vs_TEXCOORD8 = in_TEXCOORD2;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _normalMap;
uniform lowp sampler2D _RefractionMask;
uniform lowp sampler2D _RefractionMask2;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _AlphaMask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_TEXCOORD7;
varying mediump vec4 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_12;
vec2 u_xlat14;
lowp float u_xlat10_14;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD2.yzx) * u_xlat16_1.xxx + vs_TEXCOORD3.yzx;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD2.zxy;
    u_xlat3.xyz = vs_TEXCOORD2.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vs_TEXCOORD3.www;
    u_xlat0.y = u_xlat3.z;
    u_xlat0.x = u_xlat2.y;
    u_xlat10_4.xyz = texture2D(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vs_TEXCOORD8.xyz + vec3(_IOR, _NormalScale, _NormalInfluenceIntensity);
    u_xlat16_22 = max(u_xlat16_5.y, 0.00999999978);
    u_xlat16_1.xy = vec2(u_xlat16_22) * u_xlat16_1.xy;
    u_xlat16_22 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat2.z;
    u_xlat4.y = u_xlat3.x;
    u_xlat2.y = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD2.x;
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat2.z = vs_TEXCOORD2.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat14.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat14.x = max(u_xlat14.x, 1.17549435e-38);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat0.xy = u_xlat14.xx * u_xlat0.xy;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_22 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_6.xyz = vec3(u_xlat16_22) * vs_TEXCOORD2.xyz;
    u_xlat14.x = dot(u_xlat16_1.xyz, u_xlat16_6.xyz);
    u_xlat21 = (-u_xlat14.x) * u_xlat14.x + 1.0;
    u_xlat2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat21 = (-u_xlat2.x) * u_xlat21 + 1.0;
    u_xlat2.x = sqrt(u_xlat21);
    u_xlatb21 = u_xlat21>=0.0;
    u_xlat14.x = u_xlat16_5.x * u_xlat14.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat14.xxx;
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat16_1.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = bool(u_xlatb21) ? u_xlat2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat3.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat3.y = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat14.x = _Time.y * 0.000277777785;
    u_xlatb21 = u_xlat14.x>=(-u_xlat14.x);
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : (-u_xlat14.x);
    u_xlat14.x = u_xlat14.x * 3600.0;
    u_xlat16_1 = vs_TEXCOORD7 + _FlowSpeed;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_2.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat1 = u_xlat14.xxxx * u_xlat16_1 + u_xlat16_2;
    u_xlat14.xy = _Time.yy * _GChannel.zw;
    u_xlat14.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat14.xy;
    u_xlat10_14 = texture2D(_NoiseTex, u_xlat14.xy).y;
    u_xlat1 = vec4(u_xlat10_14) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat1;
    u_xlat10_21 = texture2D(_RefractionMask, u_xlat1.xy).x;
    u_xlat10_3 = texture2D(_RefractionMask2, u_xlat1.zw).x;
    u_xlat16_5.x = u_xlat10_21 * u_xlat10_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat10_0.xyw = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_12.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat10_0.xyw;
    u_xlat16_5.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat0.xy = vec2(u_xlat10_14) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_5.xy;
    u_xlat10_0.x = texture2D(_AlphaMask, u_xlat0.xy).x;
    u_xlat16_5.x = vs_TEXCOORD5.w;
    u_xlat16_5.x = u_xlat16_5.x * _Color.w;
    u_xlat1.w = u_xlat10_0.x * u_xlat16_5.x;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_REQUIRE_CUSTOMDATA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_TEXCOORD7;
varying mediump vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
    vs_TEXCOORD7 = in_TEXCOORD1;
    vs_TEXCOORD8 = in_TEXCOORD2;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _normalMap;
uniform lowp sampler2D _RefractionMask;
uniform lowp sampler2D _RefractionMask2;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _AlphaMask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_TEXCOORD7;
varying mediump vec4 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_12;
vec2 u_xlat14;
lowp float u_xlat10_14;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD2.yzx) * u_xlat16_1.xxx + vs_TEXCOORD3.yzx;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD2.zxy;
    u_xlat3.xyz = vs_TEXCOORD2.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vs_TEXCOORD3.www;
    u_xlat0.y = u_xlat3.z;
    u_xlat0.x = u_xlat2.y;
    u_xlat10_4.xyz = texture2D(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vs_TEXCOORD8.xyz + vec3(_IOR, _NormalScale, _NormalInfluenceIntensity);
    u_xlat16_22 = max(u_xlat16_5.y, 0.00999999978);
    u_xlat16_1.xy = vec2(u_xlat16_22) * u_xlat16_1.xy;
    u_xlat16_22 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat2.z;
    u_xlat4.y = u_xlat3.x;
    u_xlat2.y = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD2.x;
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat2.z = vs_TEXCOORD2.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat14.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat14.x = max(u_xlat14.x, 1.17549435e-38);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat0.xy = u_xlat14.xx * u_xlat0.xy;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_22 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_6.xyz = vec3(u_xlat16_22) * vs_TEXCOORD2.xyz;
    u_xlat14.x = dot(u_xlat16_1.xyz, u_xlat16_6.xyz);
    u_xlat21 = (-u_xlat14.x) * u_xlat14.x + 1.0;
    u_xlat2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat21 = (-u_xlat2.x) * u_xlat21 + 1.0;
    u_xlat2.x = sqrt(u_xlat21);
    u_xlatb21 = u_xlat21>=0.0;
    u_xlat14.x = u_xlat16_5.x * u_xlat14.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat14.xxx;
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat16_1.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = bool(u_xlatb21) ? u_xlat2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat3.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat3.y = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat14.x = _Time.y * 0.000277777785;
    u_xlatb21 = u_xlat14.x>=(-u_xlat14.x);
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : (-u_xlat14.x);
    u_xlat14.x = u_xlat14.x * 3600.0;
    u_xlat16_1 = vs_TEXCOORD7 + _FlowSpeed;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_2.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat1 = u_xlat14.xxxx * u_xlat16_1 + u_xlat16_2;
    u_xlat14.xy = _Time.yy * _GChannel.zw;
    u_xlat14.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat14.xy;
    u_xlat10_14 = texture2D(_NoiseTex, u_xlat14.xy).y;
    u_xlat1 = vec4(u_xlat10_14) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat1;
    u_xlat10_21 = texture2D(_RefractionMask, u_xlat1.xy).x;
    u_xlat10_3 = texture2D(_RefractionMask2, u_xlat1.zw).x;
    u_xlat16_5.x = u_xlat10_21 * u_xlat10_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat10_0.xyw = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_12.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat10_0.xyw;
    u_xlat16_5.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat0.xy = vec2(u_xlat10_14) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_5.xy;
    u_xlat10_0.x = texture2D(_AlphaMask, u_xlat0.xy).x;
    u_xlat16_5.x = vs_TEXCOORD5.w;
    u_xlat16_5.x = u_xlat16_5.x * _Color.w;
    u_xlat1.w = u_xlat10_0.x * u_xlat16_5.x;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _RefractionMask;
UNITY_LOCATION(3) uniform mediump sampler2D _RefractionMask2;
UNITY_LOCATION(4) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(5) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_9;
vec2 u_xlat15;
mediump float u_xlat16_15;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.x = max(_NormalScale, 0.00999999978);
    u_xlat16_1.xyz = texture(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_0.xx * u_xlat16_7.xy;
    u_xlat16_0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.z = vs_TEXCOORD2.z;
    u_xlat16_21 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_21) + vs_TEXCOORD3.yzx;
    u_xlat22 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat22 = max(u_xlat22, 1.17549435e-38);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat4.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vs_TEXCOORD3.www;
    u_xlat1.y = u_xlat4.z;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.z = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat5.x = u_xlat3.z;
    u_xlat5.y = u_xlat4.x;
    u_xlat3.y = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD2.x;
    u_xlat1.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat1.y = dot(u_xlat16_0.xyz, u_xlat3.xyz);
    u_xlat15.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15.x = max(u_xlat15.x, 1.17549435e-38);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat1.xy = u_xlat15.xx * u_xlat1.xy;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat3.xyz;
    u_xlat16_21 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_2.xyz = vec3(u_xlat16_21) * vs_TEXCOORD2.xyz;
    u_xlat15.x = dot(u_xlat16_0.xyz, u_xlat16_2.xyz);
    u_xlat22 = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat3.x = _IOR * _IOR;
    u_xlat22 = (-u_xlat3.x) * u_xlat22 + 1.0;
    u_xlat3.x = sqrt(u_xlat22);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=0.0);
#else
    u_xlatb22 = u_xlat22>=0.0;
#endif
    u_xlat15.x = _IOR * u_xlat15.x + u_xlat3.x;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat15.xxx;
    u_xlat3.xyz = vec3(_IOR) * u_xlat16_0.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = bool(u_xlatb22) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
    u_xlat4.y = dot(vs_TEXCOORD4.xyz, u_xlat3.xyz);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_NormalInfluenceIntensity, _NormalInfluenceIntensity)) + u_xlat4.xy;
    u_xlat15.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat15.x>=(-u_xlat15.x));
#else
    u_xlatb22 = u_xlat15.x>=(-u_xlat15.x);
#endif
    u_xlat15.x = fract(abs(u_xlat15.x));
    u_xlat15.x = (u_xlatb22) ? u_xlat15.x : (-u_xlat15.x);
    u_xlat15.x = u_xlat15.x * 3600.0;
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_0.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat0 = u_xlat15.xxxx * _FlowSpeed + u_xlat16_0;
    u_xlat15.xy = _GChannel.zw * _Time.yy;
    u_xlat15.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat15.xy;
    u_xlat16_15 = texture(_NoiseTex, u_xlat15.xy).y;
    u_xlat0 = vec4(u_xlat16_15) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat0;
    u_xlat16_22 = texture(_RefractionMask, u_xlat0.xy).x;
    u_xlat16_3 = texture(_RefractionMask2, u_xlat0.zw).x;
    u_xlat16_2.x = u_xlat16_22 * u_xlat16_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_2.xx + u_xlat3.xy;
    u_xlat16_1.xyw = texture(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat16_9.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz + u_xlat16_1.xyw;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat1.xy = vec2(u_xlat16_15) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_2.xy;
    u_xlat16_1.x = texture(_AlphaMask, u_xlat1.xy).x;
    u_xlat16_2.x = vs_TEXCOORD5.w;
    u_xlat16_2.x = u_xlat16_2.x * _Color.w;
    u_xlat0.w = u_xlat16_1.x * u_xlat16_2.x;
    SV_Target0 = u_xlat0;
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _RefractionMask;
UNITY_LOCATION(3) uniform mediump sampler2D _RefractionMask2;
UNITY_LOCATION(4) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(5) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_9;
vec2 u_xlat15;
mediump float u_xlat16_15;
mediump float u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.x = max(_NormalScale, 0.00999999978);
    u_xlat16_1.xyz = texture(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_0.xx * u_xlat16_7.xy;
    u_xlat16_0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.z = vs_TEXCOORD2.z;
    u_xlat16_21 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_21) + vs_TEXCOORD3.yzx;
    u_xlat22 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat22 = max(u_xlat22, 1.17549435e-38);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat4.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vs_TEXCOORD3.www;
    u_xlat1.y = u_xlat4.z;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.z = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat5.x = u_xlat3.z;
    u_xlat5.y = u_xlat4.x;
    u_xlat3.y = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD2.x;
    u_xlat1.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat1.y = dot(u_xlat16_0.xyz, u_xlat3.xyz);
    u_xlat15.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15.x = max(u_xlat15.x, 1.17549435e-38);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat1.xy = u_xlat15.xx * u_xlat1.xy;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat3.xyz;
    u_xlat16_21 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_2.xyz = vec3(u_xlat16_21) * vs_TEXCOORD2.xyz;
    u_xlat15.x = dot(u_xlat16_0.xyz, u_xlat16_2.xyz);
    u_xlat22 = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat3.x = _IOR * _IOR;
    u_xlat22 = (-u_xlat3.x) * u_xlat22 + 1.0;
    u_xlat3.x = sqrt(u_xlat22);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat22>=0.0);
#else
    u_xlatb22 = u_xlat22>=0.0;
#endif
    u_xlat15.x = _IOR * u_xlat15.x + u_xlat3.x;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat15.xxx;
    u_xlat3.xyz = vec3(_IOR) * u_xlat16_0.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = bool(u_xlatb22) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
    u_xlat4.y = dot(vs_TEXCOORD4.xyz, u_xlat3.xyz);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_NormalInfluenceIntensity, _NormalInfluenceIntensity)) + u_xlat4.xy;
    u_xlat15.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat15.x>=(-u_xlat15.x));
#else
    u_xlatb22 = u_xlat15.x>=(-u_xlat15.x);
#endif
    u_xlat15.x = fract(abs(u_xlat15.x));
    u_xlat15.x = (u_xlatb22) ? u_xlat15.x : (-u_xlat15.x);
    u_xlat15.x = u_xlat15.x * 3600.0;
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_0.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat0 = u_xlat15.xxxx * _FlowSpeed + u_xlat16_0;
    u_xlat15.xy = _GChannel.zw * _Time.yy;
    u_xlat15.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat15.xy;
    u_xlat16_15 = texture(_NoiseTex, u_xlat15.xy).y;
    u_xlat0 = vec4(u_xlat16_15) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat0;
    u_xlat16_22 = texture(_RefractionMask, u_xlat0.xy).x;
    u_xlat16_3 = texture(_RefractionMask2, u_xlat0.zw).x;
    u_xlat16_2.x = u_xlat16_22 * u_xlat16_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_2.xx + u_xlat3.xy;
    u_xlat16_1.xyw = texture(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat16_9.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz + u_xlat16_1.xyw;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat1.xy = vec2(u_xlat16_15) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_2.xy;
    u_xlat16_1.x = texture(_AlphaMask, u_xlat1.xy).x;
    u_xlat16_2.x = vs_TEXCOORD5.w;
    u_xlat16_2.x = u_xlat16_2.x * _Color.w;
    u_xlat0.w = u_xlat16_1.x * u_xlat16_2.x;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _normalMap;
uniform lowp sampler2D _RefractionMask;
uniform lowp sampler2D _RefractionMask2;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _AlphaMask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_9;
vec2 u_xlat15;
lowp float u_xlat10_15;
mediump float u_xlat16_21;
float u_xlat22;
lowp float u_xlat10_22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.x = max(_NormalScale, 0.00999999978);
    u_xlat10_1.xyz = texture2D(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_0.xx * u_xlat16_7.xy;
    u_xlat16_0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.z = vs_TEXCOORD2.z;
    u_xlat16_21 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_21) + vs_TEXCOORD3.yzx;
    u_xlat22 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat22 = max(u_xlat22, 1.17549435e-38);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat4.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vs_TEXCOORD3.www;
    u_xlat1.y = u_xlat4.z;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.z = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat5.x = u_xlat3.z;
    u_xlat5.y = u_xlat4.x;
    u_xlat3.y = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD2.x;
    u_xlat1.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat1.y = dot(u_xlat16_0.xyz, u_xlat3.xyz);
    u_xlat15.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15.x = max(u_xlat15.x, 1.17549435e-38);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat1.xy = u_xlat15.xx * u_xlat1.xy;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat3.xyz;
    u_xlat16_21 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_2.xyz = vec3(u_xlat16_21) * vs_TEXCOORD2.xyz;
    u_xlat15.x = dot(u_xlat16_0.xyz, u_xlat16_2.xyz);
    u_xlat22 = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat3.x = _IOR * _IOR;
    u_xlat22 = (-u_xlat3.x) * u_xlat22 + 1.0;
    u_xlat3.x = sqrt(u_xlat22);
    u_xlatb22 = u_xlat22>=0.0;
    u_xlat15.x = _IOR * u_xlat15.x + u_xlat3.x;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat15.xxx;
    u_xlat3.xyz = vec3(_IOR) * u_xlat16_0.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = bool(u_xlatb22) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
    u_xlat4.y = dot(vs_TEXCOORD4.xyz, u_xlat3.xyz);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_NormalInfluenceIntensity, _NormalInfluenceIntensity)) + u_xlat4.xy;
    u_xlat15.x = _Time.y * 0.000277777785;
    u_xlatb22 = u_xlat15.x>=(-u_xlat15.x);
    u_xlat15.x = fract(abs(u_xlat15.x));
    u_xlat15.x = (u_xlatb22) ? u_xlat15.x : (-u_xlat15.x);
    u_xlat15.x = u_xlat15.x * 3600.0;
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_0.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat0 = u_xlat15.xxxx * _FlowSpeed + u_xlat16_0;
    u_xlat15.xy = _Time.yy * _GChannel.zw;
    u_xlat15.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat15.xy;
    u_xlat10_15 = texture2D(_NoiseTex, u_xlat15.xy).y;
    u_xlat0 = vec4(u_xlat10_15) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat0;
    u_xlat10_22 = texture2D(_RefractionMask, u_xlat0.xy).x;
    u_xlat10_3 = texture2D(_RefractionMask2, u_xlat0.zw).x;
    u_xlat16_2.x = u_xlat10_22 * u_xlat10_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_2.xx + u_xlat3.xy;
    u_xlat10_1.xyw = texture2D(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat16_9.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz + u_xlat10_1.xyw;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat1.xy = vec2(u_xlat10_15) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_2.xy;
    u_xlat10_1.x = texture2D(_AlphaMask, u_xlat1.xy).x;
    u_xlat16_2.x = vs_TEXCOORD5.w;
    u_xlat16_2.x = u_xlat16_2.x * _Color.w;
    u_xlat0.w = u_xlat10_1.x * u_xlat16_2.x;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _normalMap;
uniform lowp sampler2D _RefractionMask;
uniform lowp sampler2D _RefractionMask2;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _AlphaMask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_9;
vec2 u_xlat15;
lowp float u_xlat10_15;
mediump float u_xlat16_21;
float u_xlat22;
lowp float u_xlat10_22;
bool u_xlatb22;
void main()
{
    u_xlat16_0.x = max(_NormalScale, 0.00999999978);
    u_xlat10_1.xyz = texture2D(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_7.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.xy = u_xlat16_0.xx * u_xlat16_7.xy;
    u_xlat16_0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz;
    u_xlat1.z = vs_TEXCOORD2.z;
    u_xlat16_21 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD2.yzx) * vec3(u_xlat16_21) + vs_TEXCOORD3.yzx;
    u_xlat22 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat22 = max(u_xlat22, 1.17549435e-38);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat3.xyz = vec3(u_xlat22) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD2.zxy;
    u_xlat4.xyz = vs_TEXCOORD2.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vs_TEXCOORD3.www;
    u_xlat1.y = u_xlat4.z;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.z = dot(u_xlat16_0.xyz, u_xlat1.xyz);
    u_xlat5.x = u_xlat3.z;
    u_xlat5.y = u_xlat4.x;
    u_xlat3.y = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD2.x;
    u_xlat1.x = dot(u_xlat16_0.xyz, u_xlat5.xyz);
    u_xlat3.z = vs_TEXCOORD2.y;
    u_xlat1.y = dot(u_xlat16_0.xyz, u_xlat3.xyz);
    u_xlat15.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15.x = max(u_xlat15.x, 1.17549435e-38);
    u_xlat15.x = inversesqrt(u_xlat15.x);
    u_xlat1.xy = u_xlat15.xx * u_xlat1.xy;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_0.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_0.x = inversesqrt(u_xlat16_0.x);
    u_xlat16_0.xyz = u_xlat16_0.xxx * u_xlat3.xyz;
    u_xlat16_21 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_2.xyz = vec3(u_xlat16_21) * vs_TEXCOORD2.xyz;
    u_xlat15.x = dot(u_xlat16_0.xyz, u_xlat16_2.xyz);
    u_xlat22 = (-u_xlat15.x) * u_xlat15.x + 1.0;
    u_xlat3.x = _IOR * _IOR;
    u_xlat22 = (-u_xlat3.x) * u_xlat22 + 1.0;
    u_xlat3.x = sqrt(u_xlat22);
    u_xlatb22 = u_xlat22>=0.0;
    u_xlat15.x = _IOR * u_xlat15.x + u_xlat3.x;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat15.xxx;
    u_xlat3.xyz = vec3(_IOR) * u_xlat16_0.xyz + (-u_xlat3.xyz);
    u_xlat3.xyz = bool(u_xlatb22) ? u_xlat3.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat4.x = dot(vs_TEXCOORD3.xyz, u_xlat3.xyz);
    u_xlat4.y = dot(vs_TEXCOORD4.xyz, u_xlat3.xyz);
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_NormalInfluenceIntensity, _NormalInfluenceIntensity)) + u_xlat4.xy;
    u_xlat15.x = _Time.y * 0.000277777785;
    u_xlatb22 = u_xlat15.x>=(-u_xlat15.x);
    u_xlat15.x = fract(abs(u_xlat15.x));
    u_xlat15.x = (u_xlatb22) ? u_xlat15.x : (-u_xlat15.x);
    u_xlat15.x = u_xlat15.x * 3600.0;
    u_xlat16_0.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_0.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat0 = u_xlat15.xxxx * _FlowSpeed + u_xlat16_0;
    u_xlat15.xy = _Time.yy * _GChannel.zw;
    u_xlat15.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat15.xy;
    u_xlat10_15 = texture2D(_NoiseTex, u_xlat15.xy).y;
    u_xlat0 = vec4(u_xlat10_15) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat0;
    u_xlat10_22 = texture2D(_RefractionMask, u_xlat0.xy).x;
    u_xlat10_3 = texture2D(_RefractionMask2, u_xlat0.zw).x;
    u_xlat16_2.x = u_xlat10_22 * u_xlat10_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat1.xy = u_xlat1.xy * u_xlat16_2.xx + u_xlat3.xy;
    u_xlat10_1.xyw = texture2D(_GrabTexture, u_xlat1.xy).xyz;
    u_xlat16_9.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_2.xxx * u_xlat16_9.xyz + u_xlat10_1.xyw;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat1.xy = vec2(u_xlat10_15) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_2.xy;
    u_xlat10_1.x = texture2D(_AlphaMask, u_xlat1.xy).x;
    u_xlat16_2.x = vs_TEXCOORD5.w;
    u_xlat16_2.x = u_xlat16_2.x * _Color.w;
    u_xlat0.w = u_xlat10_1.x * u_xlat16_2.x;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
out mediump vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
    vs_TEXCOORD7 = in_TEXCOORD1;
    vs_TEXCOORD8 = in_TEXCOORD2;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _RefractionMask;
UNITY_LOCATION(3) uniform mediump sampler2D _RefractionMask2;
UNITY_LOCATION(4) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(5) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in mediump vec4 vs_TEXCOORD7;
in mediump vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_12;
vec2 u_xlat14;
mediump float u_xlat16_14;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD2.yzx) * u_xlat16_1.xxx + vs_TEXCOORD3.yzx;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD2.zxy;
    u_xlat3.xyz = vs_TEXCOORD2.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vs_TEXCOORD3.www;
    u_xlat0.y = u_xlat3.z;
    u_xlat0.x = u_xlat2.y;
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vs_TEXCOORD8.xyz + vec3(_IOR, _NormalScale, _NormalInfluenceIntensity);
    u_xlat16_22 = max(u_xlat16_5.y, 0.00999999978);
    u_xlat16_1.xy = vec2(u_xlat16_22) * u_xlat16_1.xy;
    u_xlat16_22 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat2.z;
    u_xlat4.y = u_xlat3.x;
    u_xlat2.y = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD2.x;
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat2.z = vs_TEXCOORD2.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat14.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat14.x = max(u_xlat14.x, 1.17549435e-38);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat0.xy = u_xlat14.xx * u_xlat0.xy;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_22 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_6.xyz = vec3(u_xlat16_22) * vs_TEXCOORD2.xyz;
    u_xlat14.x = dot(u_xlat16_1.xyz, u_xlat16_6.xyz);
    u_xlat21 = (-u_xlat14.x) * u_xlat14.x + 1.0;
    u_xlat2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat21 = (-u_xlat2.x) * u_xlat21 + 1.0;
    u_xlat2.x = sqrt(u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21>=0.0);
#else
    u_xlatb21 = u_xlat21>=0.0;
#endif
    u_xlat14.x = u_xlat16_5.x * u_xlat14.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat14.xxx;
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat16_1.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = bool(u_xlatb21) ? u_xlat2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat3.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat3.y = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat14.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb21 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : (-u_xlat14.x);
    u_xlat14.x = u_xlat14.x * 3600.0;
    u_xlat16_1 = vs_TEXCOORD7 + _FlowSpeed;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_2.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat1 = u_xlat14.xxxx * u_xlat16_1 + u_xlat16_2;
    u_xlat14.xy = _GChannel.zw * _Time.yy;
    u_xlat14.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat14.xy;
    u_xlat16_14 = texture(_NoiseTex, u_xlat14.xy).y;
    u_xlat1 = vec4(u_xlat16_14) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat1;
    u_xlat16_21 = texture(_RefractionMask, u_xlat1.xy).x;
    u_xlat16_3 = texture(_RefractionMask2, u_xlat1.zw).x;
    u_xlat16_5.x = u_xlat16_21 * u_xlat16_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat16_0.xyw = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_12.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat16_0.xyw;
    u_xlat16_5.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat0.xy = vec2(u_xlat16_14) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_5.xy;
    u_xlat16_0.x = texture(_AlphaMask, u_xlat0.xy).x;
    u_xlat16_5.x = vs_TEXCOORD5.w;
    u_xlat16_5.x = u_xlat16_5.x * _Color.w;
    u_xlat1.w = u_xlat16_0.x * u_xlat16_5.x;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec2 vs_TEXCOORD1;
out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out highp vec3 vs_TEXCOORD4;
out mediump vec4 vs_TEXCOORD5;
out highp vec4 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD7;
out mediump vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
    vs_TEXCOORD7 = in_TEXCOORD1;
    vs_TEXCOORD8 = in_TEXCOORD2;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
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
UNITY_LOCATION(0) uniform mediump sampler2D _GrabTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _RefractionMask;
UNITY_LOCATION(3) uniform mediump sampler2D _RefractionMask2;
UNITY_LOCATION(4) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(5) uniform mediump sampler2D _NoiseTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec2 vs_TEXCOORD1;
in mediump vec3 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in highp vec3 vs_TEXCOORD4;
in mediump vec4 vs_TEXCOORD5;
in highp vec4 vs_TEXCOORD6;
in mediump vec4 vs_TEXCOORD7;
in mediump vec4 vs_TEXCOORD8;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump float u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_12;
vec2 u_xlat14;
mediump float u_xlat16_14;
float u_xlat21;
mediump float u_xlat16_21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD2.yzx) * u_xlat16_1.xxx + vs_TEXCOORD3.yzx;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD2.zxy;
    u_xlat3.xyz = vs_TEXCOORD2.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vs_TEXCOORD3.www;
    u_xlat0.y = u_xlat3.z;
    u_xlat0.x = u_xlat2.y;
    u_xlat16_4.xyz = texture(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vs_TEXCOORD8.xyz + vec3(_IOR, _NormalScale, _NormalInfluenceIntensity);
    u_xlat16_22 = max(u_xlat16_5.y, 0.00999999978);
    u_xlat16_1.xy = vec2(u_xlat16_22) * u_xlat16_1.xy;
    u_xlat16_22 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat2.z;
    u_xlat4.y = u_xlat3.x;
    u_xlat2.y = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD2.x;
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat2.z = vs_TEXCOORD2.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat14.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat14.x = max(u_xlat14.x, 1.17549435e-38);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat0.xy = u_xlat14.xx * u_xlat0.xy;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_22 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_6.xyz = vec3(u_xlat16_22) * vs_TEXCOORD2.xyz;
    u_xlat14.x = dot(u_xlat16_1.xyz, u_xlat16_6.xyz);
    u_xlat21 = (-u_xlat14.x) * u_xlat14.x + 1.0;
    u_xlat2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat21 = (-u_xlat2.x) * u_xlat21 + 1.0;
    u_xlat2.x = sqrt(u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat21>=0.0);
#else
    u_xlatb21 = u_xlat21>=0.0;
#endif
    u_xlat14.x = u_xlat16_5.x * u_xlat14.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat14.xxx;
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat16_1.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = bool(u_xlatb21) ? u_xlat2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat3.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat3.y = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat14.x = _Time.y * 0.000277777785;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb21 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : (-u_xlat14.x);
    u_xlat14.x = u_xlat14.x * 3600.0;
    u_xlat16_1 = vs_TEXCOORD7 + _FlowSpeed;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_2.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat1 = u_xlat14.xxxx * u_xlat16_1 + u_xlat16_2;
    u_xlat14.xy = _GChannel.zw * _Time.yy;
    u_xlat14.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat14.xy;
    u_xlat16_14 = texture(_NoiseTex, u_xlat14.xy).y;
    u_xlat1 = vec4(u_xlat16_14) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat1;
    u_xlat16_21 = texture(_RefractionMask, u_xlat1.xy).x;
    u_xlat16_3 = texture(_RefractionMask2, u_xlat1.zw).x;
    u_xlat16_5.x = u_xlat16_21 * u_xlat16_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat16_0.xyw = texture(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_12.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat16_0.xyw;
    u_xlat16_5.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat0.xy = vec2(u_xlat16_14) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_5.xy;
    u_xlat16_0.x = texture(_AlphaMask, u_xlat0.xy).x;
    u_xlat16_5.x = vs_TEXCOORD5.w;
    u_xlat16_5.x = u_xlat16_5.x * _Color.w;
    u_xlat1.w = u_xlat16_0.x * u_xlat16_5.x;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_TEXCOORD7;
varying mediump vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
    vs_TEXCOORD7 = in_TEXCOORD1;
    vs_TEXCOORD8 = in_TEXCOORD2;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _normalMap;
uniform lowp sampler2D _RefractionMask;
uniform lowp sampler2D _RefractionMask2;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _AlphaMask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_TEXCOORD7;
varying mediump vec4 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_12;
vec2 u_xlat14;
lowp float u_xlat10_14;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD2.yzx) * u_xlat16_1.xxx + vs_TEXCOORD3.yzx;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD2.zxy;
    u_xlat3.xyz = vs_TEXCOORD2.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vs_TEXCOORD3.www;
    u_xlat0.y = u_xlat3.z;
    u_xlat0.x = u_xlat2.y;
    u_xlat10_4.xyz = texture2D(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vs_TEXCOORD8.xyz + vec3(_IOR, _NormalScale, _NormalInfluenceIntensity);
    u_xlat16_22 = max(u_xlat16_5.y, 0.00999999978);
    u_xlat16_1.xy = vec2(u_xlat16_22) * u_xlat16_1.xy;
    u_xlat16_22 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat2.z;
    u_xlat4.y = u_xlat3.x;
    u_xlat2.y = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD2.x;
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat2.z = vs_TEXCOORD2.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat14.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat14.x = max(u_xlat14.x, 1.17549435e-38);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat0.xy = u_xlat14.xx * u_xlat0.xy;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_22 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_6.xyz = vec3(u_xlat16_22) * vs_TEXCOORD2.xyz;
    u_xlat14.x = dot(u_xlat16_1.xyz, u_xlat16_6.xyz);
    u_xlat21 = (-u_xlat14.x) * u_xlat14.x + 1.0;
    u_xlat2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat21 = (-u_xlat2.x) * u_xlat21 + 1.0;
    u_xlat2.x = sqrt(u_xlat21);
    u_xlatb21 = u_xlat21>=0.0;
    u_xlat14.x = u_xlat16_5.x * u_xlat14.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat14.xxx;
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat16_1.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = bool(u_xlatb21) ? u_xlat2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat3.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat3.y = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat14.x = _Time.y * 0.000277777785;
    u_xlatb21 = u_xlat14.x>=(-u_xlat14.x);
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : (-u_xlat14.x);
    u_xlat14.x = u_xlat14.x * 3600.0;
    u_xlat16_1 = vs_TEXCOORD7 + _FlowSpeed;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_2.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat1 = u_xlat14.xxxx * u_xlat16_1 + u_xlat16_2;
    u_xlat14.xy = _Time.yy * _GChannel.zw;
    u_xlat14.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat14.xy;
    u_xlat10_14 = texture2D(_NoiseTex, u_xlat14.xy).y;
    u_xlat1 = vec4(u_xlat10_14) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat1;
    u_xlat10_21 = texture2D(_RefractionMask, u_xlat1.xy).x;
    u_xlat10_3 = texture2D(_RefractionMask2, u_xlat1.zw).x;
    u_xlat16_5.x = u_xlat10_21 * u_xlat10_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat10_0.xyw = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_12.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat10_0.xyw;
    u_xlat16_5.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat0.xy = vec2(u_xlat10_14) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_5.xy;
    u_xlat10_0.x = texture2D(_AlphaMask, u_xlat0.xy).x;
    u_xlat16_5.x = vs_TEXCOORD5.w;
    u_xlat16_5.x = u_xlat16_5.x * _Color.w;
    u_xlat1.w = u_xlat10_0.x * u_xlat16_5.x;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 unity_WorldTransformParams;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_NORMAL0;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_TEXCOORD2;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_TEXCOORD7;
varying mediump vec4 vs_TEXCOORD8;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat16;
bool u_xlatb16;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    gl_Position = u_xlat0;
    vs_TEXCOORD0.w = 0.0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat16 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat1.xyz = vec3(u_xlat16) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    u_xlat2.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat2.xyz;
    u_xlat16 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16 = max(u_xlat16, 1.17549435e-38);
    u_xlat16 = inversesqrt(u_xlat16);
    u_xlat2.xyz = vec3(u_xlat16) * u_xlat2.xyz;
    vs_TEXCOORD3.xyz = u_xlat2.xyz;
    u_xlatb16 = unity_WorldTransformParams.w>=0.0;
    u_xlat16 = (u_xlatb16) ? 1.0 : -1.0;
    u_xlat16_3.x = u_xlat16 * in_TANGENT0.w;
    vs_TEXCOORD3.w = u_xlat16_3.x;
    u_xlat4.xyz = u_xlat1.zxy * u_xlat2.yzx;
    u_xlat1.xyz = u_xlat1.yzx * u_xlat2.zxy + (-u_xlat4.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat1.xyz;
    vs_TEXCOORD4.xyz = u_xlat16_3.xyz;
    vs_TEXCOORD5 = in_COLOR0;
    u_xlat1.xyz = u_xlat0.xyw * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD6.zw = u_xlat0.zw;
    vs_TEXCOORD6.xy = u_xlat1.zz + u_xlat1.xy;
    vs_TEXCOORD7 = in_TEXCOORD1;
    vs_TEXCOORD8 = in_TEXCOORD2;
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
uniform 	mediump vec4 _RefractionMask_ST;
uniform 	mediump vec4 _RefractionMask2_ST;
uniform 	mediump vec4 _AlphaMask_ST;
uniform 	mediump float _IOR;
uniform 	mediump float _NormalScale;
uniform 	mediump float _NormalInfluenceIntensity;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _FlowSpeed;
uniform 	vec4 _GChannel;
uniform 	mediump float _NoiseXStrength;
uniform 	mediump float _NoiseYStrength;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _normalMap;
uniform lowp sampler2D _RefractionMask;
uniform lowp sampler2D _RefractionMask2;
uniform lowp sampler2D _GrabTexture;
uniform lowp sampler2D _AlphaMask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD1;
varying mediump vec3 vs_TEXCOORD2;
varying mediump vec4 vs_TEXCOORD3;
varying highp vec3 vs_TEXCOORD4;
varying mediump vec4 vs_TEXCOORD5;
varying highp vec4 vs_TEXCOORD6;
varying mediump vec4 vs_TEXCOORD7;
varying mediump vec4 vs_TEXCOORD8;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
lowp float u_xlat10_3;
vec3 u_xlat4;
lowp vec3 u_xlat10_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_12;
vec2 u_xlat14;
lowp float u_xlat10_14;
float u_xlat21;
lowp float u_xlat10_21;
bool u_xlatb21;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.x = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_1.xyz = (-vs_TEXCOORD2.yzx) * u_xlat16_1.xxx + vs_TEXCOORD3.yzx;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat16_1.xyz;
    u_xlat3.xyz = u_xlat2.xyz * vs_TEXCOORD2.zxy;
    u_xlat3.xyz = vs_TEXCOORD2.yzx * u_xlat2.yzx + (-u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * vs_TEXCOORD3.www;
    u_xlat0.y = u_xlat3.z;
    u_xlat0.x = u_xlat2.y;
    u_xlat10_4.xyz = texture2D(_normalMap, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = vs_TEXCOORD8.xyz + vec3(_IOR, _NormalScale, _NormalInfluenceIntensity);
    u_xlat16_22 = max(u_xlat16_5.y, 0.00999999978);
    u_xlat16_1.xy = vec2(u_xlat16_22) * u_xlat16_1.xy;
    u_xlat16_22 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_1.xyz = vec3(u_xlat16_22) * u_xlat16_1.xyz;
    u_xlat0.z = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat4.x = u_xlat2.z;
    u_xlat4.y = u_xlat3.x;
    u_xlat2.y = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD2.x;
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat4.xyz);
    u_xlat2.z = vs_TEXCOORD2.y;
    u_xlat0.y = dot(u_xlat16_1.xyz, u_xlat2.xyz);
    u_xlat14.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat14.x = max(u_xlat14.x, 1.17549435e-38);
    u_xlat14.x = inversesqrt(u_xlat14.x);
    u_xlat0.xy = u_xlat14.xx * u_xlat0.xy;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat16_22 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat16_22 = inversesqrt(u_xlat16_22);
    u_xlat16_6.xyz = vec3(u_xlat16_22) * vs_TEXCOORD2.xyz;
    u_xlat14.x = dot(u_xlat16_1.xyz, u_xlat16_6.xyz);
    u_xlat21 = (-u_xlat14.x) * u_xlat14.x + 1.0;
    u_xlat2.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat21 = (-u_xlat2.x) * u_xlat21 + 1.0;
    u_xlat2.x = sqrt(u_xlat21);
    u_xlatb21 = u_xlat21>=0.0;
    u_xlat14.x = u_xlat16_5.x * u_xlat14.x + u_xlat2.x;
    u_xlat2.xyz = u_xlat16_6.xyz * u_xlat14.xxx;
    u_xlat2.xyz = u_xlat16_5.xxx * u_xlat16_1.xyz + (-u_xlat2.xyz);
    u_xlat2.xyz = bool(u_xlatb21) ? u_xlat2.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat3.x = dot(vs_TEXCOORD3.xyz, u_xlat2.xyz);
    u_xlat3.y = dot(vs_TEXCOORD4.xyz, u_xlat2.xyz);
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.zz + u_xlat3.xy;
    u_xlat14.x = _Time.y * 0.000277777785;
    u_xlatb21 = u_xlat14.x>=(-u_xlat14.x);
    u_xlat14.x = fract(abs(u_xlat14.x));
    u_xlat14.x = (u_xlatb21) ? u_xlat14.x : (-u_xlat14.x);
    u_xlat14.x = u_xlat14.x * 3600.0;
    u_xlat16_1 = vs_TEXCOORD7 + _FlowSpeed;
    u_xlat16_2.xy = vs_TEXCOORD1.xy * _RefractionMask_ST.xy + _RefractionMask_ST.zw;
    u_xlat16_2.zw = vs_TEXCOORD1.xy * _RefractionMask2_ST.xy + _RefractionMask2_ST.zw;
    u_xlat1 = u_xlat14.xxxx * u_xlat16_1 + u_xlat16_2;
    u_xlat14.xy = _Time.yy * _GChannel.zw;
    u_xlat14.xy = vs_TEXCOORD1.xy * _GChannel.xy + u_xlat14.xy;
    u_xlat10_14 = texture2D(_NoiseTex, u_xlat14.xy).y;
    u_xlat1 = vec4(u_xlat10_14) * vec4(_NoiseXStrength, _NoiseYStrength, _NoiseXStrength, _NoiseYStrength) + u_xlat1;
    u_xlat10_21 = texture2D(_RefractionMask, u_xlat1.xy).x;
    u_xlat10_3 = texture2D(_RefractionMask2, u_xlat1.zw).x;
    u_xlat16_5.x = u_xlat10_21 * u_xlat10_3;
    u_xlat3.xy = vs_TEXCOORD6.xy / vs_TEXCOORD6.ww;
    u_xlat0.xy = u_xlat0.xy * u_xlat16_5.xx + u_xlat3.xy;
    u_xlat10_0.xyw = texture2D(_GrabTexture, u_xlat0.xy).xyz;
    u_xlat16_12.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD5.xyz * vs_TEXCOORD5.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_6.xyz;
    u_xlat1.xyz = u_xlat16_5.xxx * u_xlat16_12.xyz + u_xlat10_0.xyw;
    u_xlat16_5.xy = vs_TEXCOORD1.xy * _AlphaMask_ST.xy + _AlphaMask_ST.zw;
    u_xlat0.xy = vec2(u_xlat10_14) * vec2(_NoiseXStrength, _NoiseYStrength) + u_xlat16_5.xy;
    u_xlat10_0.x = texture2D(_AlphaMask, u_xlat0.xy).x;
    u_xlat16_5.x = vs_TEXCOORD5.w;
    u_xlat16_5.x = u_xlat16_5.x * _Color.w;
    u_xlat1.w = u_xlat10_0.x * u_xlat16_5.x;
    SV_Target0 = u_xlat1;
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
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_REQUIRE_CUSTOMDATA" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_REQUIRE_CUSTOMDATA" }
""
}
}
}
}
}